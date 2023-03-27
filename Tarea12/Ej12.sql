USE tarea12ej12; 

CREATE TABLE IF NOT EXISTS empresas  (
  cif VARCHAR(10) PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  telefono VARCHAR(9) NOT NULL,
  codigo VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS proyectos (
  id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
  fecha_inicio TIMESTAMP DEFAULT NOW(),
  fecha_final DATE,
  fecha_prevista DATE NOT NULL,
  cif VARCHAR(10),
  FOREIGN KEY (cif) REFERENCES empresas(cif)
);

CREATE TABLE IF NOT EXISTS  trabajadores (
  codigo INT AUTO_INCREMENT PRIMARY KEY,
  dni VARCHAR(10) NOT NULL UNIQUE,
  nombre VARCHAR(30) NOT NULL,
  apellidos VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS  profesiones (
  codigo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS participaciones (
  id_participacion INT AUTO_INCREMENT PRIMARY KEY,
  id_proyecto INT,
  codigo_trabajador INT,
  codigo_profesion INT,
  FOREIGN KEY (id_proyecto) REFERENCES proyectos(id_proyecto),
  FOREIGN KEY (codigo_trabajador) REFERENCES trabajadores(codigo),
  FOREIGN KEY (codigo_profesion) REFERENCES profesiones(codigo)
);

ALTER TABLE participaciones ADD horas TIME;  

INSERT INTO empresas VALUES ('23446789', 'Pepitos SL', 'Calle Palmeras, 14, Reus, Tarragona', '656598758', 'A0001');

INSERT INTO proyectos (fecha_final,fecha_prevista, cif) VALUES ('2023-06-05', '2023-05-25', '23446789');

INSERT INTO trabajadores(dni, nombre,apellidos) VALUES ('77756434R', 'Aitor', 'Iglesias');
INSERT INTO trabajadores(dni, nombre,apellidos) VALUES ('77756994R', 'Camila', 'Garcia');
INSERT INTO trabajadores(dni, nombre,apellidos) VALUES ('77756348R', 'Javier', 'Perez');

INSERT INTO profesiones (nombre) VALUES ('Desarrolladores');
INSERT INTO profesiones (nombre) VALUES ('Analista');
INSERT INTO profesiones (nombre) VALUES ('Jefe de proyecto');
INSERT INTO profesiones (nombre) VALUES ('Administrador de diseño');


INSERT INTO participaciones (id_proyecto, codigo_trabajador, codigo_profesion) VALUES (1, 2, 1); 
INSERT INTO participaciones (id_proyecto, codigo_trabajador, codigo_profesion) VALUES (1, 3, 2); 
INSERT INTO participaciones (id_proyecto, codigo_trabajador, codigo_profesion) VALUES (1, 1, 3); 

UPDATE participaciones SET horas = '10:10:00' WHERE id_participacion = 1;
UPDATE participaciones SET horas = '10:10:00' WHERE id_participacion = 2;


SELECT participaciones.id_participacion, participaciones.id_proyecto, trabajadores.nombre, profesiones.nombre, participaciones.horas
FROM participaciones
INNER JOIN trabajadores ON participaciones.codigo_trabajador = trabajadores.codigo
INNER JOIN profesiones ON participaciones.codigo_profesion = profesiones.codigo;
