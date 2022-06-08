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
select concat(nombre,' ',apellido) into nombreapellido from gimnasio.profesores;
RETURN nombreapellido;
END$$

DELIMITER ;
