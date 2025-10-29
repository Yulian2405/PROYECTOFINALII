
CREATE DATABASE ProyectoFinal;
GO

USE ProyectoFinal;
GO

-- ==========================================
-- TABLA: tbl_roles
-- ==========================================
CREATE TABLE tbl_roles (
    CodigoRol INT PRIMARY KEY,
    NombreRol VARCHAR(45),
    TipoPermiso VARCHAR(45),
    Pantalla VARCHAR(45),
    Estado VARCHAR(45)
);
GO

-- ==========================================
-- TABLA: tbl_usuarios
-- ==========================================
CREATE TABLE tbl_usuarios (
    CodigoUsuario INT PRIMARY KEY,
    CodigoRol INT,
    NombreUsuario VARCHAR(45),
    Contrasenia VARCHAR(45),
    Estado VARCHAR(45),
    FOREIGN KEY (CodigoRol) REFERENCES tbl_roles(CodigoRol)
);
GO

-- ==========================================
-- TABLA: tbl_empleados
-- ==========================================
CREATE TABLE tbl_empleados (
    CodigoEmpleado INT PRIMARY KEY,
    CodigoUsuario INT,
    Nombre VARCHAR(45),
    Correo VARCHAR(45),
    Telefono INT,
    Salario DECIMAL(10,2),
    Estado VARCHAR(45),
    FOREIGN KEY (CodigoUsuario) REFERENCES tbl_usuarios(CodigoUsuario)
);
GO

-- ==========================================
-- TABLA: tbl_proveedores
-- ==========================================
CREATE TABLE tbl_proveedores (
    CodigoProveedor INT PRIMARY KEY,
    Nombre VARCHAR(45),
    Telefono INT,
    Correo VARCHAR(45),
    Direccion VARCHAR(45),
    Estado VARCHAR(45)
);
GO

-- ==========================================
-- TABLA: tbl_compras
-- ==========================================
CREATE TABLE tbl_compras (
    CodigoCompra INT PRIMARY KEY,
    CodigoProveedor INT,
    CodigoProducto INT,
    FechaCompra DATETIME,
    Cantidad INT,
    Costo DECIMAL(10,2),
    TotalCompra DECIMAL(10,2),
    Estado VARCHAR(45),
    FOREIGN KEY (CodigoProveedor) REFERENCES tbl_proveedores(CodigoProveedor)
);
GO

-- ==========================================
-- TABLA: tbl_productos
-- ==========================================
CREATE TABLE tbl_productos (
    CodigoProducto INT PRIMARY KEY,
    CodigoProveedor INT,
    NombreProducto VARCHAR(45),
    Precio DECIMAL(10,2),
    Stock INT,
    FechaVencimiento DATETIME,
    Estado VARCHAR(45)
);
GO

-- ==========================================
-- TABLA: tbl_inventarios
-- ==========================================
CREATE TABLE tbl_inventarios (
    CodigoInventario INT PRIMARY KEY,
    CodigoSucursal INT,
    CodigoProducto INT,
    Cantidad INT,
    FechaActualizacion DATETIME,
    EstadoMinimo INT,
    Estado VARCHAR(45)
);
GO

-- ==========================================
-- TABLA: tbl_sucursales
-- ==========================================
CREATE TABLE tbl_sucursales (
    CodigoSucursal INT PRIMARY KEY,
    Nombre VARCHAR(45),
    Direccion VARCHAR(45),
    Telefono INT,
    Correo VARCHAR(45),
    CodigoEmpleado INT,
    Estado VARCHAR(45)
);
GO

-- ==========================================
-- TABLA: tbl_clientes
-- ==========================================
CREATE TABLE tbl_clientes (
    CodigoCliente INT PRIMARY KEY,
    Nombre VARCHAR(45),
    NIT VARCHAR(45),
    Direccion VARCHAR(45),
    Departamento VARCHAR(45),
    TipoCliente VARCHAR(45),
    Estado VARCHAR(45)
);
GO

-- ==========================================
-- TABLA: tbl_ventas
-- ==========================================
CREATE TABLE tbl_ventas (
    CodigoVenta INT PRIMARY KEY,
    CodigoCliente INT,
    CodigoSucursal INT,
    FechaVenta DATETIME,
    MetodoPago VARCHAR(45),
    Total DECIMAL(10,2),
    Estado VARCHAR(45),
    FOREIGN KEY (CodigoCliente) REFERENCES tbl_clientes(CodigoCliente),
    FOREIGN KEY (CodigoSucursal) REFERENCES tbl_sucursales(CodigoSucursal)
);
GO

-- ==========================================
-- TABLA: tbl_detalleVenta
-- ==========================================
CREATE TABLE tbl_detalleVenta (
    CodigoDetalle INT PRIMARY KEY,
    CodigoVenta INT,
    CodigoProducto INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10,2),
    Descuento DECIMAL(10,2),
    Impuestos DECIMAL(10,2),
    Total DECIMAL(10,2),
    Estado VARCHAR(45),
    FOREIGN KEY (CodigoVenta) REFERENCES tbl_ventas(CodigoVenta),
    FOREIGN KEY (CodigoProducto) REFERENCES tbl_productos(CodigoProducto)
);
GO

-- ==========================================
-- TABLA: tbl_envios
-- ==========================================
CREATE TABLE tbl_envios (
    CodigoEnvio INT PRIMARY KEY,
    CodigoVenta INT,
    FechaEnvio DATETIME,
    Direccion VARCHAR(45),
    Vehiculo VARCHAR(45),
    CostoEnvio DECIMAL(10,2),
    Estado VARCHAR(45),
    FOREIGN KEY (CodigoVenta) REFERENCES tbl_ventas(CodigoVenta)
);
GO

-- ==========================================
-- TABLA: tbl_detalleEnvios
-- ==========================================
CREATE TABLE tbl_detalleEnvios (
    CodigoDetalleEnvio INT PRIMARY KEY,
    CodigoEnvio INT,
    CodigoProducto INT,
    Cantidad INT,
    CostoUnitario DECIMAL(10,2),
    CostoTotal DECIMAL(10,2),
    Estado VARCHAR(45),
    FOREIGN KEY (CodigoEnvio) REFERENCES tbl_envios(CodigoEnvio),
    FOREIGN KEY (CodigoProducto) REFERENCES tbl_productos(CodigoProducto)
);
GO

-- ==========================================
-- TABLA: tbl_pagosClientes
-- ==========================================
CREATE TABLE tbl_pagosClientes (
    CodigoPago INT PRIMARY KEY,
    CodigoEnvio INT,
    Fecha DATETIME,
    Monto DECIMAL(10,2),
    MetodoPago VARCHAR(45),
    ReferenciaPago VARCHAR(45),
    Estado VARCHAR(45),
    FOREIGN KEY (CodigoEnvio) REFERENCES tbl_envios(CodigoEnvio)
);
GO

-- ==========================================
-- TABLA: tbl_pagosProveedores
-- ==========================================
CREATE TABLE tbl_pagosProveedores (
    CodigoPagoProv INT PRIMARY KEY,
    CodigoProveedor INT,
    Fecha DATETIME,
    Monto DECIMAL(10,2),
    MetodoPago VARCHAR(45),
    Estado VARCHAR(45),
    FOREIGN KEY (CodigoProveedor) REFERENCES tbl_proveedores(CodigoProveedor)
);
GO

-- ==========================================
-- TABLA: tbl_pagoEmpleados
-- ==========================================
CREATE TABLE tbl_pagoEmpleados (
    CodigoPagoEmp INT PRIMARY KEY,
    CodigoEmpleado INT,
    Fecha DATETIME,
    HorasExtras DECIMAL(10,2),
    SalarioBase DECIMAL(10,2),
    TotalPago DECIMAL(10,2),
    MetodoPago VARCHAR(45),
    Estado VARCHAR(45),
    FOREIGN KEY (CodigoEmpleado) REFERENCES tbl_empleados(CodigoEmpleado)
);
GO
