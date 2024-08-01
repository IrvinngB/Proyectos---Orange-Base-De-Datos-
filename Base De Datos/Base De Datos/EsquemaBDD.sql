-- Crear la base de datos
CREATE DATABASE Orange;
GO
USE Orange;
GO

-- Tabla Proveedor
CREATE TABLE Proveedor (
    IDProveedor VARCHAR(10),
    NombreProv VARCHAR(100) NOT NULL,
    ContactoNombre VARCHAR(50) NOT NULL,
    ContactoApellido VARCHAR(50) NOT NULL,
    ContactoEmail VARCHAR(100) NOT NULL,
    Telefono VARCHAR(25) NOT NULL,
    Ciudad VARCHAR(255) NOT NULL,
    Pais VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Proveedor PRIMARY KEY (IDProveedor),
    CONSTRAINT UQ_ContactoEmail UNIQUE (ContactoEmail), --1 Unique 
    CONSTRAINT UQ_Telefono UNIQUE (Telefono) --2 unique 
);
GO

-- Tabla Departamento
CREATE TABLE Departamento (
    IDDepartamento VARCHAR(10),
    NombreDepartamento VARCHAR(100) NOT NULL,
    CONSTRAINT CK_NombreDepartamento CHECK (NombreDepartamento IN ('Ventas', 'Recursos Humanos', 'Finanzas', 'Marketing', 'Logistica', 'Tecnologia', 'Operaciones', 'Gerencia')), --1 Ck
    CONSTRAINT PK_IDDepartamento PRIMARY KEY (IDDepartamento)
);
GO

-- Tabla Empleado
CREATE TABLE Empleado (
    IDEmpleado VARCHAR(10),
    NombreEmp VARCHAR(100) NOT NULL,
	Nombre2Emp VARCHAR(100),
    ApellidoEmp VARCHAR(100) NOT NULL,
	Apellido2Emp VARCHAR(100),
    DepartamentoID VARCHAR(10) NOT NULL,
    Cargo VARCHAR(100) NOT NULL,  
    SucursalID VARCHAR(10) NOT NULL,
    FechaContratacion DATE DEFAULT GETDATE(), --1 default 
    Salario FLOAT,
    Email VARCHAR(100),
    Telefono VARCHAR(20),
    CONSTRAINT PK_IDEmpleado PRIMARY KEY (IDEmpleado),
    CONSTRAINT FK_DepartamentoID FOREIGN KEY (DepartamentoID) REFERENCES Departamento(IDDepartamento),
    CONSTRAINT UQ_EmailE UNIQUE (Email), --3 Unique 
    CONSTRAINT UQ_TelefonoE UNIQUE (Telefono) --4 Unique 
);
GO

-- Tabla Cliente
CREATE TABLE Cliente (
    IDCliente VARCHAR(10),
    NombreCli VARCHAR(100) NOT NULL,
    ApellidoCli VARCHAR(100) NOT NULL,
    Ciudad VARCHAR(100),
    FechaNacimiento DATE,
    Edad INT NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Telefono VARCHAR(20) NOT NULL,
    CONSTRAINT PK_IDCliente PRIMARY KEY (IDCliente),
    CONSTRAINT UQ_EmailC UNIQUE (Email), --5 Unique 
    CONSTRAINT UQ_TelefonoC UNIQUE (Telefono), --6 unique 
    CONSTRAINT CK_EdadC CHECK (Edad >= 16) --2 Check 
);
GO

SELECT * FROM Cliente

-- Tabla Sucursales
CREATE TABLE Sucursales (
    IDSucursal VARCHAR(10),
    NombreSucursal VARCHAR(100) NOT NULL,
    Provincia VARCHAR(100) NOT NULL,
    Direccion VARCHAR(255) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    GerenteID VARCHAR(10),
    FechaApertura DATE DEFAULT GETDATE(),--2 Default 
    CONSTRAINT PK_IDSucursal PRIMARY KEY (IDSucursal),
    CONSTRAINT UQ_TelefonoS UNIQUE (Telefono),
    CONSTRAINT FK_GerenteID FOREIGN KEY (GerenteID) REFERENCES Empleado(IDEmpleado)
);
GO

-- Tabla Producto
CREATE TABLE Producto (
    IDProducto VARCHAR(10),
    NombreProducto VARCHAR(100) NOT NULL,
    Precio FLOAT NOT NULL,
    Categoria VARCHAR(50) NOT NULL,
    ProveedorID VARCHAR(10) NOT NULL,
    CONSTRAINT PK_IDProducto PRIMARY KEY (IDProducto),
    CONSTRAINT FK_ProveedorID FOREIGN KEY (ProveedorID) REFERENCES Proveedor(IDProveedor)
);
GO

-- Tabla Pedido
CREATE TABLE Pedido (
    IDPedido VARCHAR(10),
    ClienteID VARCHAR(10) NOT NULL,
    ProductoID VARCHAR(10) NOT NULL,
    Cantidad INT NOT NULL,
    FechaPedido DATE DEFAULT GETDATE(), --4 default 
    EstadoPedido VARCHAR(50) NOT NULL DEFAULT 'En Proceso', --3 default 
    SucursalID VARCHAR(10) NOT NULL,
    PrecioTotal FLOAT,
    CONSTRAINT PK_IDPedido PRIMARY KEY (IDPedido),
    CONSTRAINT FK_ClienteID FOREIGN KEY (ClienteID) REFERENCES Cliente(IDCliente),
    CONSTRAINT FK_ProductoID FOREIGN KEY (ProductoID) REFERENCES Producto(IDProducto),
    CONSTRAINT FK_SucursalID FOREIGN KEY (SucursalID) REFERENCES Sucursales(IDSucursal),
    CONSTRAINT CK_EstadoPedido CHECK (EstadoPedido IN ('En Proceso', 'Enviado', 'Entregado', 'Cancelado')), --3 Check  
    CONSTRAINT CK_Cantidad CHECK (Cantidad > 0) --5 Check 
);
GO

-- Tabla Inventario con llave primaria compuesta
CREATE TABLE Inventario (
    IDInventario  VARCHAR(10),
    ProductoID VARCHAR(10) NOT NULL,
    SucursalID VARCHAR(10) NOT NULL,
    Stock INT CHECK (Stock >= 0), --4 check 
    FechaLlegada DATE DEFAULT GETDATE(),
    CONSTRAINT PK_Inventario PRIMARY KEY (IDInventario, ProductoID, SucursalID), --llave primaria compuesta
    CONSTRAINT FK_ProductoIDI FOREIGN KEY (ProductoID) REFERENCES Producto(IDProducto),
    CONSTRAINT FK_SucursalIDI FOREIGN KEY (SucursalID) REFERENCES Sucursales(IDSucursal)
);
GO

-- Crear la tabla de auditoría para la tabla Producto
CREATE TABLE Producto_Auditoria (
    AuditoriaID INT IDENTITY(1,1) PRIMARY KEY,
    IDProducto VARCHAR(10),
    NombreProducto VARCHAR(100),
    Precio FLOAT,
    Categoria VARCHAR(50),
    ProveedorID VARCHAR(10),
    Operacion VARCHAR(10), -- 'INSERT', 'UPDATE', 'DELETE'
    FechaHora DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Producto_Auditoria_Producto FOREIGN KEY (IDProducto) REFERENCES Producto(IDProducto)
);
GO

-- Crear la tabla de auditoría para la tabla Empleado
CREATE TABLE Empleado_Log (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    IDEmpleado VARCHAR(10),
    Operacion VARCHAR(10), -- 'INSERT', 'UPDATE', 'DELETE'
    FechaHora DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Empleado_Log_Empleado FOREIGN KEY (IDEmpleado) REFERENCES Empleado(IDEmpleado)
);
GO