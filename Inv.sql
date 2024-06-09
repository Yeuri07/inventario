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
