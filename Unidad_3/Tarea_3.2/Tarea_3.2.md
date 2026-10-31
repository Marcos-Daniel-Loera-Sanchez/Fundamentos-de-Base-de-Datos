# Tarea 3.2: Generación del Esquema Físico en SGBD y Script LDD

**Asignatura:** Fundamentos de Bases de Datos  
**Unidad 3:** Modelo Relacional  
**Estudiante:** Marcos Daniel Loera Sanchez  
**Matrícula:** I24050383  
**Periodo:** 2026-2  
**Fecha:** 31 de Octubre de 2026  

---

## 1. Introducción y Diccionario de Datos

En este entregable se presenta la implementación física en SGBD mediante sentencias DDL en SQL, garantizando el cumplimiento del diccionario de datos y las pruebas de integridad [4].

### Diccionario de Datos Sintético:
* **`paciente`**: Registro de pacientes con PK `id_paciente` (AUTO_INCREMENT), restricciones `UNIQUE` en `curp` y `rfc` [4].
* **`medico`**: Registro de médicos con PK `cedula_profesional` y FK `id_especialidad` referenciando a `especialidad` [4].
* **`cita`**: Transacción de citas con FKs hacia `paciente` y `medico`, además de una restricción `CHECK (estado_cita IN ('Programada', 'Completada', 'Cancelada'))` [4].
* **`receta_medicamento`**: Tabla asociativa N:M con PK compuesta (`folio_cita`, `id_medicamento`) y borrado en cascada `ON DELETE CASCADE` [4].

---

## 2. Evidencias de Pruebas de Integridad en el SGBD [4, 5]

1. **Prueba de Inserción Limpia:** El script `schema.sql` se ejecuta sin errores ni advertencias [4, 5].
2. **Prueba de Integridad de Entidad (Rechazo de Duplicados):** Al intentar insertar un segundo paciente con la misma CURP, el SGBD devuelve `ERROR 1062 (23000): Duplicate entry` [4].
3. **Prueba de Integridad Referencial (RESTRICT):** Al intentar eliminar un paciente que tiene una cita activa, la base de datos bloquea la operación con `ERROR 1451 (23000)` protegiendo los datos [4].
4. **Prueba de Borrado en Cascada (CASCADE):** Al eliminar un registro de `cita`, sus renglones correspondientes en `receta_medicamento` se eliminan automáticamente sin dejar huérfanos [4].

---

## 3. Enlaces de Entregables Digitales [2, 5]

* 🎥 **Video en YouTube (Demostración de Ejecución en SGBD):** [Ver Video Demostrativo]([suspicious link removed]) *(Con cámara web en la esquina inferior derecha)* [2, 5]
* 📂 **Script SQL en GitHub:** [`schema.sql`](./schema.sql) [5]
* 📄 **Reporte Formal en PDF:** [`Reporte_Tarea_3_2.pdf`](./Reporte_Tarea_3_2.pdf) [4]

---

## 4. Referencias Bibliográficas

* Date, C. J. (2004). *An Introduction to Database Systems* (8th ed.). Addison-Wesley.
* Elmasri, R., &amp; Navathe, S. B. (2017). *Fundamentals of Database Systems* (7th ed.). Pearson.
* Silberschatz, A., Korth, H. F., &amp; Sudarshan, S. (2020). *Database System Concepts* (7th ed.). McGraw-Hill.
