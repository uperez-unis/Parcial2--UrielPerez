# Parcial2--UrielPerez
Resolución parcial 2 de Arquitectura de Computadoras y Microcontroladores  

[📺 Mira el funcionamiento aquí](https://youtu.be/MwgqM5ZpWrE)

---

## 📌 Serie 1 del Parcial

La **Serie 1** consiste en el estudio y la implementación de **tres tipos de sumadores** en **SystemVerilog**, analizando sus ventajas, desventajas y funcionamiento interno.  

### 🔹 Ripple-Carry Adder (RCA)
El **Ripple-Carry Adder** es el más sencillo de los sumadores. Funciona propagando el acarreo (carry) de un bit al siguiente de forma secuencial.  
- **Ventajas:** Diseño simple, fácil de implementar.  
- **Desventajas:** Su velocidad depende de la cantidad de bits, ya que el acarreo debe propagarse a través de todas las etapas.  


---

### 🔹 Carry Lookahead Adder (CLA)
El **Carry Lookahead Adder** mejora el tiempo de cálculo al generar y propagar los acarreos en paralelo, en lugar de esperar que viajen bit a bit.  
- **Ventajas:** Mucho más rápido que el Ripple-Carry.  
- **Desventajas:** El hardware es más complejo, requiere más compuertas lógicas.  


---

### 🔹 Prefix Adder
El **Prefix Adder** utiliza estructuras jerárquicas y operaciones de prefijo para calcular los acarreos en paralelo, optimizando la velocidad y reduciendo la profundidad del circuito.  
- **Ventajas:** Muy eficiente para sumadores de gran tamaño, alta velocidad.  
- **Desventajas:** Diseño más complejo y mayor uso de recursos.  



---

## 🎯 Conclusión
Cada sumador presenta un compromiso entre **simplicidad**, **velocidad** y **uso de recursos**.  
- El **Ripple-Carry** es ideal para diseños pequeños y sencillos.  
- El **Carry Lookahead** ofrece un balance entre complejidad y rapidez.  
- El **Prefix Adder** es el más adecuado para aplicaciones que requieren gran velocidad sin importar la complejidad del hardware.
