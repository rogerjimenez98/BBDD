DROP DATABASE IF EXISTS bd;
CREATE DATABASE bd;-- CREAMOS BASE DE DATOS 
-- Te daba error al principio del todo porque no estabas dejando un espacio después de --, cuando hagas un comentario en sql siempre tiene que haber un espacio detrás de los guiones, si no peta
USE bd;-- Le pedimos que use la base de datos

CREATE TABLE JUGADOR (
ID INT NOT NULL,-- identificador numero entero
NOMBRE VARCHAR(20),-- Nombre de la persona
PRIMARY KEY(ID)-- clave primaria que sera el identificador
)ENGINE = InnoDB;

CREATE TABLE PUNTUACIÓN (
ID INT NOT NULL,-- Cuando creemos una entrada en la bs tiene que haber un identificador especificado
PUNTOS INT, -- Aquí había un ; en vez de una ,
PRIMARY KEY(ID)
)ENGINE = InnoDB;

CREATE TABLE PARTIDAS(

ID_N INT NOT NULL,
ID_P INT NOT NULL,
FOREIGN KEY (ID_N) REFERENCES JUGADOR(ID), -- Aquí el id que estabas poniendo (ID_J) no existe en la tabla (ya que es ID_N)
FOREIGN KEY (ID_P) REFERENCES PUNTUACIÓN(ID)
)ENGINE = InnoDB;


INSERT INTO JUGADOR VALUES (1,'PEDRO BENITO');
INSERT INTO JUGADOR VALUES (2,'PEPE MEL');
INSERT INTO JUGADOR VALUES (3,'JURGEN KLOOP');
INSERT INTO JUGADOR VALUES (4,'JOHN NAGGELSMAN');

INSERT INTO PUNTUACIÓN VALUES (1,'10000'); -- Ojo! aquí imagino que estabas probando cosas pero se te olvidó cambiar PUNTOS por PUNTUACIÓN
INSERT INTO PUNTUACIÓN VALUES (2,'5000');
INSERT INTO PUNTUACIÓN VALUES (3,'18900');
INSERT INTO PUNTUACIÓN VALUES (4,'52500');

INSERT INTO PARTIDAS VALUES (1,1);
INSERT INTO PARTIDAS VALUES (2,2);
INSERT INTO PARTIDAS VALUES (3,3);
INSERT INTO PARTIDAS VALUES (4,4);
INSERT INTO PARTIDAS VALUES (1,2);

-- NUMERO DE PARTIDAS QUE HA JUGADO PEDRO BENITO


SELECT COUNT(PARTIDAS.ID_N) FROM  (JUGADOR,PARTIDAS)
WHERE JUGADOR.NOMBRE = 'PEDRO BENITO' AND JUGADOR.ID = PARTIDAS.ID_N;


 







