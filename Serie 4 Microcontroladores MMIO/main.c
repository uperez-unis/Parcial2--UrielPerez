#include <stdint.h>

//BASE PERIFÉRICOS
#define PERIPHERAL_BASE_ADDRESS     0x40000000U
#define AHB_BASE_ADDRESS            (PERIPHERAL_BASE_ADDRESS + 0x00020000U)
#define RCC_BASE_ADDRESS            (AHB_BASE_ADDRESS + 0x00001000U)
#define IOPORT_ADDRESS              (PERIPHERAL_BASE_ADDRESS + 0x10000000U)

#define GPIOA_BASE_ADDRESS          (IOPORT_ADDRESS + 0x00000000U)
#define GPIOB_BASE_ADDRESS          (IOPORT_ADDRESS + 0x00000400U)
#define GPIOC_BASE_ADDRESS          (IOPORT_ADDRESS + 0x00000800U)

//ESTRUCTURAS (registro tipo)
typedef struct{
    uint32_t MODER;
    uint32_t OTYPER;
    uint32_t OSPEEDR;
    uint32_t PUPDR;
    uint32_t IDR;
    uint32_t ODR;
    uint32_t BSRR;
    uint32_t LCKR;
    uint32_t AFR[2];
    uint32_t BRR;
} GPIOx_Reg_Def;

typedef struct{
    uint32_t CR;
    uint32_t ICSCR;
    uint32_t CRRCR;
    uint32_t CFGR;
    uint32_t CIER;
    uint32_t CIFR;
    uint32_t CICR;
    uint32_t IOPRSTR;
    uint32_t AHBPRSTR;
    uint32_t APB1PRSTR;
    uint32_t APB2PRSTR;
    uint32_t IOPENR;
    uint32_t AHBENR;
    uint32_t APBENR[2];
    uint32_t IOPSMENR;
    uint32_t AHBSMENR;
    uint32_t APBSMENR[2];
    uint32_t CCIPR;
    uint32_t CSR;
} RCC_Reg_Def;

#define GPIOA   ((GPIOx_Reg_Def*)GPIOA_BASE_ADDRESS)
#define GPIOB   ((GPIOx_Reg_Def*)GPIOB_BASE_ADDRESS)
#define GPIOC   ((GPIOx_Reg_Def*)GPIOC_BASE_ADDRESS)
#define RCC     ((RCC_Reg_Def*)RCC_BASE_ADDRESS)

//CONTROL DISPLAYS (GPIOC)
// Pines para encender displays PC5 (D0), PC6 (D1), PC8 (D2), PC9 (D3)
#define D0_CTRL   (1U<<5)    // display derecho (unidades minutos)
#define D1_CTRL   (1U<<6)    // siguiente (decenas minutos)
#define D2_CTRL   (1U<<8)    // horas unidades
#define D3_CTRL   (1U<<9)    // horas decenas (izquierda)
#define ALL_DISPLAYS    (D0_CTRL|D1_CTRL|D2_CTRL|D3_CTRL) //apagar todos los displays

//MAPA 7-SEG (CÁTODO COMÚN
const uint8_t digit_map[10] = {
    0b00111111, //0 -> 0x3F
    0b00000110, //1 -> 0x06
    0b01011011, //2 -> 0x5B
    0b01001111, //3 -> 0x4F
    0b01100110, //4 -> 0x66
    0b01101101, //5 -> 0x6D
    0b01111101, //6 -> 0x7D
    0b00000111, //7 -> 0x07
    0b01111111, //8 -> 0x7F
    0b01101111  //9 -> 0x6F
};

//VARIABLES DE TIEMPO/ESTADO
uint8_t hours24 = 0;         // hora interna 0..23 (no se modifica al cambiar formato)
uint8_t minutes = 0;
uint8_t display_digits[4] = {0,0,0,0}; // [D0(min u), D1(min d), D2(hr u), D3(hr d)]
uint8_t my_fsm = 0;
uint8_t mode_24h = 0;        // 0 = 12h display, 1 = 24h display

//DELAY SIMPLE
void delay_ms(uint16_t n){
    uint16_t i;
    for(; n>0; n--)
        for(i=0; i<140; i++);
}

//calcular dígitos desde hora interna
void refresh_display_digits_from_time(void){
    uint8_t disp_hours;
    if(mode_24h){
        disp_hours = hours24;           // mostrar 0..23 (así en 24h)
    } else {
        // convertir 24h -> 12h (mostrar 12 en vez de 0)
        uint8_t h12 = hours24 % 12;
        if(h12 == 0) h12 = 12;
        disp_hours = h12;
    }


    display_digits[0] = minutes % 10;     // D0: unidades minutos
    display_digits[1] = minutes / 10;     // D1: decenas minutos
    display_digits[2] = disp_hours % 10;  // D2: unidades horas
    display_digits[3] = disp_hours / 10;  // D3: decenas horas
}

// ACTUALIZA UN DIGITO (multiplexado)
void update_display(void){
    uint8_t seg;
    uint8_t is_pm = (hours24 >= 12) ? 1 : 0;

    switch(my_fsm){
        case 0: // D0 (derecha): unidades de minutos
            // Apagar todos los displays y limpiar segmentos
            GPIOC->BSRR = (ALL_DISPLAYS << 16);
            GPIOB->BSRR = (0xFFU << 16);
            // Encender este display
            GPIOC->BSRR = D0_CTRL;
            // preparar segmentos
            seg = digit_map[ display_digits[0] ];
            // si modo 12h y es PM encender DP (bit7)
            if(!mode_24h && is_pm) seg |= 0x80U;
            // escribir segmentos
            GPIOB->BSRR = seg;
            my_fsm++;
            break;

        case 1: // D1: decenas minutos
            GPIOC->BSRR = (ALL_DISPLAYS << 16);
            GPIOB->BSRR = (0xFFU << 16);
            GPIOC->BSRR = D1_CTRL;
            GPIOB->BSRR = digit_map[ display_digits[1] ];
            my_fsm++;
            break;

        case 2: // D2: unidades horas
            GPIOC->BSRR = (ALL_DISPLAYS << 16);
            GPIOB->BSRR = (0xFFU << 16);
            GPIOC->BSRR = D2_CTRL;
            GPIOB->BSRR = digit_map[ display_digits[2] ];
            my_fsm++;
            break;

        case 3: // D3: decenas horas
            GPIOC->BSRR = (ALL_DISPLAYS << 16);
            GPIOB->BSRR = (0xFFU << 16);
            GPIOC->BSRR = D3_CTRL;
            GPIOB->BSRR = digit_map[ display_digits[3] ];
            my_fsm = 0;
            break;
    }
}

//BOTÓN PC13: cambiar modo 12/24
void check_button(void){
    static uint8_t last_state = 1; // pull-up -> no presionado = 1
    uint8_t state = (GPIOC->IDR & (1U<<13)) ? 1 : 0;

    if(last_state == 1 && state == 0){ // flanco 1->0
        delay_ms(40);
        if((GPIOC->IDR & (1U<<13)) == 0){
            mode_24h ^= 1;
            // actualizar dígitos para nuevo modo sin alterar hours24
            refresh_display_digits_from_time();
            // esperar liberacion para evitar multiples toggles
            while((GPIOC->IDR & (1U<<13)) == 0) delay_ms(10);
        }
    }
    last_state = state;
}

//ALARMA: LD2 (PA5) ON durante 2 minutos a las 08:00
void check_alarm_led(void){
    // LD2 en PA5 -> encender cuando sean 08:00
    // Usamos hours24 para detectar 08:00; minutes < 2 => 2 minutos ON (min 0 y 1)
    if(hours24 == 8 && minutes < 2){
        GPIOA->ODR |= (1U << 5);  // LED ON
    } else {
        GPIOA->ODR &= ~(1U << 5); // LED OFF
    }
}

//AVANZAR RELOJ (minutos y horas)
void update_clock(void){
    minutes++;
    if(minutes >= 60){
        minutes = 0;
        hours24++;
        if(hours24 >= 24) hours24 = 0;
    }
    refresh_display_digits_from_time();
    check_alarm_led();
}

//
int main(void){
    // habilitar clocks GPIOA, GPIOB, GPIOC
    RCC->IOPENR |= (1U<<0); // GPIOA
    RCC->IOPENR |= (1U<<1); // GPIOB
    RCC->IOPENR |= (1U<<2); // GPIOC

    //configurar PA5 (LD2) como salida
    GPIOA->MODER &= ~(3U << (5*2));   // limpiar
    GPIOA->MODER |=  (1U << (5*2));   // PA5 = output (01)

    //PB0..PB7 como salida
    GPIOB->MODER &= ~0xFFFFU;         // limpiar MODER para PB0..PB7
    GPIOB->MODER |=  0x5555U;         // PB0..PB7 = 01 (output)

    //configurar PC5,PC6,PC8,PC9 como salida (control displays)
    //
    GPIOC->MODER &= ~((3U<<10)|(3U<<12)|(3U<<16)|(3U<<18)); // limpiar
    GPIOC->MODER |=  ((1U<<10)|(1U<<12)|(1U<<16)|(1U<<18)); // salida (01)

    //configurar PC13 como entrada (botón B1)
    GPIOC->MODER &= ~(3U << (13*2)); // entrada (00)

    // apagar displays y segmentos al inicio
    GPIOC->BSRR = (ALL_DISPLAYS << 16); // reset display enables
    GPIOB->BSRR = (0xFFU << 16);        // reset segments

    // inicializar hora en 00:00 como pediste
    hours24 = 0;
    minutes = 0;
    refresh_display_digits_from_time();
    check_alarm_led();

    uint16_t tick = 0;

    while(1){
        update_display();
        delay_ms(5); // refresco por dígito

        tick++;
        if(tick >= 10){
            tick = 0;
            update_clock();
        }

        check_button();
    }
}
