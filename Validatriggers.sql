/*
   ARCHIVO: Validatriggers.sql
   AUTOR: Equipo Club Deportivo
   FECHA: 28/Nov/2025
   DESCRIPCION: Script que contiene los triggers para validar su funcionamiento.
*/
-- =======================
---VALIDAR TRIGGERS 
-- =======================


USE [ClubDeportivo]
GO


-- =================================================================================
-- PRUEBA 1: VALIDAR TRIGGER "TRG_Validar_Deuda"
-- Escenario: Intentar inscribir a un socio con estatus 'A' (Adeudo) en una actividad.
-- =================================================================================

select * from MEMBRESIA.SOCIO
where ESTADO_SOCIO = 'A'

-- 1. Intentamos la operación prohibida
BEGIN TRY
    INSERT INTO OPERACION.INSCRIPCION (ID_USUARIO, ID_HORARIO, ESTADO_INSCRIPCION) 
    VALUES (33, 1, 'SOLICITADA'); -- Socio 15 intenta inscribirse a Tenis
    
    -- Si llega aquí, el trigger falló
    PRINT '   [FALLO] El trigger NO bloqueó la inscripción del socio con ADEUDO.';
END TRY
BEGIN CATCH
    -- Si entra aquí, el trigger funcionó
    PRINT '   Mensaje de Error Recibido: ' + ERROR_MESSAGE();
END CATCH



-- =================================================================================
-- PRUEBA 2: VALIDAR TRIGGER "TRG_Limite_Entrenamiento"
-- Escenario: Intentar registrar un entrenamiento que sume más de 120 min en un día.
-- =================================================================================

-- 1. Preparamos: Socio 21 ya tiene 60 min el Lunes (Carga Inicial). 
--    Intentamos agregar 90 minutos más ese mismo día (Total 150 min).

BEGIN TRY
    INSERT INTO OPERACION.ENTRENAMIENTO (ID_USUARIO, DIA_SEMANA, HORA_INICIO, DURACION_MINUTOS)
    VALUES (21, 'Lunes', '10:00', 90);
    
END TRY
BEGIN CATCH
    PRINT '   Mensaje de Error Recibido: ' + ERROR_MESSAGE();
END CATCH
GO


-- =================================================================================
-- PRUEBA 3: VALIDAR TRIGGER "TRG_Duracion_Reserva"
-- Escenario: Intentar hacer una reserva de 2 horas (debe ser de 1 hora exacta).
-- =================================================================================
BEGIN TRY
    INSERT INTO OPERACION.ALQUILER (ID_USUARIO, ID_INSTALACION, ID_MATERIAL, FECHA, HORA_INICIO, HORA_FIN, ESTADO_ALQUILER)
    VALUES (22, 'CTA01', NULL, '2025-12-01', '10:00', '12:00', 'SOLICITADO'); -- Duración: 2 horas
   
END TRY
BEGIN CATCH
    PRINT '   Mensaje de Error Recibido: ' + ERROR_MESSAGE();
END CATCH
GO



-- =================================================================================
-- PRUEBA 4: VALIDAR TRIGGER "TRG_Validar_Acceso_Instalaciones"
-- Escenario: Socio moroso intenta reservar una cancha (Ingresar).
-- =================================================================================


select * from MEMBRESIA.SOCIO
where ESTADO_SOCIO = 'A'
-- 1. Ponemos el socio 25 como ADEUDO

BEGIN TRY
    INSERT INTO OPERACION.ALQUILER (ID_USUARIO, ID_INSTALACION, ID_MATERIAL, FECHA, HORA_INICIO, HORA_FIN, ESTADO_ALQUILER)
    VALUES (25, 'ALB01', NULL, '2025-12-01', '09:00', '10:00', 'SOLICITADO');
    
END TRY
BEGIN CATCH
    PRINT '   Mensaje de Error Recibido: ' + ERROR_MESSAGE();
END CATCH



-- =================================================================================
-- PRUEBA 5: VALIDAR TRIGGER "TRG_Validar_Traslape_Horario"
-- Escenario: Intentar empalmar una clase nueva sobre una existente.
-- =================================================================================

-- Nota: Ya existe Tenis en 'CTA01' los Lunes de 08:00 a 09:00 (ID Horario 1).
-- Intentaremos meter Badminton en 'CTA01' el Lunes de 08:30 a 09:30.

BEGIN TRY
    INSERT INTO OPERACION.HORARIO (ID_SERVICIO_ACTIVIDAD, ID_INSTALACION, ID_PROFESOR, DIA_SEMANA, HORA_INICIO, HORA_FIN)
    VALUES (16, 'CTA01', 11, 'Lunes', '08:30', '09:30'); 
    
END TRY
BEGIN CATCH
    PRINT '   Mensaje de Error Recibido: ' + ERROR_MESSAGE();
END CATCH
GO


-----PRUEBA 6
-- Insertamos una inscripción válida primero
INSERT INTO OPERACION.INSCRIPCION (ID_USUARIO, ID_HORARIO, ESTADO_INSCRIPCION)
VALUES (22, 5, 'SOLICITADA');

-- Capturamos el ID recién generado
DECLARE @id_inscripcion INT;
SET @id_inscripcion = SCOPE_IDENTITY();

-- Ahora insertamos el pago usando la inscripción recién creada
INSERT INTO OPERACION.PAGOS (ID_USUARIO, ID_INSCRIPCION, MONTO, FECHA_PAGO, METODO_PAGO)
VALUES (22, @id_inscripcion, 500, DATEADD(DAY,6,GETDATE()), 'E');  -- Esto activa el trigger si pasa de 5 días



---------PRUEBA 7
-- Actualizamos la fecha de ingreso para probar el bono
UPDATE MEMBRESIA.EMPLEADO
SET FECHA_INGRESO = DATEADD(YEAR, -10, FECHA_INGRESO)
WHERE ID_USUARIO = 19;  -- ID del empleado que quieres probar

select * from MEMBRESIA.EMPLEADO

SELECT *
FROM MEMBRESIA.BONO_EMPLEADO
WHERE ID_USUARIO = 19;