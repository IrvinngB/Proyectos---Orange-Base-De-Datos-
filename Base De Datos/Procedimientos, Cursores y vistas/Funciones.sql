-- 1. Funci�n para obtener los productos m�s comprados por un cliente
CREATE FUNCTION dbo.OPMCPorCliente
(
    @IDCliente VARCHAR(10)
)
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 5
        P.NombreProducto,
        COUNT(*) AS CantidadCompras
    FROM
        Pedido PE
    INNER JOIN
        Producto P ON PE.ProductoID = P.IDProducto
    WHERE
        PE.ClienteID = @IDCliente
    GROUP BY
        P.NombreProducto
    ORDER BY
        CantidadCompras DESC
);
-- Ejemplo de uso de la funci�n ObtenerProductosMasCompradosPorCliente
SELECT * FROM dbo.OPMCPorCliente('CL40');

select * from Cliente

-- 2. Funci�n para obtener rangos de edades de clientes frecuentes por categor�a de producto
CREATE FUNCTION dbo.ORECFPorCategoria
(
    @Categoria VARCHAR(50)
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        CASE
            WHEN Edad >= 16 AND Edad <= 25 THEN '16-25'
            WHEN Edad > 25 AND Edad <= 35 THEN '26-35'
            WHEN Edad > 35 AND Edad <= 45 THEN '36-45'
            WHEN Edad > 45 AND Edad <= 55 THEN '46-55'
            ELSE '55+'
        END AS RangoEdad,
        COUNT(*) AS CantidadClientes
    FROM
        Cliente C
    WHERE
        EXISTS (
            SELECT 1
            FROM Pedido PE
            INNER JOIN Producto P ON PE.ProductoID = P.IDProducto
            WHERE PE.ClienteID = C.IDCliente
              AND P.Categoria = @Categoria
        )
    GROUP BY
        CASE
            WHEN Edad >= 16 AND Edad <= 25 THEN '16-25'
            WHEN Edad > 25 AND Edad <= 35 THEN '26-35'
            WHEN Edad > 35 AND Edad <= 45 THEN '36-45'
            WHEN Edad > 45 AND Edad <= 55 THEN '46-55'
            ELSE '55+'
        END
);

-- Ejemplo de uso de la funci�n ObtenerRangosEdadesClientesFrecuentesPorCategoria
SELECT * FROM dbo.ORECFPorCategoria('Procesador');

-- 3. Funci�n para obtener los productos m�s populares por sucursal
CREATE FUNCTION dbo.OPPPorSucursal
(
    @IDSucursal VARCHAR(10)
)
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 5
        P.NombreProducto,
        COUNT(*) AS CantidadPedidos
    FROM
        Pedido PE
    INNER JOIN
        Producto P ON PE.ProductoID = P.IDProducto
    WHERE
        PE.SucursalID = @IDSucursal
    GROUP BY
        P.NombreProducto
    ORDER BY
        CantidadPedidos DESC
);

-- Ejemplo de uso de la funci�n ObtenerProductosPopularesPorSucursal
SELECT * FROM dbo.OPPPorSucursal('S02');

select * from Sucursales


-- 4. Funci�n para obtener la cantidad de productos en stock en una sucursal
CREATE FUNCTION dbo.OSPPorSucursal
(
    @IDProducto VARCHAR(10),
    @IDSucursal VARCHAR(10)
)
RETURNS INT
AS
BEGIN
    DECLARE @Stock INT;

    SELECT @Stock = Stock
    FROM Inventario
    WHERE ProductoID = @IDProducto AND SucursalID = @IDSucursal;

    RETURN ISNULL(@Stock, 0);
END;
GO

-- Prueba de la funci�n ObtenerStockProductoPorSucursal
DECLARE @Stock INT;
EXEC @Stock = dbo.OSPPorSucursal @IDProducto = 'ST03', @IDSucursal = 'S01';
SELECT @Stock AS StockDisponible;

select*from Producto
select*from Sucursales
SELECT*FROM Inventario

-- 5. Funci�n para calcular el total de ventas por categor�a de producto
CREATE FUNCTION dbo.OTVPorCategoria
(
    @Categoria VARCHAR(50)
)
RETURNS FLOAT
AS
BEGIN
    DECLARE @TotalVentas FLOAT;

    SELECT @TotalVentas = SUM(PrecioTotal)
    FROM Pedido PE
    INNER JOIN Producto P ON PE.ProductoID = P.IDProducto
    WHERE P.Categoria = @Categoria;

    RETURN ISNULL(@TotalVentas, 0);
END;
GO

-- Prueba de la funci�n ObtenerTotalVentasPorCategoria
DECLARE @TotalVentas FLOAT;
EXEC @TotalVentas = dbo.OTVPorCategoria @Categoria = 'Monitor';
SELECT @TotalVentas AS TotalVentas;

select*from Producto

-- 6. Funci�n para obtener la cantidad de empleados por departamento
CREATE FUNCTION dbo.OCEPorDepartamento
(
    @IDDepartamento VARCHAR(10)
)
RETURNS INT
AS
BEGIN
    DECLARE @CantidadEmpleados INT;

    SELECT @CantidadEmpleados = COUNT(*)
    FROM Empleado
    WHERE DepartamentoID = @IDDepartamento;

    RETURN ISNULL(@CantidadEmpleados, 0);
END;
GO

-- Prueba de la funci�n ObtenerCantidadEmpleadosPorDepartamento
DECLARE @CantidadEmpleados INT;
EXEC @CantidadEmpleados = dbo.OCEPorDepartamento @IDDepartamento = 'DPT01';
SELECT @CantidadEmpleados AS CantidadEmpleados;

select*From Departamento

-- 7. Funci�n para obtener la cantidad de pedidos en un estado espec�fico por sucursal
CREATE FUNCTION dbo.CEPPEstadoYSucursal
(
    @EstadoPedido VARCHAR(50),
    @IDSucursal VARCHAR(10)
)
RETURNS INT
AS
BEGIN
    DECLARE @CantidadPedidos INT;

    SELECT @CantidadPedidos = COUNT(*)
    FROM Pedido
    WHERE EstadoPedido = @EstadoPedido AND SucursalID = @IDSucursal;

    RETURN ISNULL(@CantidadPedidos, 0);
END;
GO

-- Prueba de la funci�n ObtenerCantidadPedidosPorEstadoYSucursal
DECLARE @CantidadPedidos INT;
EXEC @CantidadPedidos = dbo.CEPPEstadoYSucursal @EstadoPedido = 'En Proceso', @IDSucursal = 'S02';
SELECT @CantidadPedidos AS numero_de_pedidos_segun_su_estado;

SELECT*FROM Pedido
SELECT*FROM Sucursales

-- 8. Funci�n para obtener la cantidad de pedidos por estado y sucursal
-- Crear funci�n para obtener la cantidad de pedidos por estado y sucursal
CREATE FUNCTION dbo.OCPPEstadoYSucursal
(
    @IDSucursal VARCHAR(10)
)
RETURNS @Resultado TABLE
(
    EstadoPedido VARCHAR(50),
    Cantidad INT
)
AS
BEGIN
    INSERT INTO @Resultado (EstadoPedido, Cantidad)
    SELECT 
        EstadoPedido,
        COUNT(*) AS Cantidad
    FROM Pedido
    WHERE SucursalID = @IDSucursal
    GROUP BY EstadoPedido;

    RETURN;
END;
GO

-- Prueba de la nueva funci�n ObtenerCantidadPedidosPorEstadoYSucursal
DECLARE @SucursalID VARCHAR(10) = 'S01';

SELECT *
FROM dbo.OCPPEstadoYSucursal(@SucursalID);
