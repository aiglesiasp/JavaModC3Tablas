CREATE DATABASE inmuebles;
USE inmuebles;

CREATE TABLE IF NOT EXISTS personas (
						dni VARCHAR(8),
						telefono_fijo INT NULL,
						telefono_movil INT NOT NULL,
						nombre VARCHAR(255) NOT NULL,
						apellidos VARCHAR(255) NOT NULL,
						PRIMARY KEY(dni)
						);
					
CREATE TABLE IF NOT EXISTS clientes (
						cod_cliente INT,
						dni VARCHAR(8) NOT NULL,
						PRIMARY KEY(cod_cliente, dni),
						FOREIGN KEY (dni) REFERENCES personas (dni)
						ON DELETE CASCADE ON UPDATE CASCADE
						);
					
CREATE TABLE IF NOT EXISTS trabajadores (
						cod_trabajador INT,
						dni VARCHAR(8) NOT NULL,
						PRIMARY KEY(cod_trabajador, dni),
						FOREIGN KEY (dni) REFERENCES personas (dni)
						ON DELETE CASCADE ON UPDATE CASCADE
						);
					
CREATE TABLE IF NOT EXISTS inmuebles (
						cod_inmueble INT,
						metros VARCHAR(8) NOT NULL,
						descripcion VARCHAR(255) NOT NULL,
						direccion VARCHAR(100) NOT NULL,
						PRIMARY KEY(cod_inmueble)
						);	

CREATE TABLE IF NOT EXISTS pisos (
						cod_piso INT,
						cod_inmueble INT,
						PRIMARY KEY(cod_piso),
						FOREIGN KEY (cod_inmueble) REFERENCES inmuebles (cod_inmueble)
						ON DELETE CASCADE ON UPDATE CASCADE
						);	
					
CREATE TABLE IF NOT EXISTS locales (
						cod_inmueble INT,
						utilidad VARCHAR(100) NOT NULL,
						servicio BOOL NOT NULL,
						PRIMARY KEY(cod_inmueble),
						FOREIGN KEY (cod_inmueble) REFERENCES inmuebles (cod_inmueble)
						ON DELETE CASCADE ON UPDATE CASCADE
						);	
					
CREATE TABLE IF NOT EXISTS garajes (
						cod_inmueble INT,
						n_garaje INT NOT NULL,
						planta INT NOT NULL,
						codigo_piso INT,
						PRIMARY KEY(cod_inmueble),
						FOREIGN KEY (cod_inmueble) REFERENCES inmuebles (cod_inmueble)
						ON DELETE CASCADE ON UPDATE CASCADE,
						FOREIGN KEY (codigo_piso) REFERENCES pisos (cod_piso)
						ON DELETE CASCADE ON UPDATE CASCADE
						);	
					
CREATE TABLE IF NOT EXISTS alquileres (
						codigo_alquiler INT,
						codigo_trabajador INT,
						codigo_cliente INT,
						codigo_inmueble INT,
						PRIMARY KEY(codigo_alquiler),
						FOREIGN KEY (codigo_trabajador) REFERENCES trabajadores (cod_trabajador)
						ON DELETE CASCADE ON UPDATE CASCADE,
						FOREIGN KEY (codigo_cliente) REFERENCES clientes (cod_cliente)
						ON DELETE CASCADE ON UPDATE CASCADE,
						FOREIGN KEY (codigo_inmueble) REFERENCES inmuebles (cod_inmueble)
						ON DELETE CASCADE ON UPDATE CASCADE
						);	
					
					
					
CREATE TABLE IF NOT EXISTS pagos (
						codigo_alquiler INT,
						año INT NOT NULL,
						mes VARCHAR(10) NOT NULL,
						valor INT NOT NULL,
						PRIMARY KEY(codigo_alquiler, año, mes),
						FOREIGN KEY (codigo_alquiler) REFERENCES alquileres (codigo_alquiler)
						ON DELETE CASCADE ON UPDATE CASCADE
					);					
					
					
CREATE TABLE IF NOT EXISTS compras (
						codigo_compra INT,
						fecha DATE NOT NULL,
						valor INT NOT NULL,
						codigo_trabajador INT,
						codigo_cliente INT,
						codigo_inmueble INT,
						PRIMARY KEY(codigo_compra),
						FOREIGN KEY (codigo_trabajador) REFERENCES trabajadores (cod_trabajador)
						ON DELETE CASCADE ON UPDATE CASCADE,
						FOREIGN KEY (codigo_cliente) REFERENCES clientes (cod_cliente)
						ON DELETE CASCADE ON UPDATE CASCADE,
						FOREIGN KEY (codigo_inmueble) REFERENCES inmuebles (cod_inmueble)
						ON DELETE CASCADE ON UPDATE CASCADE
						);				

					

					