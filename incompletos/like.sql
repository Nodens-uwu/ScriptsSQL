use mydb;
select id, primero_nombre, segundo_nombre, primero_apellido, segundo_apellido, edad
from usuario inner join edad_usuario on usuario.id=edad_usuario.usuario_id;



-- select * from usuario where primero_nombre not like 'W%';
-- select * from usuario where segundo_nombre not like '%d';
-- select * from usuario where primero_apellido not like'__h%';
-- select * from usuario where segundo_apellido not like '';