DELIMITER $$
#Mayusculas de nombres
create definer=`root`@`localhost` TRIGGER before_empleados_insert
BEFORE INSERT ON Empleado
FOR EACH ROW
BEGIN
    SET NEW.primer_apellido = UPPER(NEW.primer_apellido);
    SET NEW.segundo_apellido = UPPER(NEW.segundo_apellido);
    SET NEW.primer_nombre = UPPER(NEW.primer_nombre);
    SET NEW.otros_nombres = UPPER(NEW.otros_nombres);
END$$
DELIMITER ;

DELIMITER $$
create definer=`root`@`localhost` TRIGGER before_empleados_update
BEFORE UPDATE ON Empleado
FOR EACH ROW
BEGIN
    SET NEW.primer_apellido = UPPER(NEW.primer_apellido);
    SET NEW.segundo_apellido = UPPER(NEW.segundo_apellido);
    SET NEW.primer_nombre = UPPER(NEW.primer_nombre);
    SET NEW.otros_nombres = UPPER(NEW.otros_nombres);
END$$

DELIMITER ;


##Generacion de correo
DELIMITER $$
create definer=`root`@`localhost` TRIGGER before_correo_insert
BEFORE INSERT ON Empleado
FOR EACH ROW
BEGIN
	DECLARE nombreDominio VARCHAR(20);
	DECLARE nombrePais VARCHAR(30);
    DECLARE ID INT;
	IF NEW.primer_nombre IS NOT NULL AND NEW.primer_apellido IS NOT NULL THEN
        SET nombrePais = NEW.pais_empleo;
        SET ID = (SELECT COUNT(*) AS cantidad_filas
						FROM Empleado e1, Empleado e2 
						WHERE e1.primer_nombre = e2.primer_nombre AND e1.otros_nombres = e2.otros_nombres);
        IF nombrePais = 'Colombia' THEN
            SET nombreDominio = 'global.com.co';
        ELSEIF nombrePais = 'Estados Unidos' THEN
            SET nombreDominio = 'global.com.us';
        END IF;
       
        SET NEW.correo_electronico = CONCAT(LOWER(NEW.primer_nombre), '.', LOWER(NEW.primer_apellido), '.', ID, '@', nombreDominio);
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER after_actualizar_correo
AFTER UPDATE ON Empleado
FOR EACH ROW
BEGIN
    DECLARE nombreDominio VARCHAR(20);
    IF @disable_trigger IS NULL THEN
        SET @disable_trigger = 1;

        -- Realizar la actualización
        IF NEW.pais_empleo = 'Colombia' THEN
			SET nombreDominio = 'global.com.co';
		ELSEIF NEW.pais_empleo = 'Estados Unidos' THEN
			SET nombreDominio = 'global.com.us';
		END IF;

		-- Actualiza el correo electrónico si los nombres o apellidos se han modificado
		IF NEW.primer_nombre != OLD.primer_nombre OR NEW.primer_apellido != OLD.primer_apellido THEN
			
			UPDATE Empleado
			SET NEW.correo_electronico = CONCAT(LOWER(NEW.primer_nombre), '.', LOWER(NEW.primer_apellido), '.', NEW.id_empleado, '@', nombreDominio);
			
		END IF;

        -- Reactivar el trigger
        SET @disable_trigger = NULL;
    END IF;
    
END$$

DELIMITER ;
