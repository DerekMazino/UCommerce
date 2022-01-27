drop database if exists U_CommerceBD;
create database U_CommerceBD;
use U_CommerceBD;

create table Categoria(
	id_categoria INT NOT NULL AUTO_INCREMENT,
    nombre varchar(12) NOT NULL,
    descripcion varchar(200),
    primary key(id_categoria)
);

create table Usuario(
	id_usuario INT NOT NULL AUTO_INCREMENT,
    nombre varchar(25) NOT NULL,
    apellido varchar(25) NOT NULL,
    email varchar(100) NOT NULL,
    celular varchar(10) NOT NULL,
    imagen varchar(500),
    user_password varchar(200),
    primary key(id_usuario),
    unique(email)
);

create table Tienda(
	id_tienda INT NOT NULL AUTO_INCREMENT,
    nombre varchar(25) NOT NULL,
    descripcion varchar(200),
    logo varchar(500),
    categoria_id int,
    usuario_id int,
    primary key(id_tienda),
    unique(nombre),
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id_categoria),
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id_usuario)
);

create table Seccion(
	id_seccion INT NOT NULL AUTO_INCREMENT,
    nombre varchar(12) NOT NULL,
    descripcion varchar(200),
    tienda_id int,
    primary key(id_seccion),
    FOREIGN KEY (tienda_id) REFERENCES Tienda(id_tienda)
);

create table Producto(
	id_producto INT NOT NULL AUTO_INCREMENT,
    nombre varchar(12) NOT NULL,
    descripcion varchar(200),
    precio double,
    seccion_id int,
    primary key(id_producto),
    FOREIGN KEY (seccion_id) REFERENCES Seccion(id_seccion)
);

create table MetodoPago(
	id_metodo_pago INT NOT NULL AUTO_INCREMENT,
    nombre varchar(12) NOT NULL,
    primary key(id_metodo_pago)
);

create table Venta(
	id_venta INT NOT NULL AUTO_INCREMENT,
    tienda_id int NOT NULL,
    cliente_id int NOT NULL,
    fecha_venta date NOT NULL,
    total_pagar double,
    metodo_pago_id int,
    primary key(id_venta),
    FOREIGN KEY (tienda_id) REFERENCES Tienda(id_tienda),
    FOREIGN KEY (cliente_id) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (metodo_pago_id) REFERENCES MetodoPago(id_metodo_pago)
);

create table DetalleVenta(
	id_detalle_venta INT NOT NULL AUTO_INCREMENT,
    venta_id int NOT NULL,
    producto_id int NOT NULL,
    precio_unitario double NOT NULL,
    cantidad int NOT NULL,
    primary key(id_detalle_venta),
    FOREIGN KEY (venta_id) REFERENCES Venta(id_venta),
    FOREIGN KEY (producto_id) REFERENCES Producto(id_producto)
);

