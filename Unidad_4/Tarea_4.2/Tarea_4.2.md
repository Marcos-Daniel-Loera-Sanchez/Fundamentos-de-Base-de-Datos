[⬅️ Volver al README anterior](../README.md) 
# Tarea 4.2: Proceso Paso a Paso de Normalización del Proyecto Aplicado

**Asignatura:** Fundamentos y Arquitectura de Bases de Datos  
**Unidad 4:** Normalización de Bases de Datos  
**Estudiante:** Marcos Daniel Loera Sanchez  
**Matrícula:** I24050383  
**Periodo:** 2026-2  
**Fecha:** 31 de Octubre de 2026  

---

## 1. Planteamiento de la Estructura Desnormalizada (0FN)

Para ilustrar el proceso deductivo y la descomposición técnica, se parte de una estructura plana no normalizada denominada `REGISTRO_CONSULTAS_DESNORMALIZADO`:

```text
REGISTRO_CONSULTAS_DESNORMALIZADO (
    folio_cita, fecha_hora, id_paciente, curp_paciente, nombre_paciente, telefonos_paciente,
    cedula_medico, nombre_medico, id_especialidad, nombre_especialidad,
    medicamentos_recetados [id_medicamento, nombre_medicamento, dosis]
)
```
2. Desglose Metodológico Fase por Fase

🔹 Fase 1: Transición a 1FN (Primera Forma Normal)
* Problema en 0FN: telefonos_paciente es un atributo multivalorado y medicamentos_recetados es una lista anidada no atómica.

* Solución 1FN: Se garantiza la atomicidad extrayendo paciente_telefono y desglosando las recetas en tuplas individuales con clave primaria compuesta (folio_cita, id_medicamento).

🔹 Fase 2: Transición a 2FN (Segunda Forma Normal)
* Problema en 1FN: En la relación de recetas (folio_cita, id_medicamento), el atributo nombre_medicamento depende parcialmente de id_medicamento y no de folio_cita.

* Solución 2FN: Se separa la entidad medicamento a su propia tabla con PK id_medicamento, conservando únicamente en receta_medicamento las llaves foráneas y la dosis.

🔹 Fase 3: Transición a 3FN y Validación FNBC (Tercera Forma Normal)
* Problema en 2FN: Existencia de dependencia transitiva: cedula_medico $\rightarrow$ id_especialidad $\rightarrow$ nombre_especialidad.

* Solución 3FN: Se extrae la entidad especialidad con clave primaria id_especialidad, vinculándola mediante una clave foránea en la tabla medico.

### 3. Matriz Resumen de Descomposición de Tablas

| Estado Inicial (0FN) | 1FN (Atomicidad) | 2FN (Sin Dependencia Parcial) | 3FN / FNBC (Sin Dependencia Transitiva) |
| :--- | :--- | :--- | :--- |
| Tabla Plana Única | `paciente`<br>`paciente_telefono`<br>`cita_receta_plana` | `paciente`<br>`paciente_telefono`<br>`medicamento`<br>`receta_medicamento` | `paciente`<br>`paciente_telefono`<br>`especialidad`<br>`medico`<br>`cita`<br>`medicamento`<br>`receta_medicamento` |

## 4. Enlaces de Entregables Digitales

* 💾 **Script SQL Normalizado en GitHub:** [normalized\_schema.sql](./normalized%5Fschema.sql)
* 📄 **Reporte Formal en PDF:** [Reporte\_Tarea\_4\_2.pdf](./Reporte%5FTarea%5F4%5F2.pdf)

---

## 5. Referencias Bibliográficas (APA 7.ª ed.)

* Date, C. J. (2004). *An Introduction to Database Systems* (8th ed.). Addison-Wesley.
* Elmasri, R., &amp; Navathe, S. B. (2017). *Fundamentals of Database Systems* (7th ed.). Pearson.
* Silberschatz, A., Korth, H. F., &amp; Sudarshan, S. (2020). *Database System Concepts* (7th ed.). McGraw-Hill.
