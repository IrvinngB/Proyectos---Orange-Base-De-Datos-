-- Crear la tabla de auditoría para la tabla Producto
CREATE TABLE Producto_Auditoria (
    AuditoriaID INT IDENTITY(1,1) PRIMARY KEY,
    IDProducto VARCHAR(10),
    NombreProducto VARCHAR(100),
    Precio FLOAT,
    Categoria VARCHAR(50),
    ProveedorID VARCHAR(10),
    Operacion VARCHAR(10), -- 'INSERT', 'UPDATE', 'DELETE'
    FechaHora DATETIME DEFAULT GETDATE()
);
GO
select *from Producto_Auditoria
CREATE TRIGGER trg_Producto_Insert
ON Producto
AFTER INSERT
AS
BEGIN
    INSERT INTO Producto_Auditoria (IDProducto, NombreProducto, Precio, Categoria, ProveedorID, Operacion, FechaHora)
    SELECT IDProducto, NombreProducto, Precio, Categoria, ProveedorID, 'INSERT', GETDATE()
    FROM inserted;

    -- Mensaje indicando la inserción
    PRINT 'La inserción se ha realizado correctamente en Producto y se ha registrado en Producto_Auditoria.';
END;
GO
CREATE TRIGGER trg_Producto_Update
ON Producto
AFTER UPDATE
AS
BEGIN
    INSERT INTO Producto_Auditoria (IDProducto, NombreProducto, Precio, Categoria, ProveedorID, Operacion, FechaHora)
    SELECT IDProducto, NombreProducto, Precio, Categoria, ProveedorID, 'UPDATE', GETDATE()
    FROM inserted;

    -- Mensaje indicando la actualización
    PRINT 'La actualización se ha realizado correctamente en Producto y se ha registrado en Producto_Auditoria.';
END;
GO
CREATE TRIGGER trg_Producto_Delete
ON Producto
AFTER DELETE
AS
BEGIN
    INSERT INTO Producto_Auditoria (IDProducto, NombreProducto, Precio, Categoria, ProveedorID, Operacion, FechaHora)
    SELECT IDProducto, NombreProducto, Precio, Categoria, ProveedorID, 'DELETE', GETDATE()
    FROM deleted;

    -- Mensaje indicando la eliminación
    PRINT 'La eliminación se ha realizado correctamente en Producto y se ha registrado en Producto_Auditoria.';
END;
GO

--trigger mas recmendados
-- Trigger para actualizar el stock después de un nuevo pedido
CREATE TRIGGER trg_Pedido_Insert
ON Pedido
AFTER INSERT
AS
BEGIN
    UPDATE Inventario
    SET Stock = Stock - p.Cantidad
    FROM Inventario i
    JOIN inserted p ON i.ProductoID = p.ProductoID AND i.SucursalID = p.SucursalID;
    
    PRINT 'El stock ha sido actualizado después de insertar un nuevo pedido.';
END;
GO
-- Trigger para validar que el stock nunca sea negativo
CREATE TRIGGER trg_Inventario_Update
ON Inventario
AFTER UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM Inventario WHERE Stock < 0)
    BEGIN
        RAISERROR ('El stock no puede ser negativo.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        PRINT 'La actualización de inventario es válida.';
    END
END;
GO
-- Trigger para registrar en una tabla de log cada vez que se hace una actualización en la tabla de empleados
CREATE TRIGGER trg_Empleado_Update
ON Empleado
AFTER UPDATE
AS
BEGIN
    INSERT INTO Empleado_Log (IDEmpleado, Operacion, FechaHora)
    SELECT i.IDEmpleado, 'UPDATE', GETDATE()
    FROM inserted i;
    
    PRINT 'Se ha registrado una actualización en la tabla de empleados.';
END;
GO
-- Trigger para cambiar el estado del pedido a 'Enviado' cuando la fecha de envío se actualiza
CREATE TRIGGER trg_Pedido_Update
ON Pedido
AFTER UPDATE
AS
BEGIN
    UPDATE Pedido
    SET EstadoPedido = 'Enviado'
    WHERE FechaPedido IS NOT NULL AND EstadoPedido = 'En Proceso'
    AND IDPedido IN (SELECT IDPedido FROM inserted);
    
    PRINT 'El estado del pedido se ha actualizado a "Enviado".';
END;
GO
