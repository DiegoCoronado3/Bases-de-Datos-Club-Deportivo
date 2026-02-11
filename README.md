# Bases-de-Datos-Club-Deportivo

# Sistema de Gestión de Club Deportivo 🏋️‍♂️🏊‍♀️

Este proyecto consiste en el diseño e implementación completa de una base de datos relacional en **SQL Server** para la gestión integral de un club deportivo. El sistema automatiza procesos críticos como membresías, reservaciones de instalaciones, control de pagos, entrenamientos personalizados y dietas.

## 📋 Características Principales

El sistema está diseñado bajo una arquitectura robusta que incluye:

* **Gestión de Usuarios:** Roles diferenciados para `Socios` y `Empleados` con esquemas de seguridad.
* **Operación Diaria:** Control de acceso, reservación de instalaciones (Canchas, Albercas, Gimnasio) y control de inventario de material.
* **Membresías y Pagos:** Gestión de cuotas, validación de estados de cuenta y cortes de acceso automático por morosidad.
* **Salud y Fitness:** Módulos para asignación de rutinas de entrenamiento y planes alimenticios (dietas).

## 🛠️ Tecnologías y Estructura

* **Motor de Base de Datos:** SQL Server (T-SQL)
* **Modelado:** Normalización hasta 3FN.
* **Esquemas:** Organización lógica en `MEMBRESIA` y `OPERACION`.

### Componentes del Código
El proyecto implementa lógica de negocio avanzada mediante:
* **15+ Tablas Relacionales:** Con integridad referencial y restricciones (Check constraints).
* **Triggers:** Validación automática de reglas de negocio (ej. límite de 2 horas de entrenamiento, bloqueo de socios con adeudo, validación de aforos).
* **Stored Procedures:** Más de 15 procedimientos para transacciones complejas (inscripciones, pagos) y reportes estadísticos.
* **Vistas y Funciones:** Para seguridad de datos y cálculos recurrentes (ingresos mensuales, rankings de socios).

## 🚀 Instalación y Uso

Para desplegar este proyecto en tu entorno local de SQL Server, ejecuta los scripts en el siguiente orden estricto:

1.  **`sql/01_creaBase.sql`**: Crea la base de datos, esquemas y tablas.
2.  **`sql/02_dml_logica.sql`**: Carga los Stored Procedures, Funciones y Triggers.
3.  **`sql/03_seguridad.sql`**: Configura los Roles y Usuarios del sistema.
4.  **`sql/04_cargaInicial.sql`**: Pobla la base de datos con datos de prueba (seed data).
5.  **`sql/05_informes.sql`**: Genera los procedimientos de reporte.

## 📊 Reportes Incluidos

El sistema incluye procedimientos almacenados para generar informes ejecutivos:
* `pa_ReporteIngresosDiarios`: Flujo de caja diario.
* `pa_Top5ActividadesDelMes`: Análisis de tendencias y demanda.
* `pa_Top30MejoresSocios`: Identificación de clientes VIP.
* `pa_ReportePagosMensual`: Auditoría financiera.

## 📂 Documentación

Puedes encontrar la documentación completa del proyecto, incluyendo el diagrama relacional y el diccionario de datos, en la carpeta `/docs`.

---
*Autor: Equipo Club Deportivo | Proyecto Académico/Portafolio 2025*
