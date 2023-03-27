CREATE DATABASE tarea14ejercicio9;
USE tarea14ejercicio9;

CREATE TABLE IF NOT EXISTS cientificos (
						dni VARCHAR(8),
						nom_apels VARCHAR(255) NOT NULL,
						PRIMARY KEY(dni)
						);
					
CREATE TABLE IF NOT EXISTS proyecto (
						id CHAR(4),
						nombre VARCHAR(255) NOT NULL,
						horas INT NOT NULL,
						PRIMARY KEY(id)
						);
						
CREATE TABLE IF NOT EXISTS asignado_a (
						cientifico VARCHAR(8),
						proyecto CHAR(4),
						PRIMARY KEY(cientifico, proyecto),
						FOREIGN KEY (cientifico) REFERENCES cientificos (dni)
						ON DELETE CASCADE ON UPDATE CASCADE,
						FOREIGN KEY (proyecto) REFERENCES proyecto (id)
						ON DELETE CASCADE ON UPDATE CASCADE
						);
						
SHOW COLUMNS FROM cientificos;
SHOW COLUMNS FROM proyecto;
SHOW COLUMNS FROM asignado_a;