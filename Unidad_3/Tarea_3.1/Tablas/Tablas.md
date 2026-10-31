[⬅️ Volver al README anterior](../../README.md)
## 2. Componentes Formales y Restricciones de Integridad 
| Componente / Restricción | Definición Técnica | Aplicación en la BD Clínica |
| :--- | :--- | :--- | 
| **Relación (Tabla)** | Estructura bidimensional con nombre único que contiene un conjunto de entidades. | Tablas `paciente`, `medico`, `cita`, `especialidad`. | 
| **Tupla (Fila)** | Registro individual dentro de una relación con valores específicos para cada atributo. | Registro único de un paciente con su CURP y datos. | 
| **Atributo (Columna)** | Propiedad o característica que describe a una entidad. | `cedula_profesional`, `fecha_hora`, `rfc`. | 
| **Dominio** | Conjunto de valores válidos de un tipo de dato permitido. | `fecha_nacimiento` (DATE), `estado_cita` (ENUM). | 
| **Integridad de Entidad** | Garantiza que toda tabla tenga una clave primaria (PK) única y no nula (NOT NULL). | `id_paciente INT PRIMARY KEY`. | 
| **Integridad Referencial** | Asegura que toda clave foránea (FK) coincida con una PK existente o sea nula. | `cita.id_paciente FK` --> `paciente.id_paciente`. | 
| **Integridad de Dominio** | Limita los valores permitidos mediante tipos de datos y cláusulas `CHECK`. | `CHECK (estado_cita IN ('Programada','Completada'))`. |
