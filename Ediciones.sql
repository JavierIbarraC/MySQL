DROP DATABASE IF EXISTS RRHH;
CREATE DATABASE IF NOT EXISTS RRHH CHARSET utf8mb4 COLLATE utf8mb4_spanish2_ci;
 
 USE RRHH;
 
 CREATE TABLE Cursos (
 RefCurso int AUTO_INCREMENT,
 Duracion NUMERIC(4) NOT NULL,
 Descripcion VARCHAR(200) NOT NULL,
 CONSTRAINT PK_RefCurso PRIMARY KEY (RefCurso),
 CONSTRAINT CH_Duracion CHECK (Duracion >= 1 AND Duracion <= 2000)
 )
 ENGINE = InnoDB;
 
 CREATE TABLE Empleados (
 NIF VARCHAR (12),
 Nombre VARCHAR (25) NOT NULL,
 Apellido1 VARCHAR (25) NOT NULL,
 Apellido2 VARCHAR (25) NOT NULL,
 FechaNacimiento DATE,
 Salario NUMERIC (6,2) NOT NULL,
 Sexo VARCHAR(6),
 Nacion VARCHAR(50),
 Firma VARCHAR(200),

 CONSTRAINT PK_NIF PRIMARY KEY (NIF),
 CONSTRAINT CH_Salario CHECK (Salario >= 100),
 CONSTRAINT CH_Sexo CHECK (Sexo = "HOMBRE" OR Sexo = "MUJER"),
 CONSTRAINT CH_Nacion CHECK (Nacion = "ESPAÑA"),
 CONSTRAINT CH_Firma CHECK (Firma = "Fichero de Documento")
 )
 ENGINE = InnoDB;
 
 CREATE TABLE Ediciones (
 CodEdicion int AUTO_INCREMENT,
 RefCurso int ,
 Fecha DATE NOT NULL,
 Lugar VARCHAR(100),
 Coste NUMERIC (7,2) NOT NULL,
 NIF_Docente VARCHAR(12) NOT NULL,
 
 CONSTRAINT PK_CodEdicion PRIMARY KEY (CodEdicion),
 CONSTRAINT FK_RefCurso FOREIGN KEY (RefCurso) 
 REFERENCES Cursos (RefCurso) 
 ON DELETE CASCADE,
 CONSTRAINT FK_NIFDocente FOREIGN KEY (NIF_Docente)
 REFERENCES Empleados (NIF)
 ON DELETE CASCADE
 )
 ENGINE = InnoDB;
 
 CREATE TABLE Telefonos(
 NIF_Empleados VARCHAR(12),
 Telefono VARCHAR (11),
 
 CONSTRAINT PK_Telefonos PRIMARY KEY (Telefono),
 CONSTRAINT FK_NIFEmpleados FOREIGN KEY (NIF_Empleados) 
 REFERENCES Empleados (NIF)
 ON DELETE CASCADE
 )
 ENGINE = InnoDB;
 
 CREATE TABLE Capitaciones(
 RefCurso int,
 NIF_Empleados VARCHAR (12),
 
 CONSTRAINT FK_NIFEmpleados FOREIGN KEY (NIF_Empleados) 
 REFERENCES Empleados (NIF)
 ON DELETE CASCADE,
 CONSTRAINT FK_RefCurso FOREIGN KEY (RefCurso) 
 REFERENCES Cursos (RefCurso)
 ON DELETE CASCADE
 )
 ENGINE = InnoDB;
 
CREATE TABLE Prerrequisitos(
 RefCursoARealizar int,
 RefCursoARequisito int,
 Tipo VARCHAR (15) NOT NULL,
 
 CONSTRAINT FK_RefCursoARealizar FOREIGN KEY (RefCursoARealizar) 
 REFERENCES Cursos (RefCurso)
 ON DELETE CASCADE,
 CONSTRAINT FK_RefCursoARequisito FOREIGN KEY (RefCursoARequisito) 
 REFERENCES Cursos (RefCurso)
 ON DELETE CASCADE
 )
 ENGINE = InnoDB;
 
 CREATE TABLE Matriculas(
 NIF_Alumno VARCHAR (12),
 CodEdicion int,
 
 CONSTRAINT FK_NIFAlumno FOREIGN KEY (NIF_Alumno) 
 REFERENCES Empleados (NIF)
 ON DELETE CASCADE,
 CONSTRAINT CodEdicion FOREIGN KEY (CodEdicion) 
 REFERENCES Ediciones (CodEdicion)
 ON DELETE CASCADE
 )
 ENGINE = InnoDB;
 
 
 

 
