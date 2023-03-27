CREATE DATABASE IF NOT EXISTS ejercicio10;
USE ejercicio10;

CREATE TABLE IF NOT EXISTS cajeros (
    codigo INT PRIMARY KEY,
    nomApels VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS productos (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio INT NOT NULL
);

CREATE TABLE IF NOT EXISTS maquinas_registradas (
    codigo INT PRIMARY KEY,
    piso INT NOT NULL
);

CREATE TABLE IF NOT EXISTS venta (
    cajero INT NOT NULL,
    maquina INT NOT NULL,
    producto INT NOT NULL,
    PRIMARY KEY (cajero, maquina, producto),
    FOREIGN KEY (cajero) REFERENCES cajeros(codigo),
    FOREIGN KEY (maquina) REFERENCES maquinas_registradas(codigo),
    FOREIGN KEY (producto) REFERENCES productos(codigo)
);