CREATE DATABASE tarea14ejercicio3;
USE tarea14ejercicio3;

CREATE TABLE IF NOT EXISTS fabricantes (
						codigo INT AUTO_INCREMENT,
						nombre VARCHAR(100) NOT NULL,
						PRIMARY KEY(codigo)
						);
						
CREATE TABLE IF NOT EXISTS articulos (
						codigo INT AUTO_INCREMENT,
						nombre VARCHAR(100) NOT NULL,
						precio INT NOT NULL,
						fabricante INT NOT NULL,
						PRIMARY KEY(codigo),
						KEY (fabricante),
						FOREIGN KEY (fabricante) REFERENCES fabricantes (codigo)
						ON DELETE CASCADE ON UPDATE CASCADE
						);
						
SHOW COLUMNS FROM fabricantes;
SHOW COLUMNS FROM articulos;

DROP TABLE articulos;