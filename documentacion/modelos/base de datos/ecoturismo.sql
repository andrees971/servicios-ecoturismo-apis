CREATE DATABASE if NOT EXISTS ecoturismo;


USE ecoturismo;


DROP TABLE if EXISTS empresa;
DROP TABLE if EXISTS seguro;
DROP TABLE if EXISTS ruta;
DROP TABLE if EXISTS estadia;
DROP TABLE if EXISTS evento;
DROP TABLE if EXISTS estado;
DROP TABLE if EXISTS ruta_estado;
DROP TABLE if EXISTS user_;
DROP TABLE if EXISTS usuaro;
DROP TABLE if EXISTS guia;
DROP TABLE if EXISTS reserva;
DROP TABLE if EXISTS pago;
DROP TABLE if EXISTS noticia;

CREATE TABLE if NOT EXISTS empresa(
empresa_id INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
direccion VARCHAR(50) NOT NULL,
telefono VARCHAR(50) NOT NULL,
foto blob
);

CREATE TABLE if NOT EXISTS seguro(
seguro_id INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
fecha_inicio DATETIME NOT NULL,
fecha_fin DATETIME NOT NULL,
precio INT NOT NULL
);

CREATE TABLE if NOT EXISTS ruta(
ruta_id INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
riesgo VARCHAR(50) NOT NULL,
distancia INT NOT NULL,
descripcion TEXT,
empresa_id INT NOT NULL,
seguro_id INT NOT NULL,
CONSTRAINT fk_emp_ruta FOREIGN KEY(empresa_id) REFERENCES empresa(empresa_id),
CONSTRAINT fk_seguro_ruta FOREIGN KEY(seguro_id) REFERENCES seguro(seguro_id)
);

CREATE TABLE if NOT EXISTS estadia(
estadia_id INT PRIMARY KEY,
fecha_inicio DATETIME NOT NULL,
fecha_fin DATETIME NOT NULL,
precio INT NOT NULL,
ruta_id INT NOT NULL,
CONSTRAINT fk_ruta_estadia FOREIGN KEY(ruta_id) REFERENCES ruta(ruta_id)
);

CREATE TABLE if NOT EXISTS evento(
evento_id INT PRIMARY KEY,
fecha DATETIME NOT NULL,
descripcion TEXT,
ruta_id INT NOT NULL,
CONSTRAINT fk_evento_estadia FOREIGN KEY(ruta_id) REFERENCES ruta(ruta_id)
);

CREATE TABLE if NOT EXISTS estado(
estado_id INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

CREATE TABLE if NOT EXISTS ruta_estado(
ruta_estado_id INT PRIMARY KEY,
fecha DATETIME NOT NULL,
descripcion TEXT NOT NULL,
ruta_id INT NOT NULL,
estado_id INT NOT NULL,
CONSTRAINT fk_ruta_estado FOREIGN KEY(ruta_id) REFERENCES ruta(ruta_id),
CONSTRAINT fk_estado_ruta FOREIGN KEY(estado_id) REFERENCES estado(estado_id)
);

CREATE TABLE if NOT EXISTS user_(
user_id INT PRIMARY KEY,
user_name VARCHAR(50) NOT NULL,
contraseña VARCHAR(50) NOT NULL,
rool VARCHAR(50) NOT NULL
);

CREATE TABLE if NOT EXISTS usuario(
usuario_id INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
telefono VARCHAR(50) NOT NULL,
foto BLOB,
user_id INT NOT NULL,
CONSTRAINT fk_user_usuario FOREIGN KEY(user_id) REFERENCES user_(user_id)
);

CREATE TABLE if NOT EXISTS guia(
guia_id INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
telefono VARCHAR(50) NOT NULL,
foto BLOB,
user_id INT NOT NULL,
CONSTRAINT fk_user_usuario FOREIGN KEY(user_id) REFERENCES user_(user_id)
);

CREATE TABLE if NOT EXISTS reserva(
reserva_id INT PRIMARY KEY,
estado VARCHAR(50) NOT NULL,
ruta_id INT NOT NULL,
usuario_id INT NOT NULL,
CONSTRAINT fk_ruta_reserva FOREIGN KEY(ruta_id) REFERENCES ruta(ruta_id),
CONSTRAINT fk_usuario_reserva FOREIGN KEY(usuario_id) REFERENCES usuario(usuario_id)
);

CREATE TABLE if NOT EXISTS pago(
pago_id INT PRIMARY KEY,
valor INT NOT NULL,
descuento INT,
descipcion TEXT,
fecha DATETIME NOT NULL,
reserva_id INT NOT NULL,
CONSTRAINT fk_reserva_pago FOREIGN KEY(reserva_id) REFERENCES reserva(reserva_id),
);

CREATE TABLE if NOT EXISTS noticia(
noticia_id INT PRIMARY KEY,
fecha DATETIME NOT NULL,
autor VARCHAR(50) NOT NULL,
descipcion TEXT NOT NULL,
imagen BLOB 
);


