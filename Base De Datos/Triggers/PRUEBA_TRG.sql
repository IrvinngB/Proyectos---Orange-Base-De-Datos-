-- Insertar un nuevo producto para activar el trigger trg_Producto_Insert
INSERT INTO Producto (IDProducto, NombreProducto, Precio, Categoria, ProveedorID)
VALUES ('ST36', 'Test Product', 50.00, 'Test Category', 'PR01');


-- Actualizar un producto existente para activar el trigger trg_Producto_Update
UPDATE Producto
SET Precio = 55.00
WHERE IDProducto = 'ST36';

-- Eliminar un producto existente para activar el trigger trg_Producto_Delete
DELETE FROM Producto
WHERE IDProducto = 'ST36';

-- Asegurar que haya stock suficiente en inventario antes de insertar un pedido
INSERT INTO Inventario (IDInventario, ProductoID, SucursalID, Stock)
VALUES ('INV101', 'ST01', 'S01', 50);

-- Insertar un pedido que afecte el stock para activar el trigger trg_Pedido_Insert
INSERT INTO Pedido (IDPedido, ClienteID, ProductoID, Cantidad, SucursalID)
VALUES ('PD101', 'CL01', 'ST01', 5, 'S01');

-- Intentar actualizar el stock a un valor negativo para activar el trigger trg_Inventario_Update
UPDATE Inventario
SET Stock = -5
WHERE IDInventario = 'INV101';

-- Crear la tabla de log para registrar actualizaciones en empleados
CREATE TABLE Empleado_Log (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    IDEmpleado VARCHAR(10),
    Operacion VARCHAR(10),
    FechaHora DATETIME DEFAULT GETDATE()
);

-- Actualizar un empleado existente para activar el trigger trg_Empleado_Update
UPDATE Empleado
SET Salario = 2500
WHERE IDEmpleado = 'E01';

-- Actualizar la fecha de pedido para cambiar el estado a 'Enviado' y activar el trigger trg_Pedido_Update
UPDATE Pedido
SET FechaPedido = GETDATE()
WHERE IDPedido = 'DP01';



