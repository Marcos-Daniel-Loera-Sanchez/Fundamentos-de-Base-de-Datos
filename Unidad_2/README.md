# Unidad 2: Diseño de Bases de Datos con el Modelo E-R

[⬅️ Volver al Índice Principal](../README.md)

---

## 📋 Índice de Actividades y Entregables

### 🔹 Actividad 2.1: Modelado Conceptual E-R y E-R Extendido de un Caso Real
* 📄 **Reporte Técnico (Markdown):** [`Tarea_2_1.md`](./Tarea_2.1/Tarea_2.1.md)
* 📄 **Reporte Formal (PDF):** [`Reporte_Tarea_2_1.pdf`](./Tarea_2.1/Reporte_Tarea_2.1.pdf)
* 🎥 **Video Explicativo en YouTube:** [Ver Exposición en YouTube]([suspicious link removed]) *(Reemplazar con tu enlace con cámara activa)*

#### Diagrama Entidad-Relación y E-R Extendido:
```mermaid
erDiagram
    PACIENTE {
        int id_paciente PK
        string curp
        string rfc
        string nombre_completo "Compuesto: Nombre, ApPaterno, ApMaterno"
        date fecha_nacimiento
        int edad "Derivado"
        string telefonos "Multivalorado"
    }

    ESPECIALIDAD {
        int id_especialidad PK
        string nombre_especialidad
        string area_medica
    }

    MEDICO {
        string cedula_profesional PK
        string nombre_medico
        string email_institucional
    }

    MEDICO_GENERAL {
        string cedula_profesional PK
        int id_consultorio_comunitario
    }

    MEDICO_ESPECIALISTA {
        string cedula_profesional PK
        string subespecialidad
        string numero_certificacion
    }

    CITA {
        int folio_cita PK
        datetime fecha_hora
        string estado_cita
    }

    EXPEDIENTE_CLINICO {
        int id_expediente PK
        date fecha_apertura
        string observaciones_generales
    }

    MEDICAMENTO {
        int id_medicamento PK
        string nombre_comercial
        string sustancia_activa
    }

    %% Relaciones y Cardinalidades
    ESPECIALIDAD ||--|{ MEDICO : "adscribe (1:N)"
    PACIENTE ||--o{ CITA : "solicita (1:N)"
    MEDICO ||--o{ CITA : "atiende (1:N)"
    PACIENTE ||--|| EXPEDIENTE_CLINICO : "posee (1:1)"
    CITA }|--|{ MEDICAMENTO : "prescribe en receta (N:M)"

    %% Jerarquía E-RE (Especialización)
    MEDICO ||--|| MEDICO_GENERAL : "es"
    MEDICO ||--|| MEDICO_ESPECIALISTA : "es"

```

---

### 🔹 Actividad 2.2: Transición de Diagrama E-R a Notación UML

* 📄 **Reporte Técnico (Markdown):** [Tarea_2_2.md](./Tarea2.2/Tarea.md)
* 📄 **Reporte Formal (PDF):** [Reporte_Tarea_2_2.pdf](./Tarea2.2/Reporte_Tarea.pdf)
* 🎥 **Video Explicativo en YouTube:** [Ver Exposición en YouTube]([suspicious link removed]) *(Reemplazar con tu enlace con cámara activa)*

#### Diagrama de Clases UML:

```mermaid
classDiagram
    class Paciente {
        -int idPaciente
        -String curp
        -String rfc
        -String nombre
        -String apellidoPaterno
        -Date fechaNacimiento
        +getEdad() int
        +agendarCita() void
    }

    class Especialidad {
        -int idEspecialidad
        -String nombreEspecialidad
        +getMedicosAdscritos() List
    }

    class Medico {
        #String cedulaProfesional
        #String nombreMedico
        #String email
        +consultarAgenda() List
    }

    class MedicoGeneral {
        -int idConsultorioComunitario
        +atenderConsultaGeneral() void
    }

    class MedicoEspecialista {
        -String subespecialidad
        -String numeroCertificacion
        +programarProcedimiento() void
    }

    class Cita {
        -int folioCita
        -DateTime fechaHora
        -String estado
        +cancelarCita() boolean
    }

    class ExpedienteClinico {
        -int idExpediente
        -Date fechaApertura
        -String observaciones
        +agregarDiagnostico(String) void
    }

    class Medicamento {
        -int idMedicamento
        -String nombreComercial
        -String sustanciaActiva
    }

    %% Relaciones y Herencia UML
    Medico &lt;|-- MedicoGeneral : Herencia
    Medico &lt;|-- MedicoEspecialista : Herencia
    Especialidad "1" --&gt; "*" Medico : Adscripcion
    Paciente "1" --&gt; "*" Cita : Solicita
    Medico "1" --&gt; "*" Cita : Atiende
    Paciente "1" *-- "1" ExpedienteClinico : Composicion
    Cita "*" --&gt; "*" Medicamento : Prescribe
```
