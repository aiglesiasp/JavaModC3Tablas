CREATE DATABASE IF NOT EXISTS ejercicio_7;
USE ejercicio_7;

CREATE TABLE IF NOT EXISTS Despachos (
    numero INT PRIMARY KEY,
    capacidad INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Directores (
    dni VARCHAR(8) PRIMARY KEY,
    nomApels VARCHAR(255) NOT NULL,
    dni_jefe VARCHAR(8),
    despacho INT,
    FOREIGN KEY (dni_jefe) REFERENCES Directores(dni),
    FOREIGN KEY (despacho) REFERENCES Despachos(numero)
);