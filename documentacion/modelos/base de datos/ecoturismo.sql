CREATE DATABASE if NOT EXISTS ecoturismo;


USE ecoturismo;

DROP TABLE if EXISTS guia;
DROP TABLE if EXISTS pago;
DROP TABLE if EXISTS reserva;
DROP TABLE if EXISTS hospedaje;
DROP TABLE if EXISTS negocio;
DROP TABLE if EXISTS evento;
DROP TABLE if EXISTS ruta_estado;
DROP TABLE if EXISTS estado;
DROP TABLE if EXISTS punto_temporales;
DROP TABLE if EXISTS punto_estatico;
DROP TABLE if EXISTS puntoderuta;
DROP TABLE if EXISTS ruta;
DROP TABLE if EXISTS empresa ;
DROP TABLE if EXISTS seguro;
DROP TABLE if EXISTS usuario;
DROP TABLE if EXISTS user_;
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

CREATE TABLE if NOT EXISTS puntoderuta(
puntoderuta_id INT PRIMARY KEY,
x VARCHAR(50),
y VARCHAR(50), 
ruta_id INT NOT NULL,
CONSTRAINT fk_ruta_puntoderuta FOREIGN KEY(ruta_id) REFERENCES ruta(ruta_id)
);

CREATE TABLE if NOT EXISTS punto_temporales(
punto_temporales_id INT PRIMARY KEY,
ubicacion VARCHAR(50), 
puntoderuta_id INT NOT NULL,
CONSTRAINT fk_puntoderuta_temporal FOREIGN KEY(puntoderuta_id) REFERENCES puntoderuta(puntoderuta_id)
);

CREATE TABLE if NOT EXISTS punto_estatico(
punto_estatico_id INT PRIMARY KEY,
ubicacion VARCHAR(50), 
puntoderuta_id INT NOT NULL,
CONSTRAINT fk_puntoderuta_estatico FOREIGN KEY(puntoderuta_id) REFERENCES puntoderuta(puntoderuta_id)
);

CREATE TABLE if NOT EXISTS hospedaje(
hospedaje_id INT PRIMARY KEY,
fecha_inicio DATETIME NOT NULL,
fecha_fin DATETIME NOT NULL,
precio INT NOT NULL,
estado VARCHAR(50),
ruta_id INT NOT NULL,
CONSTRAINT fk_ruta_hospedaje FOREIGN KEY(ruta_id) REFERENCES ruta(ruta_id)
);

CREATE TABLE if NOT EXISTS negocio(
negocio_id INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
estado VARCHAR(50),
ruta_id INT NOT NULL,
CONSTRAINT fk_ruta_negocio FOREIGN KEY(ruta_id) REFERENCES ruta(ruta_id)
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
contraseÃ±a VARCHAR(50) NOT NULL,
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
CONSTRAINT fk_user_guia FOREIGN KEY(user_id) REFERENCES user_(user_id)
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
CONSTRAINT fk_reserva_pago FOREIGN KEY(reserva_id) REFERENCES reserva(reserva_id)
);

CREATE TABLE if NOT EXISTS noticia(
noticia_id INT PRIMARY KEY,
fecha DATETIME NOT NULL,
autor VARCHAR(50) NOT NULL,
descipcion TEXT NOT NULL,
imagen BLOB 
);


INSERT INTO empresa (empresa_id, nombre, email, direccion, telefono) VALUES (01,'Fundacion pico pance', 'fundacion@gmail.com', 'Cra 100 # 34 h34', '3184884569')
INSERT INTO seguro (seguro_id, nombre, fecha_inicio, fecha_fin, precio) VALUES (01,'Ecoseguro', '13/04/22', '14/04/22', '25000')