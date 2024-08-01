USE Orange;
GO

-- 1. Obtener clientes por ciudad
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ObtenCliPorCiudad')
BEGIN
    DROP PROCEDURE ObtenCliPorCiudad;
END;
GO

CREATE PROCEDURE ObtenCliPorCiudad
  @Ciudad VARCHAR(100)
AS
BEGIN
  SELECT * FROM Cliente
  WHERE Ciudad = @Ciudad;
  PRINT 'Clientes en la ciudad seleccionada obtenidos exitosamente.';
END;
GO

EXEC ObtenCliPorCiudad @Ciudad = 'Panamá';
GO

-- 2. Obtener clientes con edad mayor a un valor especificado
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ObtenCliPorEdadMayor')
BEGIN
    DROP PROCEDURE ObtenCliPorEdadMayor;
END;
GO

CREATE PROCEDURE ObtenCliPorEdadMayor
  @Edad INT
AS
BEGIN
  SELECT * FROM Cliente
  WHERE Edad > @Edad;
  PRINT 'Clientes con edad mayor a la especificada obtenidos exitosamente.';
END;
GO

EXEC ObtenCliPorEdadMayor @Edad = 30;
GO

-- 3. Obtener productos por categoría
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ObtenProdPorCat')
BEGIN
    DROP PROCEDURE ObtenProdPorCat;
END;
GO

CREATE PROCEDURE ObtenProdPorCat
  @Categoria VARCHAR(50)
AS
BEGIN
  SELECT * FROM Producto
  WHERE Categoria = @Categoria;
  PRINT 'Productos en la categoría seleccionada obtenidos exitosamente.';
END;
GO

EXEC ObtenProdPorCat @Categoria = 'CPU';
GO

-- 4. Obtener productos por rango de precios
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ObtenProdPorPrecio')
BEGIN
    DROP PROCEDURE ObtenProdPorPrecio;
END;
GO

CREATE PROCEDURE ObtenProdPorPrecio
  @PrecioMin DECIMAL(10, 2),
  @PrecioMax DECIMAL(10, 2)
AS
BEGIN
  SELECT * FROM Producto
  WHERE Precio BETWEEN @PrecioMin AND @PrecioMax;
  PRINT 'Productos en el rango de precios especificado obtenidos exitosamente.';
END;
GO

EXEC ObtenProdPorPrecio @PrecioMin = 100.00, @PrecioMax = 500.00;
GO

-- 5. Obtener proveedores por país
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ObtenProvPorPais')
BEGIN
    DROP PROCEDURE ObtenProvPorPais;
END;
GO

CREATE PROCEDURE ObtenProvPorPais
  @Pais VARCHAR(50)
AS
BEGIN
  SELECT * FROM Proveedor
  WHERE Pais = @Pais;
  PRINT 'Proveedores en el país seleccionado obtenidos exitosamente.';
END;
GO

EXEC ObtenProvPorPais @Pais = 'España';
GO

-- 6. Obtener proveedores por ciudad
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ObtenProvPorCiudad')
BEGIN
    DROP PROCEDURE ObtenProvPorCiudad;
END;
GO

CREATE PROCEDURE ObtenProvPorCiudad
  @Ciudad VARCHAR(100)
AS
BEGIN
  SELECT * FROM Proveedor
  WHERE Ciudad = @Ciudad;
  PRINT 'Proveedores en la ciudad seleccionada obtenidos exitosamente.';
END;
GO

EXEC ObtenProvPorCiudad @Ciudad = 'Madrid';
GO

-- 7. Obtener departamentos por nombre
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ObtenDeptPorNombre')
BEGIN
    DROP PROCEDURE ObtenDeptPorNombre;
END;
GO

CREATE PROCEDURE ObtenDeptPorNombre
  @Nombre VARCHAR(100)
AS
BEGIN
  SELECT * FROM Departamento
  WHERE NombreDepartamento = @Nombre;
  PRINT 'Departamentos con el nombre especificado obtenidos exitosamente.';
END;
GO

EXEC ObtenDeptPorNombre @Nombre = 'Ventas';
GO

-- 8. Obtener empleados por departamento
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ObtenEmpPorDepto')
BEGIN
    DROP PROCEDURE ObtenEmpPorDepto;
END;
GO

CREATE PROCEDURE ObtenEmpPorDepto
  @DeptoID VARCHAR(10)
AS
BEGIN
  SELECT * FROM Empleado
  WHERE DepartamentoID = @DeptoID;
  PRINT 'Empleados en el departamento seleccionado obtenidos exitosamente.';
END;
GO

EXEC ObtenEmpPorDepto @DeptoID = 'DPT01';
GO

-- 9. Obtener empleados por salario mayor a un valor especificado
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ObtenEmpPorSalarioMayor')
BEGIN
    DROP PROCEDURE ObtenEmpPorSalarioMayor;
END;
GO

CREATE PROCEDURE ObtenEmpPorSalarioMayor
  @Salario FLOAT
AS
BEGIN
  SELECT * FROM Empleado
  WHERE Salario > @Salario;
  PRINT 'Empleados con salario mayor al especificado obtenidos exitosamente.';
END;
GO

EXEC ObtenEmpPorSalarioMayor @Salario = 2000;
GO

-- 10. Obtener inventarios por producto
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ObtenInvPorProd')
BEGIN
    DROP PROCEDURE ObtenInvPorProd;
END;
GO

CREATE PROCEDURE ObtenInvPorProd
  @ProdID VARCHAR(10)
AS
BEGIN
  SELECT * FROM Inventario
  WHERE ProductoID = @ProdID;
  PRINT 'Inventarios del producto seleccionado obtenidos exitosamente.';
END;
GO

EXEC ObtenInvPorProd @ProdID = 'P001';
GO

-- 11. Obtener inventarios por sucursal
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ObtenInvPorSucursal')
BEGIN
    DROP PROCEDURE ObtenInvPorSucursal;
END;
GO

CREATE PROCEDURE ObtenInvPorSucursal
  @SucursalID VARCHAR(10)
AS
BEGIN
  SELECT * FROM Inventario
  WHERE SucursalID = @SucursalID;
  PRINT 'Inventarios de la sucursal seleccionada obtenidos exitosamente.';
END;
GO

EXEC ObtenInvPorSucursal @SucursalID = 'S001';
GO

-- 12. Obtener pedidos por cliente
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ObtenPedPorCliente')
BEGIN
    DROP PROCEDURE ObtenPedPorCliente;
END;
GO

CREATE PROCEDURE ObtenPedPorCliente
  @ClienteID VARCHAR(10)
AS
BEGIN
  SELECT * FROM Pedido
  WHERE ClienteID = @ClienteID;
  PRINT 'Pedidos del cliente seleccionado obtenidos exitosamente.';
END;
GO

EXEC ObtenPedPorCliente @ClienteID = 'CL01';
GO

-- 13. Obtener pedidos por estado
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ObtenPedPorEstado')
BEGIN
    DROP PROCEDURE ObtenPedPorEstado;
END;
GO

CREATE PROCEDURE ObtenPedPorEstado
  @Estado VARCHAR(50)
AS
BEGIN
  SELECT * FROM Pedido
  WHERE EstadoPedido = @Estado;
  PRINT 'Pedidos con el estado especificado obtenidos exitosamente.';
END;
GO

EXEC ObtenPedPorEstado @Estado = 'En Proceso';
GO

-- 14. Obtener sucursales por provincia
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ObtenSucPorProvincia')
BEGIN
    DROP PROCEDURE ObtenSucPorProvincia;
END;
GO

CREATE PROCEDURE ObtenSucPorProvincia
  @Provincia VARCHAR(100)
AS
BEGIN
  SELECT * FROM Sucursales
  WHERE Provincia = @Provincia;
  PRINT 'Sucursales en la provincia seleccionada obtenidas exitosamente.';
END;
GO

EXEC ObtenSucPorProvincia @Provincia = 'Darien';
GO

-- 15. Obtener sucursales por gerente
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ObtenSucPorGerente')
BEGIN
    DROP PROCEDURE ObtenSucPorGerente;
END;
GO

CREATE PROCEDURE ObtenSucPorGerente
  @GerenteID VARCHAR(10)
AS
BEGIN
  SELECT * FROM Sucursales
  WHERE GerenteID = @GerenteID;
  PRINT 'Sucursales con el gerente especificado obtenidas exitosamente.';
END;
GO

EXEC ObtenSucPorGerente @GerenteID = 'E04';
GO

-- 16. Obtener empleados por sucursal
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ObtenEmpPorSucursal')
BEGIN
    DROP PROCEDURE ObtenEmpPorSucursal;
END;
GO

CREATE PROCEDURE ObtenEmpPorSucursal
  @SucursalID VARCHAR(10)
AS
BEGIN
  SELECT * FROM Empleado
  WHERE SucursalID = @SucursalID;
  PRINT 'Empleados en la sucursal seleccionada obtenidos exitosamente.';
END;
GO

EXEC ObtenEmpPorSucursal @SucursalID = 'S02';
GO
