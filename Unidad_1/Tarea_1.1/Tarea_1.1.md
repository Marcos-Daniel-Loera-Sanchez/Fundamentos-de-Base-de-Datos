[⬅️ Volver al README anterior](../README.md) 
# Tarea 1.1: Fundamentos, Objetivos y Modelos de Bases de Datos 

**Asignatura:** Fundamentos y Arquitectura de Bases de Datos 

**Unidad 1:** Introducción a las bases de datos 

**Estudiante:** Marcos Daniel Loera Sanchez 

**Profesor:** [Nombre del Docente] 

--- 

## 1. Introducción
El presente reporte analiza los conceptos fundamentales, los objetivos principales, las áreas de aplicación y la comparativa estructural de los modelos de bases de datos, conforme a las instrucciones de la Unidad 1 [2]. 

--- 

## 2. Conceptos Fundamentales, Objetivos y Áreas de Aplicación 

### 2.1. Conceptos Básicos 
* **Base de Datos (BD):** Colección organizada e interrelacionada de datos almacenados de forma persistente para responder a las necesidades de información de una organización.
* **Sistema de Gestión de Bases de Datos (SGBD):** Software especializado que actúa como interfaz entre la base de datos, los usuarios y las aplicaciones, garantizando el almacenamiento, seguridad e integridad de la información.

### 2.2\. Objetivos Principales 
1. **Control de Redundancia:** Reducir la duplicación innecesaria de información para optimizar el almacenamiento.
2. **Integridad de Datos:** Garantizar la precisión, consistencia y validez de los datos almacenados mediante reglas de negocio.
3. **Independencia de Datos:** Separar la estructura lógica de los datos de su representación física en disco.
4. **Acceso Concurrente y Seguridad:** Permitir el acceso simultáneo controlado, evitando conflictos mediante el manejo de transacciones y permisos de usuario.

### 2.3. Áreas de Aplicación 
* **Sistemas Bancarios y Financieros:** Administración de cuentas, transferencias y transacciones en tiempo real.
* **Comercio Electrónico:** Control de inventarios, carritos de compra y datos de clientes.
* **Sector Salud:** Gestión de expedientes clínicos electrónicos e historial de pacientes.
* **Educación:** Control escolar, gestión de matrículas y registro académico.

--- 

## 3. Mapa Conceptual Analítico A continuación se presenta la representación gráfica de los fundamentos, objetivos y aplicaciones de las bases de datos: 

![Mapa Conceptual](./Diagramas/mapa_conceptual.svg)

* ✏️ **Fuente Editable del Diagrama:** [`mapa_conceptual.drawio`](../Tarea_1.1/Diagramas/mapa_conceptual.drawio)

--- 

## 4. Tabla Comparativa de Modelos de Bases de Datos 
| Modelo de Base de Datos | Definición | Forma de Representación de Datos | 
| :--- | :--- | :--- | 
| **Jerárquico** | Organiza la información en una estructura de árbol invertido con nodos padre e hijo. | Registros en jerarquía con relaciones de tipo 1:N (un padre a múltiples hijos). | 
| **En Red** | Evolución del modelo jerárquico que permite relaciones complejas de muchos a muchos. | Estructura de grafo donde un registro hijo puede enlazarse a múltiples registros padres (relaciones N:M). | 
| **Relacional** | Modelo basado en la lógica de predicados y la teoría de conjuntos para organizar los datos. | Tablas bidimensionales (relaciones) compuestas por filas (tuplas) y columnas (atributos), vinculadas mediante llaves primarias y foráneas. | 
| **Orientado a Objetos** | Integra los conceptos de bases de datos con los principios de la programación orientada a objetos (POO). | Objetos que encapsulan tanto el estado (atributos) como el comportamiento (métodos u operaciones). | 

--- 

## 5. Enlaces de Entregables 
* 🎥 **Video Explicativo en YouTube:** [Ver exposición en YouTube]([suspicious link removed]) *(Reemplazar con tu enlace público)*
* 📂 **Repositorio de GitHub:** [Ver archivos fuente](https://github.com) *(Reemplazar con tu enlace)*

--- 

## 6. Referencias Bibliográficas (Formato APA) 
* Date, C. J. (2004). *An Introduction to Database Systems* (8th ed.). Addison-Wesley.
* Elmasri, R., &amp; Navathe, S. B. (2017). *Fundamentals of Database Systems* (7th ed.). Pearson.
* Silberschatz, A., Korth, H. F., &amp; Sudarshan, S. (2020). *Database System Concepts* (7th ed.). McGraw-Hill.
