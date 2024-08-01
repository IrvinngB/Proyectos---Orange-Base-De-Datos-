 USE Orange

-- Inserción de datos en Proveedor
INSERT INTO Proveedor (IDProveedor, NombreProv, ContactoNombre, ContactoApellido, ContactoEmail, Telefono, Ciudad, Pais) VALUES
('PR01', 'TecnoPro', 'Roger', 'Burke', 'Roger.Burke@Tecnopro.com', '633 90 76 23', 'Valencia', 'España'),
('PR02', 'D.N.A', 'Álan', 'Martinez', 'Álan.Martinez@dna.com', '15 1234 5678', 'Buenos Aires', 'Argentina'),
('PR03', 'ElectroMax', 'Laura', 'Gomez', 'Laura.Gomez@electromax.com', '555-1234', 'Madrid', 'España'),
('PR04', 'GlobalTech', 'Michael', 'Johnson', 'Michael.Johnson@globaltech.com', '789-4567', 'Londres', 'Reino Unido'),
('PR05', 'InfoTech Solutions', 'Sophia', 'Lee', 'Sophia.Lee@infotech.com', '987-6543', 'Nueva York', 'Estados Unidos');

-- Inserción de datos en Departamento
INSERT INTO Departamento (IDDepartamento, NombreDepartamento)
VALUES 
    ('DPT01', 'Ventas'),
    ('DPT02', 'Recursos Humanos'),
    ('DPT03', 'Finanzas'),
    ('DPT04', 'Marketing'),
    ('DPT05', 'Logistica'),
    ('DPT06', 'Tecnologia'),
    ('DPT07', 'Operaciones'),
    ('DPT08', 'Gerencia');


SELECT * FROM Empleado

INSERT INTO Empleado (IDEmpleado, NombreEmp, ApellidoEmp, DepartamentoID, Cargo, SucursalID, FechaContratacion, Salario, Email, Telefono) VALUES
('E01', 'Juan', 'Pérez', 'DPT08', 'Gerente de Tienda', 'S01', '2016-04-21', 2400, 'juan.perez@orange.com', '65478200'),
('E02', 'María', 'Gómez', 'DPT08', 'Gerente de Tienda', 'S02', '2017-06-15', 2400, 'maria.gomez@orange.com', '69541211'),
('E03', 'Carlos', 'López', 'DPT08', 'Gerente de Tienda', 'S03', '2018-09-10', 2500, 'carlos.lopez@orange.com', '61233344'),
('E04', 'Ana', 'Martínez', 'DPT01', 'Vendedor', 'S01', '2019-02-18', 1800, 'ana.martinez@orange.com', '63459988'),
('E05', 'Pedro', 'García', 'DPT01', 'Vendedor', 'S02', '2020-08-07', 1900, 'pedro.garcia@orange.com', '67891122'),
('E06', 'Laura', 'Hernández', 'DPT04', 'Soporte Técnico', 'S03', '2019-05-12', 2200, 'laura.hernandez@orange.com', '66554455'),
('E07', 'Miguel', 'Díaz', 'DPT04', 'Soporte Técnico', 'S01', '2020-10-25', 2300, 'miguel.diaz@orange.com', '60127788'),
('E08', 'Isabel', 'Fernández', 'DPT05', 'Contador', 'S02', '2018-03-30', 2000, 'isabel.fernandez@orange.com', '68903344'),
('E09', 'Hugo', 'Ramírez', 'DPT05', 'Contador', 'S03', '2019-11-14', 2100, 'hugo.ramirez@orange.com', '62215566'),
('E10', 'Luisa', 'Vega', 'DPT04', 'Analista de Sistemas', 'S03', '2016-12-08', 2600, 'luisa.vega@orange.com', '65599122'),
('E11', 'Diego', 'Ortega', 'DPT03', 'Coordinador de Aduanas', 'S01', '2020-02-17', 2700, 'diego.ortega@orange.com', '68884455'),
('E12', 'Alejandra', 'Gutiérrez', 'DPT03', 'Analista de Inventarios', 'S01', '2018-10-05', 2800, 'alejandra.gutierrez@orange.com', '67800344'),
('E13', 'Ricardo', 'Díaz', 'DPT03', 'Planificador de Demanda', 'S01', '2016-01-15', 2900, 'ricardo.diaz@orange.com', '60005566'),
('E14', 'Andrés', 'Rodríguez', 'DPT04', 'Desarrollador Web', 'S02', '2020-03-25', 2200, 'andres.rodriguez@orange.com', '63455544'),
('E15', 'Paula', 'Suárez', 'DPT05', 'Contador', 'S03', '2021-05-18', 2300, 'paula.suarez@orange.com', '67898877'),
('E16', 'Roberto', 'Gómez', 'DPT02', 'Director de Recursos Humanos', 'S01', '2019-08-10', 2000, 'roberto.gomez@orange.com', '60112233'),
('E17', 'Camila', 'Torres', 'DPT02', 'Especialista en Desarrollo Organizacional', 'S01', '2020-11-05', 2100, 'camila.torres@orange.com', '68885566'),
('E18', 'Fernando', 'Díaz', 'DPT01', 'Analista de Mercado', 'S03', '2021-02-20', 2400, 'fernando.diaz@orange.com', '60000788'),
('E19', 'Valeria', 'Martínez', 'DPT01', 'Vendedor', 'S01', '2022-03-10', 2600, 'valeria.martinez@orange.com', '65559900'),
('E20', 'Mateo', 'López', 'DPT04', 'Soporte Técnico', 'S02', '2019-08-30', 2100, 'mateo.lopez@orange.com', '62223344'),
('E21', 'Alejandro', 'Ramírez', 'DPT05', 'Contador', 'S03', '2021-01-07', 2200, 'alejandro.ramirez@orange.com', '60116677'),
('E22', 'Lorena', 'García', 'DPT06', 'Especialista en Contenido', 'S01', '2019-06-18', 2300, 'lorena.garcia@orange.com', '68881122'),
('E23', 'Gustavo', 'Hernández', 'DPT04', 'Soporte Técnico', 'S02', '2020-12-12', 2400, 'gustavo.hernandez@orange.com', '60113344'),
('E24', 'Gabriela', 'Martínez', 'DPT01', 'Vendedor', 'S01', '2021-08-15', 2500, 'gabriela.martinez@orange.com', '65551122'),
('E25', 'Javier', 'González', 'DPT01', 'Vendedor', 'S02', '2016-02-28', 2600, 'javier.gonzalez@orange.com', '67893344'),
('E26', 'Silvia', 'Fernández', 'DPT06', 'Analis de Tendencias', 'S03', '2018-11-10', 2400, 'silvia.fernandez@orange.com', '60125566'),
('E27', 'Raul', 'López', 'DPT06', 'Coordinador de Eventos', 'S01', '2023-04-05', 2500, 'raul.lopez@orange.com', '63457788'),
('E28', 'Natalia', 'Herrera', 'DPT05', 'Contador', 'S02', '2020-07-20', 2300, 'natalia.herrera@orange.com', '65559999'),
('E29', 'Pedro', 'Díaz', 'DPT05', 'Contador', 'S03', '2016-03-12', 2400, 'pedro.diaz@orange.com', '62993344'),
('E30', 'Sara', 'Gómez', 'DPT04', 'Administrador de BD', 'S01', '2023-06-18', 2700, 'sara.gomez@orange.com', '68007122'),
('E31', 'Natasha', 'Otero', 'DPT02', 'Analista de Recursos Humanos', 'S03', '2020-08-10', 2000, 'Natasha.Otero@orange.com', '60002233');



INSERT INTO Empleado (IDEmpleado, NombreEmp, ApellidoEmp, DepartamentoID, Cargo, SucursalID, FechaContratacion, Salario, Email, Telefono) VALUES
('E32', 'Jhonathan', 'Blanco', 'DPT08', 'CEO', 'S01', '2017-09-01', 5000, 'Jhonathan.Blanco@orange.com', '65432109'),
('E33', 'Laura', 'Molina', 'DPT01', 'Gerente de Ventas', 'S03', '2020-09-15', 3500, 'laura.molina@orange.com', '63210987'),
('E34', 'Daniel', 'Ríos', 'DPT01', 'Vendedor', 'S01', '2021-09-20', 2800, 'daniel.rios@orange.com', '68904321'),
('E35', 'Ana', 'García', 'DPT03', 'Analista Financiero', 'S01', '2018-09-25', 3000, 'ana.garcia@orange.com', '61234567'),
('E36', 'Martín', 'Ramírez', 'DPT06', 'Director de Tecnología', 'S01', '2018-10-01', 4500, 'martin.ramirez@orange.com', '67678899'),
('E37', 'Luisa', 'Sánchez', 'DPT06', 'Soporte Técnico', 'S01', '2018-10-10', 3200, 'luisa.sanchez@orange.com', '64567890'),
('E38', 'Roberto', 'Vega', 'DPT04', 'Especialista en Marketing', 'S01', '2018-10-15', 3800, 'roberto.vega@orange.com', '61112222'),
('E39', 'María', 'Gutiérrez', 'DPT02', 'Desarrolladora Web', 'S03', '2016-10-20', 4000, 'maria.gutierrez@orange.com', '63451234'),
('E40', 'David', 'Pérez', 'DPT05', 'Administrador de Logística', 'S01', '2020-10-25', 4200, 'david.perez@orange.com', '67895678'),
('E41', 'Carlos', 'Hernández', 'DPT05', 'Contador Logístico', 'S01', '2020-11-01', 3400, 'carlos.hernandez@orange.com', '65437899'),
('E42', 'Lucía', 'Fuentes', 'DPT02', 'Directora de RRHH', 'S01', '2020-11-15', 4200, 'lucia.fuentes@orange.com', '63216543'),
('E43', 'Pedro', 'Torres', 'DPT02', 'Analista de Recursos Humanos', 'S01', '2020-11-20', 3200, 'pedro.torres@orange.com', '68907654'),
('E44', 'Isabel', 'Méndez', 'DPT04', 'Coordinadora de Campañas', 'S01', '2021-11-25', 3500, 'isabel.mendez@orange.com', '61239876'),
('E45', 'Juan', 'Díaz', 'DPT08', 'Director de Gerencia', 'S01', '2021-12-01', 4500, 'juan.diaz@orange.com', '67674567'),
('E46', 'Beatriz', 'Alvarez', 'DPT07', 'Gerente de Operaciones', 'S01', '2021-12-10', 3200, 'beatriz.alvarez@orange.com', '64562345'),
('E47', 'Pablo', 'Romero', 'DPT07', 'Coordinador de Operaciones', 'S02', '2022-12-15', 3800, 'pablo.romero@orange.com', '61114567'),
('E48', 'Marina', 'Ortega', 'DPT06', 'Especialista en Sistemas', 'S01', '2023-12-20', 4000, 'marina.ortega@orange.com', '63459876'),
('E49', 'Javier', 'Navarro', 'DPT05', 'Director de Logística', 'S01', '2022-01-01', 4200, 'javier.navarro@orange.com', '67897867'),
('E50', 'Carmen', 'López', 'DPT03', 'Planificadora de Demanda', 'S02', '2022-01-10', 3200, 'carmen.lopez@orange.com', '65438976');



-- Inserción de datos en Cliente
INSERT INTO Cliente (IDCliente, NombreCli, ApellidoCli, Ciudad, FechaNacimiento, Edad, Email, Telefono) VALUES
('CL01', 'Carlos', 'Martínez', 'Chorrera', '1990-05-15', 34, 'carlos.Mz34@gmail.com', '66251111'),
('CL02', 'Laura', 'Sánchez', 'Panamá', '1985-08-20', 39, 'laura.Jime34@gmail.com', '65178884'),
('CL03', 'Ana', 'González', 'David', '1992-03-10', 32, 'ana.Gonzalez@gmail.com', '61234567'),
('CL04', 'José', 'Herrera', 'Chitré', '1988-07-22', 36, 'jose.Herrera@gmail.com', '63457890'),
('CL05', 'María', 'Ríos', 'Colón', '1995-12-05', 29, 'maria.Rios@gmail.com', '65432109'),
('CL06', 'Pedro', 'Torres', 'Penonomé', '1987-06-18', 37, 'pedro.Torres@gmail.com', '62109876'),
('CL07', 'Luisa', 'Santos', 'Panamá', '1990-09-28', 34, 'luisa.Santos@gmail.com', '63219087'),
('CL08', 'Javier', 'Castañeda', 'Santiago', '1986-02-15', 38, 'javier.Castaneda@gmail.com', '65471234'),
('CL09', 'Isabel', 'Mendoza', 'La Chorrera', '1998-11-30', 26, 'isabel.Mendoza@gmail.com', '67894321'),
('CL10', 'Fernando', 'Fuentes', 'Las Tablas', '1989-04-08', 35, 'fernando.Fuentes@gmail.com', '68905432'),
('CL11', 'Adriana', 'Vega', 'Panamá', '1993-07-14', 31, 'adriana.Vega@gmail.com', '67892109'),
('CL12', 'Ricardo', 'López', 'David', '1996-01-25', 28, 'ricardo.Lopez@gmail.com', '66781234'),
('CL13', 'Gabriela', 'Navarro', 'Chitré', '1985-05-18', 39, 'gabriela.Navarro@gmail.com', '62345678'),
('CL14', 'Martín', 'Castro', 'Colón', '1994-10-12', 30, 'martin.Castro@gmail.com', '60987654'),
('CL15', 'Lucía', 'Cruz', 'Penonomé', '1986-03-28', 38, 'lucia.Cruz@gmail.com', '64567890'),
('CL16', 'Carlos', 'Gómez', 'Panamá', '1997-08-15', 27, 'carlos.Gomez@gmail.com', '60123456'),
('CL17', 'Sofía', 'Díaz', 'Santiago', '1988-12-30', 36, 'sofia.Diaz@gmail.com', '63217890'),
('CL18', 'Alejandro', 'Hernández', 'La Chorrera', '1991-06-22', 33, 'alejandro.Hernandez@gmail.com', '67894322'),
('CL19', 'Patricia', 'Ortega', 'Las Tablas', '1999-03-05', 25, 'patricia.Ortega@gmail.com', '68905433'),
('CL20', 'Daniel', 'Reyes', 'Panamá', '1987-09-18', 37, 'daniel.Reyes@gmail.com', '67892110'),
('CL21', 'Mariana', 'Lara', 'David', '2002-02-10', 22, 'mariana.Lara@gmail.com', '61234568'),
('CL22', 'Diego', 'Pérez', 'Chitré', '2004-07-22', 20, 'diego.Perez@gmail.com', '63457891'),
('CL23', 'Valeria', 'Guzmán', 'Colón', '2005-12-05', 19, 'valeria.Guzman@gmail.com', '65432110'),
('CL24', 'Mateo', 'Silva', 'Penonomé', '2001-06-18', 23, 'mateo.Silva@gmail.com', '62109877'),
('CL25', 'Camila', 'Molina', 'Panamá', '2003-09-28', 21, 'camila.Molina@gmail.com', '63219088'),
('CL26', 'Joaquín', 'Ramos', 'Santiago', '2006-02-15', 18, 'joaquin.Ramos@gmail.com', '65471235'),
('CL27', 'Aitana', 'Ortiz', 'La Chorrera', '2004-11-30', 20, 'aitana.Ortiz@gmail.com', '67894323'),
('CL28', 'Adrián', 'Castañeda', 'Las Tablas', '2001-04-08', 23, 'adrian.Castaneda@gmail.com', '68905434'),
('CL29', 'Ximena', 'Vega', 'Panamá', '2005-07-14', 19, 'ximena.Vega@gmail.com', '67892111'),
('CL30', 'Santiago', 'López', 'David', '2006-01-25', 18, 'santiago.Lopez@gmail.com', '66781235');


INSERT INTO Cliente (IDCliente, NombreCli, ApellidoCli, Ciudad, FechaNacimiento, Edad, Email, Telefono) VALUES
('CL31', 'Isabella', 'Gómez', 'Chitré', '2001-05-18', 23, 'isabella.Gomez@gmail.com', '62345998'),
('CL32', 'Maximiliano', 'Castro', 'Colón', '2003-10-12', 21, 'maximiliano.Castro@gmail.com', '61111654'),
('CL33', 'Emma', 'Cruz', 'Penonomé', '2001-03-28', 23, 'emma.Cruz@gmail.com', '64511330'),
('CL34', 'Lucas', 'Gómez', 'Panamá', '2005-08-15', 19, 'lucas.Gomez@gmail.com', '60111456'),
('CL35', 'Alessandra', 'Díaz', 'Santiago', '2002-12-30', 22, 'alessandra.Diaz@gmail.com', '63211890'),
('CL36', 'Samuel', 'Herrera', 'Las Tablas', '2002-05-10', 22, 'samuel.Herrera@gmail.com', '61288567'),
('CL37', 'Valentina', 'Gutiérrez', 'Panamá', '2006-07-22', 18, 'valentina.Gutierrez@gmail.com', '64457890'),
('CL38', 'Gabriel', 'Mendoza', 'David', '2005-12-05', 19, 'gabriel.Mendoza@gmail.com', '65439909'),
('CL39', 'Aitana', 'Fuentes', 'Chitré', '2001-06-18', 23, 'aitana.Fuentes@gmail.com', '62105576'),
('CL40', 'Adrián', 'Guerra', 'Colón', '2003-09-28', 21, 'adrian.Guerra@gmail.com', '63219227'),
('CL41', 'Camila', 'Santos', 'Panamá', '2006-02-15', 18, 'camila.Santos@gmail.com', '65471534'),
('CL42', 'Luis', 'Ortega', 'Santiago', '2004-11-30', 20, 'luis.Ortega@gmail.com', '67894661'),
('CL43', 'Ana', 'Díaz', 'La Chorrera', '2001-04-08', 23, 'ana.Diaz@gmail.com', '68944432'),
('CL44', 'Miguel', 'Velasco', 'Las Tablas', '2005-07-14', 19, 'miguel.Velasco@gmail.com', '65592110'),
('CL45', 'Isabella', 'Castañeda', 'Panamá', '2006-01-25', 18, 'isabella.Castaneda@gmail.com', '66781134'),
('CL46', 'Maximiliano', 'Rojas', 'David', '2001-05-18', 23, 'maximiliano.Rojas@gmail.com', '62346679'),
('CL47', 'Emma', 'Zamora', 'Chitré', '2003-10-12', 21, 'emma.Zamora@gmail.com', '60999555'),
('CL48', 'Lucas', 'Córdoba', 'Colón', '2001-03-28', 23, 'lucas.Cordoba@gmail.com', '64111891'),
('CL49', 'Valeria', 'Molina', 'Panamá', '2005-08-15', 19, 'valeria.Molina@gmail.com', '60633457'),
('CL50', 'Gabriel', 'Salazar', 'Santiago', '2002-12-30', 22, 'gabriel.Salazar@gmail.com', '63417891'),
('CL51', 'Sofía', 'Arias', 'Las Tablas', '2001-07-18', 23, 'sofia.Arias@gmail.com', '61236368'),
('CL52', 'Juan', 'García', 'Panamá', '2003-09-22', 21, 'juan.Garcia@gmail.com', '63456391'),
('CL53', 'Valentina', 'Moreno', 'David', '2006-01-05', 18, 'valentina.Moreno@gmail.com', '65112110'),
('CL54', 'Andrés', 'Sánchez', 'Chitré', '2001-04-18', 23, 'andres.Sanchez@gmail.com', '62122877'),
('CL55', 'Laura', 'Torres', 'Colón', '2004-11-28', 20, 'laura.Torres@gmail.com', '63215588'),
('CL56', 'Mateo', 'Pérez', 'Santiago', '2002-08-10', 22, 'mateo.Perez@gmail.com', '64366098'),
('CL57', 'Julieta', 'Gómez', 'La Chorrera', '2006-03-22', 18, 'julieta.Gomez@gmail.com', '66669876'),
('CL58', 'Daniel', 'Castañón', 'Colón', '2005-06-05', 19, 'daniel.Castanon@gmail.com', '67895511'),
('CL59', 'Olivia', 'Hernández', 'Panamá', '2001-11-18', 23, 'olivia.Hernandez@gmail.com', '68181235'),
('CL60', 'Sebastián', 'Ortiz', 'David', '2006-04-25', 18, 'sebastian.Ortiz@gmail.com', '67892232');



-- Inserción de datos en Sucursales
INSERT INTO Sucursales (IDSucursal, NombreSucursal, Provincia, Direccion, Telefono, GerenteID, FechaApertura) VALUES
('S01', 'SucursalP', 'Panamá Oeste', 'Chorrera', '555-1111', 'E01', '2016-04-21'),
('S02', 'Sucursal2', 'Panamá', 'San Miguel', '555-2222', 'E02', '2018-04-27'),
('S03', 'Sucursal3', 'Veraguas', 'Santiago', '555-3333', 'E03', '2023-05-21');

-- Inserción de datos en Producto
INSERT INTO Producto (IDProducto, NombreProducto, Precio, ProveedorID, Categoria) VALUES
('ST01', 'Intel Core i7-13700K', 375.00, 'PR01', 'Procesador'),
('ST02', 'ASUS ROG STRIX GAMING', 1100.00,'PR01', 'Tarjeta gráfica'),
('ST03', 'Corsair Vengeance LPX 16GB', 90.00, 'PR02', 'Memoria RAM'),
('ST04', 'Samsung 970 EVO Plus 1TB', 150.00, 'PR03', 'Almacenamiento SSD'),
('ST05', 'Logitech G Pro X Mechanical Keyboard', 120.00, 'PR04', 'Teclado'),
('ST06', 'SteelSeries Rival 600', 80.00, 'PR05', 'Mouse'),
('ST07', 'LG 27GL83A-B 27 Inch', 450.00, 'PR05', 'Monitor'),
('ST08', 'NZXT H510i Compact ATX Mid-Tower', 110.00, 'PR01', 'Caja/Torre'),
('ST09', 'EVGA SuperNOVA 750 G5', 120.00, 'PR04', 'Fuente de alimentación'),
('ST10', 'HyperX Cloud II Gaming Headset', 80.00, 'PR01', 'Auriculares'),
('ST11', 'ASRock B550 Steel Legend', 160.00, 'PR01', 'Placa base'),
('ST12', 'Seagate Barracuda 2TB', 60.00, 'PR02', 'Disco Duro'),
('ST13', 'AMD Ryzen 5 5600X', 300.00, 'PR01', 'Procesador'),
('ST14', 'NVIDIA GeForce RTX 3070', 900.00, 'PR02', 'Tarjeta gráfica'),
('ST15', 'Corsair Vengeance RGB PRO 32GB', 150.00, 'PR03', 'Memoria RAM'),
('ST16', 'Western Digital Blue 500GB', 80.00, 'PR04', 'Almacenamiento SSD'),
('ST17', 'Razer BlackWidow Elite Mechanical Keyboard', 140.00, 'PR05', 'Teclado'),
('ST18', 'Logitech G Pro Wireless', 100.00, 'PR05', 'Mouse'),
('ST19', 'Dell S2419HGF 24 Inch', 200.00, 'PR04', 'Monitor'),
('ST20', 'Fractal Design Meshify C ATX Mid-Tower', 80.00, 'PR01', 'Caja/Torre'),
('ST21', 'Corsair RM750x', 130.00, 'PR04', 'Fuente de alimentación'),
('ST22', 'Bose QuietComfort 35 II', 250.00, 'PR04', 'Auriculares'),
('ST23', 'MSI MAG B550 TOMAHAWK', 180.00, 'PR04', 'Placa base'),
('ST24', 'Crucial P2 1TB', 120.00, 'PR01', 'Disco Duro'),
('ST25', 'AMD Ryzen 7 5800X', 400.00, 'PR01', 'Procesador'),
('ST26', 'NVIDIA GeForce GTX 1660 Ti', 300.00, 'PR02', 'Tarjeta gráfica'),
('ST27', 'G.Skill Ripjaws V 16GB', 80.00, 'PR03', 'Memoria RAM'),
('ST28', 'Intel Core i9-11900K', 500.00, 'PR01', 'Procesador'),
('ST29', 'MSI Radeon RX 6700 XT', 550.00, 'PR02', 'Tarjeta gráfica'),
('ST30', 'Corsair Vengeance LPX 32GB', 120.00, 'PR03', 'Memoria RAM'),
('ST31', 'AMD Ryzen 9 5900X', 550.00, 'PR01', 'Procesador'),
('ST32', 'ASUS TUF Gaming GeForce RTX 3080', 1000.00, 'PR02', 'Tarjeta gráfica'),
('ST33', 'Kingston HyperX Fury 16GB', 90.00, 'PR03', 'Memoria RAM'),
('ST34', 'Intel Core i5-12600K', 350.00, 'PR01', 'Procesador'),
('ST35', 'Gigabyte AORUS GeForce RTX 3070', 850.00, 'PR02', 'Tarjeta gráfica');

-- Tabla inventario aparte

-- Inserción de datos en Pedido
INSERT INTO Pedido (IDPedido, ClienteID, ProductoID, Cantidad, FechaPedido, EstadoPedido, SucursalID, PrecioTotal) VALUES
('DP01', 'CL01', 'ST01', 2, '2023-03-01', 'En Proceso', 'S01', 749.00),
('DP02', 'CL02', 'ST02', 1, '2023-03-15', 'Cancelado', 'S01', 1177.00),
('DP03', 'CL03', 'ST03', 3, '2023-03-02', 'En Proceso', 'S02', 270.00),
('DP04', 'CL04', 'ST04', 1, '2023-03-12', 'Entregado', 'S02', 150.00),
('DP05', 'CL05', 'ST05', 2, '2023-03-05', 'En Proceso', 'S03', 240.00),
('DP06', 'CL06', 'ST06', 1, '2023-03-18', 'En Proceso', 'S03', 80.00),
('DP07', 'CL07', 'ST07', 1, '2023-03-07', 'Entregado', 'S01', 450.00),
('DP08', 'CL08', 'ST08', 2, '2023-03-10', 'En Proceso', 'S02', 220.00),
('DP09', 'CL09', 'ST09', 3, '2023-03-14', 'En Proceso', 'S03', 360.00),
('DP10', 'CL10', 'ST10', 1, '2023-03-03', 'Cancelado', 'S01', 80.00),
('DP11', 'CL11', 'ST11', 2, '2023-03-08', 'Entregado', 'S01', 320.00),
('DP12', 'CL12', 'ST12', 1, '2023-03-16', 'En Proceso', 'S02', 60.00),
('DP13', 'CL13', 'ST13', 3, '2023-03-04', 'En Proceso', 'S02', 900.00),
('DP14', 'CL14', 'ST14', 1, '2023-03-09', 'Cancelado', 'S03', 900.00),
('DP15', 'CL15', 'ST15', 2, '2023-03-11', 'Entregado', 'S03', 300.00),
('DP16', 'CL16', 'ST16', 1, '2023-03-17', 'En Proceso', 'S01', 80.00),
('DP17', 'CL17', 'ST17', 3, '2023-03-06', 'En Proceso', 'S02', 420.00),
('DP18', 'CL18', 'ST18', 1, '2023-03-13', 'Cancelado', 'S01', 100.00),
('DP19', 'CL19', 'ST19', 2, '2023-03-19', 'Entregado', 'S02', 400.00),
('DP20', 'CL20', 'ST20', 1, '2023-03-20', 'En Proceso', 'S03', 80.00),
('DP21', 'CL21', 'ST21', 3, '2023-03-21', 'En Proceso', 'S01', 390.00),
('DP22', 'CL22', 'ST22', 1, '2023-03-22', 'Cancelado', 'S01', 250.00),
('DP23', 'CL23', 'ST23', 2, '2023-03-23', 'Entregado', 'S02', 1100.00),
('DP24', 'CL24', 'ST24', 1, '2023-03-24', 'En Proceso', 'S02', 120.00),
('DP25', 'CL25', 'ST25', 3, '2023-03-25', 'En Proceso', 'S03', 1050.00),
('DP26', 'CL26', 'ST26', 1, '2023-03-26', 'Enviado', 'S03', 300.00),
('DP27', 'CL27', 'ST27', 2, '2023-03-27', 'Entregado', 'S03', 160.00),
('DP28', 'CL28', 'ST28', 1, '2023-03-28', 'En Proceso', 'S03', 500.00),
('DP29', 'CL29', 'ST29', 3, '2023-03-29', 'En Proceso', 'S01', 1650.00),
('DP30', 'CL30', 'ST30', 1, '2023-03-30', 'Cancelado', 'S01', 120.00),
('DP31', 'CL31', 'ST31', 2, '2023-03-31', 'Entregado', 'S01', 1100.00),
('DP32', 'CL32', 'ST32', 1, '2023-04-01', 'En Proceso', 'S02', 800.00),
('DP33', 'CL33', 'ST33', 3, '2023-04-02', 'En Proceso', 'S02', 270.00),
('DP34', 'CL34', 'ST34', 1, '2023-04-03', 'Cancelado', 'S02', 350.00),
('DP35', 'CL35', 'ST35', 2, '2023-04-04', 'Entregado', 'S02', 170.00),
('DP36', 'CL36', 'ST01', 2, '2023-04-05', 'Enviado', 'S01', 680.00),
('DP37', 'CL37', 'ST02', 1, '2023-04-06', 'Enviado', 'S02', 1100.00),
('DP38', 'CL38', 'ST03', 3, '2023-04-07', 'Enviado', 'S03', 270.00),
('DP39', 'CL39', 'ST04', 1, '2023-04-08', 'Enviado', 'S02', 150.00),
('DP40', 'CL40', 'ST05', 2, '2023-04-09', 'Enviado', 'S03', 240.00);

SELECT DISTINCT Cargo, DepartamentoID
FROM Empleado;
