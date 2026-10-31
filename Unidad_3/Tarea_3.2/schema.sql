-- ============================================================
-- SCRIPT DE CREACIÓN DE BASE DE DATOS Y TABLAS (T-SQL / SQL SERVER)
-- Materia: Fundamentos y Arquitectura de Bases de Datos
-- Estudiante: Marcos Daniel Loera Sanchez (Matrícula: I24050383)
-- Unidad 3: Modelo Relacional - Caso Clínica Médica
-- ============================================================

-- 1. Creación de la Base de Datos
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'clinica_medica_db')
BEGIN
    ALTER DATABASE clinica_medica_db SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE clinica_medica_db;
END
GO

CREATE DATABASE clinica_medica_db;
GO

USE clinica_medica_db;
GO

-- 2. Tabla PACIENTE
CREATE TABLE paciente (
    id_paciente INT IDENTITY(1,1) PRIMARY KEY,
    curp VARCHAR(18) NOT NULL UNIQUE,
    rfc VARCHAR(13) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50) NULL,
    fecha_nacimiento DATE NOT NULL
);
GO

-- 3. Atributo Multivalorado: PACIENTE_TELEFONO
CREATE TABLE paciente_telefono (
    id_paciente INT NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    tipo_telefono VARCHAR(20) DEFAULT 'Móvil',
    PRIMARY KEY (id_paciente, telefono),
    CONSTRAINT fk_telefono_paciente FOREIGN KEY (id_paciente)
        REFERENCES paciente(id_paciente) ON UPDATE CASCADE ON DELETE CASCADE
);
GO

-- 4. Tabla ESPECIALIDAD
CREATE TABLE especialidad (
    id_especialidad INT IDENTITY(1,1) PRIMARY KEY,
    nombre_especialidad VARCHAR(100) NOT NULL UNIQUE,
    area_medica VARCHAR(100) NOT NULL
);
GO

-- 5. Tabla MEDICO
CREATE TABLE medico (
    cedula_profesional VARCHAR(20) PRIMARY KEY,
    nombre_medico VARCHAR(100) NOT NULL,
    email_institucional VARCHAR(100) NOT NULL UNIQUE,
    id_especialidad INT NOT NULL,
    CONSTRAINT fk_medico_especialidad FOREIGN KEY (id_especialidad)
        REFERENCES especialidad(id_especialidad) ON UPDATE CASCADE ON DELETE NO ACTION
);
GO

-- 6. Subclase E-RE: MEDICO_GENERAL
CREATE TABLE medico_general (
    cedula_profesional VARCHAR(20) PRIMARY KEY,
    id_consultorio_comunitario INT NOT NULL,
    CONSTRAINT fk_general_medico FOREIGN KEY (cedula_profesional)
        REFERENCES medico(cedula_profesional) ON UPDATE CASCADE ON DELETE CASCADE
);
GO

-- 7. Subclase E-RE: MEDICO_ESPECIALISTA
CREATE TABLE medico_especialista (
    cedula_profesional VARCHAR(20) PRIMARY KEY,
    subespecialidad VARCHAR(100) NOT NULL,
    numero_certificacion VARCHAR(50) NOT NULL UNIQUE,
    CONSTRAINT fk_especialista_medico FOREIGN KEY (cedula_profesional)
        REFERENCES medico(cedula_profesional) ON UPDATE CASCADE ON DELETE CASCADE
);
GO

-- 8. Tabla CITA
CREATE TABLE cita (
    folio_cita INT IDENTITY(1,1) PRIMARY KEY,
    fecha_hora DATETIME NOT NULL,
    estado_cita VARCHAR(20) NOT NULL DEFAULT 'Programada',
    id_paciente INT NOT NULL,
    cedula_medico VARCHAR(20) NOT NULL,
    CONSTRAINT chk_estado_cita CHECK (estado_cita IN ('Programada', 'Completada', 'Cancelada')),
    CONSTRAINT fk_cita_paciente FOREIGN KEY (id_paciente)
        REFERENCES paciente(id_paciente) ON UPDATE CASCADE ON DELETE NO ACTION,
    CONSTRAINT fk_cita_medico FOREIGN KEY (cedula_medico)
        REFERENCES medico(cedula_profesional) ON UPDATE NO ACTION ON DELETE NO ACTION
);
GO

-- 9. Entidad Débil: EXPEDIENTE_CLINICO (1:1)
CREATE TABLE expediente_clinico (
    id_expediente INT IDENTITY(1,1) PRIMARY KEY,
    id_paciente INT NOT NULL UNIQUE,
    fecha_apertura DATE NOT NULL,
    observaciones_generales NVARCHAR(MAX) NULL,
    CONSTRAINT fk_expediente_paciente FOREIGN KEY (id_paciente)
        REFERENCES paciente(id_paciente) ON UPDATE CASCADE ON DELETE CASCADE
);
GO

-- 10. Tabla MEDICAMENTO
CREATE TABLE medicamento (
    id_medicamento INT IDENTITY(1,1) PRIMARY KEY,
    nombre_comercial VARCHAR(100) NOT NULL UNIQUE,
    sustancia_activa VARCHAR(100) NOT NULL
);
GO

-- 11. Relación N:M: RECETA_MEDICAMENTO
CREATE TABLE receta_medicamento (
    folio_cita INT NOT NULL,
    id_medicamento INT NOT NULL,
    dosis VARCHAR(100) NOT NULL,
    frecuencia VARCHAR(100) NOT NULL,
    PRIMARY KEY (folio_cita, id_medicamento),
    CONSTRAINT fk_receta_cita FOREIGN KEY (folio_cita)
        REFERENCES cita(folio_cita) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_receta_medicamento FOREIGN KEY (id_medicamento)
        REFERENCES medicamento(id_medicamento) ON UPDATE CASCADE ON DELETE NO ACTION
);
GO

-- ============================================================
-- INSERCIÓN DE DATOS DE PRUEBA
-- ============================================================
INSERT INTO paciente (curp, rfc, nombre, apellido_paterno, apellido_materno, fecha_nacimiento) VALUES
('LOEM010101HCHRR01', 'LOEM010101AAA', 'Marcos Daniel', 'Loera', 'Sanchez', '2001-05-15');

INSERT INTO especialidad (nombre_especialidad, area_medica) VALUES
('Cardiología', 'Medicina Interna'),
('Medicina Familiar', 'Atención Primaria');

INSERT INTO medico (cedula_profesional, nombre_medico, email_institucional, id_especialidad) VALUES
('MED-1001', 'Dr. Roberto Gomez', 'roberto.gomez@clinica.ud', 1),
('MED-1002', 'Dra. Ana Martinez', 'ana.martinez@clinica.ud', 2);

INSERT INTO cita (fecha_hora, estado_cita, id_paciente, cedula_medico) VALUES
('2026-11-05 10:00:00', 'Programada', 1, 'MED-1001');
GO



---