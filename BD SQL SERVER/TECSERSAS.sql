--Creaci�n base de datos TECSERSAS--
CREATE DATABASE TECSERSAS

--Usar la Bd creada--
USE TECSERSAS

-- Creaci�n de la tabla Rol--
CREATE TABLE Rol(
    Codigo_Rol INT PRIMARY KEY NOT NULL,
    Nombre_Rol VARCHAR(50) NOT NULL
);

-- Creaci�n de la tabla Inventario
CREATE TABLE Inventario(
    Codigo_Inventario INT PRIMARY KEY NOT NULL,
    Fecha_Inventario DATE NOT NULL,
    Hora_Inventario TIME NOT NULL
);

-- Creaci�n de la tabla Proveedor
CREATE TABLE Proveedor(
    Nit_Proveedor INT PRIMARY KEY NOT NULL,
	Tipo_Proveedor VARCHAR (20) NOT NULL,
    Nombre_Proveedor VARCHAR(50) NOT NULL,
    Direccion_Proveedor VARCHAR(50) NOT NULL,
    Telefono_Proveedor BIGINT  NOT NULL,
    Correo_Proveedor VARCHAR(50) NOT NULL,
	CondicionesPago_Proveedor TEXT NOT NULL,
	FechasPago_Proveedor TEXT NOT NULL
);


-- Creaci�n de la tabla Cliente
CREATE TABLE Cliente(
    Identificacion_Cliente INT PRIMARY KEY NOT NULL,
    Nombre_Cliente VARCHAR(50) NOT NULL,
	Nit_Cliente VARCHAR(20) NOT NULL,
    Direccion_Cliente VARCHAR(50) NOT NULL,
    Telefono_Cliente BIGINT  NOT NULL,
    Correo_Cliente VARCHAR(50) NOT NULL
);

-- Creaci�n de la tabla Servicio
CREATE TABLE Servicio(
    Codigo_Servicio INT PRIMARY KEY NOT NULL,
	Fecha_Servicio DATE NOT NULL,
    Nombre_Servicio VARCHAR(50) NOT NULL,
	PrecioBruto_Servicio DECIMAL(10, 2) NOT NULL,
    Descripcion_Servicio TEXT NOT NULL,
	Estado_Servicio VARCHAR(20) NOT NULL
);

-- Creaci�n de la tabla Usuario
CREATE TABLE Usuario(
    Codigo_Usuario INT PRIMARY KEY NOT NULL,
    Nombre_Usuario VARCHAR(50) NOT NULL,
	Correo_Usuario VARCHAR(50) NOT NULL,
    Contrasena_Usuario VARCHAR(15) NOT NULL,
    Codigo_Rol INT FOREIGN KEY REFERENCES Rol (Codigo_Rol) NOT NULL
);

-- Creaci�n de la tabla Vendedor
CREATE TABLE Vendedor(
    Identificacion_Vendedor INT PRIMARY KEY NOT NULL,
    Nombre_Vendedor VARCHAR(50) NOT NULL,
	Direccion_Vendedor VARCHAR(50) NOT NULL,
	Telefono_Vendedor BIGINT NOT NULL,
    Correo_Vendedor VARCHAR(50) NOT NULL,
	Horario_Vendedor VARCHAR(50) NOT NULL,
	Salario_Vendedor DECIMAL(10, 2) NOT NULL,
    Codigo_Usuario INT FOREIGN KEY REFERENCES Usuario (Codigo_Usuario) NOT NULL
);

-- Creaci�n de la tabla Producto
CREATE TABLE Producto(
    Codigo_Producto INT PRIMARY KEY NOT NULL,
    Nombre_Producto VARCHAR(60) NOT NULL,
	Precio_Producto DECIMAL(10, 2) NOT NULL,
	Tipo_Producto VARCHAR(30) NOT NULL,
    Descripcion_Producto TEXT NOT NULL,
    Codigo_Inventario INT FOREIGN KEY REFERENCES Inventario (Codigo_Inventario) NOT NULL,
	Nit_Proveedor INT FOREIGN KEY REFERENCES Proveedor (Nit_Proveedor) NOT NULL
);


-- Creaci�n de la tabla Pedido
CREATE TABLE Pedido(
    Codigo_Pedido INT PRIMARY KEY NOT NULL,
    Fecha_Pedido DATE NOT NULL,
	FechaEntrega_Pedido DATE NOT NULL,
	Cantidad_Pedido INT NOT NULL,
    Estado_Pedido VARCHAR (20) NOT NULL,
    Identificacion_Cliente INT FOREIGN KEY REFERENCES Cliente (Identificacion_Cliente) NOT NULL,
	Codigo_Producto INT FOREIGN KEY REFERENCES Producto (Codigo_Producto) NOT NULL
);

-- Creaci�n de la tabla Venta
CREATE TABLE Venta(
    Codigo_Venta INT PRIMARY KEY NOT NULL,
    Fecha_Venta DATE NOT NULL,
    Total_Venta DECIMAL(10, 2) NOT NULL,
    Codigo_Producto INT FOREIGN KEY REFERENCES Producto (Codigo_Producto) NOT NULL,
	Identificacion_Vendedor INT FOREIGN KEY REFERENCES Vendedor (Identificacion_Vendedor) NOT NULL,
	Identificacion_Cliente INT FOREIGN KEY REFERENCES Cliente (Identificacion_Cliente) NOT NULL
);

-- Creaci�n de la tabla Factura
CREATE TABLE Factura(
    Codigo_Factura INT PRIMARY KEY NOT NULL,
    Fecha_Factura DATE NOT NULL,
	Hora_Factura TIME NOT NULL,
    PrecioUnitario_Factura DECIMAL(10, 2) NOT NULL,
	Iva_Factura VARCHAR (20) NOT NULL,
	Total_Factura DECIMAL(10, 2) NOT NULL,
    Identificacion_Cliente INT FOREIGN KEY REFERENCES Cliente (Identificacion_Cliente) NOT NULL,
	Codigo_Venta INT FOREIGN KEY REFERENCES Venta (Codigo_Venta) NOT NULL,
	Codigo_Servicio INT FOREIGN KEY REFERENCES Servicio (Codigo_Servicio) NOT NULL
);


-- Creaci�n de la tabla Detalle Pedido Producto
CREATE TABLE Detalle_Pedido_Producto(
    Codigo_Detalle_Pedido_Producto INT PRIMARY KEY NOT NULL,
    Codigo_Pedido INT FOREIGN KEY REFERENCES Pedido (Codigo_Pedido) NOT NULL,
	Codigo_Producto INT FOREIGN KEY REFERENCES Producto (Codigo_Producto) NOT NULL
);

-- Creaci�n de la tabla Detalle Servicio Factura
CREATE TABLE Detalle_Servicio_Factura(
    Codigo_Detalle_Servicio_Factura INT PRIMARY KEY NOT NULL,
	TipoServicio_Detalle_Servicio_Factura VARCHAR (40) NOT NULL,
	Codigo_Servicio INT FOREIGN KEY REFERENCES Servicio (Codigo_Servicio) NOT NULL,
	Codigo_Factura INT FOREIGN KEY REFERENCES Factura (Codigo_Factura) NOT NULL
);

-- Creaci�n de la tabla Detalle Venta Producto
CREATE TABLE Detalle_Venta_Producto(
    Codigo_Detalle_Venta_Producto INT PRIMARY KEY NOT NULL,
	Stock_Detalle_Venta_Producto INT NOT NULL,
	Codigo_Producto INT FOREIGN KEY REFERENCES Producto (Codigo_Producto) NOT NULL,
	Codigo_Venta INT FOREIGN KEY REFERENCES Venta (Codigo_Venta) NOT NULL
);

--Inserci�n base de datos TECSERSAS--

-- Insertar datos en la tabla Rol
INSERT INTO Rol(Codigo_Rol, Nombre_Rol) VALUES
(101, 'Vendedor'),
(102, 'Administrador'),
(103, 'Asistente'),
(104, 'Gerente'),
(105, 'Recepcionista');

-- Insertar datos en la tabla Inventario
INSERT INTO Inventario(Codigo_Inventario, Fecha_Inventario, Hora_Inventario) VALUES
(101, '2024-12-01', '08:00:00'),
(102, '2024-12-02', '09:30:00'),
(103, '2024-12-03', '10:15:00'),
(104, '2024-12-04', '11:00:00'),
(105, '2024-12-05', '12:45:00');

-- Insertar datos en la tabla Proveedor
INSERT INTO Proveedor(Nit_Proveedor, Tipo_Proveedor, Nombre_Proveedor, Direccion_Proveedor, Telefono_Proveedor, Correo_Proveedor, CondicionesPago_Proveedor, FechasPago_Proveedor) VALUES
(34567, 'Mayorista', 'Tecsersas S.A.S.', 'Calle 10 # 50-40, Bogot�', 3105551234, 'contacto@tecsersas.com', 'Pago al contado o cr�dito a 30 d�as', 'Primer d�a de cada mes'),
(98909, 'Minorista', 'Distribuciones Tec', 'Carrera 7 # 34-20, Bogot�', 3105554321, 'ventas@distribuciontec.com', 'Pago inmediato', 'Quincenal'),
(26786, 'Mayorista', 'Soluciones y Tecnolog�a', 'Avenida 9 # 12-30, Medell�n', 3005559876, 'info@solutec.com', 'Pago a 60 d�as', '�ltimo d�a de cada mes'),
(76785, 'Minorista', 'TecnoProveedores', 'Calle 5 # 23-45, Cali', 3205556543, 'contacto@tecnoproveedores.com', 'Pago por consignaci�n', 'Primero de cada mes'),
(65389, 'Mayorista', 'Proveedor Universal', 'Carrera 13 # 15-60, Barranquilla', 3115558976, 'proveedor@universal.com', 'Pago a 30 d�as', 'Quincenal');


-- Insertar datos en la tabla Cliente
INSERT INTO Cliente(Identificacion_Cliente, Nombre_Cliente, Nit_Cliente, Direccion_Cliente, Telefono_Cliente, Correo_Cliente) VALUES
(15678, 'Industrias Romero', '800456789', 'Carrera 1 # 10-20, Bogot�', 3005551234, 'Romero@gmail.com'),
(98767, 'Mar�a G�mez', 'N/A', 'Calle 5 # 30-50, Medell�n', 3005555678, 'mariagomez@gmail.com'),
(34567, 'Carvajal Asociados', '800987654', 'Avenida 7 # 45-60, Cali', 3205557890, 'carvjak@gmail.com'),
(90789, 'Ana Torres', 'N/A', 'Carrera 3 # 12-25, Barranquilla', 3105554321, 'anatorres@email.com'),
(15212, 'Geotermica SAS', '800654321', 'Calle 8 # 20-15, Bogot�', 3105559876, 'geotermica@gmail.com');

-- Insertar datos en la tabla Servicio
INSERT INTO Servicio(Codigo_Servicio, Fecha_Servicio, Nombre_Servicio, PrecioBruto_Servicio, Descripcion_Servicio, Estado_Servicio) VALUES
(101, '2024-12-01', 'Instalaci�n de Red', 200000.00, 'Servicio de instalaci�n de redes locales (LAN) para empresas.', 'Activo'),
(102, '2024-12-02', 'Mantenimiento de Equipos', 150000.00, 'Mantenimiento preventivo y correctivo para equipos inform�ticos.', 'Activo'),
(103, '2024-12-03', 'Asesor�a en Seguridad Inform�tica', 250000.00, 'Consultor�a en implementaci�n de soluciones de seguridad inform�tica.', 'Activo'),
(104, '2024-12-04', 'Desarrollo de Software', 500000.00, 'Creaci�n de software personalizado seg�n necesidades del cliente.', 'Inactivo'),
(105, '2024-12-05', 'Soporte T�cnico Remoto', 100000.00, 'Atenci�n a incidencias y soporte remoto para usuarios finales.', 'Activo');



INSERT INTO Usuario(Codigo_Usuario, Nombre_Usuario, Correo_Usuario, Contrasena_Usuario, Codigo_Rol) VALUES
(101, 'JuanR1', 'juanrodriguez@email.com', 'pass1234', 101),
(102, 'AnaLo2', 'analopez@email.com', 'pass5678', 102),
(103, 'CarlosSo3', 'carlossoto@email.com', 'pass7890', 103),
(104, 'LaurM4', 'lauramartinez@email.com', 'pass2345', 104),
(105, 'DavidH5', 'davidhernandez@email.com', 'pass6789', 105);


-- Insertar datos en la tabla Vendedor
INSERT INTO Vendedor(Identificacion_Vendedor, Nombre_Vendedor, Direccion_Vendedor, Telefono_Vendedor, Correo_Vendedor, Horario_Vendedor, Salario_Vendedor, Codigo_Usuario) VALUES
(45345, 'Luis P�rez', 'Carrera 8 # 23-45, Bogot�', 3105552345, 'luisperez@email.com', '9:00 AM - 6:00 PM', 1500000.00, 101),
(12678, 'Pedro Gonz�lez', 'Calle 10 # 15-30, Medell�n', 3105559876, 'pedrogonzalez@email.com', '9:00 AM - 6:00 PM', 1400000.00, 102),
(45908, 'Mar�a Rodr�guez', 'Avenida 5 # 30-60, Cali', 3205558765, 'mariarodriguez@email.com', '9:00 AM - 6:00 PM', 1300000.00, 103),
(23567, 'Carlos D�az', 'Carrera 3 # 10-20, Barranquilla', 3105554321, 'carlosdiaz@email.com', '9:00 AM - 6:00 PM', 1450000.00, 104),
(90890, 'Ana Gonz�lez', 'Calle 12 # 20-40, Bogot�', 3105551234, 'anagonzalez@email.com', '9:00 AM - 6:00 PM', 1600000.00, 105);

-- Insertar datos en la tabla Producto
INSERT INTO Producto(Codigo_Producto, Nombre_Producto, Precio_Producto, Tipo_Producto, Descripcion_Producto, Codigo_Inventario, Nit_Proveedor) VALUES
(101, 'Router TP-Link Archer AX50', 450000.00, 'Tecnolog�a', 'Router Wi-Fi 6 de alto rendimiento', 101, 34567),
(102, 'Computadora Dell OptiPlex 7070', 3200000.00, 'Tecnolog�a', 'Computadora de escritorio para uso empresarial', 102, 98909),
(103, 'Monitor LG 27GL850-B', 1800000.00, 'Tecnolog�a', 'Monitor IPS 27" para profesionales y gamers', 103, 26786),
(104, 'Laptop HP EliteBook 840', 3500000.00, 'Tecnolog�a', 'Laptop empresarial con alto rendimiento y seguridad', 104, 76785),
(105, 'Impresora HP LaserJet Pro M404n', 900000.00, 'Tecnolog�a', 'Impresora l�ser monocrom�tica para oficinas', 105, 65389);


-- Insertar datos en la tabla Pedido
INSERT INTO Pedido(Codigo_Pedido, Fecha_Pedido, FechaEntrega_Pedido, Cantidad_Pedido, Estado_Pedido, Identificacion_Cliente, Codigo_Producto) VALUES
(101, '2024-12-01', '2024-12-05', 2, 'Pendiente', 15678, 101),
(102, '2024-12-02', '2024-12-06', 1, 'Entregado', 98767, 102),
(103, '2024-12-03', '2024-12-07', 5, 'Cancelado', 34567, 103),
(104, '2024-12-04', '2024-12-08', 1, 'Pendiente', 90789, 104),
(105, '2024-12-05', '2024-12-09', 3, 'Entregado', 15212, 105);

-- Insertar datos en la tabla Venta
INSERT INTO Venta(Codigo_Venta, Fecha_Venta, Total_Venta, Codigo_Producto, Identificacion_Vendedor, Identificacion_Cliente) VALUES
(101, '2024-12-01', 900000.00, 101, 45345, 15678),
(102, '2024-12-02', 3200000.00, 102, 12678, 98767),
(103, '2024-12-03', 1800000.00, 103, 45908, 34567),
(104, '2024-12-04', 3500000.00, 104, 23567, 90789),
(105, '2024-12-05', 900000.00, 105, 90890, 15212);

-- Insertar datos en la tabla Factura
INSERT INTO Factura(Codigo_Factura, Fecha_Factura, Hora_Factura, PrecioUnitario_Factura, Iva_Factura, Total_Factura, Identificacion_Cliente, Codigo_Venta, Codigo_Servicio) VALUES
(101, '2024-12-01', '10:00:00', 900000.00, '19%', 1071000.00, 15678, 101, 101),
(102, '2024-12-02', '11:30:00', 3200000.00, '19%', 3808000.00, 98767, 102, 102),
(103, '2024-12-03', '12:00:00', 1800000.00, '19%', 2142000.00, 34567, 103, 103),
(104, '2024-12-04', '14:00:00', 3500000.00, '19%', 4165000.00, 90789, 104, 104),
(105, '2024-12-05', '15:30:00', 900000.00, '19%', 1071000.00, 15212, 105, 105);


-- Insertar datos en la tabla Detalle Pedido Producto
INSERT INTO Detalle_Pedido_Producto(Codigo_Detalle_Pedido_Producto, Codigo_Pedido, Codigo_Producto) VALUES
(101, 101, 101),
(102, 102, 102),
(103, 103, 103),
(104, 104, 104),
(105, 105, 105);

-- Insertar datos en la tabla Detalle Servicio Factura
INSERT INTO Detalle_Servicio_Factura(Codigo_Detalle_Servicio_Factura, TipoServicio_Detalle_Servicio_Factura, Codigo_Servicio, Codigo_Factura) VALUES
(101, 'Instalaci�n', 101, 101),
(102, 'Mantenimiento', 102, 102),
(103, 'Asesor�a', 103, 103),
(104, 'Desarrollo', 104, 104),
(105, 'Soporte', 105, 105);

-- Insertar datos en la tabla Detalle Venta Producto
INSERT INTO Detalle_Venta_Producto(Codigo_Detalle_Venta_Producto, Stock_Detalle_Venta_Producto, Codigo_Producto, Codigo_Venta) VALUES
(101, 5, 101, 101),
(102, 3, 102, 102),
(103, 7, 103, 103),
(104, 2, 104, 104),
(105, 10,105, 105);

select * from Detalle_Venta_Producto;
