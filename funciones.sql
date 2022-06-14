USE `gimnasio`;
DROP function IF EXISTS `cantidad_alumnos_inscriptos`;

DELIMITER $$
USE `gimnasio`$$
CREATE FUNCTION `cantidad de alumnos inscriptos` (cursoId int)
RETURNS INTEGER
READS SQL DATA
BEGIN
declare cantidad int;

select count(*) into cantidad from gimnasio.clasesalumnos where id_clases = cursoId;
RETURN cantidad;
END$$

DELIMITER ;


DROP function IF EXISTS `nombre_profesor`;

DELIMITER $$
USE `gimnasio`$$
CREATE FUNCTION `nombre_profesor` (cursoId int)
RETURNS varchar(200)
reads sql data
BEGIN
declare nombreapellido varchar(200);
select concat(p.nombre,' ',p.apellido) into nombreapellido from gimnasio.clases c
inner join gimnasio.profesores p on c.id_profesor = p.id_profesores
where id_clases = cursoId;
RETURN nombreapellido;
END$$

DELIMITER ;
