CREATE DATABASE  IF NOT EXISTS `gimnasio`;
USE `gimnasio`;


CREATE TABLE `actividad` (
  `Id_Actividad` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_Actividad`)
);
 
CREATE TABLE `alumnos` (
  `id_alumnos` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `edad` int DEFAULT NULL,
  `telefono` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_alumnos`)
);

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
);

CREATE TABLE `clasesalumnos` (
  `id_clasesalumnos` int NOT NULL AUTO_INCREMENT,
  `id_clases` int NOT NULL,
  `id_alumnos` int NOT NULL,
  PRIMARY KEY (`id_clasesalumnos`),
  KEY `id_clases_idx` (`id_clases`),
  KEY `id_alumnos_idx` (`id_alumnos`),
  CONSTRAINT `id_alumnos` FOREIGN KEY (`id_alumnos`) REFERENCES `alumnos` (`id_alumnos`),
  CONSTRAINT `id_clases` FOREIGN KEY (`id_clases`) REFERENCES `clases` (`id_clases`)
);

CREATE TABLE `profesores` (
  `id_profesores` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `cuit` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_profesores`)
);
