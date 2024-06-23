CREATE DATABASE IF NOT EXISTS inventario;
USE inventario;

-- Tabla Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    telefono VARCHAR(50)
);

-- Tabla Productos
CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

-- Tabla Variaciones
CREATE TABLE Variaciones (
    id_variacion INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    talla VARCHAR(50),
    color VARCHAR(50),
    estilo VARCHAR(50),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Tabla Almacenes
CREATE TABLE Almacenes (
    id_almacen INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    ubicacion TEXT
);

-- Tabla Movimientos
CREATE TABLE Movimientos (
    id_movimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    id_almacen INT,
    tipo ENUM('entrada', 'salida'),
    fecha DATE,
    cantidad INT,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    FOREIGN KEY (id_almacen) REFERENCES Almacenes(id_almacen)
);

-- Tabla Proveedores
CREATE TABLE Proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion TEXT,
    telefono VARCHAR(50)
);

-- Tabla Compras
CREATE TABLE Compras (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT,
    fecha DATE,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

-- Tabla DetalleCompras
CREATE TABLE DetalleCompras (
    id_detalle_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_compra INT,
    id_producto INT,
    cantidad INT,
    precio DECIMAL(10, 2),
    FOREIGN KEY (id_compra) REFERENCES Compras(id_compra),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Tabla Ventas
CREATE TABLE Ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha DATE,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Tabla DetalleVentas
CREATE TABLE DetalleVentas (
    id_detalle_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad INT,
    precio DECIMAL(10, 2),
    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Tabla Usuarios
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(255) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    rol VARCHAR(50)
);

-- Tabla Permisos
CREATE TABLE Permisos (
    id_permiso INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255)
);

-- Tabla UsuarioPermiso
CREATE TABLE UsuarioPermiso (
    id_usuario INT,
    id_permiso INT,
    PRIMARY KEY (id_usuario, id_permiso),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_permiso) REFERENCES Permisos(id_permiso)
);

-- Tabla Fidelizacion
CREATE TABLE Fidelizacion (
    id_fidelizacion INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    puntos INT,
    descuentos DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Tabla Facturas
CREATE TABLE Facturas (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha DATE,
    subtotal DECIMAL(10, 2),
    itbis DECIMAL(10, 2),
    descuento DECIMAL(10, 2),
    recargo DECIMAL(10, 2),
    total DECIMAL(10, 2),
    ncf VARCHAR(255),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Tabla DetalleFacturas
CREATE TABLE DetalleFacturas (
    id_detalle_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_factura INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    importe DECIMAL(10, 2),
    FOREIGN KEY (id_factura) REFERENCES Facturas(id_factura),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- add tabla new v1

-- Use the database
USE inventario;

-- Create Categorías de Productos
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Create Subcategorías de Productos
CREATE TABLE subcategorias (
    id_subcategoria INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT,
    nombre VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- Create Marcas
CREATE TABLE marcas (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Create Sucursales
CREATE TABLE sucursales (
    id_sucursal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion TEXT
);

-- Create Empleados
CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    id_sucursal INT,
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);

-- Create Roles de Empleados
CREATE TABLE roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Create Asignación de Roles
CREATE TABLE asignacion_roles (
    id_empleado INT,
    id_rol INT,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
);

-- Create Turnos de Trabajo
CREATE TABLE turnos (
    id_turno INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    hora_inicio TIME,
    hora_fin TIME
);

-- Create Asignación de Turnos
CREATE TABLE asignacion_turnos (
    id_empleado INT,
    id_turno INT,
    fecha DATE,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
    FOREIGN KEY (id_turno) REFERENCES turnos(id_turno)
);

-- Create Pedidos
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Create Detalle de Pedidos
CREATE TABLE detalle_pedidos (
    id_detalle_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_producto INT,
    cantidad INT,
    precio DECIMAL(10,2),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Create Promociones
CREATE TABLE promociones (
    id_promocion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descuento DECIMAL(10,2)
);

-- Create Productos en Promoción
CREATE TABLE productos_promocion (
    id_producto INT,
    id_promocion INT,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_promocion) REFERENCES promociones(id_promocion)
);

-- Create Devoluciones
CREATE TABLE devoluciones (
    id_devolucion INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    fecha DATE,
    motivo TEXT,
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta)
);

-- Create Detalle de Devoluciones
CREATE TABLE detalle_devoluciones (
    id_detalle_devolucion INT AUTO_INCREMENT PRIMARY KEY,
    id_devolucion INT,
    id_producto INT,
    cantidad INT,
    precio DECIMAL(10,2),
    FOREIGN KEY (id_devolucion) REFERENCES devoluciones(id_devolucion),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Create Cajas Registradoras
CREATE TABLE cajas (
    id_caja INT AUTO_INCREMENT PRIMARY KEY,
    id_sucursal INT,
    nombre VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);

-- Create Transacciones en Caja
CREATE TABLE transacciones_caja (
    id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
    id_caja INT,
    id_venta INT,
    fecha DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (id_caja) REFERENCES cajas(id_caja),
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta)
);

-- Create Pagos
CREATE TABLE pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_factura INT,
    fecha DATE,
    monto DECIMAL(10,2),
    metodo VARCHAR(255),
    FOREIGN KEY (id_factura) REFERENCES facturas(id_factura)
);

-- Create Cuentas por Cobrar
CREATE TABLE cuentas_cobrar (
    id_cuenta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    monto DECIMAL(10,2),
    fecha_vencimiento DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Create Cobros
CREATE TABLE cobros (
    id_cobro INT AUTO_INCREMENT PRIMARY KEY,
    id_cuenta INT,
    fecha DATE,
    monto DECIMAL(10,2),
    FOREIGN KEY (id_cuenta) REFERENCES cuentas_cobrar(id_cuenta)
);

-- Create Incidencias de Productos
CREATE TABLE incidencias_productos (
    id_incidencia INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    fecha DATE,
    descripcion TEXT,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Create Reclamaciones
CREATE TABLE reclamaciones (
    id_reclamacion INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha DATE,
    descripcion TEXT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Create Resoluciones de Reclamaciones
CREATE TABLE resoluciones_reclamaciones (
    id_resolucion INT AUTO_INCREMENT PRIMARY KEY,
    id_reclamacion INT,
    fecha DATE,
    descripcion TEXT,
    FOREIGN KEY (id_reclamacion) REFERENCES reclamaciones(id_reclamacion)
);

-- Create Transportistas
CREATE TABLE transportistas (
    id_transportista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    telefono VARCHAR(50)
);

-- Create Envios
CREATE TABLE envios (
    id_envio INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_transportista INT,
    fecha DATE,
    costo DECIMAL(10,2),
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_transportista) REFERENCES transportistas(id_transportista)
);

-- Create Historial de Precios
CREATE TABLE historial_precios (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    fecha DATE,
    precio DECIMAL(10,2),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Create Ofertas Especiales
CREATE TABLE ofertas_especiales (
    id_oferta INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE
);

-- Create Productos en Ofertas
CREATE TABLE productos_ofertas (
    id_producto INT,
    id_oferta INT,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_oferta) REFERENCES ofertas_especiales(id_oferta)
);

-- Create Inventario de Sucursal
CREATE TABLE inventario_sucursal (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_sucursal INT,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Create Compras de Sucursal
CREATE TABLE compras_sucursal (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_sucursal INT,
    id_proveedor INT,
    fecha DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

-- Create Detalle de Compras de Sucursal
CREATE TABLE detalle_compras_sucursal (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_compra INT,
    id_producto INT,
    cantidad INT,
    precio DECIMAL(10,2),
    FOREIGN KEY (id_compra) REFERENCES compras_sucursal(id_compra),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Create Eventos
CREATE TABLE eventos (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha DATE,
    descripcion TEXT
);

-- Create Participantes en Eventos
CREATE TABLE participantes_eventos (
    id_participante INT AUTO_INCREMENT PRIMARY KEY,
    id_evento INT,
    id_cliente INT,
    FOREIGN KEY (id_evento) REFERENCES eventos(id_evento),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Create Mensajes de Clientes
CREATE TABLE mensajes_clientes (
    id_mensaje INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha DATE,
    mensaje TEXT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Create Respuestas a Mensajes
CREATE TABLE respuestas_mensajes (
    id_respuesta INT AUTO_INCREMENT PRIMARY KEY,
    id_mensaje INT,
    fecha DATE,
    respuesta TEXT,
    FOREIGN KEY (id_mensaje) REFERENCES mensajes_clientes(id_mensaje)
);

-- Create Historial de Cambios en Inventario
CREATE TABLE historial_cambios_inventario (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    fecha DATE,
    cambio INT,
    motivo TEXT,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Create Documentos de Facturación
CREATE TABLE documentos_facturacion (
    id_documento INT AUTO_INCREMENT PRIMARY KEY,
    id_factura INT,
    tipo VARCHAR(255),
    url TEXT,
    FOREIGN KEY (id_factura) REFERENCES facturas(id_factura)
);

-- Create Metas de Ventas
CREATE TABLE metas_ventas (
    id_meta INT AUTO_INCREMENT PRIMARY KEY,
    id_sucursal INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    objetivo DECIMAL(10,2),
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);

-- Create Logros de Metas
CREATE TABLE logros_metas (
    id_logro INT AUTO_INCREMENT PRIMARY KEY,
    id_meta INT,
    fecha DATE,
    ventas DECIMAL(10,2),
    FOREIGN KEY (id_meta) REFERENCES metas_ventas(id_meta)
);

-- Create Reglas de Descuentos
CREATE TABLE reglas_descuentos (
    id_regla INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    tipo VARCHAR(255),
    valor DECIMAL(10,2)
);

-- Create Aplicaciones de Reglas de Descuentos
CREATE TABLE aplicaciones_reglas_descuentos (
    id_aplicacion INT AUTO_INCREMENT PRIMARY KEY,
    id_regla INT,
    id_producto INT,
    FOREIGN KEY (id_regla) REFERENCES reglas_descuentos(id_regla),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);


--Datos 

INSERT INTO Clientes (nombre, email, telefono) VALUES
('Juan Pérez', 'juan@example.com', '1234567890'),
('María López', 'maria@example.com', '0987654321'),
('Carlos García', 'carlos@example.com', '5555555555'),
('Ana Martínez', 'ana@example.com', '6666666666');


INSERT INTO Productos (nombre, descripcion, precio, stock) VALUES
('Camiseta', 'Camiseta de algodón', 10.00, 100),
('Pantalón', 'Pantalón de mezclilla', 20.00, 50),
('Chaqueta', 'Chaqueta de cuero', 50.00, 20),
('Zapatos', 'Zapatos deportivos', 30.00, 75);

INSERT INTO Variaciones (id_producto, talla, color, estilo) VALUES
(1, 'M', 'Rojo', 'Casual'),
(2, 'L', 'Azul', 'Formal'),
(3, 'S', 'Negro', 'Deportivo'),
(4, 'XL', 'Blanco', 'Casual');


INSERT INTO Almacenes (nombre, ubicacion) VALUES
('Almacén Central', 'Calle Principal 123'),
('Almacén Secundario', 'Avenida Secundaria 456'),
('Almacén Norte', 'Calle Norte 789'),
('Almacén Sur', 'Avenida Sur 101');

INSERT INTO Movimientos (id_producto, id_almacen, tipo, fecha, cantidad) VALUES
(1, 1, 'entrada', '2024-06-01', 50),
(2, 2, 'salida', '2024-06-02', 20),
(3, 3, 'entrada', '2024-06-03', 15),
(4, 4, 'salida', '2024-06-04', 10);

INSERT INTO Proveedores (nombre, direccion, telefono) VALUES
('Proveedor A', 'Calle A 123', '1111111111'),
('Proveedor B', 'Calle B 456', '2222222222'),
('Proveedor C', 'Calle C 789', '3333333333'),
('Proveedor D', 'Calle D 101', '4444444444');

INSERT INTO Compras (id_proveedor, fecha, total) VALUES
(1, '2024-06-05', 500.00),
(2, '2024-06-06', 300.00),
(3, '2024-06-07', 200.00),
(4, '2024-06-08', 400.00);

INSERT INTO DetalleCompras (id_compra, id_producto, cantidad, precio) VALUES
(1, 1, 10, 10.00),
(2, 2, 15, 20.00),
(3, 3, 5, 50.00),
(4, 4, 7, 30.00);

INSERT INTO Ventas (id_cliente, fecha, total) VALUES
(1, '2024-06-09', 150.00),
(2, '2024-06-10', 100.00),
(3, '2024-06-11', 200.00),
(4, '2024-06-12', 250.00);

INSERT INTO DetalleVentas (id_venta, id_producto, cantidad, precio) VALUES
(1, 1, 3, 10.00),
(2, 2, 2, 20.00),
(3, 3, 4, 50.00),
(4, 4, 5, 30.00);

INSERT INTO Usuarios (nombre_usuario, contrasena, rol) VALUES
('admin', 'admin123', 'admin'),
('user1', 'user1123', 'user'),
('user2', 'user2123', 'user'),
('user3', 'user3123', 'user');

INSERT INTO Permisos (descripcion) VALUES
('Ver productos'),
('Agregar productos'),
('Eliminar productos'),
('Actualizar productos');

INSERT INTO UsuarioPermiso (id_usuario, id_permiso) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1);

INSERT INTO Fidelizacion (id_cliente, puntos, descuentos) VALUES
(1, 100, 10.00),
(2, 200, 20.00),
(3, 300, 30.00),
(4, 400, 40.00);

INSERT INTO Facturas (id_cliente, fecha, subtotal, itbis, descuento, recargo, total, ncf) VALUES
(1, '2024-06-09', 100.00, 18.00, 5.00, 2.00, 115.00, 'A001'),
(2, '2024-06-10', 200.00, 36.00, 10.00, 4.00, 230.00, 'A002'),
(3, '2024-06-11', 150.00, 27.00, 7.50, 3.00, 172.50, 'A003'),
(4, '2024-06-12', 250.00, 45.00, 12.50, 5.00, 287.50, 'A004');

INSERT INTO DetalleFacturas (id_factura, id_producto, cantidad, precio_unitario, importe) VALUES
(1, 1, 3, 10.00, 30.00),
(2, 2, 5, 20.00, 100.00),
(3, 3, 2, 50.00, 100.00),
(4, 4, 1, 30.00, 30.00);

-- Contar tablas

SELECT COUNT(*) 
FROM information_schema.tables 
WHERE table_schema = 'nombre_de_tu_base_de_datos';