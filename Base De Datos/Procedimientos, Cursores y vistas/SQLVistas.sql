USE Orange
GO

-- Vista para Proveedor
CREATE VIEW vw_Proveedor AS
SELECT 
    IDProveedor, 
    NombreProv, 
    ContactoNombre, 
    ContactoApellido, 
    ContactoEmail, 
    Telefono, 
    Ciudad, 
    Pais
FROM 
    Proveedor;
GO

-- Vista para Departamento
CREATE VIEW vw_Departamento AS
SELECT 
    IDDepartamento, 
    NombreDepartamento
FROM 
    Departamento;
GO

-- Vista para Empleado
CREATE VIEW vw_Empleado AS
SELECT 
    IDEmpleado, 
    NombreEmp, 
    ApellidoEmp, 
    DepartamentoID, 
    Cargo, 
    SucursalID, 
    FechaContratacion, 
    Salario, 
    Email, 
    Telefono
FROM 
    Empleado;
GO

-- Vista para Cliente
CREATE VIEW vw_Cliente AS
SELECT 
    IDCliente, 
    NombreCli, 
    ApellidoCli, 
    Ciudad, 
    FechaNacimiento, 
    Edad, 
    Email, 
    Telefono, 
    Direccion
FROM 
    Cliente;
GO

-- Vista para Sucursales
CREATE VIEW vw_Sucursales AS
SELECT 
    IDSucursal, 
    NombreSucursal, 
    Provincia, 
    Direccion, 
    Telefono, 
    GerenteID, 
    FechaApertura
FROM 
    Sucursales;
GO

-- Vista para Producto
CREATE VIEW vw_Producto AS
SELECT 
    IDProducto, 
    NombreProducto, 
    Precio, 
    Categoria, 
    ProveedorID
FROM 
    Producto;
GO

-- Vista para Pedido
CREATE VIEW vw_Pedido AS
SELECT 
    IDPedido, 
    ClienteID, 
    ProductoID, 
    Cantidad, 
    FechaPedido, 
    EstadoPedido, 
    SucursalID, 
    PrecioTotal
FROM 
    Pedido;
GO

-- Vista para Inventario
CREATE VIEW vw_Inventario AS
SELECT 
    IDInventario, 
    ProductoID, 
    SucursalID, 
    Stock, 
    Fechallegada
FROM 
    Inventario;
GO

-- Ejecucion de las Vistas
SELECT * FROM vw_Proveedor;

SELECT * FROM vw_Departamento;

SELECT * FROM vw_Empleado;

SELECT * FROM vw_Cliente;

SELECT * FROM vw_Sucursales;

SELECT * FROM vw_Producto;

SELECT * FROM vw_Pedido;

SELECT * FROM vw_Inventario;