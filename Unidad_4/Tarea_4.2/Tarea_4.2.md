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
