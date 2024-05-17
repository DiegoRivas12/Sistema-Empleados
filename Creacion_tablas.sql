CREATE DATABASE Sistema_Empleados;

CREATE TABLE Empleado(
	id_empleado INT auto_increment,
    primer_nombre VARCHAR(20),#Mayuscula
    otros_nombres VARCHAR(50),
    primer_apellido VARCHAR(20),
    segundo_apellido VARCHAR(20),
    pais_empleo ENUM('Colombia', 'Estados Unidos') NOT NULL,
	correo_electronico VARCHAR(300),
    estado ENUM('Activo') NOT NULL,
	numero_identificacion VARCHAR(20),
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_empleado)
);


CREATE TABLE Areaa(
	id_empleado INT UNIQUE,
    valor_area ENUM('compras','servicios_varios','infraestructura','financiera','administracion','operacion','talento_humano'),
    foreign key (id_empleado) references Empleado(id_empleado)

);

CREATE TABLE tipoIdentificacion(
	id_empleado INT UNIQUE,
    valor_identificacion ENUM('pasaporte','cedula_ciudadania','cedula_extranjeria','permiso_especial'),
    foreign key (id_empleado) references Empleado(id_empleado)
);

CREATE TABLE fechaIngreso(
	id_fecha_ingreso INT AUTO_INCREMENT,
	id_empleado INT,
    registro_ingreso DATETIME,
    PRIMARY KEY(id_fecha_ingreso),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);