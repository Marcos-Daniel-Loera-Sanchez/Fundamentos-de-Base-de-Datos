# Tarea 5.2: Resolución de Consultas sobre el Esquema Relacional con Álgebra Formal

**Asignatura:** Fundamentos de Bases de Datos  
**Unidad 5:** Álgebra Relacional  
**Estudiante:** Marcos Daniel Loera Sanchez  
**Matrícula:** I24050383  
**Periodo:** 2026-2  

---

## 1. Catálogo de 10 Consultas Formales en Álgebra Relacional

### Consulta 1: Citas Médicas Programadas
* **Lenguaje Natural:** Obtener todos los registros de citas que se encuentren en estado 'Programada'.
* **Fórmula Algebraica:**  
  $$\sigma_{estado\_cita='Programada'}(CITA)$$

### Consulta 2: Nómina Básica de Pacientes
* **Lenguaje Natural:** Obtener el nombre, apellido paterno y CURP de todos los pacientes.
* **Fórmula Algebraica:**  
  $$\pi_{nombre, apellido\_paterno, curp}(PACIENTE)$$

### Consulta 3: Pacientes Jóvenes (Nacidos después del 2000)
* **Lenguaje Natural:** Obtener el nombre y apellido paterno de los pacientes nacidos después del 1 de enero de 2000.
* **Fórmula Algebraica:**  
  $$\pi_{nombre, apellido\_paterno}(\sigma_{fecha\_nacimiento &gt; '2000-01-01'}(PACIENTE))$$

### Consulta 4: Citas de Pacientes con Fecha y Hora
* **Lenguaje Natural:** Mostrar el nombre del paciente junto con la fecha y hora de sus citas agendadas.
* **Fórmula Algebraica:**  
  $$\pi_{nombre, apellido\_paterno, fecha\_hora}(PACIENTE \bowtie_{PACIENTE.id\_paciente = CITA.id\_paciente} CITA)$$

### Consulta 5: Médicos y sus Especialidades
* **Lenguaje Natural:** Listar el nombre de cada médico junto con el nombre de su especialidad clínica.
* **Fórmula Algebraica:**  
  $$\pi_{nombre\_medico, nombre\_especialidad}(MEDICO \bowtie_{MEDICO.id\_especialidad = ESPECIALIDAD.id\_especialidad} ESPECIALIDAD)$$

### Consulta 6: Citas Atendidas en la Especialidad de Cardiología
* **Lenguaje Natural:** Mostrar el folio y la fecha de las citas atendidas por médicos especialistas en 'Cardiología'.
* **Fórmula Algebraica:**  
  $$\pi_{folio\_cita, fecha\_hora}(\sigma_{nombre\_especialidad='Cardiologia'}(CITA \bowtie MEDICO \bowtie ESPECIALIDAD))$$

### Consulta 7: Conteo de Citas por Paciente (Agregación)
* **Lenguaje Natural:** Calcular la cantidad total de citas agendadas por cada paciente.
* **Fórmula Algebraica:**  
  $$\_{id\\\_paciente}\\mathcal{G}\_{COUNT(folio\\\_cita)}(CITA)$$

### Consulta 8: Pacientes sin Citas Registradas (Left Outer Join)
* **Lenguaje Natural:** Listar a todos los pacientes registrados, incluyendo aquellos que aún no tienen citas agendadas.
* **Fórmula Algebraica:**  
  $$\pi_{nombre, apellido\_paterno, folio\_cita}(PACIENTE \mathbb{\rtimes}_{PACIENTE.id\_paciente = CITA.id\_paciente} CITA)$$

### Consulta 9: Citas con Medicamentos Prescritos
* **Lenguaje Natural:** Mostrar el folio de la cita, el nombre del paciente y la sustancia activa recetada.
* **Fórmula Algebraica:**  
  $$\pi_{folio\_cita, nombre, sustancia\_activa}(PACIENTE \bowtie CITA \bowtie RECETA\_MEDICAMENTO \bowtie MEDICAMENTO)$$

### Consulta 10: Pacientes Recetados con Todos los Medicamentos de la Lista (División)
* **Lenguaje Natural:** Identificar los folios de cita que contienen la totalidad de los medicamentos registrados.
* **Fórmula Algebraica:**  
  $$\pi_{folio\_cita, id\_medicamento}(RECETA\_MEDICAMENTO) \div \pi_{id\_medicamento}(MEDICAMENTO)$$

---

## 2. Enlaces de Entregables Digitales

* 📂 **Repositorio Público de GitHub:** [Ver repositorio en GitHub](https://github.com)
* 📄 **Reporte Formal en PDF:** [`Reporte_Tarea_5_2.pdf`](./Reporte_Tarea_5_2.pdf)
