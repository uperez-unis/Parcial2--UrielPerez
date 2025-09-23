# Parcial2--UrielPerez
Resolución parcial 2 de Arquitectura de Computadoras y Microcontroladores  

[📺 Mira el código aquí](https://youtu.be/CkWGsPEimZo)  
[📺 Mira el funcionamiento aquí](https://youtube.com/shorts/xGyMWA707gQ?feature=share)

---

## 📌 Serie 4 del Parcial

La **Serie 4** consistió en la implementación de un **reloj digital (hh:mm)** con formato **12h y 24h**, incluyendo una **alarma** visualizada en el LED integrado de la tarjeta Nucleo.  

El reloj fue desarrollado en **STM32CubeIDE** y probado en una **placa Nucleo-L053R8**.

---

### 🔹 Características principales
- **Formato dual:** Permite mostrar la hora en **12h** o en **24h**.  
- **Alarma:** Al llegar a la hora configurada, se activa el **LED del núcleo**.  
- **Display de salida:** Un **display de 4 dígitos de 7 segmentos** muestra las horas y minutos.  
- **Control de hardware:** Se utilizaron **resistencias y transistores** para manejar el display de forma multiplexada.  

---

### 🔹 Hardware utilizado
- **Placa Nucleo-L053R8**  
- **Display de 7 segmentos (4 dígitos)**  
- **Resistencias**  
- **Transistores**  
- **LED integrado de la Nucleo** para la alarma  

---

### 🔹 Software
- Programación en **C** utilizando **STM32CubeIDE**.  
- Configuración de **timers** para controlar el incremento de segundos, minutos y horas.  
- Implementación de lógica para manejar el **cambio entre formato 12h y 24h**.  
- Rutina de **multiplexado** para refrescar el display de 7 segmentos.  
- Funcionalidad de **alarma** comparando la hora actual con la hora programada.  

---

## 🎯 Conclusión
Este proyecto permitió integrar conceptos de **programación embebida** con **manejo de hardware externo**, logrando un reloj digital funcional con formato 12/24 horas y alarma.  
- El uso de la **Nucleo-L053R8** simplificó el desarrollo en C.  
- La práctica reforzó conocimientos de **timers, multiplexado y control de periféricos**.  
- La implementación del **LED de alarma** demostró la interacción entre software y hardware en sistemas embebidos.  

