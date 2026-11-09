--#### 02_data_inserts.sql

-- ============================================================
-- SCRIPT 02: LMD - POBLADO DE DATOS DE PRUEBA
-- Estudiante: Marcos Daniel Loera Sanchez (Matrícula: I24050383)
-- ============================================================

USE clinica_sql_db;
GO

INSERT INTO especialidad (nombre_especialidad, area_medica) VALUES
('Cardiología', 'Medicina Interna'),
('Medicina Familiar', 'Atención Primaria'),
('Pediatría', 'Medicina Infantil');

INSERT INTO medico (cedula_profesional, nombre_medico, email_institucional, id_especialidad) VALUES
('MED-1001', 'Dr. Roberto Gomez', 'roberto.gomez@clinica.ud', 1),
('MED-1002', 'Dra. Ana Martinez', 'ana.martinez@clinica.ud', 2),
('MED-1003', 'Dr. Carlos Ruiz', 'carlos.ruiz@clinica.ud', 3);

INSERT INTO paciente (curp, rfc, nombre, apellido_paterno, apellido_materno, fecha_nacimiento) VALUES
('LOEM010101HCHRR01', 'LOEM010101AAA', 'Marcos Daniel', 'Loera', 'Sanchez', '2001-05-15'),
('GARM950220HCHRR02', 'GARM950220BBB', 'Miguel', 'Garcia', 'Rios', '1995-02-20'),
('PERA030410MCHRR03', 'PERA030410CCC', 'Alicia', 'Perez', 'Alvarez', '2003-04-10');

INSERT INTO cita (fecha_hora, estado_cita, id_paciente, cedula_medico) VALUES
('2026-11-10 09:00:00', 'Programada', 1, 'MED-1001'),
('2026-11-10 10:30:00', 'Completada', 2, 'MED-1002'),
('2026-11-11 11:00:00', 'Programada', 3, 'MED-1003');

INSERT INTO medicamento (nombre_comercial, sustancia_activa) VALUES
('Paracetamol 500mg', 'Paracetamol'),
('Amoxicilina 875mg', 'Amoxicilina'),
('Losartán 50mg', 'Losartán Potassium');

INSERT INTO receta_medicamento (folio_cita, id_medicamento, dosis, frecuencia) VALUES
(1, 3, '1 tableta diaria', 'Cada 24 horas'),
(2, 1, '1 tableta', 'Cada 8 horas'),
(3, 2, '500mg', 'Cada 12 horas');
GO