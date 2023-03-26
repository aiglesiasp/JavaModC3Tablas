CREATE DATABASE academia; 

USE academia; 

CREATE TABLE profesores (
  dni CHAR(9) NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  titulacion VARCHAR(100) NOT NULL,
  cuota_hora DECIMAL(8, 2) NOT NULL,
  gana DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (dni),
  UNIQUE KEY (nombre),
  CHECK (gana IS NOT NULL)
);

CREATE TABLE cursos (
  codigo INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  max_alumnos_recomendado INT NOT NULL,
  profesor_dni CHAR(9) NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NOT NULL,
  horas INT NOT NULL,
  PRIMARY KEY (codigo),
  UNIQUE KEY (nombre),
  FOREIGN KEY (profesor_dni) REFERENCES profesores (dni),
  CHECK (fecha_inicio < fecha_fin)
);
CREATE TABLE alumnos (
  codigo_alumno INT NOT NULL,
  dni CHAR(9) NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellidos VARCHAR(100) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  sexo ENUM('H', 'M') NOT NULL,
  curso_codigo INT NOT NULL,
  PRIMARY KEY (codigo_alumno),
  FOREIGN KEY (curso_codigo) REFERENCES cursos (codigo),
  FOREIGN KEY (dni) REFERENCES profesores (dni)
);


ALTER TABLE alumnos ADD CONSTRAINT fk_alumnos_cursos FOREIGN KEY (curso_codigo) REFERENCES cursos (codigo);
ALTER TABLE cursos ADD CONSTRAINT fk_cursos_profesores FOREIGN KEY (profesor_dni) REFERENCES profesores (dni);