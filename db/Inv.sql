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