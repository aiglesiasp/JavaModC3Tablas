CREATE DATABASE tarea14ejercicio6;
USE tarea14ejercicio6;

CREATE TABLE IF NOT EXISTS peliculas (
						codigo INT AUTO_INCREMENT,
						nombre VARCHAR(100) NOT NULL,
						calificacion_edad INT NOT NULL,
						PRIMARY KEY(codigo)
						);
						
CREATE TABLE IF NOT EXISTS salas (
						codigo INT AUTO_INCREMENT,
						nombre VARCHAR(100) NOT NULL,
						pelicula INT NOT NULL,
						PRIMARY KEY(codigo),
						FOREIGN KEY (pelicula) REFERENCES peliculas (codigo)
						ON DELETE CASCADE ON UPDATE CASCADE
						);
						
SHOW COLUMNS FROM peliculas;
SHOW COLUMNS FROM salas;
