# Parcial2--UrielPerez
Resolución parcial 2 de Arquitectura de Computadoras y Microcontroladores  

[📺 Mira el funcionamiento aquí](https://youtu.be/H2counbQ6uA)

---

## 📌 Serie 0 del Parcial

La **Serie 0** consiste en la implementación de una **máquina expendedora de bebidas** en **Vivado** utilizando **SystemVerilog** y el modelado con **máquinas de estados (FSM)**.

### 🔹 Funcionamiento general

1. **FSM Moore (Control de crédito):**
   - Entrada de 1 bit para billetes de **Q5** (hasta un máximo de 15).
   - Entrada de 1 bit para el **botón de aceptar**.
   - No da vuelto.
   - La salida es el **crédito acumulado** que lleva el usuario.

2. **FSM Mealy (Selección de producto):**
   - Entrada del **crédito** proveniente de la FSM Moore (**2 bits**).
   - Entrada del **código de producto**:
     - Pepsi → Q5  
     - Coca → Q10  
     - Red Bull → Q15  
   - Salidas:
     - **2 bits** para indicar el producto seleccionado.
     - **1 bit** que valida si la compra es posible con el crédito actual.

En conjunto, la máquina simula el proceso de insertar dinero, validar la cantidad y permitir o negar la compra del producto elegido.

---
