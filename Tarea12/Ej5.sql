CREATE DATABASE IF NOT EXISTS ejercicio5;
USE ejercicio5;

CREATE TABLE IF NOT EXISTS almacen (
    numero INT PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS estanteria (
    id INT PRIMARY KEY,
    almacen_numero INT NOT NULL,
    FOREIGN KEY (almacen_numero) REFERENCES almacen(numero)
);

CREATE TABLE IF NOT EXISTS pieza (
    tipo INT NOT NULL,
    modelo INT NOT NULL,
    descripcion VARCHAR(255),
    precio_venta DECIMAL(10, 2) NOT NULL,
    pieza_compuesta_tipo INT,
    pieza_compuesta_modelo INT,
    estanteria_id INT NOT NULL,
    PRIMARY KEY (tipo, modelo),
    FOREIGN KEY (pieza_compuesta_tipo, pieza_compuesta_modelo) REFERENCES pieza(tipo, modelo),
    FOREIGN KEY (estanteria_id) REFERENCES estanteria(id)
);