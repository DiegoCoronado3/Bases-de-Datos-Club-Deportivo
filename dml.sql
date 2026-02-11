/*
   ARCHIVO: dml.sql
   AUTOR: Equipo Club Deportivo
   FECHA: 28/Nov/2025
   DESCRIPCION: Script DML este script contiene los procedimientos
   almacenados, funciones, disparadores y vistas 
*/

-----------------------------------------------------
--------- STORE PROCEDURE
-----------------------------------------------------

-- 1.-Registrar compra de una actividad con cuota

USE [ClubDeportivo]

CREATE OR ALTER PROCEDURE OPERACION.spRegistrarCompraActividadCuota
    @ID_Usuario INT,
    @ID_Horario INT,
    @MetodoPago VARCHAR(20),
    @Banco VARCHAR(50) = NULL,
    @NumTarjeta VARCHAR(20) = NULL,
    @VigMes INT = NULL,
    @VigAnio INT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        
        -- Validar que el horario existe y es una actividad con cuota
        IF NOT EXISTS (
            SELECT 1
            FROM OPERACION.HORARIO H
            JOIN OPERACION.SERVICIOS_ACTIVIDADES SA ON H.ID_SERVICIO_ACTIVIDAD = SA.ID_SERVICIO_ACTIVIDAD
            JOIN OPERACION.CUOTA C ON SA.ID_SERVICIO_ACTIVIDAD = C.ID_SERVICIO_ACTIVIDAD
            WHERE H.ID_HORARIO = @ID_Horario
        )
        BEGIN
            RAISERROR('El horario no corresponde a una actividad con cuota.', 16, 1);
            RETURN;
        END
        
        DECLARE @Costo DECIMAL(10,2),
                @ID_Insc INT;

        SELECT @Costo = C.COSTO
        FROM OPERACION.HORARIO H
        JOIN OPERACION.CUOTA C ON H.ID_SERVICIO_ACTIVIDAD = C.ID_SERVICIO_ACTIVIDAD
        WHERE H.ID_HORARIO = @ID_Horario;

        -- Registrar inscripción como PAGADA
        INSERT INTO OPERACION.INSCRIPCION(ID_USUARIO, ID_HORARIO, ESTADO_INSCRIPCION)
        VALUES(@ID_Usuario, @ID_Horario, 'PAGADA');

        SET @ID_Insc = SCOPE_IDENTITY();

        -- Registrar pago
        INSERT INTO OPERACION.PAGOS(
            ID_USUARIO, ID_INSCRIPCION, MONTO,
            METODO_PAGO, BANCO, NUM_TARJETA, VIGENCIA_MES, VIGENCIA_ANIO, TIPO_CONCEPTO
        )
        VALUES(
            @ID_Usuario, @ID_Insc, @Costo,
            @MetodoPago, @Banco, @NumTarjeta, @VigMes, @VigAnio, 'ACTIVIDAD'
        );

        PRINT 'Compra registrada correctamente.';
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END;
GO

---------------------
-- sección de prueba 1
---------------------

SELECT H.ID_HORARIO, SA.NOMBRE_ACTIVIDAD, C.COSTO
FROM OPERACION.HORARIO H
JOIN OPERACION.SERVICIOS_ACTIVIDADES SA ON H.ID_SERVICIO_ACTIVIDAD = SA.ID_SERVICIO_ACTIVIDAD
JOIN OPERACION.CUOTA C ON SA.ID_SERVICIO_ACTIVIDAD = C.ID_SERVICIO_ACTIVIDAD;

EXEC OPERACION.spRegistrarCompraActividadCuota
    @ID_Usuario = 1,
    @ID_Horario = 3,   -- un horario con cuota
    @MetodoPago = 'Tarjeta',
    @Banco = 'BBVA',
    @NumTarjeta = '4111111111111111',
    @VigMes = 12,
    @VigAnio = 2028;

SELECT * FROM OPERACION.INSCRIPCION ORDER BY ID_INSCRIPCION DESC;
SELECT * FROM OPERACION.PAGOS ORDER BY ID_PAGO DESC;

---------------------------------------------------------------
--2.- SP registrar reservación de actividad SIN cuota (gratuita)
----------------------------------------------------------------
CREATE OR ALTER PROCEDURE OPERACION.spRegistrarActividadGratuita
    @ID_Usuario INT,
    @ID_Horario INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        
        IF NOT EXISTS(
            SELECT 1 
            FROM OPERACION.HORARIO H
            JOIN OPERACION.SERVICIOS_ACTIVIDADES SA ON H.ID_SERVICIO_ACTIVIDAD = SA.ID_SERVICIO_ACTIVIDAD
            WHERE H.ID_HORARIO = @ID_Horario
              AND SA.TIPO_ACTIVIDAD = 'GRATUITA'
        )
        BEGIN
            RAISERROR('La actividad indicada no es gratuita.', 16, 1);
            RETURN;
        END

        INSERT INTO OPERACION.INSCRIPCION(ID_USUARIO, ID_HORARIO, ESTADO_INSCRIPCION)
        VALUES(@ID_Usuario, @ID_Horario, 'SOLICITADA');

        PRINT 'Inscripción registrada (actividad gratuita).';

    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END;
GO
-----------------------
-- sección de prueba 2
-----------------------
SELECT H.ID_HORARIO, SA.NOMBRE_ACTIVIDAD
FROM OPERACION.HORARIO H
JOIN OPERACION.SERVICIOS_ACTIVIDADES SA ON H.ID_SERVICIO_ACTIVIDAD = SA.ID_SERVICIO_ACTIVIDAD
WHERE SA.TIPO_ACTIVIDAD = 'GRATUITA';

select * from OPERACION.INSCRIPCION

EXEC OPERACION.spRegistrarActividadGratuita 
    @ID_Usuario = 21,
    @ID_Horario = 5; 

SELECT * FROM OPERACION.INSCRIPCION ORDER BY ID_INSCRIPCION DESC;

--------------------------------------
-- 3.- SP registrar dieta de un socio
--------------------------------------
CREATE OR ALTER PROCEDURE OPERACION.spRegistrarDieta
    @ID_Usuario INT,
    @ID_Platillo INT,
    @DiaSemana VARCHAR(15),
    @CaloriasTotales INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        
        IF NOT EXISTS(SELECT 1 FROM MEMBRESIA.SOCIO WHERE ID_USUARIO=@ID_Usuario)
        BEGIN
            RAISERROR('El usuario no es socio.', 16, 1);
            RETURN;
        END

        INSERT INTO OPERACION.DIETA(ID_USUARIO, ID_PLATILLO, DIA_SEMANA, CALORIAS_TOTALES)
        VALUES (@ID_Usuario, @ID_Platillo, @DiaSemana, @CaloriasTotales);

        PRINT 'Dieta registrada correctamente.';
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END;
GO
----------------------------------
-- 3.- sección de pruebas
----------------------------------

SELECT * FROM OPERACION.PLATILLO;

EXEC OPERACION.spRegistrarDieta
    @ID_Usuario = 1,
    @ID_Platillo = 2,
    @DiaSemana = 'Lunes',
    @CaloriasTotales = 550;

SELECT * FROM OPERACION.DIETA ORDER BY ID_DIETA DESC;

-----------------------------------------------------
-- 4.- SP registrar entrenamiento de un socio
----------------------------------------------------

CREATE OR ALTER PROCEDURE OPERACION.spRegistrarEntrenamiento
    @ID_Usuario INT,
    @DiaSemana VARCHAR(15),
    @HoraInicio TIME,
    @DuracionMinutos INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY

        IF NOT EXISTS(SELECT 1 FROM MEMBRESIA.SOCIO WHERE ID_USUARIO=@ID_Usuario)
        BEGIN
            RAISERROR('El usuario no es socio.', 16, 1);
            RETURN;
        END

        INSERT INTO OPERACION.ENTRENAMIENTO(ID_USUARIO, DIA_SEMANA, HORA_INICIO, DURACION_MINUTOS)
        VALUES(@ID_Usuario, @DiaSemana, @HoraInicio, @DuracionMinutos);

        PRINT 'Entrenamiento registrado.';
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END;
GO

--------------------
-- 4.- sección de pruebas
---------------------------

EXEC OPERACION.spRegistrarEntrenamiento
    @ID_Usuario = 31,
    @DiaSemana = 'Martes',
    @HoraInicio = '07:00',
    @DuracionMinutos = 60;

	SELECT * FROM OPERACION.ENTRENAMIENTO ORDER BY ID_ENTRENAMIENTO DESC;

--------------------------------------------------
-- 5.- SP registrar actividades/servicios del club
---------------------------------------------------
CREATE OR ALTER PROCEDURE OPERACION.spRegistrarActividad
    @Nombre VARCHAR(100),
    @Descripcion VARCHAR(MAX),
    @Tipo VARCHAR(20),
    @EdadMin INT = 16
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        
        INSERT INTO OPERACION.SERVICIOS_ACTIVIDADES(NOMBRE_ACTIVIDAD, DESCRIPCION, TIPO_ACTIVIDAD, EDAD_MINIMA)
        VALUES(@Nombre, @Descripcion, @Tipo, @EdadMin);

        PRINT 'Actividad del club registrada.';

    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END;
GO

-------------------------------
-- 5.- sección de pruebas
-------------------------------
EXEC OPERACION.spRegistrarActividad
    @Nombre = 'Yoga Terapéutico',
    @Descripcion = 'Sesiones suaves y guiadas para recuperación física',
    @Tipo = 'GRATUITA',
    @EdadMin = 18;

	SELECT * FROM OPERACION.SERVICIOS_ACTIVIDADES ORDER BY ID_SERVICIO_ACTIVIDAD DESC;

-----------------------------------------------------------
-- 6.- SP búsqueda de socios por nombre / paterno / materno
-----------------------------------------------------------

CREATE OR ALTER PROCEDURE MEMBRESIA.spBuscarSocios
    @Nombre VARCHAR(50) = NULL,
    @Paterno VARCHAR(50) = NULL,
    @Materno VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        U.ID_USUARIO,
        U.NOMBRE,
        U.APELLIDO_P,
        U.APELLIDO_M,
        S.NUM_SOCIO,
        S.TIPO_MEMBRESIA,
        S.ESTADO_SOCIO
    FROM MEMBRESIA.USUARIO_WEB U
    JOIN MEMBRESIA.SOCIO S ON U.ID_USUARIO = S.ID_USUARIO
    WHERE
        (@Nombre IS NULL OR U.NOMBRE LIKE '%' + @Nombre + '%')
        AND (@Paterno IS NULL OR U.APELLIDO_P LIKE '%' + @Paterno + '%')
        AND (@Materno IS NULL OR U.APELLIDO_M LIKE '%' + @Materno + '%');
END;
GO

------------------------------------
-- 6.- sección  de pruebas 
------------------------------------
Select * from MEMBRESIA.USUARIO_WEB

EXEC MEMBRESIA.spBuscarSocios @Nombre = 'Javier';

EXEC MEMBRESIA.spBuscarSocios @Paterno = 'Navarro';

EXEC MEMBRESIA.spBuscarSocios @Paterno = 'Roman', @Materno = 'Luz';


EXEC MEMBRESIA.spBuscarSocios 
    @Nombre = 'Ricardo', 
    @Paterno = 'Campos', 
    @Materno = 'Vega';









-----------------------------
--			VISTAS
-----------------------------


-- VISTA 1: Malla de Horarios Completa 
-- Muestra todas las clases, horarios y profesores de forma legible.
GO
CREATE OR ALTER VIEW OPERACION.VI_Malla_Horarios_Completa
AS
SELECT 
    SA.NOMBRE_ACTIVIDAD,
    H.DIA_SEMANA,
    -- Formateamos la hora pa que se vea bonita
    FORMAT(CAST(H.HORA_INICIO AS DATETIME), 'HH:mm') + ' - ' + FORMAT(CAST(H.HORA_FIN AS DATETIME), 'HH:mm') AS HORARIO,
    I.NOMBRE_INSTALACION AS LUGAR,
    U.NOMBRE + ' ' + U.APELLIDO_P AS PROFESOR
FROM 
    OPERACION.HORARIO H
JOIN OPERACION.SERVICIOS_ACTIVIDADES SA ON H.ID_SERVICIO_ACTIVIDAD = SA.ID_SERVICIO_ACTIVIDAD
JOIN OPERACION.INSTALACION I ON H.ID_INSTALACION = I.ID_INSTALACION
JOIN MEMBRESIA.EMPLEADO E ON H.ID_PROFESOR = E.ID_USUARIO
JOIN MEMBRESIA.USUARIO_WEB U ON E.ID_USUARIO = U.ID_USUARIO;
GO

-- VISTA 2: Ranking de Socios por Gasto
-- Calcula cuánto ha gastado cada socio en total histórico.
GO
CREATE OR ALTER VIEW MEMBRESIA.VI_Ranking_Socios_Gasto
AS
SELECT 
    S.ID_USUARIO,
    S.NUM_SOCIO,
    U.NOMBRE + ' ' + U.APELLIDO_P AS NOMBRE_SOCIO,
    COUNT(I.ID_INSCRIPCION) AS ACTIVIDADES_COMPRADAS,
    ISNULL(SUM(P.MONTO), 0) AS TOTAL_GASTADO
FROM 
    MEMBRESIA.SOCIO S
JOIN MEMBRESIA.USUARIO_WEB U ON S.ID_USUARIO = U.ID_USUARIO
LEFT JOIN OPERACION.INSCRIPCION I ON S.ID_USUARIO = I.ID_USUARIO
LEFT JOIN OPERACION.PAGOS P ON I.ID_INSCRIPCION = P.ID_INSCRIPCION
GROUP BY 
    S.ID_USUARIO, S.NUM_SOCIO, U.NOMBRE, U.APELLIDO_P;
GO

select * from OPERACION.SERVICIOS_ACTIVIDADES

-- VISTA 3: Datos de Cumpleaños
-- Prepara la lista de cumpleaños con correos.
GO
CREATE OR ALTER VIEW MEMBRESIA.VI_Socios_Cumpleanios
AS
SELECT 
    S.NUM_SOCIO,
    U.NOMBRE + ' ' + U.APELLIDO_P AS NOMBRE_COMPLETO,
    S.FECHA_NACIMIENTO,
    MONTH(S.FECHA_NACIMIENTO) AS MES_CUMPLE,
    DAY(S.FECHA_NACIMIENTO) AS DIA_CUMPLE,
    (SELECT TOP 1 CORREO FROM MEMBRESIA.SOCIO_CORREO WHERE ID_USUARIO = S.ID_USUARIO) AS EMAIL
FROM 
    MEMBRESIA.SOCIO S
JOIN MEMBRESIA.USUARIO_WEB U ON S.ID_USUARIO = U.ID_USUARIO;
GO





--------------------------------
--		FUNCIONES
--------------------------------


-- FUNCION 1: Obtener Accesos por Rango de Fechas 
-- Recibe fechas y devuelve una tabla con los datos filtrados.
GO
CREATE OR ALTER FUNCTION OPERACION.fn_ObtenerAccesosPorFechas
(
    @FechaInicio DATE,
    @FechaFin DATE
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        S.NUM_SOCIO,
        U.NOMBRE + ' ' + U.APELLIDO_P AS NOMBRE_COMPLETO,
        A.FECHA AS DIA,
        A.HORA_INICIO AS HORA_ENTRADA,
        A.HORA_FIN AS HORA_SALIDA,
        I.NOMBRE_INSTALACION
    FROM 
        OPERACION.ALQUILER A
    JOIN MEMBRESIA.SOCIO S ON A.ID_USUARIO = S.ID_USUARIO
    JOIN MEMBRESIA.USUARIO_WEB U ON S.ID_USUARIO = U.ID_USUARIO
    JOIN OPERACION.INSTALACION I ON A.ID_INSTALACION = I.ID_INSTALACION
    WHERE 
        A.FECHA BETWEEN @FechaInicio AND @FechaFin
        AND A.ESTADO_ALQUILER IN ('ENTREGADO', 'DEVUELTO')
);
GO



-- FUNCION 2: Calcular Ingresos Totales de una Actividad en un Mes
-- Recibe una actividad y fecha, devuelve el dinero recaudado (DECIMAL).
GO
CREATE OR ALTER FUNCTION OPERACION.fn_CalcularIngresosActividad
(
    @IdActividad INT,
    @Mes INT,
    @Anio INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @Total DECIMAL(10,2);

    SELECT @Total = SUM(P.MONTO)
    FROM OPERACION.PAGOS P
    JOIN OPERACION.INSCRIPCION I ON P.ID_INSCRIPCION = I.ID_INSCRIPCION
    JOIN OPERACION.HORARIO H ON I.ID_HORARIO = H.ID_HORARIO
    WHERE H.ID_SERVICIO_ACTIVIDAD = @IdActividad
      AND MONTH(P.FECHA_PAGO) = @Mes
      AND YEAR(P.FECHA_PAGO) = @Anio;

    RETURN ISNULL(@Total, 0);
END;
GO





-- =======================
---TRIGGERS 
-- =======================



-- TRIGGER 1: Validar Deuda
-- Regla: Si el socio debe más de un mes ya no puede ingresar a las instalaciones
CREATE OR ALTER TRIGGER OPERACION.TRG_Validar_Deuda
ON OPERACION.INSCRIPCION
AFTER INSERT
AS
BEGIN
    DECLARE @IdUsuario INT;  
    DECLARE @Estado CHAR(1);
    SELECT @IdUsuario = i.ID_USUARIO FROM inserted i;
    
    -- Verifica estado en tabla SOCIO
    SELECT @Estado = ESTADO_SOCIO FROM MEMBRESIA.SOCIO WHERE ID_USUARIO = @IdUsuario;

    IF @Estado = 'A' -- A = Adeudo
    BEGIN
        RAISERROR ('ACCESO DENEGADO: El socio presenta adeudos pendientes.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

-- TRIGGER 2: Límite de Entrenamiento
-- Regla: Hasta 2 horas de entrenamiento al día
CREATE OR ALTER TRIGGER OPERACION.TRG_Limite_Entrenamiento
ON OPERACION.ENTRENAMIENTO
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @IdUsuario INT;
    DECLARE @DiaSemana VARCHAR(15);
    DECLARE @TotalMinutos INT;

    -- 1. Obtenemos quién es y qué día se está intentando registrar
    SELECT @IdUsuario = i.ID_USUARIO, @DiaSemana = i.DIA_SEMANA 
    FROM inserted i;

    -- 2. Sumamos SOLO los entrenamientos de ESE USUARIO en ESE DÍA ESPECÍFICO
    SELECT @TotalMinutos = SUM(DURACION_MINUTOS) 
    FROM OPERACION.ENTRENAMIENTO 
    WHERE ID_USUARIO = @IdUsuario AND DIA_SEMANA = @DiaSemana;

    -- 3. Validamos si ese día se pasó de 120 minutos (2 horas)
    IF @TotalMinutos > 120 
    BEGIN
        RAISERROR ('ERROR: El socio excede las 2 horas de entrenamiento permitidas para el día %s.', 16, 1, @DiaSemana);
        ROLLBACK TRANSACTION;
    END
END;
GO

-- TRIGGER 3: Duración de Reserva
-- Regla: Las reservaciones serán de una hora
CREATE OR ALTER TRIGGER OPERACION.TRG_Duracion_Reserva
ON OPERACION.ALQUILER
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @Inicio TIME;
    DECLARE @Fin TIME;
    SELECT @Inicio = HORA_INICIO, @Fin = HORA_FIN FROM inserted;
    
    -- Valida que la diferencia sea exactamente 60 minutos
    IF DATEDIFF(MINUTE, @Inicio, @Fin) <> 60
    BEGIN
        RAISERROR ('REGLA: La reservación debe durar exactamente 1 hora.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO



--- TRIGGER 4: Ser un socio registrado es condición indispensable para adquirir servicios de cuota e ingresar al club 
CREATE OR ALTER TRIGGER OPERACION.TRG_Validar_Acceso_Instalaciones
ON OPERACION.ALQUILER
AFTER INSERT
AS
BEGIN
    DECLARE @IdUsuario INT;
    DECLARE @Estado CHAR(1);
    DECLARE @ExisteSocio BIT;

    SELECT @IdUsuario = i.ID_USUARIO FROM inserted i;
    
    -- 1. Validar que sea Socio Registrado
    IF NOT EXISTS (SELECT 1 FROM MEMBRESIA.SOCIO WHERE ID_USUARIO = @IdUsuario)
    BEGIN
        RAISERROR ('ERROR DE ACCESO: El usuario no es un socio registrado activo.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    SELECT @Estado = ESTADO_SOCIO FROM MEMBRESIA.SOCIO WHERE ID_USUARIO = @IdUsuario;

    IF @Estado = 'A' -- A = Adeudo
    BEGIN
        RAISERROR ('ACCESO DENEGADO: El socio presenta adeudos y no puede utilizar las instalaciones.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO


---trigger 5
--- VALIDA QUE NO SE TRALAPEN LOS HORARIOS
CREATE OR ALTER TRIGGER OPERACION.TRG_Validar_Traslape_Horario
ON OPERACION.HORARIO
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificamos si existe algún registro en la tabla HORARIO que choque con lo que acabamos de insertar
    IF EXISTS (
        SELECT 1 
        FROM OPERACION.HORARIO h
        JOIN inserted i ON h.ID_INSTALACION = i.ID_INSTALACION -- Misma Instalación
                        AND h.DIA_SEMANA = i.DIA_SEMANA      -- Mismo Día
        WHERE 
            h.ID_HORARIO <> i.ID_HORARIO -- Ignoramos el registro mismo que estamos insertando/editando
            AND (
                -- Lógica de Intersección de Horarios:
                -- (El nuevo inicia antes de que el existente termine) Y (El nuevo termina después de que el existente inicie)
                (i.HORA_INICIO < h.HORA_FIN) AND (i.HORA_FIN > h.HORA_INICIO)
            )
    )
    BEGIN
        -- Si entramos aquí, hubo conflicto
        RAISERROR ('ERROR DE HORARIO: La instalación ya está ocupada en ese rango de horas para el día seleccionado.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
GO




---TRIGGER 6: Los socios deben pagar los primeros 5 días de cada mes
CREATE or ALTER TRIGGER TR_Validar_Pago_5_Dias
ON OPERACION.PAGOS
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ID_USUARIO INT, @ID_INSCRIPCION INT, @fechaPago DATE, @fechaInscripcion DATE;

    -- Tomamos los valores del INSERT
    SELECT 
        @ID_USUARIO = ID_USUARIO, 
        @ID_INSCRIPCION = ID_INSCRIPCION, 
        @fechaPago = FECHA_PAGO
    FROM inserted;

    -- Obtenemos la fecha de inscripción del socio
    SELECT @fechaInscripcion = FECHA_INSCRIPCION 
    FROM OPERACION.INSCRIPCION 
    WHERE ID_INSCRIPCION = @ID_INSCRIPCION;

    -- Verificamos si pasaron más de 5 días desde la inscripción
    IF DATEDIFF(DAY, @fechaInscripcion, @fechaPago) > 5
    BEGIN
        -- Actualizamos el estado del socio a adeudo
        UPDATE MEMBRESIA.SOCIO
        SET ESTADO_SOCIO = 'A'
        WHERE ID_USUARIO = @ID_USUARIO;

        -- Opcional: mensaje
        RAISERROR('Pago fuera del plazo de 5 días desde la inscripción. Se actualizó el estado del socio a adeudo.', 16, 1);
    END
END;
GO



------TRIGGER 7
----CREAMOS UNA TABLA BONO PARA GUARDAR AHI A LOS GANADORES DEL BONO 
CREATE TABLE MEMBRESIA.BONO_EMPLEADO (
    ID_BONO INT PRIMARY KEY IDENTITY(1,1),
    ID_USUARIO INT,
    FECHA_CALCULO DATE,
    MONTO DECIMAL(10,2),
    DESCRIPCION VARCHAR(255),
    CONSTRAINT FK_Bono_Empleado FOREIGN KEY (ID_USUARIO) 
        REFERENCES MEMBRESIA.EMPLEADO(ID_USUARIO)
);

go
CREATE OR ALTER TRIGGER TRG_Calcular_Bono
ON MEMBRESIA.EMPLEADO
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @id_usuario INT, @antiguedad INT, @monto DECIMAL(10,2);

    -- Recorremos los registros afectados
    DECLARE cur CURSOR FOR
        SELECT ID_USUARIO, DATEDIFF(YEAR, FECHA_INGRESO, GETDATE())
        FROM inserted;

    OPEN cur;
    FETCH NEXT FROM cur INTO @id_usuario, @antiguedad;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Solo si la antigüedad es múltiplo de 5 y al menos 5 años
        IF (@antiguedad >= 5 AND @antiguedad % 5 = 0)
        BEGIN
            SET @monto = @antiguedad * 100; -- ejemplo: $100 por año de bono
            INSERT INTO MEMBRESIA.BONO_EMPLEADO (ID_USUARIO, FECHA_CALCULO, MONTO, DESCRIPCION)
            VALUES (@id_usuario, GETDATE(), @monto, 'Bono por antigüedad');
        END

        FETCH NEXT FROM cur INTO @id_usuario, @antiguedad;
    END

    CLOSE cur;
    DEALLOCATE cur;
END;
GO



---------------TRIGGER 8
/*
3. Cuota trimestral

Los socios deben pagar su cuota cada 3 meses.
El trigger revisará cada pago y verificará que no pasen más de 3 meses desde el último.
*/
CREATE TRIGGER TR_Cuota_Trimestral
ON OPERACION.PAGOS
FOR INSERT
AS
BEGIN
    DECLARE @id INT, @ultimoPago DATE, @nuevoPago DATE;

    SELECT @id = ID_USUARIO, @nuevoPago = FECHA_PAGO
    FROM inserted;

    SELECT @ultimoPago = MAX(FECHA_PAGO)
    FROM OPERACION.PAGOS
    WHERE ID_USUARIO = @id
      AND ID_PAGO NOT IN (SELECT ID_PAGO FROM inserted);

    IF (@ultimoPago IS NOT NULL AND DATEDIFF(MONTH, @ultimoPago, @nuevoPago) > 3)
    BEGIN
        RAISERROR('El socio debe pagar una cuota cada 3 meses como máximo.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
GO





