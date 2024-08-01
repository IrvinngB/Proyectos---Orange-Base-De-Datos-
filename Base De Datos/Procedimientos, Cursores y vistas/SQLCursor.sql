USE Orange
GO

-- Crear el procedimiento almacenado
CREATE PROCEDURE SP_RespaldoEmpleado
AS
BEGIN
    -- Declarar variables
    DECLARE @IDEmpleado VARCHAR(10);
    DECLARE @NombreEmp VARCHAR(100);
    DECLARE @ApellidoEmp VARCHAR(100);
    DECLARE @DepartamentoID VARCHAR(10);
    DECLARE @Cargo VARCHAR(100);
    DECLARE @SucursalID VARCHAR(10);
    DECLARE @FechaContratacion DATE;
    DECLARE @Salario FLOAT;
    DECLARE @Email VARCHAR(100);
    DECLARE @Telefono VARCHAR(20);
    DECLARE @FechaHoraInsercion DATETIME;
    
    -- Crear la tabla de respaldo si no existe
    IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Empleado_RESPALDO' AND xtype='U')
    BEGIN
        CREATE TABLE Empleado_RESPALDO (
            IDEmpleado VARCHAR(10),
            NombreEmp VARCHAR(100),
            ApellidoEmp VARCHAR(100),
            DepartamentoID VARCHAR(10),
            Cargo VARCHAR(100),
            SucursalID VARCHAR(10),
            FechaContratacion DATE,
            Salario FLOAT,
            Email VARCHAR(100),
            Telefono VARCHAR(20),
            FechaHoraInsercion DATETIME
        );
    END

    -- Abrir el cursor para seleccionar todos los registros de la tabla Empleado
    DECLARE EmpleadoCursor CURSOR FOR
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

    -- Abrir el cursor
    OPEN EmpleadoCursor;

    -- Obtener el primer registro
    FETCH NEXT FROM EmpleadoCursor INTO 
        @IDEmpleado, 
        @NombreEmp, 
        @ApellidoEmp, 
        @DepartamentoID, 
        @Cargo, 
        @SucursalID, 
        @FechaContratacion, 
        @Salario, 
        @Email, 
        @Telefono;

    -- Mientras haya registros por procesar
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Asignar la fecha y hora actual
        SET @FechaHoraInsercion = GETDATE();

        -- Insertar el registro en la tabla de respaldo si no existe en ella
        IF NOT EXISTS (SELECT * FROM Empleado_RESPALDO WHERE IDEmpleado = @IDEmpleado)
        BEGIN
            INSERT INTO Empleado_RESPALDO (
                IDEmpleado, 
                NombreEmp, 
                ApellidoEmp, 
                DepartamentoID, 
                Cargo, 
                SucursalID, 
                FechaContratacion, 
                Salario, 
                Email, 
                Telefono, 
                FechaHoraInsercion
            ) 
            VALUES (
                @IDEmpleado, 
                @NombreEmp, 
                @ApellidoEmp, 
                @DepartamentoID, 
                @Cargo, 
                @SucursalID, 
                @FechaContratacion, 
                @Salario, 
                @Email, 
                @Telefono, 
                @FechaHoraInsercion
            );
        END

        -- Obtener el siguiente registro
        FETCH NEXT FROM EmpleadoCursor INTO 
            @IDEmpleado, 
            @NombreEmp, 
            @ApellidoEmp, 
            @DepartamentoID, 
            @Cargo, 
            @SucursalID, 
            @FechaContratacion, 
            @Salario, 
            @Email, 
            @Telefono;
    END

    -- Cerrar y eliminar el cursor
    CLOSE EmpleadoCursor;
    DEALLOCATE EmpleadoCursor;
END;
GO
--Ejecucion del Procedimiento Almacenado
EXEC SP_RespaldoEmpleado;
GO

--Consulta de los registros
select * from Empleado
select * from Empleado_RESPALDO

--Insercion de nuevo registro para prueba (insertar el registro, volver a ejecutar el procedimiento, y luego consultar los registros de nuevo)
INSERT INTO Empleado (IDEmpleado, NombreEmp, ApellidoEmp, DepartamentoID, Cargo, SucursalID, FechaContratacion, Salario, Email, Telefono) VALUES
('E51', 'Rodrigo', 'Mendoza', 'DPT08', 'Gerente de Tienda', 'S01', '2016-04-25', 2400, 'Mendoza.Rodrigo@orange.com', '65434502')