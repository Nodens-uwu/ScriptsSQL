-- El acudiente desea ver el progreso que lleva en la institucion.
use sportcode;
select ti, primero_nombre, segundo_nombre, primero_apellido, segundo_apellido, edad, avances
from usuario inner join edad_usuario on usuario.id=edad_usuario.usuario_id 
inner join jugador on usuario.id=jugador.usuario_id ;


-- El jugador desea ver sus estadisticas y algunos de sus datos.
use sportcode;
select ti, posicion_campo, goles_en_contra, avances
from jugador inner join posicion_jugador on jugador.ti=posicion_jugador.jugador_ti_jugador 
inner join goles_jugador on jugador.ti=goles_jugador.jugador_ti_jugador 
inner join no_goles_jugador on jugador.ti=no_goles_jugador.jugador_ti_jugador ;


-- El entrenador desea ver el progreso del jugador. 
use sportcode;
select ti, numero_de_clase, velocidad, resistencia, fuerza, coordinacion
from entrenador inner join jugador on entrenador.numero_cc=jugador.entrenador_cc_id
inner join rutinas on entrenador.numero_cc=rutinas.entrenador_numero_cc ;


-- El adudiente quiere ver algunas caracteristicas de el o los torneos
use sportcode;
select numero, nombre_torneo, sitio_nombre_parque, horario_entrenamiento, desempeño_equipo
from torneos inner join calendario on torneos.numero=calendario.torneos_numero
inner join resultados on torneos.numero=resultados.torneos_numero ;

-- Consultar información relevante a cerca del usuario
use sportcode;
select  usuario.id, usuario.primero_nombre, usuario.segundo_nombre, usuario.primero_apellido, usuario.segundo_apellido, rol_usuario.tipo_usuario, rol_usuario.descripcion, rol_usuario.contraseña, telefono_usuario.numero_telefono
from usuario inner join rol_usuario on usuario.id=rol_usuario.usuario_id
inner join telefono_usuario on usuario.id=telefono_usuario.usuario_id;
