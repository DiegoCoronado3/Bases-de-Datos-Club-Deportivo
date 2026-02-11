/*
   ARCHIVO: Consultas.sql
   AUTOR: Equipo Club Deportivo
   FECHA: 28/Nov/2025
   DESCRIPCION: Script que contiene 3 consultas 3 consultas 
   (empleando el uso de joins (diferentes tipos de JOINs), funciones de agregación, algebra relacional y subconsultas ).
*/

---------------------------------------------------------------------
--- 3 consultas (emplear el uso de joins (diferentes tipos de JOINs), 
---funciones de agregación, algebra relacional y subconsultas )
----------------------------------------------------------------------

USE [ClubDeportivo]

-- 1.- Total gastado por cada socio en actividades con cuota
-- Objetivo: Calcular cuánto dinero ha gastado cada socio en actividades con cuota

/* 
R1 ← SOCIO ⋈ USUARIO_WEB ⋈ PAGOS ⋈ INSCRIPCION ⋈ SERVICIOS_ACTIVIDADES

R2 ← γ ID_USUARIO, NOMBRE, APELLIDO_P, APELLIDO_M, SUM(MONTO)→TotalGastado (R1)

Resultado ← σ TotalGastado > 0 (R2)

*/

SELECT 
    s.ID_USUARIO,
    uw.NOMBRE + ' ' + uw.APELLIDO_P + ' ' + uw.APELLIDO_M AS NombreCompleto,
    SUM(p.MONTO) AS TotalGastado
FROM MEMBRESIA.SOCIO s
INNER JOIN MEMBRESIA.USUARIO_WEB uw -- JOINS: SOCIO → USUARIO_WEB → PAGOS → INSCRIPCION → SERVICIOS_ACTIVIDADES
    ON s.ID_USUARIO = uw.ID_USUARIO
INNER JOIN OPERACION.PAGOS p
    ON p.ID_USUARIO = s.ID_USUARIO
INNER JOIN OPERACION.INSCRIPCION i
    ON i.ID_INSCRIPCION = p.ID_INSCRIPCION
INNER JOIN OPERACION.SERVICIOS_ACTIVIDADES sa
    ON sa.ID_SERVICIO_ACTIVIDAD = i.ID_HORARIO   -- el horario está ligado a la actividad
GROUP BY s.ID_USUARIO, uw.NOMBRE, uw.APELLIDO_P, uw.APELLIDO_M
HAVING SUM(p.MONTO) > 0; -- Función de agregación: SUM(p.MONTO), Álgebra relacional: JOIN + γ (agrupación) + σ (filtro HAVING)

-- 2.- Socios y sus actividades GRATUITAS
-- Objetivo: Mostrar socios y las actividades GRATIS que han reservado

/*
R1 ← SOCIO ⟕ USUARIO_WEB
R2 ← R1 ⟕ INSCRIPCION
R3 ← R2 ⟕ HORARIO
R4 ← R3 ⟕ SERVICIOS_ACTIVIDADES
R5 ← R4 ⟕ GRATUITAS

Resultado ← σ (TIPO_ACTIVIDAD = 'GRATUITA' OR ID_SERVICIO_ACTIVIDAD IS NULL) (R5)

*/

SELECT 
    s.ID_USUARIO,
    uw.NOMBRE,
    sa.NOMBRE_ACTIVIDAD,
    i.FECHA_INSCRIPCION
FROM MEMBRESIA.SOCIO s -- JOIN: SOCIO → TIPO_MEMBRESIA
LEFT JOIN MEMBRESIA.USUARIO_WEB uw 
    ON s.ID_USUARIO = uw.ID_USUARIO
LEFT JOIN OPERACION.INSCRIPCION i -- JOINs: uso de LEFT JOIN para no perder socios sin inscripciones.
    ON i.ID_USUARIO = s.ID_USUARIO
LEFT JOIN OPERACION.HORARIO h
    ON h.ID_HORARIO = i.ID_HORARIO
LEFT JOIN OPERACION.SERVICIOS_ACTIVIDADES sa
    ON sa.ID_SERVICIO_ACTIVIDAD = h.ID_SERVICIO_ACTIVIDAD
LEFT JOIN OPERACION.GRATUITAS g
    ON g.ID_SERVICIO_ACTIVIDAD = sa.ID_SERVICIO_ACTIVIDAD
WHERE sa.TIPO_ACTIVIDAD = 'GRATUITA' -- Álgebra relacional: JOINs externos + selección σ (WHERE)
   OR sa.ID_SERVICIO_ACTIVIDAD IS NULL;



-- 3.- Entrenamientos con duración mayor o igual al promedio
-- Objetivo: listar los entrenamientos cuya duración es >= al promedio

/*
AvgDur ← γ AVG(DURACION_MINUTOS) → Promedio (ENTRENAMIENTO)

R1 ← ENTRENAMIENTO ⋈ (ENTRENAMIENTO.ID_USUARIO = SOCIO.ID_USUARIO) SOCIO
R2 ← R1 ⋈ (SOCIO.ID_USUARIO = USUARIO_WEB.ID_USUARIO) USUARIO_WEB
R3 ← R2 × AvgDur

Resultado ← σ (DURACION_MINUTOS ≥ Promedio) (R3)
*/
SELECT 
    e.ID_ENTRENAMIENTO,
    uw.NOMBRE + ' ' + uw.APELLIDO_P AS Socio,
    e.DURACION_MINUTOS,
    e.DIA_SEMANA
FROM OPERACION.ENTRENAMIENTO e
INNER JOIN MEMBRESIA.SOCIO s  -- JOINs: ENTRENAMIENTO → SOCIO → USUARIO_WEB
    ON e.ID_USUARIO = s.ID_USUARIO
INNER JOIN MEMBRESIA.USUARIO_WEB uw
    ON s.ID_USUARIO = uw.ID_USUARIO
WHERE e.DURACION_MINUTOS >= -- Álgebra relacional: JOIN + selección σ (duración ≥ promedio)
      (SELECT AVG(DURACION_MINUTOS) FROM OPERACION.ENTRENAMIENTO); -- Subconsulta: AVG(DURACION_MINUTOS)
