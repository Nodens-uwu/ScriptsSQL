-- -------------------------------------------------------------------
-- Ejecutar el procedimiento almacenado aquí
-- -------------------------------------------------------------------

-- Saber si una persona es mayor o menor de edad.

USE `sportcode`;
DROP procedure IF EXISTS `sp_age`;

USE `sportcode`;
DROP procedure IF EXISTS `sportcode`.`sp_age`;
;

DELIMITER $$
USE `sportcode_`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_age`(in fecha datetime, out edad char(45))

BEGIN

if datediff(curdate(), @fecha)<6574 then select edad='acudiente no apto';
	else if datediff(curdate(), @fecha)>6574 then select edad='acudiente apto';
		else select edad='Ha ocurrido un error';
	end if;
end if;

END$$

DELIMITER ;
;

-- -------------------------------------------------------------------
-- Ejecutar aquí poniendole un valor a set @fecha
-- -------------------------------------------------------------------
set @fecha = '2002-09-18';
call sportcode.sp_age(@fecha, @edad);
