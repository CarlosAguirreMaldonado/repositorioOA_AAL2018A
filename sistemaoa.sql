-- MySQL dump 10.16  Distrib 10.1.31-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: sistemaoa
-- ------------------------------------------------------
-- Server version	10.1.31-MariaDB

create database sistemaoa;

use sistemaoa;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `idAdministrador` int(11) NOT NULL AUTO_INCREMENT,
  `nombreAdmin` varchar(50) NOT NULL,
  `usuarioAdmin` varchar(15) NOT NULL,
  `pwAdmin` varchar(255) NOT NULL,
  PRIMARY KEY (`idAdministrador`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'Administrador','admin','$2y$10$nXfCxVyPD5M8nTsPR3Dk3.tBDBY2WZKrQqFuKXk7pGy/DjPkjNIKC');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Stored Procedures for table 'administrador'
--
-- Select usuario Administrador

DROP procedure IF EXISTS `selectUsuarioAdministrador`;

DELIMITER $$
CREATE PROCEDURE `selectUsuarioAdministrador` (
	IN usuario varchar(15)
)
BEGIN

	SELECT * FROM administrador 
    WHERE usuarioAdmin = usuario;
END$$

DELIMITER ;

-- Select a Administrador

DROP procedure IF EXISTS `seleccionarUnAdministrador`;

DELIMITER $$
CREATE PROCEDURE `seleccionarUnAdministrador` (
	IN idAdministradorN int(11)
)
BEGIN

	SELECT * FROM administrador WHERE idAdministrador = idAdministradorN;
    
END$$

DELIMITER ;

-- Editar Administrador

DROP procedure IF EXISTS `editarAdministrador`;

DELIMITER $$
CREATE PROCEDURE `editarAdministrador` (
	IN nombresAdminN varchar(50),
    IN usuarioAdminN varchar(15),
    IN idAministradorN int(11)
)
BEGIN

	UPDATE administrador SET
                nombreAdmin = nombreAdminN,
                usuarioAdmin = usuarioAdminN
                WHERE idAdministrador = idAdministradorN;
    
END$$

DELIMITER ;

-- Editar password Administrador

DROP procedure IF EXISTS `cambiarPwAdministrador`;

DELIMITER $$
CREATE PROCEDURE `cambiarPwAdministrador` (
	IN pwAdminN varchar(50),
    IN idAministradorN int(11)
)
BEGIN

	UPDATE administrador SET pwAdmin = pwAdminN
    WHERE idAdministrador = idAdministradorN;
    
END$$

DELIMITER ;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera` (
  `idCarrera` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCarrera` varchar(100) NOT NULL,
  `idFacultad` int(11) NOT NULL,
  PRIMARY KEY (`idCarrera`),
  KEY `idFacultad` (`idFacultad`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Física',1),(2,'Matemáticas',1),(3,'Ingeniería Matemática',1),(4,'Ingeniería en Ciencias Económicas y Financieras',1),(5,'Maestría en Física',1),(6,'Ingeniería Empresarial',2),(7,'Ingeniería de la Producción',2),(8,'Maestría en Sistemas de Gestión Integrados',2),(9,'Maestría en Gestión de Talento Humano',2),(10,'Ingeniería Civil',3),(11,'Ingeniería Ambiental',3),(12,'Ingeniería Eléctrica',4),(13,'Ingeniería en Electrónica y Control',4),(14,'Ingeniería en Electrónica y Redes de Información',4),(15,'Ingeniería en Electrónica y Telecomunicaciones',4),(16,'Maestría en Ciencias de Ingeniería Eléctrica',4),(17,'Maestría en Conectividad y Redes de Telecomunicaciones',4),(18,'Maestría en Automatización y Control Electrónico Industrial',4),(19,'Maestría en Administración de Negocios Eléctricos',4),(20,'Maestría en Ingeniería Eléctrica en Distribución',4),(21,'Maestría en Redes Eléctricas Inteligentes',4),(22,'Ingeniería en Geología',5),(23,'Ingeniería en Petróleos',5),(24,'Ingenieria Mecanica',6),(25,'Maestria en Mecatronica y Robotica',6),(26,'Maestria en Sistemas Automotrices',6),(27,'Maestria en Diseño y Simulacion',6),(28,'Programa Doctoral en Ciencias de la Mecanica',6),(29,'Ingeniería Agroindustrial',7),(30,'Ingeniería Química',7),(31,'Ingeniería en Software',8),(32,'Ingeniería en Computación',8),(33,'Ingeniería en Sistemas Informaticos y de Computacion',8),(34,'Maestría y Especialista en Gestión de las Comunicaciones y Tecnología de la Información',8),(35,'Maestría en Ciencias de la Computación',8),(36,'Maestría en Sistemas de Información',8),(37,'Doctorado en Informática',8),(38,'Tecnología en Electrónica y Telecomunicaciones',9),(39,'Tecnología en Análisis de Sistemas Informáticos',9),(40,'Tecnología en Electromecánica',9),(41,'Tecnología en Agua y Saneamiento Ambiental',9);
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Stored Procedures for table carrera
--
-- Select carrera per facultad

-- SP repetido en codigo fuente
DROP procedure IF EXISTS `selectCarreraXFacultad`;

DELIMITER $$
CREATE PROCEDURE `selectCarreraXFacultad` ()
BEGIN

	SELECT c.idCarrera, c.nombreCarrera, f.nombreFacultad 
    FROM carrera c JOIN facultad f 
    ON c.idFacultad = f.idFacultad;
END$$

DELIMITER ;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentario` (
  `idComentario` int(11) NOT NULL AUTO_INCREMENT,
  `detalleComent` text NOT NULL,
  `idOA` int(11) NOT NULL,
  `idProfesor` int(11) NOT NULL,
  PRIMARY KEY (`idComentario`),
  KEY `idOA` (`idOA`),
  KEY `idProfesor` (`idProfesor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Stored procedures for table `comentario`

-- Insert a comentario

DROP procedure IF EXISTS `insertarComentario`;

DELIMITER $$
CREATE PROCEDURE `insertarComentario` (
	IN detalleComentN text,
    IN idOAN int(11),
    IN idProfesorN int(11))
BEGIN

	INSERT INTO comentario (detalleComent, idOA, idProfesor)
            VALUES (detalleComent, idOA, idProfesor);

END$$

DELIMITER ;

-- select comentarioXprofesor

DROP procedure IF EXISTS `seleccionarComentarioXProfesor`;

DELIMITER $$
CREATE PROCEDURE `seleccionarComentarioXProfesor` ()
BEGIN

	SELECT * FROM objetoaprendizaje oa JOIN profesor p ON oa.idProfesor = p.idProfesor;

END$$

DELIMITER ;


-- Insert a seleccionar Comentario De Un Profesor

DROP procedure IF EXISTS `seleccionarComentarioDeUnProfesor`;

DELIMITER $$
CREATE PROCEDURE `seleccionarComentarioDeUnProfesor` (
	IN idOAN int(11))
BEGIN

	SELECT detalleComent, nombresProf, apellidosProf
	FROM comentario c JOIN profesor p
	ON p.idProfesor = c.idProfesor
    WHERE idOA = idOAN;
END$$

DELIMITER ;

-- Delete comentario

DROP procedure IF EXISTS `eliminarComentario`;

DELIMITER $$
CREATE PROCEDURE `eliminarComentario` (
	IN idOAN int(11))
BEGIN

	DELETE FROM comentario WHERE idOA = idOAN;

END$$

DELIMITER ;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `idDepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDepartamento` varchar(100) NOT NULL,
  `idFacultad` int(11) NOT NULL,
  PRIMARY KEY (`idDepartamento`),
  KEY `idFacultad` (`idFacultad`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Departamento de Física (DF)',1),(2,'Departamento de Matemática (DM)',1),(3,'Departamento de Ciencias Administrativas (DEPCA)',2),(4,'Departamento de Estudios Organizacionales Desarrollo Humano (DESODEH)',2),(5,'Departamento de Ingeniería Civil y Ambiental (DICA)',3),(6,'Departamento de Automatización y Control Industrial (DACI)',4),(7,'Departamento de Energía Eléctrica (DEE)',4),(8,'Departamento de Electrónica, Telecomunicaciones y Redes de Información (DETRI)',4),(9,'Departamento de Geología (DG)',5),(10,'Departamento de Petróleos (DP)',5),(11,'Departamento de Ingenieria Mecanica (DIM)',6),(12,'Departamento de Materiales (DMT)',6),(13,'Departamento de Ingeniería Química (DIQ)',7),(14,'Departamento de Ciencias de Alimentos y Biotecnología (DECAB)',7),(15,'Departamento de Ciencias Nucleares (DCN)',7),(16,'Departamento de Metalurgia Extractiva (DEMEX)',7),(17,'Departamento de Informática y Ciencias de la Computación (DICC)',8),(18,'Departamento de Formacion Basica (DFB)',10),(19,'Instituto Geofisico',10),(20,'Departamento de Ciencias Sociales',10);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

-- Stored procedures for table `departamento`

-- Select Despartamento per Facultad

DROP procedure IF EXISTS `seleccionarDepartamentoXFacultad`;

DELIMITER $$
CREATE PROCEDURE `seleccionarDepartamentoXFacultad`()
BEGIN

	SELECT d.idDepartamento, d.nombreDepartamento, f.nombreFacultad 
    FROM departamento d JOIN facultad f 
    ON d.idFacultad = f.idFacultad;

END$$

DELIMITER ;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiante` (
  `idEstudiante` int(11) NOT NULL AUTO_INCREMENT,
  `cedulaEst` varchar(10) NOT NULL,
  `nombresEst` varchar(50) NOT NULL,
  `apellidosEst` varchar(50) NOT NULL,
  `correoEst` varchar(50) NOT NULL,
  `idCarrera` int(11) NOT NULL,
  `usuarioEst` varchar(15) NOT NULL,
  `pwEst` varchar(255) NOT NULL,
  PRIMARY KEY (`idEstudiante`),
  KEY `idCarrera` (`idCarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Stored procedures for table `estudiante`

-- Insert a Estudiante

DROP procedure IF EXISTS `insertarEstudiante`;

DELIMITER $$
CREATE PROCEDURE `insertarEstudiante` (
	IN cedulaE varchar(10),
    IN nombresE varchar(50),
    IN apellidosE varchar(50),
    IN correoE varchar(50),
    IN carreraE int(11),
    IN usuarioE varchar(25), 
    IN passwordE varchar(225))
BEGIN

	INSERT INTO estudiante (cedulaEst, nombresEst, apellidosEst, correoEst, idCarrera, usuarioEst, pwEst)
              VALUES (cedulaE, nombresE, apellidosE, correoE, carreraE, usuarioE, passwordE);

END$$

DELIMITER ;

-- Select usuario Estudiante

DROP procedure IF EXISTS `selectUsuarioEstudiante`;

DELIMITER $$
CREATE PROCEDURE `selectUsuarioEstudiante` (
	IN usuario varchar(15)
)
BEGIN

	SELECT * FROM estudiante 
    WHERE usuarioEst = usuario;
    
END$$

DELIMITER ;

-- Select a Estudiante

DROP procedure IF EXISTS `seleccionarUnEstudiante`;

DELIMITER $$
CREATE PROCEDURE `seleccionarUnEstudiante` (
	IN idEstudianteN int(11)
)
BEGIN

	SELECT * FROM estudiante WHERE idEstudiante = idEstudianteN;
    
END$$

DELIMITER ;

-- Editar Estudiante

DROP procedure IF EXISTS `editarEstudiante`;

DELIMITER $$
CREATE PROCEDURE `editarEstudiante` (
	IN nombresEstN varchar(50),
    IN apellidoEstN varchar(50),
    IN correoEstN varchar(50),
    IN idCarreraN int(11),
    IN usuarioEstN varchar(15),
    IN idEstudianteN int(11)
)
BEGIN

	UPDATE estudiante SET
                nombresEst = nombresEstN,
                apellidosEst = apellidosEstN,
                correoEst = correoEstN,
                idCarrera = idCarreraN,
                usuarioEst = usuarioEstN
                WHERE idEstudiante = idEstudianteN;
    
END$$

DELIMITER ;

-- Editar password Estudiante

DROP procedure IF EXISTS `cambiarPwEstudiante`;

DELIMITER $$
CREATE PROCEDURE `cambiarPwEstudiante` (
	IN pwEstN varchar(50),
    IN idEstudianteN int(11)
)
BEGIN

	UPDATE estudiante SET pwEst = pwEstN
	WHERE idEstudiante = idEstudianteN;
    
END$$

DELIMITER ;

-- Delete estudiante

DROP procedure IF EXISTS `eliminarEstudiante`;

DELIMITER $$
CREATE PROCEDURE `eliminarEstudiante` (
	IN idEstudianteN int(11))
BEGIN

	DELETE FROM estudiante WHERE idEstudiante = idEstudianteN;

END$$

DELIMITER ;

-- Select Estudiante per Carrera

DROP procedure IF EXISTS `seleccionarEstudianteXCarrera`;

DELIMITER $$
CREATE PROCEDURE `seleccionarEstudianteXCarrera`()
BEGIN

	SELECT * FROM estudiante e JOIN carrera c ON e.idCarrera = c.idCarrera;

END$$

DELIMITER ;


--
-- Table structure for table `facultad`
--

DROP TABLE IF EXISTS `facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facultad` (
  `idFacultad` int(11) NOT NULL AUTO_INCREMENT,
  `nombreFacultad` varchar(100) NOT NULL,
  PRIMARY KEY (`idFacultad`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultad`
--

LOCK TABLES `facultad` WRITE;
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
INSERT INTO `facultad` VALUES (1,'Facultad de Ciencias'),(2,'Facultad de Ciencias Administrativas'),(3,'Facultad de Ing. Civil y Ambiental'),(4,'Facultad de Ing. Electrica y Electronica'),(5,'Facultad de Geologia y Petroleos'),(6,'Facultad de Ing. Mecanica'),(7,'Facultad de Ing. Quimica y Agroindustria'),(8,'Facultad de Ing. de Sistemas'),(9,'Escuela de Formacion de Tecnologos'),(10,'Otros');
/*!40000 ALTER TABLE `facultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objetoaprendizaje`
--

DROP TABLE IF EXISTS `objetoaprendizaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objetoaprendizaje` (
  `idOA` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 NOT NULL,
  `autor` varchar(100) CHARACTER SET utf8 NOT NULL,
  `descripcion` varchar(1000) CHARACTER SET utf8 NOT NULL,
  `fecha` date NOT NULL,
  `p_clave` varchar(200) CHARACTER SET utf8 NOT NULL,
  `institucion` varchar(100) CHARACTER SET utf8 NOT NULL,
  `tamano` varchar(100) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `fecha_ing` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ruta_zip` varchar(200) NOT NULL,
  `idProfesor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Stored Procedures for table 'objetoaprendizaje'
--
-- InsertarObjetoAprendizaje

DROP procedure IF EXISTS `insertarOA`;

DELIMITER $$
CREATE PROCEDURE `insertarOA` (
	IN nombreOA varchar(50),
    IN autorOA varchar(100),
    IN descripcionOA varchar(1000),
    IN fechaOA date,
    IN p_claveOA varchar(200),
    IN institucionOA varchar(100),
    IN tamanoOA varchar(100),
    IN tipoOA varchar(10),
    IN ruta_zipOA varchar(200),
    IN idProfesorOA int(11))
BEGIN

	INSERT INTO objetoaprendizaje (nombre, autor, descripcion, fecha, p_clave, institucion, tamano, tipo, ruta_zip, idProfesor)
                VALUES (nombreOA, autorOA, descripcionOA, fechaOA, p_claveOA, institucionOA, tamanoOA, tipoOA, ruta_zipOA, idProfesorOA);
                
END$$

DELIMITER ;

-- Editar Objeto Aprendizaje

DROP procedure IF EXISTS `editarUnOA`;

DELIMITER $$
CREATE PROCEDURE `editarUnOA` (
	IN nombresOA varchar(50),
    IN autorOA varchar(100),
    IN descripcionOA varchar(1000),
    IN fechaOA date,
    IN p_claveOA varchar(200),
    IN institucionOA varchar(100),
    IN idOAN int(11)
)
BEGIN

	UPDATE objetoaprendizaje SET 
                nombre = nombreOA,   
                autor = autorOA,
                descripcion = descripcionOA,
                fecha = fechaOA,
                p_clave = p_claveOA,
                institucion = institucionOA
                WHERE idOA = idOAN;
    
END$$

DELIMITER ;


-- Select a Objeto Aprendizaje

DROP procedure IF EXISTS `seleccionarUnOA`;

DELIMITER $$
CREATE PROCEDURE `seleccionarUnOA` (
	IN idOAN int(11)
)
BEGIN

	SELECT nombre, descripcion, autor, institucion, DATE_FORMAT(fecha,'%Y-%m-%d') as fecha_f, p_clave 
    FROM objetoaprendizaje WHERE idOA = idOAN;    
END$$

DELIMITER ;

-- Delete objeto aprendizaje

DROP procedure IF EXISTS `eliminarOA`;

DELIMITER $$
CREATE PROCEDURE `eliminarOA` (
	IN idOAN int(11))
BEGIN

	DELETE FROM objetoaprendizaje WHERE idOA = idOAN;

END$$

DELIMITER ;

-- Select ruta e id de OAs de un profesor

DROP procedure IF EXISTS `seleccionarRutaOAsProfesor`;

DELIMITER $$
CREATE PROCEDURE `seleccionarRutaOAsProfesor` (
	IN idProfesorOA int(11))
BEGIN

	SELECT idOA, ruta_zip FROM objetoaprendizaje 
    WHERE idProfesor = idProfesorOA;
                
END$$

DELIMITER ;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesor` (
  `idProfesor` int(11) NOT NULL AUTO_INCREMENT,
  `cedulaProf` varchar(10) NOT NULL,
  `nombresProf` varchar(50) NOT NULL,
  `apellidosProf` varchar(50) NOT NULL,
  `correoProf` varchar(50) NOT NULL,
  `idDepartamento` int(11) NOT NULL,
  `usuarioProf` varchar(15) NOT NULL,
  `pwProf` varchar(255) NOT NULL,
  PRIMARY KEY (`idProfesor`),
  KEY `idDepartamento` (`idDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Stored Procedures for table 'profesor'
--
-- InsertarProfesor


DROP procedure IF EXISTS `insertarProfesor`;

DELIMITER $$
CREATE PROCEDURE `insertarProfesor` (
	IN cedulaP varchar(10),
    IN nombresP varchar(50),
    IN apellidosP varchar(50),
    IN correoP varchar(50),
    IN idDep int(11))
BEGIN

	INSERT INTO profesor (cedulaProf, nombresProf, apellidosProf, correoProf, idDepartamento) VALUES (cedulaP, nombresP, apellidosP, correoP, idDep);

END$$

DELIMITER ;

-- Select usuario Profesor

DROP procedure IF EXISTS `selectUsuarioProfesor`;

DELIMITER $$
CREATE PROCEDURE `selectUsuarioProfesor` (
	IN usuario varchar(15)
)
BEGIN

	SELECT * FROM profesor WHERE usuarioProf = usuario;
    
END$$

DELIMITER ;

-- Select a Profesor

DROP procedure IF EXISTS `seleccionarUnProfesor`;

DELIMITER $$
CREATE PROCEDURE `seleccionarUnProfesor` (
	IN idProfesorN int(11)
)
BEGIN

	SELECT * FROM profesor WHERE idProfesor = idProfesorN;
    
END$$

DELIMITER ;

-- Editar Profesor

DROP procedure IF EXISTS `editarProfesor`;

DELIMITER $$
CREATE PROCEDURE `editarProfesor` (
	IN nombresProfN varchar(50),
    IN apellidosProfN varchar(50),
    IN correoProfN varchar(50),
    IN idDepartamentoN int(11),
    IN usuarioProfN varchar(15),
    IN idProfesorN int(11)
)
BEGIN

	UPDATE profesor SET
                nombresProf = nombresProfN,
                apellidosProf = apellidosProfN,
                correoProf = correoProfN,
                idDepartamento = idDepartamentoN,
                usuarioProf = usuarioProfN
                WHERE idProfesor = idProfesorN;
    
END$$

DELIMITER ;

-- Agregar usuario y pw de profesor

DROP procedure IF EXISTS `editarProfesorUsuarioPw`;

DELIMITER $$
CREATE PROCEDURE `editarProfesorUsuarioPw` (
	IN usuarioProfN varchar(15),
    IN pwProfN varchar(255),
    IN idProfesorN int(11)
)
BEGIN

	UPDATE profesor SET
                usuarioProf = usuarioProfN,
                pwProf = pwProfN
                WHERE idProfesor = idProfesorN;
    
END$$

DELIMITER ;

-- cambiar pw de profesor

DROP procedure IF EXISTS `cambiarProfesorPw`;

DELIMITER $$
CREATE PROCEDURE `cambiarProfesorPw` (
	IN pwProfN varchar(255),
    IN idProfesorN int(11)
)
BEGIN

	UPDATE profesor 
    SET pwProf = pwProfN
    WHERE idProfesor = idProfesorN;
    
END$$

DELIMITER ;

-- Delete profesor

DROP procedure IF EXISTS `eliminarProfesor`;

DELIMITER $$
CREATE PROCEDURE `eliminarProfesor` (
	IN idProfesorN int(11))
BEGIN

	DELETE FROM profesor WHERE idProfesor = idProfesorN;

END$$

DELIMITER ;

-- Select Profesor per Departamento sin usuario

DROP procedure IF EXISTS `seleccionarProfesorXDepartamentoSinUsuario`;

DELIMITER $$
CREATE PROCEDURE `seleccionarProfesorXDepartamentoSinUsuario`()
BEGIN

	SELECT idProfesor, cedulaProf, nombresProf, apellidosProf, correoProf, nombreDepartamento 
    FROM profesor p JOIN departamento d ON p.idDepartamento = d.idDepartamento 
    WHERE usuarioProf = '';

END$$

DELIMITER ;

-- Select Profesor per Departamento con usuario

DROP procedure IF EXISTS `seleccionarProfesorXDepartamentoConUsuario`;

DELIMITER $$
CREATE PROCEDURE `seleccionarProfesorXDepartamentoConUsuario`()
BEGIN

	SELECT * FROM profesor p JOIN departamento d ON p.idDepartamento = d.idDepartamento 
    WHERE usuarioProf != '';

END$$

DELIMITER ;

--
-- Table structure for table `rutaoa`
--

DROP TABLE IF EXISTS `rutaoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rutaoa` (
  `idRuta` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) DEFAULT NULL,
  `idOA` int(11) DEFAULT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rutaoa` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idRuta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutaoa`
--

LOCK TABLES `rutaoa` WRITE;
/*!40000 ALTER TABLE `rutaoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `rutaoa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Stored procedures for table `rutaoa`

-- Insert a rutaoa

DROP procedure IF EXISTS `insertarRutaoa`;

DELIMITER $$
CREATE PROCEDURE `insertarRutaoa` (
	IN idUserN int(11),
    IN idOAN int(11),
    IN userNameN varchar(20),
    IN rutaoaN varchar(200))
BEGIN

	INSERT INTO rutaoa (idUser, idOA, username, rutaoa)
                VALUES (idUserN, idOAN, userNameN, rutaoaN);
END$$

DELIMITER ;

-- Select a rutaoa

DROP procedure IF EXISTS `seleccionarRutaoa`;

DELIMITER $$
CREATE PROCEDURE `seleccionarRutaoa` (
	IN idOAN int(11),
    IN idUserN int(11),
    IN userNameN varchar(20))
BEGIN

	SELECT * FROM rutaoa 
    WHERE idOA = idOAN AND idUser = idUserN AND username = userNameN;

END$$

DELIMITER ;

-- Delete rutaoa

DROP procedure IF EXISTS `eliminarRutaoa`;

DELIMITER $$
CREATE PROCEDURE `eliminarRutaoa` (
	IN idUserN int(11),
    IN userNameN varchar(20))
BEGIN

	DELETE FROM rutaoa WHERE idUser = idUserN AND username = userNameN;

END$$

DELIMITER ;


-- Dump completed on 2018-02-20 18:06:13
