[⬅️ Volver al README anterior](../README.md) 
# Tarea 6.1: Sintaxis y Clasificación de Sentencias SQL (LDD y LMD)

**Asignatura:** Fundamentos de Bases de Datos  
**Unidad 6:** Introducción al Lenguaje SQL  
**Estudiante:** Marcos Daniel Loera Sanchez  
**Matrícula:** I24050383  
**Periodo:** 2026-2  

---

## 1. Clasificación del Lenguaje SQL

SQL (Structured Query Language) es el estándar internacional ANSI/ISO para la definición y manipulación de datos. Se divide en dos sublenguajes principales:

```mermaid
graph TD
    A[<b>Lenguaje SQL</b>] --&gt; B[<b>LDD / DDL</b><br />Definición de Estructura]
    A --&gt; C[<b>LMD / DML</b><br />Manipulación de Datos]
    B --&gt; B1[CREATE]
    B --&gt; B2[ALTER]
    B --&gt; B3[DROP]
    B --&gt; B4[TRUNCATE]
    C --&gt; C1[INSERT]
    C --&gt; C2[UPDATE]
    C --&gt; C3[DELETE]
    C --&gt; C4[SELECT]

```

---

## 2. Lenguaje de Definición de Datos (LDD / DDL)

| Sentencia        | Propósito Técnico                                                                      | Sintaxis General                                            |
| ---------------- | -------------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| `CREATE TABLE`   | Define una nueva tabla con columnas, tipos de datos y restricciones.                   | `CREATE TABLE nombre (col1 TIPO RESTRICCION, ...);`         |
| `ALTER TABLE`    | Modifica la estructura de una tabla existente (agrega o elimina columnas/constraints). | `ALTER TABLE nombre ADD CONSTRAINT fk_name FOREIGN KEY...;` |
| `DROP TABLE`     | Elimina permanentemente una tabla y sus datos de la base de datos.                     | `DROP TABLE nombre_tabla;`                                  |
| `TRUNCATE TABLE` | Vacía todas las tuplas de una tabla de forma rápida liberando almacenamiento.          | `TRUNCATE TABLE nombre_tabla;`                              |

---

## 3. Lenguaje de Manipulación de Datos (LMD / DML)

| Sentencia     | Propósito Técnico                                                      | Sintaxis General                                                          |
| ------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| `INSERT INTO` | Inserta nuevas tuplas o registros en una tabla.                        | `INSERT INTO tabla (col1, col2) VALUES (val1, val2);`                     |
| `UPDATE`      | Modifica los valores de atributos en tuplas existentes bajo condición. | `UPDATE tabla SET col1 = val1 WHERE condicion;`                           |
| `DELETE FROM` | Elimina tuplas específicas que cumplen una condición especificada.     | `DELETE FROM tabla WHERE condicion;`                                      |
| `SELECT`      | Consulta, filtra y agrega información combinando múltiples cláusulas.  | `SELECT col FROM tabla WHERE cond GROUP BY col HAVING cond ORDER BY col;` |

---

## 4. Enlaces de Entregables Digitales

* 📄 **Reporte Formal en PDF:** [`Tarea_6.1.pdf`](./Tarea_6.1.pdf)
