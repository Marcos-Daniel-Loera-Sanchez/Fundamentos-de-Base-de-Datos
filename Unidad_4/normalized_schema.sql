-- ============================================================
-- SCRIPT DE BASE DE DATOS TOTALMENTE NORMALIZADA (3FN / FNBC)
-- Asignatura: Fundamentos y Arquitectura de Bases de Datos
-- Estudiante: Marcos Daniel Loera Sanchez (Matrícula: I24050383)
-- Unidad 4: Normalización - Esquema Final Limpio para SSMS
-- ============================================================

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'clinica_normalizada_db')
BEGIN
    ALTER DATABASE clinica_normalizada_db SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE clinica_normalizada_db;
END
GO

CREATE DATABASE clinica_normalizada_db;
GO

USE clinica_normalizada_db;
GO

-- 1. Tabla ESPECIALIDAD (3FN: Resuelve dependencia transitiva id_especialidad -&gt; nombre_especialidad)
CREATE TABLE especialidad (
    id_especialidad INT IDENTITY(1,1) PRIMARY KEY,
    nombre_especialidad VARCHAR(100) NOT NULL UNIQUE,
    area_medica VARCHAR(100) NOT NULL
);
GO

-- 2. Tabla MEDICO
CREATE TABLE medico (
    cedula_profesional VARCHAR(20) PRIMARY KEY,
    nombre_medico VARCHAR(100) NOT NULL,
    email_institucional VARCHAR(100) NOT NULL UNIQUE,
    id_especialidad INT NOT NULL,
    CONSTRAINT fk_medico_especialidad FOREIGN KEY (id_especialidad)
        REFERENCES especialidad(id_especialidad) ON UPDATE CASCADE ON DELETE NO ACTION
);
GO

-- 3. Tabla PACIENTE (1FN: Atributos atómicos)
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

-- 4. Tabla PACIENTE_TELEFONO (1FN: Elimina atributo multivalorado)
CREATE TABLE paciente_telefono (
    id_paciente INT NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    PRIMARY KEY (id_paciente, telefono),
    CONSTRAINT fk_telefono_paciente FOREIGN KEY (id_paciente)
        REFERENCES paciente(id_paciente) ON UPDATE CASCADE ON DELETE CASCADE
);
GO

-- 5. Tabla CITA
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

-- 6. Tabla MEDICAMENTO (2FN: Elimina dependencia parcial)
CREATE TABLE medicamento (
    id_medicamento INT IDENTITY(1,1) PRIMARY KEY,
    nombre_comercial VARCHAR(100) NOT NULL UNIQUE,
    sustancia_activa VARCHAR(100) NOT NULL
);
GO

-- 7. Tabla RECETA_MEDICAMENTO (1FN/2FN/3FN: Relación N:M atómica y dependiente completa)
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

---