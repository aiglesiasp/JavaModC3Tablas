CREATE DATABASE piezasproveedores; 

USE piezasproveedores; 

CREATE TABLE PIEZAS(
codigo INT AUTO_INCREMENT PRIMARY KEY,
nombre NVARCHAR(100) NOT NULL
); 

CREATE TABLE PROVEEDORES(
id CHAR(4) PRIMARY KEY NOT NULL,
nombre NVARCHAR(100) NOT NULL
); 

CREATE TABLE SUMINSTRA(
codigopieza INT  NOT NULL,
idproveedor CHAR(4)  NOT NULL, 
precio INT NOT NULL,
PRIMARY KEY (codigopieza, idproveedor),
FOREIGN KEY (codigopieza) REFERENCES piezas(codigo),
FOREIGN KEY (idproveedor) REFERENCES proveedores(id)
); 

