-- Consultas 
USE Orange;
GO

-- 1. Eliminar la columna Edad de la tabla Cliente
ALTER TABLE Cliente
DROP COLUMN Edad;
GO


-- 2. Cambiar nombre de tabla Ciudad a provincia 
EXEC sp_rename 'Cliente.Ciudad', 'Provincia', 'COLUMN';
GO

--Lo vuelvo a cambiar 
EXEC sp_rename 'Cliente.Provincia', 'Ciudad', 'COLUMN';
GO

SELECT * FROM Cliente

-- 3. Cambiar ciudad de cliiente CL01
UPDATE Cliente
SET Ciudad = 'Tocumen'
WHERE IDCliente = 'CL01';
GO

-- 4. Usar join para ver productos que vengan de España
SELECT P.*
FROM Producto P
JOIN Proveedor Pr ON P.ProveedorID = Pr.IDProveedor
WHERE Pr.Pais = 'España';
GO

-- 5. Productos mayores a 1500
SELECT *
FROM Producto
WHERE Precio >= 500.00;
GO

-- 6. Nombre y apellido de empleados con apellido empezado en R
SELECT NombreEmp, ApellidoEmp
FROM Empleado
WHERE ApellidoEmp LIKE 'R%';
GO

-- 7. Muestra los clientes de chorrera y Panama 
SELECT NombreCli, ApellidoCli, Ciudad
FROM Cliente
WHERE Ciudad = 'Panamá'
UNION
SELECT NombreCli, ApellidoCli, Ciudad
FROM Cliente
WHERE Ciudad = 'Chorrera';
GO

-- 8. Muestra de empleados del departamento de ventas y recursos humanos
SELECT NombreEmp, ApellidoEmp, DepartamentoID
FROM Empleado
WHERE DepartamentoID = 'DPT01'
UNION
SELECT NombreEmp, ApellidoEmp, DepartamentoID
FROM Empleado
WHERE DepartamentoID = 'DPT06';
GO

-- 9. Eliminar el pedido con ID 'DP01'
DELETE FROM Pedido WHERE IDPedido = 'DP001';
GO

-- 10. Seleccionar empleados que ganan 1500 o menos
SELECT IDempleado, NombreEmp, ApellidoEmp, Salario,
       -- Calcular el bono del 10%
       Salario * 0.10 AS Bonus
FROM Empleado
WHERE Salario <= 2000;
GO

-- 11. Salario promedio por departamento 
SELECT DepartamentoID, AVG(Salario) AS SalarioPromedio
FROM Empleado
GROUP BY DepartamentoID;
GO

-- 12. Numero de pedidos por cliente 
SELECT ClienteID, COUNT(*) AS NumeroPedidos
FROM Pedido
GROUP BY ClienteID;
GO

-- 13. Edad promedio de clientes
SELECT AVG(DATEDIFF(YEAR, FechaNacimiento, GETDATE())) AS EdadPromedio
FROM Cliente;
GO

-- 14. Ingresos totales por año 
SELECT YEAR(FechaPedido) AS Anio, SUM(PrecioTotal) AS IngresosTotales
FROM Pedido
GROUP BY YEAR(FechaPedido)
ORDER BY Anio;
GO

-- 15. Productos con bajo inventario 
SELECT ProductoID, Stock
FROM Inventario
WHERE Stock < 10;
GO

-- 16. Ciudad donde hay más clientes 
SELECT Ciudad, COUNT(*) AS NumeroClientes
FROM Cliente
GROUP BY Ciudad
ORDER BY NumeroClientes DESC;
GO

-- 17. Contar pedidos en proceso 
SELECT COUNT(*) AS PedidosEnProceso
FROM Pedido
WHERE EstadoPedido = 'En Proceso';
GO

-- 18. Productos en un rango de precio 
SELECT *
FROM Producto
WHERE Precio BETWEEN 100.00 AND 500.00;
GO

-- 19. Productos más vendidos 
SELECT TOP 5
    P.IDProducto,
    P.NombreProducto,
    SUM(Ped.Cantidad) AS TotalVendido
FROM
    Producto P
JOIN
    Pedido Ped ON P.IDProducto = Ped.ProductoID
GROUP BY
    P.IDProducto, P.NombreProducto
ORDER BY
    TotalVendido DESC;
GO

-- 20. Promedio de precios por categoría
SELECT 
    Categoria,
    AVG(Precio) AS PrecioPromedio
FROM 
    Producto
GROUP BY 
    Categoria;
GO

-- 21. Clientes que han realizado más de 2 pedidos
SELECT ClienteID, COUNT(*) AS NumeroPedidos
FROM Pedido
GROUP BY ClienteID
HAVING COUNT(*) > 2;
GO

-- 22. Ingresos totales por sucursal y año
SELECT SucursalID, YEAR(FechaPedido) AS Anio, SUM(PrecioTotal) AS IngresosTotales
FROM Pedido
GROUP BY SucursalID, YEAR(FechaPedido)
ORDER BY SucursalID, Anio;
GO

-- 23. Proveedores que han suministrado más de 3 productos distintos
SELECT ProveedorID, COUNT(DISTINCT IDProducto) AS ProductosDistintos
FROM Producto
GROUP BY ProveedorID
HAVING COUNT(DISTINCT IDProducto) > 3;
GO

-- 24. Promedio de salario por departamento, mostrando solo los departamentos con un promedio mayor a 3000
SELECT DepartamentoID, AVG(Salario) AS SalarioPromedio
FROM Empleado
GROUP BY DepartamentoID
HAVING AVG(Salario) > 3000;
GO

-- 25. Clientes que han realizado pedidos en más de una sucursal
SELECT ClienteID, COUNT(DISTINCT SucursalID) AS SucursalesDistintas
FROM Pedido
GROUP BY ClienteID
HAVING COUNT(DISTINCT SucursalID) > 1;
GO

-- 26. Productos con stock bajo (menos de 10) en más de una sucursal
SELECT ProductoID, COUNT(*) AS SucursalesConBajoStock
FROM Inventario
WHERE Stock < 10
GROUP BY ProductoID
HAVING COUNT(*) > 1;
GO

-- 27. Empleados con salarios más altos por departamento, solo aquellos con salarios mayores a 3000
SELECT DepartamentoID, MAX(Salario) AS SalarioMaximo
FROM Empleado
GROUP BY DepartamentoID
HAVING MAX(Salario) > 3000;
GO

-- 28. Promedio de edad de los clientes por ciudad, solo aquellas ciudades con más de 5 clientes
SELECT Ciudad, AVG(DATEDIFF(YEAR, FechaNacimiento, GETDATE())) AS EdadPromedio
FROM Cliente
GROUP BY Ciudad
HAVING COUNT(*) > 5;
GO

-- 29. Sucursales con más de 2 empleados ganando más de 3000
SELECT SucursalID, COUNT(*) AS EmpleadosConAltoSalario
FROM Empleado
WHERE Salario > 3000
GROUP BY SucursalID
HAVING COUNT(*) > 2;
GO

-- 30. Productos con ventas totales superiores a 3000 en cualquier sucursal
SELECT ProductoID, SucursalID, SUM(PrecioTotal) AS VentasTotales
FROM Pedido
GROUP BY ProductoID, SucursalID
HAVING SUM(PrecioTotal) > 3000;
GO


-- 31. Insertar un nuevo cliente en una transacción
BEGIN TRANSACTION;
BEGIN TRY
    INSERT INTO Cliente (IDCliente, NombreCli, ApellidoCli, Ciudad, FechaNacimiento, Edad, Email, Telefono)
    VALUES ('CL60', 'John', 'Doe', 'Panamá', '1980-01-01', 43, 'john.doe@example.com', '66253947');
    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error en la inserción del cliente.';
END CATCH;
GO

-- 32. Actualizar el stock de un producto en una transacción
BEGIN TRANSACTION;
BEGIN TRY
    UPDATE Inventario
    SET Stock = Stock + 50
    WHERE ProductoID = 'ST01' AND SucursalID = 'S01';
    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error en la actualización del stock.';
END CATCH;
GO

-- 33. Eliminar un proveedor y todos sus productos en una transacción
BEGIN TRANSACTION;
BEGIN TRY
    DELETE FROM Producto WHERE ProveedorID = 'PR01';
    DELETE FROM Proveedor WHERE IDProveedor = 'PR01';
    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error en la eliminación del proveedor y sus productos.';
END CATCH;
GO

-- 34. Agregar una columna 'Estado' a la tabla 'Empleado'
BEGIN TRANSACTION;
BEGIN TRY
    ALTER TABLE Empleado ADD Estado VARCHAR(50) DEFAULT 'Activo';
    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error en la adición de la columna Estado.';
END CATCH;
GO

-- 35. Verificar si un cliente ha realizado pedidos y si no, eliminarlo
BEGIN TRANSACTION;
BEGIN TRY
    IF NOT EXISTS (SELECT * FROM Pedido WHERE ClienteID = 'CL10')
    BEGIN
        DELETE FROM Cliente WHERE IDCliente = 'CL10';
    END
    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error en la verificación y eliminación del cliente.';
END CATCH;
GO

-- 36. Transferir productos de una sucursal a otra en una transacción
BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @StockDisponible INT;
    SELECT @StockDisponible = Stock FROM Inventario WHERE ProductoID = 'P001' AND SucursalID = 'S001';

    IF @StockDisponible >= 20
    BEGIN
        UPDATE Inventario SET Stock = Stock - 20 WHERE ProductoID = 'P001' AND SucursalID = 'S001';
        UPDATE Inventario SET Stock = Stock + 20 WHERE ProductoID = 'P001' AND SucursalID = 'S002';
    END
    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error en la transferencia de productos entre sucursales.';
END CATCH;
GO

-- 37. Agregar un índice a la tabla 'Cliente' para la columna 'Ciudad'
BEGIN TRANSACTION;
BEGIN TRY
    CREATE INDEX IX_Cliente_Ciudad ON Cliente(Ciudad);
    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error en la creación del índice.';
END CATCH;
GO

-- 38. Actualizar el salario de un empleado en una transacción
BEGIN TRANSACTION;
BEGIN TRY
    UPDATE Empleado SET Salario = Salario * 1.10 WHERE IDEmpleado = 'E001';
    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error en la actualización del salario del empleado.';
END CATCH;
GO

-- 39. Eliminar un departamento y reasignar sus empleados a otro departamento en una transacción
BEGIN TRANSACTION;
BEGIN TRY
    UPDATE Empleado SET DepartamentoID = 'DPT02' WHERE DepartamentoID = 'DPT01';
    DELETE FROM Departamento WHERE IDDepartamento = 'DPT01';
    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error en la reasignación de empleados y eliminación del departamento.';
END CATCH;
GO

-- 40. Registrar un nuevo pedido y actualizar el inventario en una transacción
BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @Cantidad INT = 5;
    DECLARE @ProductoID VARCHAR(10) = 'P001';
    DECLARE @SucursalID VARCHAR(10) = 'S001';
    DECLARE @ClienteID VARCHAR(10) = 'CL01';

    INSERT INTO Pedido (IDPedido, ClienteID, ProductoID, Cantidad, SucursalID, PrecioTotal)
    VALUES ('P005', @ClienteID, @ProductoID, @Cantidad, @SucursalID, @Cantidad * (SELECT Precio FROM Producto WHERE IDProducto = @ProductoID));

    UPDATE Inventario
    SET Stock = Stock - @Cantidad
    WHERE ProductoID = @ProductoID AND SucursalID = @SucursalID;

    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error en el registro del pedido y actualización del inventario.';
END CATCH;
GO

--41. Seleccionar todos los clientes con NOLOCK
BEGIN TRANSACTION;
BEGIN TRY
    SELECT * 
    FROM Cliente WITH (NOLOCK);
    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error al seleccionar los clientes.';
END CATCH;
GO


--42. Contar el número de pedidos por cliente con NOLOCK
BEGIN TRANSACTION;
BEGIN TRY
    SELECT ClienteID, COUNT(*) AS NumeroPedidos
    FROM Pedido WITH (NOLOCK)
    GROUP BY ClienteID;
    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error al contar el número de pedidos por cliente.';
END CATCH;
GO
