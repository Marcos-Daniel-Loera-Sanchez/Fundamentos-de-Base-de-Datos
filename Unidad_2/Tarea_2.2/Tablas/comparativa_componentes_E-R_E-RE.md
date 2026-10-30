[⬅️ Volver al README anterior](../../Unidad__README.md)
# 4. Tabla Comparativa de Componentes E-R / E-RE
| Componente E-R | Elemento del Caso Real | Descripción y Clasificación |
| :--- | :--- | :--- |
| **Entidades Fuertes** | PACIENTE, MEDICO, CITA, ESPECIALIDAD | Poseen clave primaria explícita. |
| **Entidad Débil** | EXPEDIENTE_CLINICO | Depende de la existencia de la entidad PACIENTE. |
| **Atributo Compuesto** | nombre_completo | Descompuesto en: nombre, apellido_paterno, apellido_materno. |
| **Atributo Derivado** | edad | Calculado dinámicamente desde fecha_nacimiento. |
| **Atributo Multivalorado** | telefonos | Admite múltiples números de contacto por paciente. |
| **Jerarquía E-R** | MEDICO → GENERAL / ESPECIALISTA | Especialización total y disjunta. |
