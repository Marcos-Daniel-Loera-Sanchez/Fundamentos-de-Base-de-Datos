--#### 03_queries_dml.sql

-- ============================================================
-- SCRIPT 03: LMD - CONSULTAS ANALÍTICAS Y MANTENIMIENTO
-- Estudiante: Marcos Daniel Loera Sanchez (Matrícula: I24050383)
-- ============================================================

USE clinica_sql_db;
GO

-- 1. Consulta Básica con Filtro WHERE y Ordenamiento ORDER BY
SELECT nombre, apellido_paterno, curp, fecha_nacimiento
FROM paciente
WHERE fecha_nacimiento = '2000-01-01'
ORDER BY apellido_paterno ASC;

-- 2. Consulta con INNER JOIN de tres tablas
SELECT c.folio_cita, c.fecha_hora, c.estado_cita,
       p.nombre + ' ' + p.apellido_paterno AS paciente,
       m.nombre_medico, e.nombre_especialidad
FROM cita c
INNER JOIN paciente p ON c.id_paciente = p.id_paciente
INNER JOIN medico m ON c.cedula_medico = m.cedula_profesional
INNER JOIN especialidad e ON m.id_especialidad = e.id_especialidad;

-- 3. Agrupación GROUP BY, HAVING y Función de Agregación COUNT
SELECT e.nombre_especialidad, COUNT(m.cedula_profesional) AS total_medicos
FROM especialidad e
LEFT JOIN medico m ON e.id_especialidad = m.id_especialidad
GROUP BY e.nombre_especialidad
HAVING COUNT(m.cedula_profesional) = 1;

-- 4. Operación de Mantenimiento UPDATE
UPDATE cita
SET estado_cita = 'Completada'
WHERE folio_cita = 1;

-- Verificación post-update
SELECT * FROM cita WHERE folio_cita = 1;
GO