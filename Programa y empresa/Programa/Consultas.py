import pyodbc
#Antes de compilar instalar Python y Pyodbc 
#pip install pyodbc
#Ejecutar "pip install pyodbc" en la terminal antes de compilar 

class ProgramaConsultas:
    def __init__(self):
        servidor = input("Ingrese el nombre del servidor: ")
        base_datos = input("Ingrese el nombre de la base de datos: ")

        self.conexion = pyodbc.connect(
            f'DRIVER={{SQL Server}};'
            f'SERVER={servidor};'
            f'DATABASE={base_datos};'
            'Trusted_Connection=yes;'
        )
        self.cursor = self.conexion.cursor()

    def mostrar_menu(self):
        print("Menú de Consultas:")
        print("1- Estado de pedidos")
        print("2- Consultar empleados")
        print("3- Consultar clientes")
        print("4- Consultar inventario en sucursal")
        print("5- Insertar datos")
        print("0- Salir")

    def estado_pedidos(self, sucursal_id):
        try:
            # Mostrar los pedidos actuales con su estado, excluyendo los estados "Entregado" o "Cancelado"
            query = """
                SELECT IDPedido, EstadoPedido
                FROM Pedido
                WHERE EstadoPedido NOT IN ('Entregado', 'Cancelado')
                AND SucursalID = ?
            """
            self.cursor.execute(query, (sucursal_id,))
            pedidos = self.cursor.fetchall()

            print("Pedidos Actuales (Excluyendo Entregados y Cancelados):")
            for pedido in pedidos:
                print(f"Pedido ID: {pedido.IDPedido}, Estado: {pedido.EstadoPedido}")

            # Solicitar al usuario el ID del pedido que desea cambiar de estado
            pedido_id = input("Ingrese el ID del pedido que desea actualizar (0 para cancelar accion): ")

            # Solicitar al usuario el nuevo estado
            nuevo_estado = input("Ingrese el nuevo estado del pedido: ")

            # Validar que el nuevo estado sea válido
            estados_validos = ["Pendiente", "Enviado", "Procesado", "Entregado", "Cancelado"]
            if nuevo_estado not in estados_validos:
                print(f"El estado '{nuevo_estado}' no es válido.")
                return

            # Actualizar el estado del pedido en la base de datos
            update_query = "UPDATE Pedido SET EstadoPedido = ? WHERE IDPedido = ?"
            self.cursor.execute(update_query, (nuevo_estado, pedido_id))
            self.conexion.commit()

            print(f"Se ha actualizado el estado del pedido {pedido_id} a {nuevo_estado}.")

        except Exception as e:
            print(f"Error al cambiar el estado del pedido: {e}")

    def ver_estado_pedido_por_id(self):
        try:
            pedido_id = input("Ingrese el ID del pedido: ")
            query = "SELECT IDPedido, EstadoPedido FROM Pedido WHERE IDPedido = ?"
            self.cursor.execute(query, (pedido_id,))
            pedido = self.cursor.fetchone()

            if pedido:
                print(f"Pedido ID: {pedido.IDPedido}, Estado: {pedido.EstadoPedido}")
            else:
                print(f"No se encontró un pedido con el ID {pedido_id}.")

        except Exception as e:
            print(f"Error al consultar estado de pedido por ID: {e}")

    def ver_pedidos_por_sucursal(self, sucursal_id):
        try:
            query = """
                SELECT IDPedido, EstadoPedido
                FROM Pedido
                WHERE EstadoPedido IN ('Pendiente', 'Procesado', 'Enviado')
                AND SucursalID = ?
            """
            self.cursor.execute(query, (sucursal_id,))
            pedidos = self.cursor.fetchall()

            if pedidos:
                print("Pedidos Actuales (Excluyendo Entregados y Cancelados):")
                for pedido in pedidos:
                    print(f"Pedido ID: {pedido.IDPedido}, Estado: {pedido.EstadoPedido}")
            else:
                print("No hay pedidos para la sucursal con ID {sucursal_id}.")

        except Exception as e:
            print(f"Error al consultar pedidos por sucursal: {e}")

    def actualizar_estado_pedido_por_id(self):
        try:
            pedido_id = input("Ingrese el ID del pedido que desea actualizar: ")
            nuevo_estado = input("Ingrese el nuevo estado del pedido: ")

            # Validar que el nuevo estado sea válido
            estados_validos = ["Pendiente", "Enviado", "En Proceso", "Entregado", "Cancelado"]
            if nuevo_estado not in estados_validos:
                print(f"El estado '{nuevo_estado}' no es válido.")
                return

            # Actualizar el estado del pedido en la base de datos
            update_query = "UPDATE Pedido SET EstadoPedido = ? WHERE IDPedido = ?"
            self.cursor.execute(update_query, (nuevo_estado, pedido_id))
            self.conexion.commit()

            print(f"Se ha actualizado el estado del pedido {pedido_id} a {nuevo_estado}.")

        except Exception as e:
            print(f"Error al actualizar el estado del pedido: {e}")

    def consultar_empleados(self):
        try:
            print("Opciones de Consulta de Empleados:")
            print("1- Consultar por sucursal")
            print("2- Consultar por salario en cierto rango")
            print("3- Consultar por nombre")
            print("4- Consultar por departamento")
            print("5- Consultar por cargo")

            opcion = input("Seleccione una opción (1-4): ")

            respuesta = input("¿Desea mostrar el último dato insertado? (S/N): ")
            if respuesta.upper() == 'S':
                self.mostrar_ultimo_dato_insertado(opcion)

            self.conexion.commit()
            print("Datos insertados correctamente.")

        except Exception as e:
            print(f"Error al insertar datos: {e}")

            if opcion == "1":
                sucursal_id = input("Ingrese el ID de la sucursal: ")
                query = "SELECT IDEmpleado, NombreEmp, ApellidoEmp, Email FROM Empleado WHERE SucursalID = ?"
                self.cursor.execute(query, (sucursal_id,))
            elif opcion == "2":
                salario_min = float(input("Ingrese el salario mínimo: "))
                salario_max = float(input("Ingrese el salario máximo: "))
                query = "SELECT IDEmpleado, NombreEmp, ApellidoEmp, Email FROM Empleado WHERE Salario BETWEEN ? AND ?"
                self.cursor.execute(query, (salario_min, salario_max))
            elif opcion == "3":
                nombre = input("Ingrese el nombre (puede ser parcial): ")
                query = "SELECT IDEmpleado, NombreEmp, ApellidoEmp, Email FROM Empleado WHERE NombreEmp LIKE ?"
                self.cursor.execute(query, (f"%{nombre}%",))
            elif opcion == "4":
                departamento = input("Ingrese el nombre del departamento: ")
                query = "SELECT IDEmpleado, NombreEmp, ApellidoEmp, Email FROM Empleado WHERE DepartamentoID IN (SELECT IDDepartamento FROM Departamento WHERE NombreDepartamento = ?)"
                self.cursor.execute(query, (departamento,))
            elif opcion == "5":
                cargo = input("Ingrese el nombre del cargo: ")
                query = "SELECT IDEmpleado, NombreEmp, ApellidoEmp, Email FROM Empleado WHERE Cargo = ?"
                self.cursor.execute(query, (cargo,))
                resultados = self.cursor.fetchall()

                if resultados:
                    print("\nEmpleados con el cargo", cargo, ":\n")
                    for empleado in resultados:
                        print("ID: {}, Nombre: {} {}, Email: {}".format(empleado[0], empleado[1], empleado[2],
                                                                        empleado[3]))
                else:
                    print("\nNo se encontraron empleados con el cargo", cargo)
            else:
                print("Opción no válida.")
                return

            empleados = self.cursor.fetchall()

            if empleados:
                print("Empleados encontrados:")
                for empleado in empleados:
                    print(
                        f"ID: {empleado.IDEmpleado}, Nombre: {empleado.NombreEmp} {empleado.ApellidoEmp}, Email: {empleado.Email}")
            else:
                print("No se encontraron empleados que cumplan con los criterios de búsqueda.")

        except Exception as e:
            print(f"Error al consultar empleados: {e}")

    def consultar_clientes(self):
        try:
            print("Opciones de Consulta de Clientes:")
            print("1- Consultar por apellido y nombre")
            print("2- Consultar pedidos no completados por cliente")
            print("3- Consultar por ciudad")
            print("4- Consultar por ID")
            opcion = input("Seleccione una opción (1-4): ")

            if opcion == "1":
                apellido = input("Ingrese el apellido del cliente: ")
                nombre = input("Ingrese el nombre del cliente: ")
                query = "SELECT * FROM Cliente WHERE ApellidoCli = ? AND NombreCli = ?"
                self.cursor.execute(query, (apellido, nombre))
            elif opcion == "2":
                query = """
                    SELECT DISTINCT C.*
                    FROM Cliente C
                    JOIN Pedido P ON C.IDCliente = P.ClienteID
                    WHERE P.EstadoPedido <> 'Completado'
                """
                self.cursor.execute(query)
            elif opcion == "3":
                ciudad = input("Ingrese la ciudad del cliente: ")
                query = "SELECT * FROM Cliente WHERE Ciudad = ?"
                self.cursor.execute(query, (ciudad,))
            elif opcion == "4":
                cliente_id = input("Ingrese el ID del cliente: ")
                query = "SELECT * FROM Cliente WHERE IDCliente = ?"
                self.cursor.execute(query, (cliente_id,))
            else:
                print("Opción no válida.")
                return

            clientes = self.cursor.fetchall()

            if clientes:
                print("Clientes encontrados:")
                for cliente in clientes:
                    print(
                        f"ID: {cliente.IDCliente}, Nombre: {cliente.NombreCli} {cliente.ApellidoCli}, Ciudad: {cliente.Ciudad}")
            else:
                print("No se encontraron clientes que cumplan con los criterios de búsqueda.")

        except Exception as e:
            print(f"Error al consultar clientes: {e}")

    def consultar_inventario_sucursal(self):
        try:
            print("Opciones de Consulta de Inventario:")
            print("1- Consultar por ID de producto")
            print("2- Consultar por categoría y ID de sucursal")
            opcion = input("Seleccione una opción (1-2): ")

            if opcion == "1":
                producto_id = input("Ingrese el ID del producto: ")
                query = "SELECT P.IDProducto, P.NombreProducto, P.Precio, I.Stock FROM Producto P JOIN Inventario I ON P.IDProducto = I.ProductoID WHERE P.IDProducto = ?"
                self.cursor.execute(query, (producto_id,))
            elif opcion == "2":
                categoria = input("Ingrese la categoría del producto: ")
                sucursal_id = input("Ingrese el ID de la sucursal: ")
                query = """
                    SELECT P.IDProducto, P.NombreProducto, P.Precio, I.Stock
                    FROM Producto P
                    JOIN Inventario I ON P.IDProducto = I.ProductoID
                    WHERE P.Categoria = ? AND I.SucursalID = ?;
                """
                self.cursor.execute(query, (categoria, sucursal_id))
            else:
                print("Opción no válida.")
                return

            resultados = self.cursor.fetchall()

            if resultados:
                print("Resultados de Inventario:")
                for resultado in resultados:
                    print(
                        f"ID Producto: {resultado.IDProducto}, Nombre: {resultado.NombreProducto}, Precio: {resultado.Precio}, Stock: {resultado.Stock}")
            else:
                print("No se encontraron resultados que cumplan con los criterios de búsqueda.")

        except Exception as e:
            print(f"Error al consultar el inventario: {e}")

    def verificar_easter_egg(self):
        print("¡Encontraste el easter egg de Gionella Araujo! 🐰🥚")
        print("Que tengas un  buen dia y exito en tus actividades.")

    def insertar_datos(self):
        try:
            print("Opciones de Inserción de Datos:")
            print("1- Insertar datos en la tabla Cliente")
            print("2- Insertar datos en la tabla Empleado")
            print("3- Insertar datos en la tabla Producto")
            print("4- Insertar datos en la tabla Pedido")
            # Agrega más opciones según tus necesidades

            opcion = input("Seleccione una opción (1-4): ")

            if opcion == "1":
                confirmacion = input("¿En realidad desea insertar datos? S/N: ")

                if confirmacion.upper() == 'S':
                    # Obtener los últimos datos insertados
                    query_last_inserted = "SELECT TOP 1 * FROM Cliente ORDER BY IDCliente DESC;"
                    self.cursor.execute(query_last_inserted)
                    last_inserted = self.cursor.fetchone()

                    # Mostrar los últimos datos insertados
                    if last_inserted:
                        print("\nÚltimos datos ingresados:")
                        print("IDCliente:", last_inserted.IDCliente)
                        print("NombreCli:", last_inserted.NombreCli)
                        print("ApellidoCli:", last_inserted.ApellidoCli)
                        print("Ciudad:", last_inserted.Ciudad)
                        print("Fecha de Nacimiento:", last_inserted.FechaNacimiento)
                        print("Email:", last_inserted.Email)
                        print("Teléfono:", last_inserted.Telefono)
                        print("Provincia:", last_inserted.Provincia)
                    else:
                        print("No hay datos previamente insertados.")

                    # Inserción de nuevos datos en la tabla Cliente
                    id_cliente = input("\nIngrese el ID del cliente: ")
                    nombre_cliente = input("Ingrese el nombre del cliente: ")
                    apellido_cliente = input("Ingrese el apellido del cliente: ")
                    ciudad_cliente = input("Ingrese la ciudad del cliente: ")
                    fecha_nacimiento_cliente = input("Ingrese la fecha de nacimiento del cliente (YYYY-MM-DD): ")
                    email_cliente = input("Ingrese el correo electrónico del cliente: ")
                    telefono_cliente = input("Ingrese el número de teléfono del cliente: ")
                    direccion_cliente = input("Ingrese la provincia del cliente: ")

                    # Mostrar los datos ingresados antes de la inserción
                    print("\nDatos ingresados:")
                    print("IDCliente:", id_cliente)
                    print("NombreCli:", nombre_cliente)
                    print("ApellidoCli:", apellido_cliente)
                    print("Ciudad:", ciudad_cliente)
                    print("Fecha de Nacimiento:", fecha_nacimiento_cliente)
                    print("Email:", email_cliente)
                    print("Teléfono:", telefono_cliente)
                    print("Provincia:", direccion_cliente)

                    # Confirmar la inserción
                    confirmacion_insercion = input("\n¿Confirma la inserción de estos datos? S/N: ")

                    if confirmacion_insercion.upper() == 'S':
                        # Realizar la inserción en la base de datos
                        query = "INSERT INTO Cliente (IDCliente, NombreCli, ApellidoCli, Ciudad, FechaNacimiento, Email, Telefono, Provincia) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
                        self.cursor.execute(query, (
                            id_cliente, nombre_cliente, apellido_cliente, ciudad_cliente, fecha_nacimiento_cliente,
                            email_cliente, telefono_cliente, direccion_cliente))

                        print("Datos insertados correctamente.")
                    else:
                        print("Inserción cancelada.")
                else:
                    print("Volviendo al menú principal.")


            elif opcion == "2":
                confirmacion = input("¿En realidad desea insertar datos? S/N: ")

                if confirmacion.upper() == 'S':
                    # Obtener los últimos datos insertados en la tabla Empleado
                    query_last_inserted = "SELECT TOP 1 * FROM Empleado ORDER BY IDEmpleado DESC;"
                    self.cursor.execute(query_last_inserted)
                    last_inserted = self.cursor.fetchone()

                    # Mostrar los últimos datos insertados
                    if last_inserted:
                        print("\nÚltimos datos ingresados en la tabla Empleado:")
                        print("IDEmpleado:", last_inserted.IDEmpleado)
                        print("NombreEmp:", last_inserted.NombreEmp)
                        print("ApellidoEmp:", last_inserted.ApellidoEmp)
                        print("DepartamentoID:", last_inserted.DepartamentoID)
                        print("Cargo:", last_inserted.Cargo)
                        print("SucursalID:", last_inserted.SucursalID)
                        print("FechaContratacion:", last_inserted.FechaContratacion)
                        print("Salario:", last_inserted.Salario)
                        print("Email:", last_inserted.Email)
                        print("Telefono:", last_inserted.Telefono)
                        print("")
                    else:
                        print("No hay datos previamente insertados en la tabla Empleado.")

                    # Inserción de nuevos datos en la tabla Empleado
                    id_empleado = input("Ingrese el ID del empleado: ")
                    nombre_empleado = input("Ingrese el nombre del empleado: ")
                    apellido_empleado = input("Ingrese el apellido del empleado: ")
                    departamento_id = input("Ingrese el ID del departamento al que pertenece el empleado: ")
                    cargo = input("Ingrese el cargo del empleado: ")
                    sucursal_id = input("Ingrese el ID de la sucursal a la que está asignado el empleado: ")
                    fecha_contratacion = input("Ingrese la fecha de contratación del empleado (YYYY-MM-DD): ")
                    salario = float(input("Ingrese el salario del empleado: "))
                    email_empleado = input("Ingrese el correo electrónico del empleado: ")
                    telefono_empleado = input("Ingrese el número de teléfono del empleado: ")

                    # Mostrar los datos ingresados antes de la inserción
                    print("\nDatos ingresados:")
                    print("IDEmpleado:", id_empleado)
                    print("NombreEmp:", nombre_empleado)
                    print("ApellidoEmp:", apellido_empleado)
                    print("DepartamentoID:", departamento_id)
                    print("Cargo:", cargo)
                    print("SucursalID:", sucursal_id)
                    print("FechaContratacion:", fecha_contratacion)
                    print("Salario:", salario)
                    print("Email:", email_empleado)
                    print("Telefono:", telefono_empleado)

                    # Confirmar la inserción
                    confirmacion_insercion = input("\n¿Confirma la inserción de estos datos? S/N: ")

                    if confirmacion_insercion.upper() == 'S':
                        # Realizar la inserción en la base de datos
                        query = "INSERT INTO Empleado (IDEmpleado, NombreEmp, ApellidoEmp, DepartamentoID, Cargo, SucursalID, FechaContratacion, Salario, Email, Telefono) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
                        self.cursor.execute(query, (
                            id_empleado, nombre_empleado, apellido_empleado, departamento_id, cargo, sucursal_id,
                            fecha_contratacion, salario, email_empleado, telefono_empleado))

                        print("Datos insertados correctamente en la tabla Empleado.")
                    else:
                        print("Inserción cancelada.")
                else:
                    print("Volviendo al menú principal.")


            elif opcion == "3":

                confirmacion = input("¿En realidad desea insertar datos? S/N: ")

                if confirmacion.upper() == 'S':

                    # Obtener los últimos datos insertados en la tabla Producto

                    query_last_inserted = "SELECT TOP 1 * FROM Producto ORDER BY IDProducto DESC;"

                    self.cursor.execute(query_last_inserted)

                    last_inserted = self.cursor.fetchone()

                    # Mostrar los últimos datos insertados

                    if last_inserted:

                        print("\nÚltimos datos ingresados en la tabla Producto:")

                        print("IDProducto:", last_inserted.IDProducto)

                        print("NombreProducto:", last_inserted.NombreProducto)

                        print("Precio:", last_inserted.Precio)

                        print("ProveedorID:", last_inserted.ProveedorID)

                        print("Categoria:", last_inserted.Categoria)

                    else:

                        print("No hay datos previamente insertados en la tabla Producto.")

                    # Inserción de nuevos datos en la tabla Producto

                    id_producto = input("Ingrese el ID del producto: ")
                    nombre_producto = input("Ingrese el nombre del producto: ")
                    precio_producto = float(input("Ingrese el precio del producto: "))
                    proveedor_id = input("Ingrese el ID del proveedor: ")
                    categoria_producto = input("Ingrese la categoría del producto: ")

                    # Mostrar los datos ingresados antes de la inserción

                    print("\nDatos ingresados:")

                    print("IDProducto:", id_producto)
                    print("NombreProducto:", nombre_producto)
                    print("Precio:", precio_producto)
                    print("ProveedorID:", proveedor_id)
                    print("Categoria:", categoria_producto)

                    # Confirmar la inserción

                    confirmacion_insercion = input("\n¿Confirma la inserción de estos datos? S/N: ")

                    if confirmacion_insercion.upper() == 'S':

                        # Realizar la inserción en la base de datos

                        query = "INSERT INTO Producto (IDProducto, NombreProducto, Precio, ProveedorID, Categoria) VALUES (?, ?, ?, ?, ?)"
                        self.cursor.execute(query, (
                        id_producto, nombre_producto, precio_producto, proveedor_id, categoria_producto))

                        print("Datos insertados correctamente en la tabla Producto.")

                    else:

                        print("Inserción cancelada.")

                else:

                    print("Volviendo al menú principal.")



            elif opcion == "4":

                confirmacion = input("¿En realidad desea insertar datos? S/N: ")

                if confirmacion.upper() == 'S':

                    # Obtener los últimos datos insertados en la tabla Pedido

                    query_last_inserted = "SELECT TOP 1 * FROM Pedido ORDER BY IDPedido DESC;"

                    self.cursor.execute(query_last_inserted)

                    last_inserted = self.cursor.fetchone()

                    # Mostrar los últimos datos insertados

                    if last_inserted:

                        print("\nÚltimos datos ingresados en la tabla Pedido:")
                        print("IDPedido:", last_inserted.IDPedido)
                        print("ClienteID:", last_inserted.ClienteID)
                        print("ProductoID:", last_inserted.ProductoID)
                        print("Cantidad:", last_inserted.Cantidad)
                        print("FechaPedido:", last_inserted.FechaPedido)
                        print("EstadoPedido:", last_inserted.EstadoPedido)
                        print("SucursalID:", last_inserted.SucursalID)
                        print("PrecioTotal:", last_inserted.PrecioTotal)

                    else:

                        print("No hay datos previamente insertados en la tabla Pedido.")

                    # Inserción de nuevos datos en la tabla Pedido

                    id_pedido = input("Ingrese el ID del pedido: ")
                    cliente_id_pedido = input("Ingrese el ID del cliente: ")
                    producto_id_pedido = input("Ingrese el ID del producto: ")
                    cantidad_pedido = int(input("Ingrese la cantidad del producto: "))
                    fecha_pedido = input("Ingrese la fecha del pedido (YYYY-MM-DD): ")
                    estado_pedido = input("Ingrese el estado del pedido: ")
                    sucursal_id_pedido = input("Ingrese el ID de la sucursal: ")
                    precio_total_pedido = float(input("Ingrese el precio total del pedido: "))

                    # Mostrar los datos ingresados antes de la inserción

                    print("\nDatos ingresados:")

                    print("IDPedido:", id_pedido)

                    print("ClienteID:", cliente_id_pedido)

                    print("ProductoID:", producto_id_pedido)

                    print("Cantidad:", cantidad_pedido)

                    print("FechaPedido:", fecha_pedido)

                    print("EstadoPedido:", estado_pedido)

                    print("SucursalID:", sucursal_id_pedido)

                    print("PrecioTotal:", precio_total_pedido)

                    # Confirmar la inserción

                    confirmacion_insercion = input("\n¿Confirma la inserción de estos datos? S/N: ")

                    if confirmacion_insercion.upper() == 'S':

                        # Realizar la inserción en la base de datos

                        query = "INSERT INTO Pedido (IDPedido, ClienteID, ProductoID, Cantidad, FechaPedido, EstadoPedido, SucursalID, PrecioTotal) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"

                        self.cursor.execute(query, (

                            id_pedido, cliente_id_pedido, producto_id_pedido, cantidad_pedido, fecha_pedido,
                            estado_pedido,

                            sucursal_id_pedido, precio_total_pedido))

                        print("Datos insertados correctamente en la tabla Pedido.")

                    else:

                        print("Inserción cancelada.")

                else:

                    print("Volviendo al menú principal.")

            # Agrega más bloques según tus necesidades para otras tablas

            self.conexion.commit()
            print("Operacion realizada correctamente.")

        except Exception as e:
            print(f"Error al insertar datos: {e}")


    def ejecutar_menu(self):
        while True:
            self.mostrar_menu()
            opcion = input("Seleccione una opción (0-5): ")

            if opcion == "1":
                sucursal_id = input("Ingrese el ID de la sucursal: ")
                self.estado_pedidos(sucursal_id)
            elif opcion == "2":
                self.consultar_empleados()
            elif opcion == "3":
                self.consultar_clientes()
            elif opcion == "4":
                self.consultar_inventario_sucursal()
            elif opcion == "5":
                self.insertar_datos()
            elif opcion == "0":
                print("Saliendo del programa.")
                break
            elif "Gionella Araujo" in opcion:
                self.verificar_easter_egg()
            else:
                print("Opción no válida. Por favor, seleccione una opción válida.")


if __name__ == "__main__":
    programa = ProgramaConsultas()
    programa.ejecutar_menu()

