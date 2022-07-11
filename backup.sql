
/* BACKUP DE BD GIMNASIO 
	TABLAS:
	ACTIVIDAD
	ALUMNOS
	CLASES
	CLASESALUMNOS
	LOG_PROFESOR
	PROFESORES
	
	VISTAS:
	ALUMONO_CLASE
	CATIDAD_ALUMNOS_CLASES
	CLASE_PROFESOR_ACTIVIDAD
	DATOS_PROFESOR
	EDAD_ALUMNOS

	STORE PROCEDURE:
	ORDENARtABLAaLUMNOS
	REGISTRARpROFESOR
*/

-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: gimnasio
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actividad`
--

DROP TABLE IF EXISTS `actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividad` (
  `Id_Actividad` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_Actividad`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad`
--

LOCK TABLES `actividad` WRITE;
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT INTO `actividad` VALUES (1,'YOGA'),(2,'MMA'),(3,'PILATES REFORMER'),(4,'MUSCULACION'),(5,'ZUMBA'),(6,'MINI TRAMP');
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `id_alumnos` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `edad` int DEFAULT NULL,
  `telefono` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_alumnos`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (1,'MARIANO','FREIRES',28,'3512427078','FREIRESMARIANO@GMAIL.COM'),(2,'ROCIO','DIAZ',26,'3512300221','DIAZRO96@GMAIL.COM'),(3,'MARIANA','GABBANI',52,'3512457863','GABBANIMARIANA@GMAIL.COM'),(4,'ROSSANA','OLMOS',55,'3512286363','OLMOSROSSANA12@GMAIL.COM');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `alumono_clase`
--

DROP TABLE IF EXISTS `alumono_clase`;
/*!50001 DROP VIEW IF EXISTS `alumono_clase`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alumono_clase` AS SELECT 
 1 AS `nombre_alumno`,
 1 AS `nombre_clase`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `catidad_alumnos_clases`
--

DROP TABLE IF EXISTS `catidad_alumnos_clases`;
/*!50001 DROP VIEW IF EXISTS `catidad_alumnos_clases`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `catidad_alumnos_clases` AS SELECT 
 1 AS `nombre_clase`,
 1 AS `cantidad_alumnos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `clase_profesor_actividad`
--

DROP TABLE IF EXISTS `clase_profesor_actividad`;
/*!50001 DROP VIEW IF EXISTS `clase_profesor_actividad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clase_profesor_actividad` AS SELECT 
 1 AS `nombre_clase`,
 1 AS `nombre_actividad`,
 1 AS `nombre_profesor`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `clases`
--

DROP TABLE IF EXISTS `clases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clases` (
  `id_clases` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `id_actividad` int NOT NULL,
  `id_profesor` int NOT NULL,
  PRIMARY KEY (`id_clases`),
  KEY `id_actividad_idx` (`id_actividad`),
  KEY `id_profesor_idx` (`id_profesor`),
  CONSTRAINT `id_actividad` FOREIGN KEY (`id_actividad`) REFERENCES `actividad` (`Id_Actividad`),
  CONSTRAINT `id_profesor` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesores`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clases`
--

LOCK TABLES `clases` WRITE;
/*!40000 ALTER TABLE `clases` DISABLE KEYS */;
INSERT INTO `clases` VALUES (1,'MUSCULACION 1',4,3),(2,'YOGA PARA ADULTOS',1,2),(3,'ZUMBA',5,2);
/*!40000 ALTER TABLE `clases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clasesalumnos`
--

DROP TABLE IF EXISTS `clasesalumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clasesalumnos` (
  `id_clasesalumnos` int NOT NULL AUTO_INCREMENT,
  `id_clases` int NOT NULL,
  `id_alumnos` int NOT NULL,
  PRIMARY KEY (`id_clasesalumnos`),
  KEY `id_clases_idx` (`id_clases`),
  KEY `id_alumnos_idx` (`id_alumnos`),
  CONSTRAINT `id_alumnos` FOREIGN KEY (`id_alumnos`) REFERENCES `alumnos` (`id_alumnos`),
  CONSTRAINT `id_clases` FOREIGN KEY (`id_clases`) REFERENCES `clases` (`id_clases`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clasesalumnos`
--

LOCK TABLES `clasesalumnos` WRITE;
/*!40000 ALTER TABLE `clasesalumnos` DISABLE KEYS */;
INSERT INTO `clasesalumnos` VALUES (1,1,1),(2,2,3),(3,2,4),(4,3,2);
/*!40000 ALTER TABLE `clasesalumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `datos_profesor`
--

DROP TABLE IF EXISTS `datos_profesor`;
/*!50001 DROP VIEW IF EXISTS `datos_profesor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `datos_profesor` AS SELECT 
 1 AS `nombre_completo`,
 1 AS `telefono`,
 1 AS `cuit`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `edad_alumnos`
--

DROP TABLE IF EXISTS `edad_alumnos`;
/*!50001 DROP VIEW IF EXISTS `edad_alumnos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `edad_alumnos` AS SELECT 
 1 AS `nombre_completo`,
 1 AS `edad`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `log_profesor`
--

DROP TABLE IF EXISTS `log_profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_profesor` (
  `id_profesor` int DEFAULT NULL,
  `cambios` varchar(250) DEFAULT NULL,
  `fecha_cambios` timestamp NULL DEFAULT NULL,
  `tiempo_cambio` timestamp NULL DEFAULT NULL,
  `usuario_log` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_profesor`
--

LOCK TABLES `log_profesor` WRITE;
/*!40000 ALTER TABLE `log_profesor` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores` (
  `id_profesores` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `cuit` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_profesores`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (1,'OSCAR','FERNANDEZ','351785632','OSCARLARENGA56@GMAIL.COM','AVENIDA LA PATRIA 887 BARRIO SUIZO','20-27870963-8'),(2,'SOFIA','SOSA','351895632','OSCARLARENGA56@GMAIL.COM','LOS AROMOS 89 BARRIO JESUITA','27-37850654-7'),(3,'AGUSTIN','SANTANOCETO','351454982','LABALASANTONOCETO@GMAIL.COM','PUBLICA B 6105 BARRIO CARCANO','20-32456784-8'),(4,'mariano','perez','3212345465','marperez3gmail.com',NULL,NULL);
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gimnasio'
--
/*!50003 DROP FUNCTION IF EXISTS `cantidad de alumnos inscriptos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cantidad de alumnos inscriptos`(cursoId int) RETURNS int
    READS SQL DATA
BEGIN
declare cantidad int;

select count(*) into cantidad from gimmnasio.clasesalumnos where id_clases = cursoId;
RETURN cantidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cantidad_alumnos_inscriptos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cantidad_alumnos_inscriptos`(cursoId int) RETURNS int
    READS SQL DATA
BEGIN
declare cantidad int;

select count(*) into cantidad from gimnasio.clasesalumnos where id_clases = cursoId;
RETURN cantidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `nombre_profesor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `nombre_profesor`(cursoId int) RETURNS varchar(200) CHARSET utf8mb4
    READS SQL DATA
BEGIN
declare nombreapellido varchar(200);
select concat(p.nombre,' ',p.apellido) into nombreapellido from gimnasio.clases c
inner join gimnasio.profesores p on c.id_profesor = p.id_profesores
where id_clases = cursoId;
RETURN nombreapellido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ordernarTablaAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrarProfesor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `alumono_clase`
--

/*!50001 DROP VIEW IF EXISTS `alumono_clase`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alumono_clase` AS select concat_ws(' ',`a`.`nombre`,`a`.`apellido`) AS `nombre_alumno`,`c`.`nombre` AS `nombre_clase` from ((`clasesalumnos` `cl` join `clases` `c` on((`cl`.`id_clases` = `c`.`id_clases`))) join `alumnos` `a` on((`cl`.`id_alumnos` = `a`.`id_alumnos`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `catidad_alumnos_clases`
--

/*!50001 DROP VIEW IF EXISTS `catidad_alumnos_clases`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `catidad_alumnos_clases` AS select `c`.`nombre` AS `nombre_clase`,count(`cl`.`id_alumnos`) AS `cantidad_alumnos` from (`clasesalumnos` `cl` join `clases` `c` on((`cl`.`id_clases` = `c`.`id_clases`))) group by `cl`.`id_clases` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `clase_profesor_actividad`
--

/*!50001 DROP VIEW IF EXISTS `clase_profesor_actividad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clase_profesor_actividad` AS select `c`.`nombre` AS `nombre_clase`,`a`.`Nombre` AS `nombre_actividad`,concat_ws(' ',`p`.`nombre`,`p`.`apellido`) AS `nombre_profesor` from ((`clases` `c` join `actividad` `a` on((`c`.`id_actividad` = `a`.`Id_Actividad`))) join `profesores` `p` on((`c`.`id_profesor` = `p`.`id_profesores`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `datos_profesor`
--

/*!50001 DROP VIEW IF EXISTS `datos_profesor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `datos_profesor` AS select concat_ws(' ',`p`.`nombre`,`p`.`apellido`) AS `nombre_completo`,`p`.`telefono` AS `telefono`,`p`.`cuit` AS `cuit` from `profesores` `p` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `edad_alumnos`
--

/*!50001 DROP VIEW IF EXISTS `edad_alumnos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `edad_alumnos` AS select concat_ws(' ',`a`.`nombre`,`a`.`apellido`) AS `nombre_completo`,`a`.`edad` AS `edad` from `alumnos` `a` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


