[⬅️ Volver al README anterior](../README.md) 
# Tarea 6.2: Implementación de Script DDL, Carga de Datos y Consultas DML

**Asignatura:** Fundamentos de Bases de Datos  
**Unidad 6:** Introducción al Lenguaje SQL  
**Estudiante:** Marcos Daniel Loera Sanchez  
**Matrícula:** I24050383  
**Periodo:** 2026-2  

---

## 1. Arquitectura del Proyecto SQL

El proyecto práctico de la Unidad 6 se estructura en tres scripts SQL modulares ejecutables en SQL Server Management Studio (SSMS):

1. **`01_schema_ddl.sql`:** Contiene la definición del esquema físico, tablas, claves primarias, claves foráneas y restricciones `CHECK` y `UNIQUE`.
2. **`02_data_inserts.sql`:** Realiza la siembra inicial de datos de prueba respetando la integridad referencial.
3. **`03_queries_dml.sql`:** Implementa consultas analíticas avanzadas (`JOIN`, `GROUP BY`, `HAVING`, agregaciones) y sentencias de actualización (`UPDATE`).

---

## 2. Guía de Ejecución en SSMS

1. Abrir SQL Server Management Studio y conectarse a la instancia local.
2. Ejecutar secuencialmente los scripts:
   * **Paso 1:** Ejecutar `01_schema_ddl.sql` (crea la BD `clinica_sql_db` y 6 tablas).
   * **Paso 2:** Ejecutar `02_data_inserts.sql` (puebla la información de prueba).
   * **Paso 3:** Ejecutar `03_queries_dml.sql` (ejecuta las consultas y validaciones).

---

## 3. Enlaces de Entregables Digitales

* 📂 **Repositorio Público de GitHub:** [Ver repositorio en GitHub](https://github.com)
* 💾 **Scripts SQL:** [`01_schema_ddl.sql`](./scripts/01_schema_ddl.sql) | [`02_data_inserts.sql`](./scripts/02_data_inserts.sql) | [`03_queries_dml.sql`](./scripts/03_queries_dml.sql)
* 📄 **Reporte Formal en PDF:** [`Reporte_Tarea_6_2.pdf`](./Tarea_6.2.pdf)
