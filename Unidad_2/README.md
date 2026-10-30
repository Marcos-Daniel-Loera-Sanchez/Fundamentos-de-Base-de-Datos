# Unidad 2: Diseño de Bases de Datos con el Modelo E-R

[⬅️ Volver al Índice Principal](../README.md)

---

## 📋 Índice de Actividades y Entregables

### 🔹 Actividad 2.1: Modelado Conceptual E-R y E-R Extendido de un Caso Real
* 📄 **Reporte Técnico (Markdown):** [`Tarea_2_1.md`](./Tarea_2.1/Tarea_2.1.md)
* 📄 **Reporte Formal (PDF):** [`Reporte_Tarea_2_1.pdf`](./Tarea_2.1/Tarea_2.1.pdf)
* 📄 **Diagrama Entidad-Relación y E-R Extendido** [`modelo_E-R`](./Tarea_2.1/Diagramas/modelo_E-R.md)
* 📋 **Tabla Comparativa de Componentes E-R / E-RE [Comparativa_E-R_E-RE](./Tarea_2.1/Diagramas/Tablas/Comparativa_E-R_E-RE.md)
* 🎥 **Video Explicativo en YouTube:** [Ver Exposición en YouTube]([suspicious link removed]) *(Reemplazar con tu enlace con cámara activa)*



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
