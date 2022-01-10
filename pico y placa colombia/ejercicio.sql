USE `sportcode`;
DROP procedure IF EXISTS `ejercicio`.`sp_edad`;

DELIMITER $$
USE `sportcode`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edad`(in fecha_nacimiento date, out edad tinyint)
BEGIN

if dayofweek(fecha) >6 or dayofweek(fecha) <2 then select respuesta='No tiene pico y placa';
end if;
		if dayofmonth(fecha) mod 2!=0 then select respuesta='salen carros pares';
			else select respuesta='salen carros impares';
		end if;
END$$

DELIMITER ;
use ejercicio;
call sp_pico_y_placa('2021-05-12',@respuesta);
