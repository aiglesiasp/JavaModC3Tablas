CREATE DATABASE losalmacenes; 

USE losalmacenes; 

CREATE TABLE almacenes(
codigo INT AUTO_INCREMENT PRIMARY KEY,
lugar NVARCHAR(100) NOT NULL, 
capacidad INT NOT NULL
); 

CREATE TABLE CAJAS(
numreferencia CHAR(5) PRIMARY KEY NOT NULL,
contenido NVARCHAR(100) NOT NULL, 
valor INT NOT NULL,
almacen INT NOT NULL,
FOREIGN KEY (almacen) REFERENCES almacenes(codigo)
); 

