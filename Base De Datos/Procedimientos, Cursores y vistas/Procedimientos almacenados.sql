use orange

USE Orange;
GO

-- 1. Procedimientos almacenados para ingresar datos a cada una de las tablas

-- Cliente
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'InsertarCliente')
BEGIN
    DROP PROCEDURE InsertarCliente;
END;
GO

CREATE PROCEDURE InsertarCliente (
  @IDCliente VARCHAR(10),
  @NombreCli VARCHAR(100),
  @ApellidoCli VARCHAR(100),
  @Ciudad VARCHAR(100),
  @FechaNacimiento DATE,
  @Edad INT,
  @Email VARCHAR(100),
  @Telefono VARCHAR(20)
)
AS
BEGIN
  INSERT INTO Cliente (IDCliente, NombreCli, ApellidoCli, Ciudad, FechaNacimiento, Edad, Email, Telefono)
  VALUES (@IDCliente, @NombreCli, @ApellidoCli, @Ciudad, @FechaNacimiento, @Edad, @Email, @Telefono);

  PRINT 'Cliente agregado exitosamente.';
END;
GO

EXEC InsertarCliente 
  @IDCliente = 'CL62', 
  @NombreCli = 'Isaac', 
  @ApellidoCli = 'Suman', 
  @Ciudad = 'Panamá', 
  @FechaNacimiento = '1980-05-20', 
  @Edad = 43, 
  @Email = 'isaac.su@ejemplo.com', 
  @Telefono = '62234567';
GO

-- Producto
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'InsertarProducto')
BEGIN
    DROP PROCEDURE InsertarProducto;
END;
GO

CREATE PROCEDURE InsertarProducto (
  @IDProducto VARCHAR(10),
  @NombreProducto VARCHAR(100),
  @Categoria VARCHAR(50),
  @Precio DECIMAL(10, 2),
  @ProveedorID VARCHAR(10),
  @Stock INT
)
AS
BEGIN
  INSERT INTO Producto (IDProducto, NombreProducto, Categoria, Precio, ProveedorID)
  VALUES (@IDProducto, @NombreProducto, @Categoria, @Precio, @ProveedorID);

  PRINT 'Producto agregado exitosamente.';
END;
GO

EXEC InsertarProducto 
  @IDProducto = 'ST100', 
  @NombreProducto = 'Intel Core i9-9900K', 
  @Categoria = 'CPU', 
  @Precio = 499.99, 
  @ProveedorID = 'PR01', 
  @Stock = 50;
GO

-- Proveedor
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'InsertarProveedor')
BEGIN
    DROP PROCEDURE InsertarProveedor;
END;
GO

CREATE PROCEDURE InsertarProveedor
  @IDProveedor NVARCHAR(10),
  @Nombre NVARCHAR(50),
  @Contacto NVARCHAR(50),
  @ContactoApellido NVARCHAR(50),
  @ContactoEmail NVARCHAR(50),
  @Telefono NVARCHAR(20),
  @Ciudad NVARCHAR(20),
  @Pais NVARCHAR(20)
AS 
BEGIN
    INSERT INTO Proveedor (IDProveedor, NombreProv, ContactoNombre, ContactoApellido, ContactoEmail, Telefono, Ciudad, Pais)
    VALUES (@IDProveedor, @Nombre, @Contacto, @ContactoApellido, @ContactoEmail, @Telefono, @Ciudad, @Pais);
END;
GO

EXEC InsertarProveedor @IDProveedor='PR06', @Nombre = 'Proveedor A', @Contacto = 'Carlos', @ContactoApellido='Su', @ContactoEmail='carlos.su@example.com', @Telefono = '507-1234', @Ciudad='Tampa', @Pais='Estados Unidos';
GO

-- Departamento
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'InsertarDepartamento')
BEGIN
    DROP PROCEDURE InsertarDepartamento;
END;
GO

CREATE PROCEDURE InsertarDepartamento
  @IDDepartamento NVARCHAR(10),
  @Nombre NVARCHAR(50)
AS
BEGIN
    INSERT INTO Departamento (IDDepartamento, NombreDepartamento)
    VALUES (@IDDepartamento, @Nombre);
END;
GO

EXEC InsertarDepartamento @IDDepartamento='DPT09', @Nombre='Ventas';
GO

-- Empleado
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'InsertarEmpleado')
BEGIN
    DROP PROCEDURE InsertarEmpleado;
END;
GO

CREATE PROCEDURE InsertarEmpleado
  @IDEmpleado NVARCHAR(10),
  @Nombre NVARCHAR(100),
  @Nombre2 NVARCHAR(100) = NULL,
  @Apellido NVARCHAR(100),
  @Apellido2 NVARCHAR(100) = NULL,
  @DepartamentoID NVARCHAR(10),
  @Cargo NVARCHAR(100),
  @SucursalID NVARCHAR(10),
  @FechaContra DATE,
  @Salario FLOAT,
  @Email NVARCHAR(100),
  @Telefono NVARCHAR(20)
AS
BEGIN
    INSERT INTO Empleado (IDEmpleado, NombreEmp, Nombre2Emp, ApellidoEmp, Apellido2Emp, DepartamentoID, Cargo, SucursalID, FechaContratacion, Salario, Email, Telefono)
    VALUES (@IDEmpleado, @Nombre, @Nombre2, @Apellido, @Apellido2, @DepartamentoID, @Cargo, @SucursalID, @FechaContra, @Salario, @Email, @Telefono);

    PRINT 'Empleado agregado exitosamente.';
END;
GO

EXEC InsertarEmpleado @IDEmpleado='E100', @Nombre='Ana', @Apellido='Gomez', @DepartamentoID='DPT03', @Cargo='Vendedor', @SucursalID='S03', @FechaContra='2018-10-10', @Salario='1500', @Email='ana.gomez@example.com', @Telefono='66782541';
GO

-- Inventario
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'InsertarInventario')
BEGIN
    DROP PROCEDURE InsertarInventario;
END;
GO

CREATE PROCEDURE InsertarInventario
  @IDInventario NVARCHAR(10),
  @ProductoID NVARCHAR(10),
  @SucursalID NVARCHAR(10),
  @Stock NVARCHAR(10),
  @FechaLLegada NVARCHAR(10)
AS
BEGIN
    INSERT INTO Inventario (IDInventario, ProductoID, SucursalID, Stock, Fechallegada)
    VALUES (@IDInventario, @ProductoID, @SucursalID, @Stock, @FechaLLegada);
END;
GO

EXEC InsertarInventario @IDInventario='IN106', @ProductoID='ST01', @SucursalID='S03', @Stock='10', @FechaLLegada='2022-08-15';
GO

-- Pedido
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'InsertarPedido')
BEGIN
    DROP PROCEDURE InsertarPedido;
END;
GO

CREATE PROCEDURE InsertarPedido
  @IDPedido NVARCHAR(10),
  @ClienteID NVARCHAR(10),
  @ProductoID NVARCHAR(10),
  @Cantidad INT,
  @FechaPedido NVARCHAR(10),
  @EstadoPedido NVARCHAR(10),
  @SucursalID NVARCHAR(10),
  @PrecioTotal NVARCHAR(10)
AS
BEGIN
    INSERT INTO Pedido (IDPedido, ClienteID, ProductoID, Cantidad, FechaPedido, EstadoPedido, SucursalID, PrecioTotal)
    VALUES (@IDPedido, @ClienteID, @ProductoID, @Cantidad, @FechaPedido, @EstadoPedido, @SucursalID, @PrecioTotal);
END;
GO

EXEC InsertarPedido @IDPedido='DP50', @ClienteID='CL41', @ProductoID='ST01', @Cantidad=2, @FechaPedido='2024-07-08', @EstadoPedido='En Proceso', @SucursalID='S02', @PrecioTotal='200.00';
GO

-- Sucursales
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'InsertarSucursal')
BEGIN
    DROP PROCEDURE InsertarSucursal;
END;
GO

CREATE PROCEDURE InsertarSucursal
  @IDSucursal NVARCHAR(10),
  @Nombre NVARCHAR(50),
  @Provincia NVARCHAR(50),
  @Direccion NVARCHAR(100),
  @Telefono NVARCHAR(20),
  @GerenteID NVARCHAR(50),
  @FechaApertura NVARCHAR(10)
AS
BEGIN
    INSERT INTO Sucursales (IDSucursal, NombreSucursal, Provincia, Direccion, Telefono, GerenteID, FechaApertura)
    VALUES (@IDSucursal, @Nombre, @Provincia, @Direccion, @Telefono, @GerenteID, @FechaApertura);
END;
GO

EXEC InsertarSucursal @IDSucursal='S04', @Nombre='Sucursal4', @Provincia='Darien', @Direccion='Calle Principal 123', @Telefono='555-1234', @GerenteID='E04', @FechaApertura='2024-07-08';
GO

-- 2. Procedimientos almacenados para hacer actualización de campos en cada tabla

-- Tabla Cliente
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ActualizarCliente')
BEGIN
    DROP PROCEDURE ActualizarCliente;
END;
GO

CREATE PROCEDURE ActualizarCliente (
  @IDCliente VARCHAR(10),
  @NombreCli VARCHAR(100),
  @ApellidoCli VARCHAR(100),
  @Ciudad VARCHAR(100),
  @FechaNacimiento DATE,
  @Edad INT,
  @Email VARCHAR(100),
  @Telefono VARCHAR(20)
)
AS
BEGIN
  UPDATE Cliente
  SET NombreCli = @NombreCli,
      ApellidoCli = @ApellidoCli,
      Ciudad = @Ciudad,
      FechaNacimiento = @FechaNacimiento,
      Edad = @Edad,
      Email = @Email,
      Telefono = @Telefono
  WHERE IDCliente = @IDCliente;

  PRINT 'Cliente actualizado exitosamente.';
END;
GO

EXEC ActualizarCliente 
  @IDCliente = 'CL01', 
  @NombreCli = 'Juan', 
  @ApellidoCli = 'Pérez', 
  @Ciudad = 'Madrid', 
  @FechaNacimiento = '1985-05-20', 
  @Edad = 39, 
  @Email = 'juan.perez@actualizado.com', 
  @Telefono = '612345678';
GO

-- Tabla Producto
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ActualizarProducto')
BEGIN
    DROP PROCEDURE ActualizarProducto;
END;
GO

CREATE PROCEDURE ActualizarProducto (
  @IDProducto VARCHAR(10),
  @NombreProd VARCHAR(100),
  @Precio DECIMAL(10, 2),
  @Categoria VARCHAR(100),
  @ProveedorID VARCHAR(10)
)
AS
BEGIN
  UPDATE Producto
  SET NombreProducto = @NombreProd,
      Precio = @Precio,
      Categoria = @Categoria,
      ProveedorID = @ProveedorID
  WHERE IDProducto = @IDProducto;

  PRINT 'Producto actualizado exitosamente.';
END;
GO

EXEC ActualizarProducto 
  @IDProducto = 'PR01', 
  @NombreProd = 'Laptop Actualizada', 
  @Precio = 1500.00, 
  @Categoria = 'Electrónica', 
  @ProveedorID = 'PR01';
GO

-- Tabla Proveedor
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ActualizarProveedor')
BEGIN
    DROP PROCEDURE ActualizarProveedor;
END;
GO

CREATE PROCEDURE ActualizarProveedor (
  @IDProveedor NVARCHAR(10),
  @Nombre NVARCHAR(50),
  @Contacto NVARCHAR(50),
  @ContactoApellido NVARCHAR(50),
  @ContactoEmail NVARCHAR(50),
  @Telefono NVARCHAR(20),
  @Ciudad NVARCHAR(20),
  @Pais NVARCHAR(20)
)
AS
BEGIN
  UPDATE Proveedor
  SET NombreProv = @Nombre,
      ContactoNombre = @Contacto,
      ContactoApellido = @ContactoApellido,
      ContactoEmail = @ContactoEmail,
      Telefono = @Telefono,
      Ciudad = @Ciudad,
      Pais = @Pais
  WHERE IDProveedor = @IDProveedor;

  PRINT 'Proveedor actualizado exitosamente.';
END;
GO

EXEC ActualizarProveedor 
  @IDProveedor = 'PR01', 
  @Nombre = 'TecnoPro', 
  @Contacto = 'Roger', 
  @ContactoApellido = 'Burke', 
  @ContactoEmail = 'roger.burke@tecnopro.com', 
  @Telefono = '633907623', 
  @Ciudad = 'Valencia', 
  @Pais = 'España';
GO

-- Tabla Departamento
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ActualizarDepartamento')
BEGIN
    DROP PROCEDURE ActualizarDepartamento;
END;
GO

CREATE PROCEDURE ActualizarDepartamento (
  @IDDepartamento NVARCHAR(10),
  @Nombre NVARCHAR(50)
)
AS
BEGIN
  UPDATE Departamento
  SET NombreDepartamento = @Nombre
  WHERE IDDepartamento = @IDDepartamento;

  PRINT 'Departamento actualizado exitosamente.';
END;
GO

EXEC ActualizarDepartamento 
  @IDDepartamento = 'DPT01', 
  @Nombre = 'Ventas';
GO

-- Tabla Empleado
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ActualizarEmpleado')
BEGIN
    DROP PROCEDURE ActualizarEmpleado;
END;
GO

CREATE PROCEDURE ActualizarEmpleado (
  @IDEmpleado NVARCHAR(10),
  @Nombre NVARCHAR(100),
  @Nombre2 NVARCHAR(100) = NULL,
  @Apellido NVARCHAR(100),
  @Apellido2 NVARCHAR(100) = NULL,
  @DepartamentoID NVARCHAR(10),
  @Cargo NVARCHAR(100),
  @SucursalID NVARCHAR(10),
  @FechaContra DATE,
  @Salario FLOAT,
  @Email NVARCHAR(100),
  @Telefono NVARCHAR(20)
)
AS
BEGIN
  UPDATE Empleado
  SET NombreEmp = @Nombre,
      Nombre2Emp = @Nombre2,
      ApellidoEmp = @Apellido,
      Apellido2Emp = @Apellido2,
      DepartamentoID = @DepartamentoID,
      Cargo = @Cargo,
      SucursalID = @SucursalID,
      FechaContratacion = @FechaContra,
      Salario = @Salario,
      Email = @Email,
      Telefono = @Telefono
  WHERE IDEmpleado = @IDEmpleado;

  PRINT 'Empleado actualizado exitosamente.';
END;
GO

EXEC ActualizarEmpleado 
  @IDEmpleado = 'E01', 
  @Nombre = 'Juan', 
  @Apellido = 'Pérez', 
  @Apellido2 = NULL,
  @DepartamentoID = 'DPT01', 
  @Cargo = 'Gerente', 
  @SucursalID = 'S01', 
  @FechaContra = '2016-04-21', 
  @Salario = 2400, 
  @Email = 'juan.perez@actualizado.com', 
  @Telefono = '612345678';
GO

-- Tabla Inventarios
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ActualizarInventario')
BEGIN
    DROP PROCEDURE ActualizarInventario;
END;
GO

CREATE PROCEDURE ActualizarInventario (
  @IDInventario NVARCHAR(10),
  @ProductoID NVARCHAR(10),
  @SucursalID NVARCHAR(10),
  @Stock INT,
  @FechaLLegada DATE
)
AS
BEGIN
  UPDATE Inventario
  SET ProductoID = @ProductoID,
      SucursalID = @SucursalID,
      Stock = @Stock,
      FechaLlegada = @FechaLLegada
  WHERE IDInventario = @IDInventario;

  PRINT 'Inventario actualizado exitosamente.';
END;
GO

EXEC ActualizarInventario 
  @IDInventario = 'IN01', 
  @ProductoID = 'PR01', 
  @SucursalID = 'S01', 
  @Stock = 100, 
  @FechaLLegada = '2023-08-15';
GO

-- Tabla Pedidos
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ActualizarPedido')
BEGIN
    DROP PROCEDURE ActualizarPedido;
END;
GO

CREATE PROCEDURE ActualizarPedido (
  @IDPedido NVARCHAR(10),
  @ClienteID NVARCHAR(10),
  @ProductoID NVARCHAR(10),
  @Cantidad INT,
  @FechaPedido DATE,
  @EstadoPedido NVARCHAR(10),
  @SucursalID NVARCHAR(10),
  @PrecioTotal FLOAT
)
AS
BEGIN
  UPDATE Pedido
  SET ClienteID = @ClienteID,
      ProductoID = @ProductoID,
      Cantidad = @Cantidad,
      FechaPedido = @FechaPedido,
      EstadoPedido = @EstadoPedido,
      SucursalID = @SucursalID,
      PrecioTotal = @PrecioTotal
  WHERE IDPedido = @IDPedido;

  PRINT 'Pedido actualizado exitosamente.';
END;
GO

EXEC ActualizarPedido 
  @IDPedido = 'DP01', 
  @ClienteID = 'CL01', 
  @ProductoID = 'PR01', 
  @Cantidad = 10, 
  @FechaPedido = '2024-07-09', 
  @EstadoPedido = 'Enviado', 
  @SucursalID = 'S01', 
  @PrecioTotal = 1500.00;
GO

-- Tabla Sucursal
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ActualizarSucursal')
BEGIN
    DROP PROCEDURE ActualizarSucursal;
END;
GO

CREATE PROCEDURE ActualizarSucursal (
  @IDSucursal NVARCHAR(10),
  @Nombre NVARCHAR(50),
  @Provincia NVARCHAR(50),
  @Direccion NVARCHAR(100),
  @Telefono NVARCHAR(20),
  @GerenteID NVARCHAR(50),
  @FechaApertura DATE
)
AS
BEGIN
  UPDATE Sucursales
  SET NombreSucursal = @Nombre,
      Provincia = @Provincia,
      Direccion = @Direccion,
      Telefono = @Telefono,
      GerenteID = @GerenteID,
      FechaApertura = @FechaApertura
  WHERE IDSucursal = @IDSucursal;

  PRINT 'Sucursal actualizada exitosamente.';
END;
GO






-- Procedimientos para eliminar registros por su llave primaria

-- Cliente
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'EliminarCliente')
BEGIN
    DROP PROCEDURE EliminarCliente;
END;
GO

CREATE PROCEDURE EliminarCliente (
  @IDCliente VARCHAR(10)
)
AS
BEGIN
  DELETE FROM Cliente
  WHERE IDCliente = @IDCliente;

  PRINT 'Cliente eliminado exitosamente.';
END;
GO

EXEC EliminarCliente @IDCliente = 'CL62';
GO

-- Producto
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'EliminarProducto')
BEGIN
    DROP PROCEDURE EliminarProducto;
END;
GO

CREATE PROCEDURE EliminarProducto (
  @IDProducto VARCHAR(10)
)
AS
BEGIN
  DELETE FROM Producto
  WHERE IDProducto = @IDProducto;

  PRINT 'Producto eliminado exitosamente.';
END;
GO

EXEC EliminarProducto @IDProducto = 'ST36';
GO

-- Proveedor
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'EliminarProveedor')
BEGIN
    DROP PROCEDURE EliminarProveedor;
END;
GO

CREATE PROCEDURE EliminarProveedor (
  @IDProveedor NVARCHAR(10)
)
AS
BEGIN
  DELETE FROM Proveedor
  WHERE IDProveedor = @IDProveedor;

  PRINT 'Proveedor eliminado exitosamente.';
END;
GO

EXEC EliminarProveedor @IDProveedor = 'PR06';
GO

-- Departamento
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'EliminarDepartamento')
BEGIN
    DROP PROCEDURE EliminarDepartamento;
END;
GO

CREATE PROCEDURE EliminarDepartamento (
  @IDDepartamento NVARCHAR(10)
)
AS
BEGIN
  DELETE FROM Departamento
  WHERE IDDepartamento = @IDDepartamento;

  PRINT 'Departamento eliminado exitosamente.';
END;
GO

EXEC EliminarDepartamento @IDDepartamento = 'DPT09';
GO

-- Empleado
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'EliminarEmpleado')
BEGIN
    DROP PROCEDURE EliminarEmpleado;
END;
GO

CREATE PROCEDURE EliminarEmpleado (
  @IDEmpleado NVARCHAR(10)
)
AS
BEGIN
  DELETE FROM Empleado
  WHERE IDEmpleado = @IDEmpleado;

  PRINT 'Empleado eliminado exitosamente.';
END;
GO

EXEC EliminarEmpleado @IDEmpleado = 'E001';
GO

-- Inventario
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'EliminarInventario')
BEGIN
    DROP PROCEDURE EliminarInventario;
END;
GO

CREATE PROCEDURE EliminarInventario (
  @IDInventario NVARCHAR(10)
)
AS
BEGIN
  DELETE FROM Inventario
  WHERE IDInventario = @IDInventario;

  PRINT 'Inventario eliminado exitosamente.';
END;
GO

EXEC EliminarInventario @IDInventario = 'IN106';
GO

-- Pedido
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'EliminarPedido')
BEGIN
    DROP PROCEDURE EliminarPedido;
END;
GO

CREATE PROCEDURE EliminarPedido (
  @IDPedido NVARCHAR(10)
)
AS
BEGIN
  DELETE FROM Pedido
  WHERE IDPedido = @IDPedido;

  PRINT 'Pedido eliminado exitosamente.';
END;
GO

EXEC EliminarPedido @IDPedido = 'DP50';
GO

-- Sucursal
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'EliminarSucursal')
BEGIN
    DROP PROCEDURE EliminarSucursal;
END;
GO

CREATE PROCEDURE EliminarSucursal (
  @IDSucursal NVARCHAR(10)
)
AS
BEGIN
  DELETE FROM Sucursales
  WHERE IDSucursal = @IDSucursal;

  PRINT 'Sucursal eliminada exitosamente.';
END;
GO

EXEC EliminarSucursal @IDSucursal = 'S04';
GO

-- Cliente
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BuscarCliente')
BEGIN
    DROP PROCEDURE BuscarCliente;
END;
GO

CREATE PROCEDURE BuscarCliente (
  @IDCliente VARCHAR(10)
)
AS
BEGIN
  SELECT *
  FROM Cliente
  WHERE IDCliente = @IDCliente;

  PRINT 'Búsqueda de cliente completada.';
END;
GO

EXEC BuscarCliente @IDCliente = 'CL09';
GO

-- Producto
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BuscarProducto')
BEGIN
    DROP PROCEDURE BuscarProducto;
END;
GO

CREATE PROCEDURE BuscarProducto (
  @IDProducto VARCHAR(10)
)
AS
BEGIN
  SELECT *
  FROM Producto
  WHERE IDProducto = @IDProducto;

  PRINT 'Búsqueda de producto completada.';
END;
GO

EXEC BuscarProducto @IDProducto = 'ST35';
GO

-- Proveedor
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BuscarProveedor')
BEGIN
    DROP PROCEDURE BuscarProveedor;
END;
GO

CREATE PROCEDURE BuscarProveedor (
  @IDProveedor NVARCHAR(10)
)
AS
BEGIN
  SELECT *
  FROM Proveedor
  WHERE IDProveedor = @IDProveedor;

  PRINT 'Búsqueda de proveedor completada.';
END;
GO

EXEC BuscarProveedor @IDProveedor = 'PR05';
GO

-- Departamento
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BuscarDepartamento')
BEGIN
    DROP PROCEDURE BuscarDepartamento;
END;
GO

CREATE PROCEDURE BuscarDepartamento (
  @IDDepartamento NVARCHAR(10)
)
AS
BEGIN
  SELECT *
  FROM Departamento
  WHERE IDDepartamento = @IDDepartamento;

  PRINT 'Búsqueda de departamento completada.';
END;
GO

EXEC BuscarDepartamento @IDDepartamento = 'DPT08';
GO

-- Empleado
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BuscarEmpleado')
BEGIN
    DROP PROCEDURE BuscarEmpleado;
END;
GO

CREATE PROCEDURE BuscarEmpleado (
  @IDEmpleado NVARCHAR(10)
)
AS
BEGIN
  SELECT *
  FROM Empleado
  WHERE IDEmpleado = @IDEmpleado;

  PRINT 'Búsqueda de empleado completada.';
END;
GO

EXEC BuscarEmpleado @IDEmpleado = 'E02';
GO

-- Inventario
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BuscarInventario')
BEGIN
    DROP PROCEDURE BuscarInventario;
END;
GO

CREATE PROCEDURE BuscarInventario (
  @IDInventario NVARCHAR(10)
)
AS
BEGIN
  SELECT *
  FROM Inventario
  WHERE IDInventario = @IDInventario;

  PRINT 'Búsqueda de inventario completada.';
END;
GO

EXEC BuscarInventario @IDInventario = 'IN105';
GO

-- Pedido
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BuscarPedido')
BEGIN
    DROP PROCEDURE BuscarPedido;
END;
GO

CREATE PROCEDURE BuscarPedido (
  @IDPedido NVARCHAR(10)
)
AS
BEGIN
  SELECT *
  FROM Pedido
  WHERE IDPedido = @IDPedido;

  PRINT 'Búsqueda de pedido completada.';
END;
GO

EXEC BuscarPedido @IDPedido = 'DP40';
GO

-- Sucursal
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'BuscarSucursal')
BEGIN
    DROP PROCEDURE BuscarSucursal;
END;
GO

CREATE PROCEDURE BuscarSucursal (
  @IDSucursal NVARCHAR(10)
)
AS
BEGIN
  SELECT *
  FROM Sucursales
  WHERE IDSucursal = @IDSucursal;

  PRINT 'Búsqueda de sucursal completada.';
END;
GO

EXEC BuscarSucursal @IDSucursal = 'S03';
GO


--procedimientos almacenados para seleccionar todos los registros de cada tabla
-- Cliente
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SeleccionarTodosClientes')
BEGIN
    DROP PROCEDURE SeleccionarTodosClientes;
END;
GO

CREATE PROCEDURE SeleccionarTodosClientes
AS
BEGIN
  SELECT * FROM Cliente;
  PRINT 'Selección de todos los clientes completada.';
END;
GO

EXEC SeleccionarTodosClientes;
GO

-- Producto
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SeleccionarTodosProductos')
BEGIN
    DROP PROCEDURE SeleccionarTodosProductos;
END;
GO

CREATE PROCEDURE SeleccionarTodosProductos
AS
BEGIN
  SELECT * FROM Producto;
  PRINT 'Selección de todos los productos completada.';
END;
GO

EXEC SeleccionarTodosProductos;
GO

-- Proveedor
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SeleccionarTodosProveedores')
BEGIN
    DROP PROCEDURE SeleccionarTodosProveedores;
END;
GO

CREATE PROCEDURE SeleccionarTodosProveedores
AS
BEGIN
  SELECT * FROM Proveedor;
  PRINT 'Selección de todos los proveedores completada.';
END;
GO

EXEC SeleccionarTodosProveedores;
GO

-- Departamento
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SeleccionarTodosDepartamentos')
BEGIN
    DROP PROCEDURE SeleccionarTodosDepartamentos;
END;
GO

CREATE PROCEDURE SeleccionarTodosDepartamentos
AS
BEGIN
  SELECT * FROM Departamento;
  PRINT 'Selección de todos los departamentos completada.';
END;
GO

EXEC SeleccionarTodosDepartamentos;
GO

-- Empleado
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SeleccionarTodosEmpleados')
BEGIN
    DROP PROCEDURE SeleccionarTodosEmpleados;
END;
GO

CREATE PROCEDURE SeleccionarTodosEmpleados
AS
BEGIN
  SELECT * FROM Empleado;
  PRINT 'Selección de todos los empleados completada.';
END;
GO

EXEC SeleccionarTodosEmpleados;
GO

-- Inventario
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SeleccionarTodosInventarios')
BEGIN
    DROP PROCEDURE SeleccionarTodosInventarios;
END;
GO

CREATE PROCEDURE SeleccionarTodosInventarios
AS
BEGIN
  SELECT * FROM Inventario;
  PRINT 'Selección de todos los inventarios completada.';
END;
GO

EXEC SeleccionarTodosInventarios;
GO

-- Pedido
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SeleccionarTodosPedidos')
BEGIN
    DROP PROCEDURE SeleccionarTodosPedidos;
END;
GO

CREATE PROCEDURE SeleccionarTodosPedidos
AS
BEGIN
  SELECT * FROM Pedido;
  PRINT 'Selección de todos los pedidos completada.';
END;
GO

EXEC SeleccionarTodosPedidos;
GO

-- Sucursal
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SeleccionarTodasSucursales')
BEGIN
    DROP PROCEDURE SeleccionarTodasSucursales;
END;
GO

CREATE PROCEDURE SeleccionarTodasSucursales
AS
BEGIN
  SELECT * FROM Sucursales;
  PRINT 'Selección de todas las sucursales completada.';
END;
GO

EXEC SeleccionarTodasSucursales;
GO
