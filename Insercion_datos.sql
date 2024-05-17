INSERT INTO Empleado (
    id_empleado ,
    primer_nombre ,#Mayuscula
    otros_nombres ,
    primer_apellido ,
    segundo_apellido ,
    pais_empleo,
	correo_electronico ,
    estado  ,
	numero_identificacion 
) VALUES (
	NULL,
    'Juan',
    'Carlos',
    'Perez',
    'Montoya',
    'Colombia',
    ' ',
    'Activo',
    '123ASD'
    
);


INSERT INTO Empleado (
    id_empleado ,
    primer_nombre ,#Mayuscula
    otros_nombres ,
    primer_apellido ,
    segundo_apellido ,
    pais_empleo,
	correo_electronico ,
    estado  ,
	numero_identificacion 
) VALUES (
	NULL,
    'Juan',
    'Felipe',
    'Perez',
    'Gomez',
    'Colombia',
    ' ',
    'Activo',
    '123ASD'
);

INSERT INTO Empleado (
    id_empleado ,
    primer_nombre ,#Mayuscula
    otros_nombres ,
    primer_apellido ,
    segundo_apellido ,
    pais_empleo,
	correo_electronico ,
    estado  ,
	numero_identificacion 
) VALUES (
	NULL,
    'Juan',
    'David',
    'Perez',
    'Jimenez',
    'Estados Unidos',
    ' ',
    'Activo',
    '123ASD'
);

INSERT INTO Empleado (
    id_empleado ,
    primer_nombre ,#Mayuscula
    otros_nombres ,
    primer_apellido ,
    segundo_apellido ,
    pais_empleo,
	correo_electronico ,
    estado  ,
	numero_identificacion
) VALUES (
	NULL,
    'Juan',
    'Andres',
    'Perez',
    'Calle',
    'Colombia',
    ' ',#CORREO
    'Activo',
    '123ASD'
);


select *from Empleado;
#DROP DATABASE Sistema_Empleados;
UPDATE Empleado
SET primer_nombre = 'pedrito'
WHERE id_empleado = 1;
select *from Empleado;

select* from Empleado e1, Empleado e2 WHERE e1.primer_nombre = e2.primer_nombre and e1.otros_nombres = e2.otros_nombres; 