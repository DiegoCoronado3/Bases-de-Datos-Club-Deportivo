/*
   ARCHIVO: cargainicial.sql
   AUTOR: Equipo Club Deportivo
   FECHA: 27/Nov/2025
   DESCRIPCION: Script de carga inicial con datos para llenar las tablitas.

*/

use [ClubDeportivo]


-- 20 EMPLEADOS (Tipo 'E') - IDs 1 al 20
INSERT INTO MEMBRESIA.USUARIO_WEB (NOMBRE, APELLIDO_P, APELLIDO_M, CALLE, NUMERO, COLONIA, ALCALDIA, USUARIO, CONTRASEÑA, TIPO_USUARIO) VALUES 
('Juan', 'Perez', 'Lopez', 'Av. Siempre Viva', '123', 'Centro', 'Coyoacan', 'emp_juan', '12345', 'E'),
('Maria', 'Gomez', 'Sanchez', 'Calle 4', '45', 'Del Valle', 'Benito Juarez', 'emp_maria', '12345', 'E'),
('Carlos', 'Ruiz', 'Diaz', 'Reforma', '90', 'Juarez', 'Cuauhtemoc', 'emp_carlos', '12345', 'E'),
('Ana', 'Torres', 'Mendez', 'Insurgentes', '88', 'Roma', 'Cuauhtemoc', 'emp_ana', '12345', 'E'),
('Luis', 'Hernandez', 'Cruz', 'Patriotismo', '12', 'Condesa', 'Cuauhtemoc', 'emp_luis', '12345', 'E'),
('Sofia', 'Vargas', 'Rios', 'Universidad', '500', 'Copilco', 'Coyoacan', 'emp_sofia', '12345', 'E'),
('Miguel', 'Castro', 'Soto', 'Division del Norte', '33', 'Portales', 'Benito Juarez', 'emp_miguel', '12345', 'E'),
('Elena', 'Morales', 'Vega', 'Tlalpan', '101', 'Alamos', 'Benito Juarez', 'emp_elena', '12345', 'E'),
('Roberto', 'Gil', 'Lara', 'Miramontes', '77', 'Coapa', 'Coyoacan', 'emp_roberto', '12345', 'E'),
('Diana', 'Reyes', 'Luna', 'Taxqueña', '20', 'Campestre', 'Coyoacan', 'emp_diana', '12345', 'E'),
('Oscar', 'Luna', 'Paz', 'Aztecas', '55', 'Ajusco', 'Coyoacan', 'emp_oscar', '12345', 'E'),
('Patricia', 'Solis', 'Mora', 'Tlalpan', '202', 'Centro', 'Tlalpan', 'emp_paty', '12345', 'E'),
('Ricardo', 'Vega', 'Ruz', 'Periferico', '100', 'Pedregal', 'Alvaro Obregon', 'emp_richard', '12345', 'E'),
('Gabriela', 'Nunez', 'Sol', 'Revolucion', '44', 'San Angel', 'Alvaro Obregon', 'emp_gaby', '12345', 'E'),
('Felipe', 'Carrillo', 'Mar', 'Patriotismo', '88', 'Mixcoac', 'Benito Juarez', 'emp_felipe', '12345', 'E'),
('Veronica', 'Lozano', 'Gil', 'Insurgentes', '1200', 'Del Valle', 'Benito Juarez', 'emp_vero', '12345', 'E'),
('Hugo', 'Sanchez', 'Rey', 'Acoxpa', '300', 'Coapa', 'Tlalpan', 'emp_hugo', '12345', 'E'),
('Natalia', 'Ortiz', 'Cruz', 'Division', '50', 'Portales', 'Benito Juarez', 'emp_nat', '12345', 'E'),
('Diego', 'Luna', 'Sanz', 'Churubusco', '10', 'Coyoacan', 'Coyoacan', 'emp_diego', '12345', 'E'),
('Fernanda', 'Castillo', 'Roy', 'Miguel Angel', '5', 'Mixcoac', 'Benito Juarez', 'emp_fer', '12345', 'E');

-- 20 SOCIOS (Tipo 'S') - IDs 21 al 40
INSERT INTO MEMBRESIA.USUARIO_WEB (NOMBRE, APELLIDO_P, APELLIDO_M, CALLE, NUMERO, COLONIA, ALCALDIA, USUARIO, CONTRASEÑA, TIPO_USUARIO) VALUES 
('Pedro', 'Alvarez', 'Nieto', 'Calle 10', '1', 'Pedregal', 'Alvaro Obregon', 'soc_pedro', 'socio123', 'S'),
('Laura', 'Jimenez', 'Paz', 'Calle 11', '2', 'San Angel', 'Alvaro Obregon', 'soc_laura', 'socio123', 'S'),
('Jorge', 'Molina', 'Salas', 'Calle 12', '3', 'Jardines', 'Coyoacan', 'soc_jorge', 'socio123', 'S'),
('Carmen', 'Ortega', 'Vidal', 'Calle 13', '4', 'Florida', 'Alvaro Obregon', 'soc_carmen', 'socio123', 'S'),
('Raul', 'Nuñez', 'Cano', 'Calle 14', '5', 'Napoles', 'Benito Juarez', 'soc_raul', 'socio123', 'S'),
('Patricia', 'Iglesias', 'Rubio', 'Calle 15', '6', 'Nochebuena', 'Benito Juarez', 'soc_patricia', 'socio123', 'S'),
('Fernando', 'Serrano', 'Leon', 'Calle 16', '7', 'Mixcoac', 'Benito Juarez', 'soc_fernando', 'socio123', 'S'),
('Lucia', 'Cortes', 'Mora', 'Calle 17', '8', 'Actipan', 'Benito Juarez', 'soc_lucia', 'socio123', 'S'),
('Alberto', 'Guerrero', 'Marin', 'Calle 18', '9', 'Del Carmen', 'Coyoacan', 'soc_alberto', 'socio123', 'S'),
('Monica', 'Navarro', 'Rojas', 'Calle 19', '10', 'Santa Catarina', 'Coyoacan', 'soc_monica', 'socio123', 'S'),
('Ricardo', 'Campos', 'Vega', 'Calle 20', '11', 'Villa Coyoacan', 'Coyoacan', 'soc_ricardo', 'socio123', 'S'),
('Silvia', 'Fuentes', 'Diez', 'Calle 21', '12', 'Chimalistac', 'Alvaro Obregon', 'soc_silvia', 'socio123', 'S'),
('Daniel', 'Carrasco', 'Sanz', 'Calle 22', '13', 'Oxtopulco', 'Alvaro Obregon', 'soc_daniel', 'socio123', 'S'),
('Isabel', 'Caballero', 'Puga', 'Calle 23', '14', 'Romero de Terreros', 'Coyoacan', 'soc_isabel', 'socio123', 'S'),
('Francisco', 'Velasco', 'Sol', 'Calle 24', '15', 'Cuadrante', 'Coyoacan', 'soc_francisco', 'socio123', 'S'),
('Teresa', 'Mendez', 'Rico', 'Calle 25', '16', 'Avante', 'Coyoacan', 'soc_teresa', 'socio123', 'S'),
('Manuel', 'Prieto', 'Rey', 'Calle 26', '17', 'Educacion', 'Coyoacan', 'soc_manuel', 'socio123', 'S'),
('Rosa', 'Calvo', 'Peña', 'Calle 27', '18', 'Paseos', 'Coyoacan', 'soc_rosa', 'socio123', 'S'),
('Javier', 'Gallego', 'Cruz', 'Calle 28', '19', 'Taxqueña', 'Coyoacan', 'soc_javier', 'socio123', 'S'),
('Alejandra', 'Roman', 'Luz', 'Calle 29', '20', 'Centinela', 'Coyoacan', 'soc_alejandra', 'socio123', 'S');


-- Tabla EMPLEADO (IDs 1-20)
INSERT INTO MEMBRESIA.EMPLEADO (ID_USUARIO, NSS, TIPO_EMPLEADO, PUESTO, SUELDO, FECHA_CUMPLEAÑOS) VALUES
(1, '11122233301', 'ADMIN', 'Gerente', 25000, '1980-05-15'), 
(2, '11122233302', 'INSTR', 'Instructor Pesas', 12000, '1990-08-20'), 
(3, '11122233303', 'INSTR', 'Instructor Natacion', 12000, '1992-02-10'), 
(4, '11122233304', 'INSTR', 'Instructor Yoga', 11000, '1988-11-30'), 
(5, '11122233305', 'RECEP', 'Recepcionista', 8000, '1995-01-25'), 
(6, '11122233306', 'MANT', 'Limpieza', 6000, '1985-07-14'), 
(7, '11122233307', 'MANT', 'Mantenimiento', 7000, '1982-09-09'), 
(8, '11122233308', 'INSTR', 'Instructor Box', 12500, '1991-03-18'), 
(9, '11122233309', 'ADMIN', 'Contador', 18000, '1975-12-05'), 
(10, '11122233310', 'INSTR', 'Instructor Baile', 11500, '1993-06-22'),
(11, '11122233311', 'INSTR', 'Instructor Tenis', 13000, '1994-07-22'),
(12, '11122233312', 'INSTR', 'Instructor Zumba', 11000, '1996-01-15'),
(13, '11122233313', 'RECEP', 'Recepcionista', 8000, '1998-03-30'),
(14, '11122233314', 'MANT', 'Jardinero', 7000, '1980-11-11'),
(15, '11122233315', 'INSTR', 'Instructor Karate', 12500, '1992-05-05'),
(16, '11122233316', 'MEDIC', 'Medico', 20000, '1978-09-09'),
(17, '11122233317', 'NUTRI', 'Nutriologo', 18000, '1985-12-12'),
(18, '11122233318', 'ADMIN', 'RH', 18000, '1983-04-04'),
(19, '11122233319', 'SEGUR', 'Seguridad', 9000, '1981-08-08'),
(20, '11122233320', 'INSTR', 'Instructor Crossfit', 13000, '1995-02-28');

-- Tabla SOCIO (IDs 21-40)
INSERT INTO MEMBRESIA.SOCIO (ID_USUARIO, NUM_SOCIO, TIPO_MEMBRESIA, FECHA_NACIMIENTO, ESTADO_SOCIO, SEXO, PESO, ESTATURA) VALUES
(21, 1001, 'V', '1990-01-01', 'C', 'M', 80.5, 1.75), 
(22, 1002, 'E', '1995-02-15', 'C', 'F', 60.2, 1.65), 
(23, 1003, 'V', '1988-11-20', 'C', 'M', 75.0, 1.80), 
(24, 1004, 'E', '2000-05-10', 'C', 'F', 58.0, 1.60), 
(25, 1005, 'E', '1992-09-09', 'A', 'M', 90.0, 1.78), 
(26, 1006, 'V', '1985-03-30', 'C', 'F', 65.5, 1.68), 
(27, 1007, 'E', '1998-07-22', 'C', 'M', 70.0, 1.72), 
(28, 1008, 'E', '1999-12-01', 'C', 'F', 55.0, 1.58), 
(29, 1009, 'V', '1980-06-18', 'C', 'M', 85.0, 1.82), 
(30, 1010, 'E', '2001-04-05', 'C', 'F', 62.0, 1.70),
(31, 1011, 'E', '1990-08-08', 'C', 'M', 78.0, 1.76),
(32, 1012, 'V', '1994-01-25', 'C', 'F', 59.0, 1.63),
(33, 1013, 'E', '1987-10-10', 'A', 'M', 95.0, 1.85),
(34, 1014, 'E', '1996-02-14', 'C', 'F', 64.0, 1.66),
(35, 1015, 'V', '1993-05-05', 'C', 'M', 82.0, 1.79),
(36, 1016, 'E', '1991-09-20', 'C', 'F', 57.0, 1.61),
(37, 1017, 'E', '1989-12-12', 'C', 'M', 76.0, 1.74),
(38, 1018, 'V', '2002-03-03', 'C', 'F', 61.0, 1.69),
(39, 1019, 'E', '1997-07-07', 'C', 'M', 88.0, 1.81),
(40, 1020, 'E', '1995-11-11', 'C', 'F', 63.0, 1.67);


INSERT INTO MEMBRESIA.TIPO_MEMBRESIA (TIPO_MEMBRESIA, NOMBRE, COSTO)
VALUES
('V', 'VIP', 1200),
('E', 'Estandar', 800);

-- Datos Contacto
INSERT INTO MEMBRESIA.SOCIO_TELEFONO (ID_USUARIO, TELEFONO) VALUES 
(21, '5512345678'), (22, '5587654321'), (23, '5511223344'), (24, '5599887766'), (25, '5566778899'),
(26, '5511111111'), (27, '5522222222'), (28, '5533333333'), (29, '5544444444'), (30, '5555555555'),
(31, '5566666666'), (32, '5577777777'), (33, '5588888888'), (34, '5599999999'), (35, '5500000000'),
(36, '5512121212'), (37, '5513131313'), (38, '5514141414'), (39, '5515151515'), (40, '5516161616');

INSERT INTO MEMBRESIA.SOCIO_CORREO (ID_USUARIO, CORREO) VALUES 
(21, 'pedro@mail.com'), (22, 'laura@mail.com'), (23, 'jorge@mail.com'), (24, 'carmen@mail.com'), (25, 'raul@mail.com'),
(26, 'patricia@mail.com'), (27, 'fernando@mail.com'), (28, 'lucia@mail.com'), (29, 'alberto@mail.com'), (30, 'monica@mail.com'),
(31, 'ricardo@mail.com'), (32, 'silvia@mail.com'), (33, 'daniel@mail.com'), (34, 'isabel@mail.com'), (35, 'francisco@mail.com'),
(36, 'teresa@mail.com'), (37, 'manuel@mail.com'), (38, 'rosa@mail.com'), (39, 'javier@mail.com'), (40, 'alejandra@mail.com');

INSERT INTO MEMBRESIA.SOCIO_FAMILIAR (ID_USUARIO, ID_SOCIO_FAMILIAR, PARENTESCO) VALUES (21, 22, 'PADRE');


-- Instalaciones
INSERT INTO OPERACION.INSTALACION (ID_INSTALACION, NOMBRE_INSTALACION, CAPACIDAD, DESCRIPCION) VALUES
('ALB01', 'Alberca Olimpica', 50, 'Alberca'), ('CTA01', 'Cancha de Tenis 1', 4, 'Arcilla'),
('GYM01', 'Gimnasio Pesas', 30, 'Pesas'), ('SUM01', 'Salon Usos Multiples', 25, 'Espejos'),
('FUT01', 'Cancha Futbol 7', 14, 'Pasto'), ('RIN01', 'Ring de Boxeo', 10, 'Ring'),
('SPI01', 'Salon Spinning', 20, 'Bicis'), ('CF01',  'Area Cardio', 40, 'Cardio'),
('FRO01', 'Cancha Frontenis', 4, 'Pared'), ('JAR01', 'Jardin Yoga', 15, 'Aire libre');

-- Materiales
INSERT INTO OPERACION.MATERIAL (ID_MATERIAL, DESCRIPCION, UNIDADES_TOTALES) VALUES
('BAL01', 'Balon Futbol', 20), ('RAQ01', 'Raqueta Tenis', 15), ('PES01', 'Mancuernas', 50),
('TAP01', 'Tapete Yoga', 30), ('GUA01', 'Guantes Box', 12), ('PEL01', 'Pelota Pilates', 10),
('RED01', 'Red Voleibol', 2), ('BIC01', 'Bici Spinning', 20), ('LIG01', 'Ligas', 25), ('TOL01', 'Toallas', 100);

-- Inventario en sitio
INSERT INTO OPERACION.MATERIAL_INSTALACION (ID_INSTALACION, ID_MATERIAL, UNIDADES_EN_SITIO) VALUES
('FUT01', 'BAL01', 15), ('CTA01', 'RAQ01', 9), ('GYM01', 'PES01', 40), ('JAR01', 'TAP01', 10),
('RIN01', 'GUA01', 12), ('SUM01', 'PEL01', 10), ('FUT01', 'RED01', 1), ('SPI01', 'BIC01', 20),
('SUM01', 'LIG01', 10), ('ALB01', 'TOL01', 30), ('GYM01', 'TOL01', 20), ('CF01', 'TOL01', 20),
('SUM01', 'TAP01', 10), ('GYM01', 'LIG01', 10), ('CF01', 'BAL01', 2), ('JAR01', 'LIG01', 5),
('RIN01', 'TOL01', 5), ('JAR01', 'TOL01', 5), ('FRO01', 'RAQ01', 2), ('SUM01', 'GUA01', 2);

-- Otros
INSERT INTO OPERACION.EJERCICIO (NOMBRE, DESCRIPCION, TIPO_EJERCICIO, ZONA_CORPORAL, SERIES_RECOMENDADAS) VALUES
('Sentadillas', 'Piernas', 'Fuerza', 'Piernas', 4), ('Lagartijas', 'Brazos', 'Fuerza', 'Pecho', 4), 
('Abdominales', 'Core', 'Fuerza', 'Abdomen', 3), ('Correr', 'Cardio', 'Cardio', 'Piernas', 1), ('Burpees', 'Total', 'Cardio', 'Todo', 3);

INSERT INTO OPERACION.PLATILLO (NOMBRE, CALORIAS_POR_RACION, HORARIO_COMIDA, TIPO_DIETA) VALUES
('Ensalada', 350, 'CO', 'Baja Carb'), ('Avena', 200, 'D', 'Energia'), ('Pollo', 400, 'CO', 'Proteina');

INSERT INTO OPERACION.PLATILLO 
(NOMBRE, CALORIAS_POR_RACION, HORARIO_COMIDA, TIPO_DIETA)
VALUES
('Huevos con espinaca', 250, 'D', 'Proteina'),
('Sandwich integral', 300, 'D', 'Energia'),
('Pechuga Asada', 420, 'CO', 'Proteina'),
('Arroz con verduras', 380, 'CO', 'Balanceada'),
('Atún con elote', 260, 'CE', 'Baja Carb'),
('Yogurt griego con fruta', 180, 'D', 'Baja Grasa'),
('Filete de pescado', 390, 'CO', 'Proteina'),
('Wrap de pollo', 320, 'CE', 'Energia'),
('Crema de verduras', 220, 'CE', 'Balanceada'),
('Fruta mixta', 150, 'D', 'Ligera');


UPDATE OPERACION.PLATILLO SET DESCRIPCION_PREPARACION = 'Ensalada fresca con verduras mixtas y aderezo ligero.'
WHERE ID_PLATILLO = 1;

UPDATE OPERACION.PLATILLO SET DESCRIPCION_PREPARACION = 'Avena cocida con leche o agua, ideal para energía matutina.'
WHERE ID_PLATILLO = 2;

UPDATE OPERACION.PLATILLO SET DESCRIPCION_PREPARACION = 'Pollo a la plancha acompañado de verduras.'
WHERE ID_PLATILLO = 3;

UPDATE OPERACION.PLATILLO SET DESCRIPCION_PREPARACION = 'Huevos revueltos con espinaca para desayuno alto en proteína.'
WHERE ID_PLATILLO = 9;

UPDATE OPERACION.PLATILLO SET DESCRIPCION_PREPARACION = 'Sándwich integral con vegetales y proteína ligera.'
WHERE ID_PLATILLO = 10;

UPDATE OPERACION.PLATILLO SET DESCRIPCION_PREPARACION = 'Pechuga de pollo asada con especias.'
WHERE ID_PLATILLO = 11;

UPDATE OPERACION.PLATILLO SET DESCRIPCION_PREPARACION = 'Arroz salteado con verduras frescas.'
WHERE ID_PLATILLO = 12;

UPDATE OPERACION.PLATILLO SET DESCRIPCION_PREPARACION = 'Atún mezclado con elote, receta ligera y nutritiva.'
WHERE ID_PLATILLO = 13;

UPDATE OPERACION.PLATILLO SET DESCRIPCION_PREPARACION = 'Yogurt griego con fruta natural para desayuno o snack.'
WHERE ID_PLATILLO = 14;

UPDATE OPERACION.PLATILLO SET DESCRIPCION_PREPARACION = 'Filete de pescado cocinado a la plancha con limón.'
WHERE ID_PLATILLO = 15;

UPDATE OPERACION.PLATILLO SET DESCRIPCION_PREPARACION = 'Wrap de pollo con vegetales, opción ligera para cena.'
WHERE ID_PLATILLO = 16;

UPDATE OPERACION.PLATILLO SET DESCRIPCION_PREPARACION = 'Crema de verduras baja en grasa y rica en fibra.'
WHERE ID_PLATILLO = 17;

UPDATE OPERACION.PLATILLO SET DESCRIPCION_PREPARACION = 'Fruta mixta fresca, ideal como postre o desayuno.'
WHERE ID_PLATILLO = 18;




INSERT INTO OPERACION.SERVICIOS_ACTIVIDADES (NOMBRE_ACTIVIDAD, DESCRIPCION, TIPO_ACTIVIDAD, EDAD_MINIMA) VALUES
('Pilates', 'Control', 'GRATUITA', 16),           -- 1
('Tenis', 'Tenis basico', 'CUOTA', 16),         -- 2
('Futbol', 'Equipo', 'GRATUITA', 16),              -- 3
('Voleibol', 'Voleibol', 'GRATUITA', 16),          -- 4
('Acondicionamiento', 'Fisico', 'GRATUITA', 16),   -- 5
('Zumba', 'Baile', 'GRATUITA', 16),                -- 6 
('Taebo', 'Artes marciales', 'GRATUITA', 16),      -- 7
('Box', 'Boxeo', 'CUOTA', 18),                  -- 8
('Carrera', 'Corredores', 'GRATUITA', 16),         -- 9
('Frontenis', 'Libre', 'GRATUITA', 16),            -- 10
('Cardiovascular', 'Caminadoras', 'GRATUITA', 16), -- 11
('Pesas', 'Fuerza', 'GRATUITA', 18),               -- 12
('Spinning', 'Ciclismo', 'CUOTA', 16),          -- 13
('Yoga', 'Flexibilidad', 'GRATUITA', 16),          -- 14
('Danza Folklorica', 'Baile', 'CULTURAL', 16),    -- 15
('Badminton', 'Raqueta ligera', 'CUOTA', 16),   -- 16
('Ballet', 'Danza clasica', 'CUOTA', 16),       -- 17
('Danza Jazz', 'Baile moderno', 'CUOTA', 16),   -- 18
('Gimnasia Aerobica', 'Gimnasia', 'CUOTA', 16), -- 19
('Natacion', 'Nado libre', 'CUOTA', 16),        -- 20
('Taekwondo', 'Artes marciales', 'CUOTA', 16),  -- 21
('Danza Polinesia', 'Hula', 'CULTURAL', 16),      -- 22
('Danza de Salon', 'Parejas', 'CULTURAL', 16),    -- 23
('Canto', 'Coro', 'CULTURAL', 16);                -- 24


-- Subtipos
INSERT INTO OPERACION.CUOTA (ID_SERVICIO_ACTIVIDAD, COSTO, METODO_PAGO) VALUES 
(2, 500, 'E'), (8, 300, 'T'), (13, 200, 'T'), 
(16, 250, 'E'), (17, 600, 'T'), (18, 450, 'E'), (19, 400, 'T'), (20, 800, 'T'), (21, 350, 'E');

INSERT INTO OPERACION.GRATUITAS (ID_SERVICIO_ACTIVIDAD, ES_CULTURAL) VALUES 
(1,0), (3,0), (4,0), (5,0), (6,0), (7,0), (9,0), (10,0), (11,0), (12,0), (14,0),
(15, 1), (22, 1), (23, 1), (24, 1);

-- Empleados
INSERT INTO OPERACION.EMPLEADO_SERVICIO (ID_USUARIO, ID_SERVICIO_ACTIVIDAD, NOMBRE_EMPLEADO) VALUES 
(2, 2, 'Maria'), (8, 8, 'Elena'), (4, 14, 'Ana'), (2, 13, 'Maria'), 
(3, 20, 'Carlos'), (10, 15, 'Diana'), (10, 17, 'Diana'), (10, 23, 'Diana');



INSERT INTO OPERACION.HORARIO (ID_SERVICIO_ACTIVIDAD, ID_INSTALACION, ID_PROFESOR, DIA_SEMANA, HORA_INICIO, HORA_FIN) VALUES
(2, 'CTA01', 2, 'Lunes', '08:00', '09:00'),      -- 1: Tenis
(8, 'RIN01', 8, 'Martes', '18:00', '19:00'),     -- 2: Box
(14, 'JAR01', 4, 'Miercoles', '07:00', '08:00'), -- 3: Yoga
(13, 'SPI01', 2, 'Jueves', '19:00', '20:00'),    -- 4: Spinning
(6, 'SUM01', 10, 'Viernes', '10:00', '11:00'),   -- 5: Zumba
(20, 'ALB01', 3, 'Sabado', '09:00', '10:00'),    -- 6: Natacion
(17, 'SUM01', 10, 'Lunes', '16:00', '17:00'),    -- 7: Ballet
(21, 'SUM01', 8, 'Martes', '17:00', '18:00'),    -- 8: Taekwondo
(16, 'CTA01', 2, 'Miercoles', '10:00', '11:00'), -- 9: Badminton
(18, 'SUM01', 10, 'Jueves', '16:00', '17:00'),   -- 10: Jazz
(1, 'SUM01', 4, 'Viernes', '09:00', '10:00'),    -- 11: Pilates
(12, 'GYM01', 2, 'Sabado', '11:00', '12:00'),    -- 12: Pesas
(3, 'FUT01', 8, 'Domingo', '08:00', '09:00'),    -- 13: Futbol
(24, 'SUM01', 4, 'Domingo', '12:00', '13:00'),   -- 14: Canto
(22, 'JAR01', 10, 'Sabado', '16:00', '17:00');   -- 15: Polinesia

PRINT '>>> 7. CARGANDO INSCRIPCIONES Y PAGOS (40+ Transacciones)...';

-- INSCRIPCIONES (Todos los socios inscritos en al menos una actividad distinta)
-- Estrategia: Distribuir las 15 actividades principales entre los 20 socios.
INSERT INTO OPERACION.INSCRIPCION (ID_USUARIO, ID_HORARIO, FECHA_INSCRIPCION, ESTADO_INSCRIPCION) VALUES
-- Tenis (Horario 1)
(21, 1, '2025-11-01', 'PAGADA'), (22, 1, '2025-11-01', 'PAGADA'), (23, 1, '2025-11-01', 'PAGADA'),
-- Box (Horario 2)
(24, 2, '2025-11-01', 'PAGADA'), (25, 2, '2025-11-01', 'PAGADA'), (26, 2, '2025-11-01', 'PAGADA'),
-- Yoga (Horario 3)
(27, 3, '2025-11-01', 'PAGADA'), (28, 3, '2025-11-01', 'PAGADA'), (29, 3, '2025-11-01', 'PAGADA'),
-- Spinning (Horario 4)
(30, 4, '2025-11-01', 'PAGADA'), (31, 4, '2025-11-01', 'PAGADA'), (32, 4, '2025-11-01', 'PAGADA'),
-- Zumba (Horario 5)
(33, 5, '2025-11-01', 'PAGADA'), (34, 5, '2025-11-01', 'PAGADA'), (35, 5, '2025-11-01', 'PAGADA'),
-- Natacion (Horario 6)
(36, 6, '2025-11-01', 'PAGADA'), (37, 6, '2025-11-01', 'PAGADA'), (38, 6, '2025-11-01', 'PAGADA'),
-- Ballet (Horario 7)
(39, 7, '2025-11-01', 'PAGADA'), (40, 7, '2025-11-01', 'PAGADA'), (21, 7, '2025-11-02', 'PAGADA'),
-- Taekwondo (Horario 8)
(22, 8, '2025-11-02', 'PAGADA'), (23, 8, '2025-11-02', 'PAGADA'), (24, 8, '2025-11-02', 'PAGADA'),
-- Badminton (Horario 9)
(25, 9, '2025-11-02', 'PAGADA'), (26, 9, '2025-11-02', 'PAGADA'), (27, 9, '2025-11-02', 'PAGADA'),
-- Jazz (Horario 10)
(28, 10, '2025-11-02', 'PAGADA'), (29, 10, '2025-11-02', 'PAGADA'), (30, 10, '2025-11-02', 'PAGADA'),
-- Pilates (Horario 11)
(31, 11, '2025-11-03', 'PAGADA'), (32, 11, '2025-11-03', 'PAGADA'), (33, 11, '2025-11-03', 'PAGADA'),
-- Pesas (Horario 12)
(34, 12, '2025-11-03', 'PAGADA'), (35, 12, '2025-11-03', 'PAGADA'), (36, 12, '2025-11-03', 'PAGADA'),
-- Futbol (Horario 13)
(37, 13, '2025-11-03', 'PAGADA'), (38, 13, '2025-11-03', 'PAGADA'), (39, 13, '2025-11-03', 'PAGADA'),
-- Canto (Horario 14)
(40, 14, '2025-11-03', 'PAGADA'), (21, 14, '2025-11-03', 'PAGADA'), (22, 14, '2025-11-03', 'PAGADA'),
-- Polinesia (Horario 15)
(23, 15, '2025-11-03', 'PAGADA'), (24, 15, '2025-11-03', 'PAGADA');

-- PAGOS (Generados para TODAS las 44 inscripciones anteriores)
INSERT INTO OPERACION.PAGOS (ID_USUARIO, ID_INSCRIPCION, MONTO, FECHA_PAGO, METODO_PAGO, BANCO, NUM_TARJETA, VIGENCIA_MES, VIGENCIA_ANIO, TIPO_CONCEPTO) VALUES
-- Tenis (500)
(21, 1, 500, '2025-11-01', 'EFECTIVO', NULL, NULL, NULL, NULL, 'CLASE'), 
(22, 2, 500, '2025-11-01', 'TARJETA', 'BBVA', '415231345678', 12, 28, 'CLASE'), 
(23, 3, 500, '2025-11-01', 'EFECTIVO', NULL, NULL, NULL, NULL, 'CLASE'),
-- Box (300)
(24, 4, 300, '2025-11-01', 'TARJETA', 'SANTANDER', '551234567890', 10, 27, 'CLASE'), 
(25, 5, 300, '2025-11-01', 'TARJETA', 'BANAMEX', '402766554433', 05, 26, 'CLASE'), 
(26, 6, 300, '2025-11-01', 'EFECTIVO', NULL, NULL, NULL, NULL, 'CLASE'),
-- Yoga (Gratis)
(27, 7, 0, '2025-11-01', 'GRATIS', NULL, NULL, NULL, NULL, 'CLASE'), 
(28, 8, 0, '2025-11-01', 'GRATIS', NULL, NULL, NULL, NULL, 'CLASE'), 
(29, 9, 0, '2025-11-01', 'GRATIS', NULL, NULL, NULL, NULL, 'CLASE'),
-- Spinning (200)
(30, 10, 200, '2025-11-01', 'EFECTIVO', NULL, NULL, NULL, NULL, 'CLASE'), 
(31, 11, 200, '2025-11-01', 'TARJETA', 'HSBC', '421399887766', 01, 29, 'CLASE'), 
(32, 12, 200, '2025-11-01', 'EFECTIVO', NULL, NULL, NULL, NULL, 'CLASE'),
-- Zumba (Gratis)
(33, 13, 0, '2025-11-01', 'GRATIS', NULL, NULL, NULL, NULL, 'CLASE'), 
(34, 14, 0, '2025-11-01', 'GRATIS', NULL, NULL, NULL, NULL, 'CLASE'), 
(35, 15, 0, '2025-11-01', 'GRATIS', NULL, NULL, NULL, NULL, 'CLASE'),
-- Natacion (800)
(36, 16, 800, '2025-11-01', 'TARJETA', 'AMEX', '376689', 11, 29, 'CLASE'),
(37, 17, 800, '2025-11-01', 'EFECTIVO', NULL, NULL, NULL, NULL, 'CLASE'),
(38, 18, 800, '2025-11-01', 'TARJETA', 'BBVA', '41238888', 12, 27, 'CLASE'),
-- Ballet (600)
(39, 19, 600, '2025-11-01', 'EFECTIVO', NULL, NULL, NULL, NULL, 'CLASE'),
(40, 20, 600, '2025-11-01', 'TARJETA', 'SCOTIA', '44445555', 08, 26, 'CLASE'),
(21, 21, 600, '2025-11-02', 'EFECTIVO', NULL, NULL, NULL, NULL, 'CLASE'),
-- Taekwondo (350)
(22, 22, 350, '2025-11-02', 'TARJETA', 'HSBC', '55551111', 09, 28, 'CLASE'),
(23, 23, 350, '2025-11-02', 'EFECTIVO', NULL, NULL, NULL, NULL, 'CLASE'),
(24, 24, 350, '2025-11-02', 'TARJETA', 'BANORTE', '49123456', 07, 30, 'CLASE'),
-- Badminton (250)
(25, 25, 250, '2025-11-02', 'EFECTIVO', NULL, NULL, NULL, NULL, 'CLASE'),
(26, 26, 250, '2025-11-02', 'EFECTIVO', NULL, NULL, NULL, NULL, 'CLASE'),
(27, 27, 250, '2025-11-02', 'TARJETA', 'INBURSA', '40001234', 05, 27, 'CLASE'),
-- Jazz (450)
(28, 28, 450, '2025-11-02', 'TARJETA', 'BBVA', '41529999', 04, 28, 'CLASE'),
(29, 29, 450, '2025-11-02', 'EFECTIVO', NULL, NULL, NULL, NULL, 'CLASE'),
(30, 30, 450, '2025-11-02', 'EFECTIVO', NULL, NULL, NULL, NULL, 'CLASE'),
-- Pilates (Gratis)
(31, 31, 0, '2025-11-03', 'GRATIS', NULL, NULL, NULL, NULL, 'CLASE'),
(32, 32, 0, '2025-11-03', 'GRATIS', NULL, NULL, NULL, NULL, 'CLASE'),
(33, 33, 0, '2025-11-03', 'GRATIS', NULL, NULL, NULL, NULL, 'CLASE'),
-- Pesas (Gratis)
(34, 34, 0, '2025-11-03', 'GRATIS', NULL, NULL, NULL, NULL, 'CLASE'),
(35, 35, 0, '2025-11-03', 'GRATIS', NULL, NULL, NULL, NULL, 'CLASE'),
(36, 36, 0, '2025-11-03', 'GRATIS', NULL, NULL, NULL, NULL, 'CLASE'),
-- Futbol (Gratis)
(37, 37, 0, '2025-11-03', 'GRATIS', NULL, NULL, NULL, NULL, 'CLASE'),
(38, 38, 0, '2025-11-03', 'GRATIS', NULL, NULL, NULL, NULL, 'CLASE'),
(39, 39, 0, '2025-11-03', 'GRATIS', NULL, NULL, NULL, NULL, 'CLASE'),
-- Canto (Gratis/Cultural)
(40, 40, 0, '2025-11-03', 'GRATIS', NULL, NULL, NULL, NULL, 'CLASE'),
(21, 41, 0, '2025-11-03', 'GRATIS', NULL, NULL, NULL, NULL, 'CLASE'),
(22, 42, 0, '2025-11-03', 'GRATIS', NULL, NULL, NULL, NULL, 'CLASE'),
-- Polinesia (Gratis/Cultural)
(23, 43, 0, '2025-11-03', 'GRATIS', NULL, NULL, NULL, NULL, 'CLASE'),
(24, 44, 0, '2025-11-03', 'GRATIS', NULL, NULL, NULL, NULL, 'CLASE');

-- Alquileres (30 Registros distribuidos con numero de personas variado)
INSERT INTO OPERACION.ALQUILER (ID_USUARIO, ID_INSTALACION, ID_MATERIAL, FECHA, HORA_INICIO, HORA_FIN, ESTADO_ALQUILER, NUMERO_PERSONAS) VALUES
(21, 'CTA01', 'RAQ01', '2025-11-10', '10:00', '11:00', 'ENTREGADO', 2),
(22, 'ALB01', 'TOL01', '2025-11-10', '11:00', '12:00', 'ENTREGADO', 1),
(23, 'GYM01', 'PES01', '2025-11-10', '12:00', '13:00', 'SOLICITADO', 1),
(24, 'FUT01', 'BAL01', '2025-11-11', '09:00', '10:00', 'ENTREGADO', 14),
(25, 'JAR01', 'TAP01', '2025-11-11', '08:00', '09:00', 'SOLICITADO', 5),
(26, 'CTA01', 'RAQ01', '2025-11-12', '16:00', '17:00', 'SOLICITADO', 4),
(27, 'GYM01', NULL, '2025-11-12', '17:00', '18:00', 'ENTREGADO', 1),
(28, 'FRO01', 'RAQ01', '2025-11-12', '18:00', '19:00', 'DEVUELTO', 2),
(29, 'ALB01', NULL, '2025-11-13', '07:00', '08:00', 'ENTREGADO', 1),
(30, 'RIN01', 'GUA01', '2025-11-13', '19:00', '20:00', 'SOLICITADO', 2),
(31, 'SPI01', 'BIC01', '2025-11-14', '08:00', '09:00', 'ENTREGADO', 1),
(32, 'CF01', NULL, '2025-11-14', '09:00', '10:00', 'ENTREGADO', 1),
(33, 'SUM01', 'PEL01', '2025-11-15', '10:00', '11:00', 'SOLICITADO', 10),
(34, 'CTA01', NULL, '2025-11-15', '11:00', '12:00', 'ENTREGADO', 2),
(35, 'JAR01', 'TAP01', '2025-11-16', '07:00', '08:00', 'SOLICITADO', 3),
(36, 'GYM01', 'LIG01', '2025-11-16', '18:00', '19:00', 'ENTREGADO', 1),
(37, 'ALB01', 'TOL01', '2025-11-17', '12:00', '13:00', 'SOLICITADO', 1),
(38, 'FUT01', 'BAL01', '2025-11-17', '16:00', '17:00', 'DEVUELTO', 10),
(39, 'RIN01', 'GUA01', '2025-11-18', '11:00', '12:00', 'SOLICITADO', 2),
(40, 'CF01', NULL, '2025-11-18', '08:00', '09:00', 'ENTREGADO', 1),
(21, 'GYM01', 'PES01', '2025-11-19', '10:00', '11:00', 'ENTREGADO', 1),
(22, 'ALB01', 'TOL01', '2025-11-19', '11:00', '12:00', 'ENTREGADO', 1),
(23, 'CTA01', 'RAQ01', '2025-11-19', '12:00', '13:00', 'SOLICITADO', 2),
(24, 'JAR01', 'TAP01', '2025-11-20', '09:00', '10:00', 'ENTREGADO', 4),
(25, 'FUT01', 'BAL01', '2025-11-20', '08:00', '09:00', 'SOLICITADO', 12),
(26, 'RIN01', 'GUA01', '2025-11-21', '16:00', '17:00', 'SOLICITADO', 2),
(27, 'SPI01', 'BIC01', '2025-11-21', '17:00', '18:00', 'ENTREGADO', 1),
(28, 'CF01', NULL, '2025-11-21', '18:00', '19:00', 'DEVUELTO', 1),
(29, 'SUM01', 'PEL01', '2025-11-22', '07:00', '08:00', 'ENTREGADO', 5),
(30, 'GYM01', 'LIG01', '2025-11-22', '19:00', '20:00', 'SOLICITADO', 1);

-- Dietas y Entrenamientos
INSERT INTO OPERACION.DIETA (ID_USUARIO, ID_PLATILLO, DIA_SEMANA, CALORIAS_TOTALES) VALUES (21, 1, 'Lunes', 1500), (22, 2, 'Martes', 1200);
INSERT INTO OPERACION.ENTRENAMIENTO (ID_USUARIO, DIA_SEMANA, HORA_INICIO, DURACION_MINUTOS) VALUES (21, 'Lunes', '08:00', 60), (22, 'Miercoles', '08:00', 60);
INSERT INTO OPERACION.EJERCICIO_ENTRENAMIENTO (ID_ENTRENAMIENTO, ID_EJERCICIO, SERIES_REALES, REPETICIONES) VALUES (1, 1, 4, 12);

---AGREGAMOS MAS DIETAS
INSERT INTO OPERACION.DIETA (ID_USUARIO, ID_PLATILLO, DIA_SEMANA, CALORIAS_TOTALES) VALUES
(23, 1, 'Miercoles', 1800),
(24, 2, 'Jueves', 1600),
(25, 3, 'Viernes', 1400),
(26, 9, 'Sabado', 2000),
(27, 10, 'Domingo', 1700),
(28, 11, 'Lunes', 1550),
(29, 12, 'Martes', 1650),
(30, 13, 'Miercoles', 1750),
(31, 14, 'Jueves', 1850),
(32, 15, 'Viernes', 1950);


INSERT INTO OPERACION.ENTRENAMIENTO (ID_USUARIO, DIA_SEMANA, HORA_INICIO, DURACION_MINUTOS) VALUES
(23, 'Lunes', '07:00', 45),      -- ID 3
(24, 'Martes', '08:00', 60),     -- ID 4
(25, 'Miercoles', '09:00', 50),  -- ID 5
(26, 'Jueves', '07:30', 55),     -- ID 6
(27, 'Viernes', '10:00', 40),    -- ID 7
(28, 'Sabado', '08:30', 70),     -- ID 8
(29, 'Domingo', '09:15', 65),    -- ID 9
(30, 'Lunes', '06:45', 50),      -- ID 10
(31, 'Martes', '07:20', 55),     -- ID 11
(32, 'Miercoles', '08:10', 60);  -- ID 12



INSERT INTO OPERACION.EJERCICIO_ENTRENAMIENTO
(ID_ENTRENAMIENTO, ID_EJERCICIO, SERIES_REALES, REPETICIONES) VALUES
(3,  1, 4, 12),
(4,  2, 3, 10),
(5,  3, 5, 15),
(6,  4, 4, 12),
(7,  5, 3, 10),
(8,  1, 4, 12),
(9,  2, 5, 12),
(10, 3, 3, 15),
(11, 4, 4, 10),
(12, 5, 5, 12);


