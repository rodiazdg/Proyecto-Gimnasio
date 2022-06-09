USE `gimnasio`;
DROP procedure IF EXISTS `ordernarTablaAlumno`;


DELIMITER $$
USE `gimnasio`$$

-- los parametros son: id_alumnos, nombre, apellido, edad, telefono y apellido
-- para el ordenamiento es: ascendente = 1 o descendente =2
CREATE DEFINER=`root`@`localhost` PROCEDURE `ordernarTablaAlumno`(parametro varchar(30), ordenamiento int)
BEGIN
declare consultaorden varchar(50);
declare consulta varchar(30);
declare clausula varchar(100);

if parametro <> '' then
set consultaorden = concat('order by ',parametro);
else
set consultaorden = '';
end if;
if ordenamiento = 1 then
	set consulta = ' asc;';		
else
    set consulta =' desc;';
end if;

select concat('select * from gimnasio.alumnos ',consultaorden,consulta) into clausula;

set @fromclausula = clausula;
prepare runSQL from @fromclausula;
execute runSQL;
deallocate prepare runSQL;

END$$

DELIMITER ;
;



DROP procedure IF EXISTS `registrarProfesor`;


DELIMITER $$
USE `gimnasio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarProfesor`(nombre varchar(100),apellido varchar(100),telefono varchar(50),email varchar(100),direccion varchar(250),cuit varchar(50))
BEGIN
declare consulta varchar(250);
declare consulta2 varchar(350);
declare consulta3 varchar(370);
declare consulta4 varchar(390);
declare clausula varchar(400);

set consulta = 'insert into gimnasio.profesores values (null,';
if nombre <> '' and apellido <> '' and telefono <> '' and email <> '' then
	set consulta2 = concat(consulta,'''',nombre,'''',',','''',apellido,'''',',','''',telefono,'''',',','''',email,'''');
		if direccion <> '' then
			set consulta3 = concat(consulta2,',','''',direccion,'''');
		else
			set consulta3 = concat(consulta2,',null');
		end if;
		if cuit <> '' then
			set consulta4 = concat(consulta3,',','''',cuit,'''');
		else
			set consulta4 = concat(consulta3,',null);');
		end if;
	select consulta4 into clausula;
    set @fromclausula = clausula;
	prepare runSQL from @fromclausula;
	execute runSQL;
	deallocate prepare runSQL;
    
else
select 'los parametros nombre, apellido, telefono y email no pueden estar vacios';
end if;

END$$

DELIMITER ;
;



