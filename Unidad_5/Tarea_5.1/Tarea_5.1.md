# Tarea 5.1: Operadores Fundamentales y Extendidos del Álgebra Relacional

**Asignatura:** Fundamentos de Bases de Datos  
**Unidad 5:** Álgebra Relacional  
**Estudiante:** Marcos Daniel Loera Sanchez  
**Matrícula:** I24050383  
**Periodo:** 2026-2  
**Fecha:** 9 de Noviembre de 2026  

---

## 1. Introducción al Álgebra Relacional

El álgebra relacional es un lenguaje de consulta procedimental teórico que define un conjunto de operaciones matemáticas sobre relaciones (tablas) para producir nuevas relaciones como resultado. Constituye la base teórica fundamental para el modelado, evaluación y optimización de consultas en los Sistemas de Gestión de Bases de Datos (SGBD).

---

## 2. Operadores Unarios Básicos

1. **Selección ($\sigma$):** Filtra tuplas de una relación $R$ que satisfacen una condición booleana $P$.
   * **Notación:** $\sigma_{P}(R)$
   * **Ejemplo:** $\sigma_{estado\_cita='Programada'}(cita)$
2. **Proyección ($\pi$):** Extrae un subconjunto de atributos (columnas) $A_1, \dots, A_n$ de $R$, eliminando tuplas duplicadas.
   * **Notación:** $\pi_{A_1, \dots, A_n}(R)$
   * **Ejemplo:** $\pi_{nombre, apellido\_paterno, curp}(paciente)$

---

## 3. Operadores Binarios Básicos

| Operador | Notación | Definición y Comportamiento |
| :--- | :--- | :--- |
| **Producto Cartesiano** | $R \times S$ | Combina cada tupla de $R$ con todas las tuplas de $S$. |
| **Unión** | $R \cup S$ | Retorna tuplas presentes en $R$, en $S$ o en ambas (requiere esquemas compatibles). |
| **Intersección** | $R \cap S$ | Retorna solo las tuplas presentes simultáneamente en $R$ y $S$. |
| **Diferencia** | $R - S$ | Retorna tuplas que pertenecen a $R$ pero no a $S$. |
| **Reunión / Join** | $R \bowtie_{\theta} S$ | Acopla tuplas de $R$ y $S$ que satisfacen una condición $\theta$. |
| **División** | $R \div S$ | Retorna tuplas de $R$ asociadas con **todas** las tuplas contenidas en $S$. |

---

## 4. Álgebra Relacional Extendida

1. **Proyección Generalizada:** Permite expresiones aritméticas y funciones sobre atributos proyectados.
2. **Funciones de Agregación ($\mathcal{G}$):** Aplica operaciones estadísticas sobre grupos de datos ($COUNT, SUM, AVG, MAX, MIN$).
   * **Notación:** $\_{\\text{agrupación}}\\mathcal{G}\_{\\text{función}(\\text{atributo})}(R)$
3. **Reuniones Externas (Outer Joins):**
   * **Left Outer Join ($R \mathbb{\rtimes} S$):** Conserva todas las tuplas de la relación izquierda $R$, rellenando con $NULL$ si no hay coincidencia en $S$.
   * **Right Outer Join ($R \mathbb{\ltimes} S$):** Conserva todas las tuplas de la relación derecha $S$.
   * **Full Outer Join ($R \mathbb{\times} S$):** Conserva todas las tuplas de ambas relaciones.

---

## 5. Enlaces de Entregables Digitales

* 📂 **Repositorio Público de GitHub:** [Ver repositorio en GitHub](https://github.com)
* 📄 **Reporte Formal en PDF:** [`Reporte_Tarea_5_1.pdf`](./Reporte_Tarea_5_1.pdf)
```
