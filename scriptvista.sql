create view alumono_clase as 
select
concat_ws(' ',a.nombre,a.apellido) as nombre_alumno,
 c.nombre as nombre_clase
from clasesalumnos cl
inner join clases c on cl.id_clases = c.id_clases
inner join alumnos a on cl.id_alumnos = a.id_alumnos;

create view clase_profesor_actividad as 
select
c.Nombre as nombre_clase,
a.Nombre as nombre_actividad,
concat_ws(' ', p.Nombre,p.Apellido) as nombre_profesor
from gimnasio.clases c
inner join actividad a on c.id_actividad = a.Id_Actividad
inner join profesores p on c.id_profesor = p.id_profesores;

create view edad_alumnos as 
select
concat_ws(' ', a.nombre,a.apellido) as nombre_completo,
a.edad as edad
from alumnos a;

create view datos_profesor as 
select
concat_ws(' ',p.nombre,p.apellido) as nombre_completo,
p.telefono,
p.cuit
from profesores p;

create view catidad_alumnos_clases as 
select 
c.nombre as nombre_clase,
count(cl.id_alumnos) as cantidad_alumnos
from clasesalumnos cl
inner join clases c on cl.id_clases = c.id_clases
group by cl.id_clases;