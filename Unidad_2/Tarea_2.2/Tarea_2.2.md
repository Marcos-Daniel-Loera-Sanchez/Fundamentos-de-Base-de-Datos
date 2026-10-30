## 📌 Actividad 2.2: Transición de Diagrama E-R a Notación UML

### 1\. Introducción al Mapeo E-R a UML

En este desarrollo se realiza la transformación conceptual del modelo Entidad-Relación hacia el **Diagrama de Clases UML**, estableciendo la correspondencia entre objetos de base de datos y componentes orientados a objetos.

### 2\. Diagrama de Clases UML (Mermaid)

```
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

✏️ **Fuente editable en Draw.io:** [diagrama\_uml\_clases.drawio](./Tarea%5F2.2/diagramas/diagrama%5Fuml%5Fclases.drawio)

### 3\. Tabla de Mapeo Directo: Modelo E-R vs. Notación UML

| Concepto E-R / E-RE              | Equivalente en UML                 | Análisis de Correspondencia                                                 |
| -------------------------------- | ---------------------------------- | --------------------------------------------------------------------------- |
| **Entidad Fuerte** (`MEDICO`)    | **Clase UML** (`Medico`)           | Pasa de tabla pasiva a clase con atributos privados (`-`) y métodos (`+`).  |
| **Entidad Débil** (`EXPEDIENTE`) | **Composición** (`*--`)            | Si se elimina el `Paciente`, su `ExpedienteClinico` se destruye en cascada. |
| **Atributos Simples**            | **Propiedades de Clase**           | Se especifican visibilidad y tipos de datos (ej. `- idPaciente: int`).      |
| **Atributo Derivado** (`edad`)   | **Método de Clase** (`getEdad()`)  | En UML se calcula dinámicamente mediante comportamiento encapsulado.        |
| **Relaciones (1:N, N:M)**        | **Asociaciones con Multiplicidad** | Se traducen en referencias o colecciones con multiplicidades (`1` a `*`).   |
| **Especialización E-RE**         | **Herencia / Generalización** (\`&lt; | \--\`)                                                                      |

### 4\. Entregables y Enlaces

* 📄 **Reporte Formal en PDF:** [Reporte\_Tarea\_2\_2.pdf](./Tarea2.2/ReporteTarea.pdf)
* 🎥 **Video Explicativo:** [Ver Exposición en YouTube]([suspicious link removed]) *(Reemplazar con tu enlace)*

---

## 📚 Referencias Bibliográficas (APA 7.ª edición)

* Date, C. J. (2004). *An Introduction to Database Systems* (8th ed.). Addison-Wesley.
* Elmasri, R., &amp; Navathe, S. B. (2017). *Fundamentals of Database Systems* (7th ed.). Pearson.
* Fowler, M. (2004). *UML Distilled: A Brief Guide to the Standard Object Modeling Language* (3rd ed.). Addison-Wesley.
* Silberschatz, A., Korth, H. F., &amp; Sudarshan, S. (2020). *Database System Concepts* (7th ed.). McGraw-Hill.
