[⬅️ Volver al README anterior](../../README.md)
# 4. Tabla Comparativa de Componentes E-R / E-RE

| Concepto en Modelo E-R / E-RE | Equivalente en Notación UML | Análisis de Correspondencia Técnica |
| :--- | :--- | :--- |
| **Entidad Fuerte** (`MEDICO`, `PACIENTE`) | **Clase UML** (`Medico`, `Paciente`) | Pasa de ser una tabla estática a una clase orientada a objetos con visibilidad y métodos. |
| **Entidad Débil** (`EXPEDIENTE_CLINICO`) | **Relación de Composición** (`*--`) | Expresa dependencia total del ciclo de vida (si se destruye el `Paciente`, el `ExpedienteClinico` se elimina). |
| **Atributo Simple** (`curp`, `rfc`) | **Atributo Privado de Clase** (`- curp: String`) | Se encapsula con visibilidad privada (`-`) y se especifica su tipo de dato (`String`, `int`, etc.). |
| **Atributo Derivado** (`edad`) | **Método u Operación** (`+ getEdad(): int`) | En UML los cálculos se representan como comportamientos encapsulados públicos (`+`). |
| **Relación 1:N / N:M** | **Asociación con Multiplicidades** (`1` a `*`) | Se traducen en referencias o colecciones de objetos especificando cardinalidades exactas. |
| **Especialización E-RE** | **Herencia / Generalización** (`<--`) | Implementa la jerarquía donde la subclase hereda atributos y métodos de la superclase. |

