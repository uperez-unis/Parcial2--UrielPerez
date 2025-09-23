# Parcial2--UrielPerez
Resolución parcial 2 de Arquitectura de Computadoras y Microcontroladores  

[📺 Mira el funcionamiento en Logisim aquí](https://youtu.be/86joLa6Kb_0)  
[📺 Mira el funcionamiento en Vivado aquí](https://youtu.be/p2pgHohpDm0?si=IsBVVWRLqjtwmuVG)

---

## 📌 Serie 2 del Parcial

La **Serie 2** consiste en la implementación de una **Unidad Aritmética Lógica (ALU)** capaz de realizar operaciones básicas y generar **banderas de estado**.  
La ALU fue implementada en **Logisim** y posteriormente en **Vivado con SystemVerilog**.

### 🔹 Características principales
- Entradas **A** y **B** de **10 bits**.  
- Para la operación de suma y resta se utilizó un **Ripple-Carry Adder**.  
- En los **shifts (izquierda y derecha)** se puede seleccionar la **cantidad de bits a desplazar**.  

---

### 🔹 Operaciones soportadas
La ALU puede ejecutar **6 operaciones** sobre las entradas de 10 bits:
1. **Suma** (Ripple-Carry Adder)  
2. **Resta**  
3. **AND**  
4. **OR**  
5. **Shift Left (desplazamiento a la izquierda con cantidad seleccionable)**  
6. **Shift Right (desplazamiento a la derecha con cantidad seleccionable)**  

---

### 🔹 Flags de estado
La ALU incluye **banderas** para indicar el estado de los resultados:
- **Overflow:** Se activa cuando el resultado excede la capacidad de 10 bits.  
- **Zero:** Se activa cuando el resultado es igual a 0.  
- **Negative:** Se activa cuando el resultado es negativo.  
- **Carry:** Indica si hubo acarreo en operaciones aritméticas.  

---

## 🎯 Conclusión
La implementación de la ALU permitió comprender el diseño de circuitos combinacionales complejos y su integración en arquitecturas de procesadores.  
- En **Logisim**, se comprobó el funcionamiento lógico de cada operación.  
- En **Vivado**, se validó la implementación en hardware digital con SystemVerilog.  
- El uso de entradas de **10 bits** y un **Ripple-Carry Adder** facilitó la comprensión del manejo de acarreos.  
- Los **shifts parametrizables** demostraron la flexibilidad en operaciones de desplazamiento.  
