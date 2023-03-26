CREATE DATABASE losinvestigadores11; 

USE losinvestigadores11; 

CREATE TABLE facultad(
	codigo int NOT NULL,
    nombre nvarchar(100),
    PRIMARY KEY(codigo)
);
CREATE TABLE investigadores(
	dni varchar(8) NOT NULL,
    nomapels nvarchar(255),
    facultad int NOT NULL,
    PRIMARY KEY(dni),
    FOREIGN KEY(facultad) REFERENCES facultad(codigo)
);
CREATE TABLE equipos(
	num_serie char(4) NOT NULL,
    nombre nvarchar(100),
    facultad int NOT NULL,
    PRIMARY KEY(num_serie),
    FOREIGN KEY(facultad) REFERENCES facultad(codigo)
);
CREATE TABLE reserva(
	dni varchar(8) NOT NULL,
    num_serie char(4) NOT NULL,
    comienzo datetime,
    fin datetime,
    PRIMARY KEY(dni, num_serie),
    KEY(num_serie,dni),
    FOREIGN KEY(dni) REFERENCES investigadores(dni),
    FOREIGN KEY(num_serie) REFERENCES equipos(num_serie)
);