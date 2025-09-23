# Parcial2--UrielPerez
Resolución parcial 2 de Arquitectura de Computadoras y Microcontroladores  

[📺 Mira el funcionamiento en Logisim aquí](https://youtu.be/86joLa6Kb_0)  
[📺 Mira el funcionamiento en Vivado aquí](https://youtu.be/p2pgHohpDm0?si=IsBVVWRLqjtwmuVG)

---

## 📌 Serie 2 del Parcial

La **Serie 2** consiste en la implementación de una **Unidad Aritmética Lógica (ALU)** capaz de realizar operaciones básicas y generar **banderas de estado**.  
La ALU fue implementada en **Logisim** y posteriormente en **Vivado con SystemVerilog**.

### 🔹 Operaciones soportadas
La ALU puede ejecutar **6 operaciones** de 32 bits:
1. **Suma**  
2. **Resta**  
3. **AND**  
4. **OR**  
5. **Shift Left (desplazamiento a la izquierda)**  
6. **Shift Right (desplazamiento a la derecha)**  

---

### 🔹 Flags de estado
Además de las operaciones, la ALU incluye **banderas** para indicar el estado de los resultados:
- **Overflow:** Se activa cuando el resultado excede la capacidad de representación.  
- **Zero:** Se activa cuando el resultado es igual a 0.  
- **Negative:** Se activa cuando el resultado es negativo.  
- **Carry:** Indica si hubo acarreo en operaciones aritméticas.  

---

## 🎯 Conclusión
La implementación de la ALU permitió comprender el diseño de circuitos combinacionales complejos y su integración en arquitecturas de procesadores.  
- En **Logisim**, se comprobó el funcionamiento lógico de cada operación.  
- En **Vivado**, se validó la implementación en hardware digital con SystemVerilog.  
