-- ------------------------------------------------
-- crear la base de datos y sus respectivas tablas.
-- ------------------------------------------------
DROP DATABASE IF EXISTS taller;
CREATE DATABASE taller;
USE taller;
  CREATE TABLE IF NOT EXISTS TABLA1 (campo1 int,
primary key (campo1))engine=innodb;

CREATE TABLE IF NOT EXISTS TABLA2 (campo1 int, key (campo1),
FOREIGN KEY (campo1) REFERENCES TABLA1 (campo1))ENGINE=innodb;

CREATE TABLE IF NOT EXISTS tabla_errores(mensaje_de_error VARCHAR(120));

-- -----------------------------------------------------------------------
-- en la llave foranea de la tabla 2 se insertarán valores y una consulta.
-- ------------------------------------------------------------------------
USE taller;
INSERT INTO TABLA2 VALUES('8');
SELECT * FROM tabla_errores;

-- ----------------------------------------------------------
-- crear el procedimiento almcacenado.
-- ----------------------------------------------------------
-- Omitir errores
delimiter //
CREATE PROCEDURE sp_handler(parametro INT)
BEGIN
DECLARE EXIT HANDLER FOR 1452
BEGIN
INSERT INTO tabla_errores VALUES (CONCAT('en la fecha: ',CURRENT_DATE,'error en la clave ajena para el valor', parametro, 'no existe parametros'));
end;
INSERT INTO tabla2 VALUES (parametro);
END; //
delimiter ;

CALL sp_handler('8');
SELECT * FROM tabla_errores;

INSERT INTO tabla1 VALUES ('1'),('2'),('3');
SELECT * FROM tabla2;

CALL sp_handler(2);
CALL sp_handler(3);
CALL sp_handler(5);

select * from tabla2;
select * from tabla_errores; 

