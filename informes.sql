/*
   ARCHIVO: informes.sql
   AUTOR: Equipo Club Deportivo
   FECHA: 28/Nov/2025
   DESCRIPCION: Script para Informes.
*/

USE [ClubDeportivo]
GO


-- REPORTE 1: Listado de ingresos diarios
-- USO: SELECT * FROM OPERACION.fn_ObtenerAccesosPorFechas
GO
CREATE OR ALTER PROCEDURE pa_ReporteIngresosDiarios
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    -- Llamamos a la FUNCIÓN 1
    SELECT * FROM OPERACION.fn_ObtenerAccesosPorFechas(@FechaInicio, @FechaFin)
    ORDER BY DIA DESC, HORA_ENTRADA ASC;
END;
GO

-- REPORTE 2: Rating Top 5 Actividades (Mes)
GO
CREATE OR ALTER PROCEDURE pa_Top5ActividadesDelMes
    @Mes INT,
    @Anio INT
AS
BEGIN
    SELECT TOP 5
        SA.NOMBRE_ACTIVIDAD,
        SA.TIPO_ACTIVIDAD,                 
        COUNT(I.ID_INSCRIPCION) AS TOTAL_SOLICITUDES
    FROM OPERACION.INSCRIPCION I
    JOIN OPERACION.HORARIO H 
        ON I.ID_HORARIO = H.ID_HORARIO
    JOIN OPERACION.SERVICIOS_ACTIVIDADES SA 
        ON H.ID_SERVICIO_ACTIVIDAD = SA.ID_SERVICIO_ACTIVIDAD
    WHERE 
        MONTH(I.FECHA_INSCRIPCION) = @Mes 
        AND YEAR(I.FECHA_INSCRIPCION) = @Anio
    GROUP BY 
        SA.NOMBRE_ACTIVIDAD,
        SA.TIPO_ACTIVIDAD           
    ORDER BY TOTAL_SOLICITUDES DESC;
END;
GO


-- REPORTE 3: Top 5 Actividades Vendidas (Rango)
GO
CREATE OR ALTER PROCEDURE pa_Top5ActividadesPorRango
    @FechaInicio DATETIME,
    @FechaFin DATETIME
AS
BEGIN
    SELECT TOP 5
        SA.NOMBRE_ACTIVIDAD,
        SA.TIPO_ACTIVIDAD, 
        COUNT(I.ID_INSCRIPCION) AS VENTAS,
        SUM(P.MONTO) AS INGRESOS
    FROM OPERACION.INSCRIPCION I
    JOIN OPERACION.HORARIO H 
        ON I.ID_HORARIO = H.ID_HORARIO
    JOIN OPERACION.SERVICIOS_ACTIVIDADES SA 
        ON H.ID_SERVICIO_ACTIVIDAD = SA.ID_SERVICIO_ACTIVIDAD
    JOIN OPERACION.PAGOS P 
        ON I.ID_INSCRIPCION = P.ID_INSCRIPCION
    WHERE 
        SA.TIPO_ACTIVIDAD = 'CUOTA'     
        AND I.FECHA_INSCRIPCION BETWEEN @FechaInicio AND @FechaFin
    GROUP BY 
        SA.NOMBRE_ACTIVIDAD, 
        SA.TIPO_ACTIVIDAD
	ORDER BY INGRESOS DESC;
END;
GO


-- REPORTE 4: Los 30 mejores socios
-- USO: Consultamos la VISTA 2
GO
CREATE OR ALTER PROCEDURE pa_Top30MejoresSocios
AS
BEGIN
    SELECT TOP 30 * FROM MEMBRESIA.VI_Ranking_Socios_Gasto
    WHERE TOTAL_GASTADO > 0
    ORDER BY ACTIVIDADES_COMPRADAS DESC, TOTAL_GASTADO DESC;
END;
GO



-- REPORTE 5: Las 5 actividades menos solicitadas
go
CREATE OR ALTER PROCEDURE pa_Top5ActividadesMenosSolicitadas
AS
BEGIN
    SELECT TOP 5 
        SA.NOMBRE_ACTIVIDAD,
        COUNT(I.ID_INSCRIPCION) AS TOTAL_INSCRIPCIONES,
        ISNULL(C.COSTO, 0) AS COSTO
    FROM 
        OPERACION.SERVICIOS_ACTIVIDADES SA
    LEFT JOIN OPERACION.CUOTA C ON SA.ID_SERVICIO_ACTIVIDAD = C.ID_SERVICIO_ACTIVIDAD
    LEFT JOIN OPERACION.HORARIO H ON SA.ID_SERVICIO_ACTIVIDAD = H.ID_SERVICIO_ACTIVIDAD
    LEFT JOIN OPERACION.INSCRIPCION I ON H.ID_HORARIO = I.ID_HORARIO
    GROUP BY SA.NOMBRE_ACTIVIDAD, C.COSTO
    ORDER BY TOTAL_INSCRIPCIONES ASC;
END;
GO



-- REPORTE 6: Cumpleaños del mes
-- USO: Consultamos la VISTA 3 y filtramos
GO
CREATE OR ALTER PROCEDURE pa_ReporteCumpleaniosDelMes
AS
BEGIN
    DECLARE @MesActual INT = MONTH(GETDATE());
    
    SELECT NOMBRE_COMPLETO, FECHA_NACIMIENTO, EMAIL 
    FROM MEMBRESIA.VI_Socios_Cumpleanios
    WHERE MES_CUMPLE = @MesActual
    ORDER BY DIA_CUMPLE;
END;
GO



-- REPORTE 7: Listado de actividades y horarios
-- USO: Consultamos la VISTA 1 directamente
GO
CREATE OR ALTER PROCEDURE pa_ReporteMallaHorarios
AS
BEGIN
    SELECT * FROM OPERACION.VI_Malla_Horarios_Completa
    ORDER BY 
        CASE DIA_SEMANA 
            WHEN 'Lunes' THEN 1 WHEN 'Martes' THEN 2 WHEN 'Miercoles' THEN 3 
            WHEN 'Jueves' THEN 4 WHEN 'Viernes' THEN 5 WHEN 'Sabado' THEN 6 WHEN 'Domingo' THEN 7 
        END;
END;
GO



-- REPORTE 8: Reporte mensual actividades cuota
-- USO: Usamos la FUNCIÓN 2 para calcular el monto
CREATE OR ALTER PROCEDURE pa_ReporteIngresosPorActividad
    @Mes INT,
    @Anio INT
AS
BEGIN
    SELECT 
        SA.NOMBRE_ACTIVIDAD,
        COUNT(I.ID_INSCRIPCION) AS CANTIDAD_INSCRIPCIONES,
        ISNULL(SUM(P.MONTO), 0) AS MONTO_RECAUDADO
    FROM 
        OPERACION.SERVICIOS_ACTIVIDADES SA
    -- Usamos LEFT JOIN para mostrar la actividad aunque no tenga ventas en ese mes
    LEFT JOIN OPERACION.HORARIO H ON SA.ID_SERVICIO_ACTIVIDAD = H.ID_SERVICIO_ACTIVIDAD
    LEFT JOIN OPERACION.INSCRIPCION I ON H.ID_HORARIO = I.ID_HORARIO 
                                     AND MONTH(I.FECHA_INSCRIPCION) = @Mes 
                                     AND YEAR(I.FECHA_INSCRIPCION) = @Anio
                                     AND I.ESTADO_INSCRIPCION = 'PAGADA' 
    LEFT JOIN OPERACION.PAGOS P ON I.ID_INSCRIPCION = P.ID_INSCRIPCION
    WHERE 
        SA.TIPO_ACTIVIDAD = 'CUOTA'  ---Solo actividades de Cuota
    GROUP BY 
        SA.NOMBRE_ACTIVIDAD
    ORDER BY 
        MONTO_RECAUDADO DESC, CANTIDAD_INSCRIPCIONES DESC;
END;
GO



-- REPORTE 9: Nuevos ingresos de socios
CREATE OR ALTER PROCEDURE pa_ReporteNuevosSocios
    @Mes INT,
    @Anio INT
AS
BEGIN
    SELECT 
        U.NOMBRE + ' ' + U.APELLIDO_P AS SOCIO,
        S.TIPO_MEMBRESIA,
        TM.COSTO AS COSTO_MEMBRESIA,
        S.FECHA_SOCIO
    FROM MEMBRESIA.SOCIO S
    JOIN MEMBRESIA.USUARIO_WEB U 
        ON S.ID_USUARIO = U.ID_USUARIO
    JOIN MEMBRESIA.TIPO_MEMBRESIA TM 
        ON S.TIPO_MEMBRESIA = TM.TIPO_MEMBRESIA
    WHERE MONTH(S.FECHA_SOCIO) = @Mes 
      AND YEAR(S.FECHA_SOCIO) = @Anio;
END;
GO



-- REPORTE 10: Reporte mensual de pagos
GO
CREATE OR ALTER PROCEDURE pa_ReportePagosMensual
    @Mes INT,
    @Anio INT
AS
BEGIN
    SELECT 
        DAY(P.FECHA_PAGO) AS DIA,
        U.NOMBRE + ' ' + U.APELLIDO_P AS SOCIO,
        P.MONTO,
        P.TIPO_CONCEPTO
    FROM OPERACION.PAGOS P
    JOIN MEMBRESIA.SOCIO S ON P.ID_USUARIO = S.ID_USUARIO
    JOIN MEMBRESIA.USUARIO_WEB U ON S.ID_USUARIO = U.ID_USUARIO
    WHERE MONTH(P.FECHA_PAGO) = @Mes AND YEAR(P.FECHA_PAGO) = @Anio
	AND P.MONTO > 0
    ORDER BY DIA;
END;
GO


----PRUEBAS----

-- Muestra quién entró al club en un rango de fechas.
-- Usamos del 1 al 30 de Noviembre 2025
EXEC pa_ReporteIngresosDiarios '2025-11-01', '2025-11-30';



-- Muestra las actividades con más inscripciones en Noviembre (Mes 11) de 2025
EXEC pa_Top5ActividadesDelMes @Mes = 11, @Anio = 2025;



-- Similar al anterior pero suma dinero y permite fechas específicas
EXEC pa_Top5ActividadesPorRango '2025-11-01', '2025-11-30';


-- Ranking de socios que más gastan y más actividades compran.
EXEC pa_Top30MejoresSocios;


-- Muestra las actividades con menos inscripciones
EXEC pa_Top5ActividadesMenosSolicitadas;


-- Muestra quién cumple años este mes (Nota: Si ejecutamos esto hoy, 
-- mostrará los del mes actual).
EXEC pa_ReporteCumpleaniosDelMes;



-- Listado completo de clases, días, horas y quién las da.
EXEC pa_ReporteMallaHorarios;



-- Cuánto dinero dejó cada clase de paga (Tenis, Box, etc.) en Noviembre 2025
EXEC pa_ReporteIngresosPorActividad @Mes = 11, @Anio = 2025;


-- Socios que se dieron de alta en Noviembre 2025
EXEC pa_ReporteNuevosSocios @Mes = 11, @Anio = 2025;


-- Desglose de cada pago recibido día por día en Noviembre 2025
EXEC pa_ReportePagosMensual @Mes = 11, @Anio = 2025;





