use sportcode_;
select id, primero_nombre, segundo_nombre, primero_apellido, segundo_apellido, fecha_nacimiento
from usuario inner join edad_usuario on usuario.id=edad_usuario.usuario_id;

USE `sportcode_`;
DROP procedure IF EXISTS `sp_age`;

DELIMITER $$
USE `sportcode`$$
CREATE PROCEDURE sp_age()
BEGIN

  DECLARE id_ INT;
  DECLARE fecha_ DATE;
  DECLARE var_final INTEGER DEFAULT 0;
  
  DECLARE date_cursor CURSOR FOR SELECT usuario_id, fecha_nacimiento, edad FROM edad_usuario;
  
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final = 1;

  OPEN date_cursor;

  bucle: LOOP

    FETCH date_cursor INTO id, fecha, age;
insert into edad VALUES (CONCAT('la edad es',(datediff(month, @fecha_nacimiento, current_date)/12)));
if (datediff(month, @fecha_nacimiento, current_date)/12<18) then insert edad values ('este acudiente no es valido');
		end if;
    UPDATE edad_usuario SET edad = age WHERE usuario_id = id;

    SELECT
      id AS  'dni',
      fecha AS 'date',
      age AS 'age'
      FROM edad_usuario WHERE usuario_id=id;


  END LOOP bucle;
  CLOSE date_cursor;

END$$

DELIMITER ;
