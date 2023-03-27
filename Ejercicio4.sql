CREATE DATABASE IF NOT EXISTS ejercicio_4;
USE ejercicio_4;

CREATE TABLE IF NOT EXISTS departamentos (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    presupuesto INT NOT NULL
);

CREATE TABLE IF NOT EXISTS empleados (
    dni VARCHAR(8) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(255) NOT NULL,
    codigo_departamento INT NOT NULL,
    FOREIGN KEY (codigo_departamento) REFERENCES departamentos(codigo)
);