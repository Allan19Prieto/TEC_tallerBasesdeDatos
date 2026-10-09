-- Creacion de la base da datos
CREATE DATABASE CursoBD;

COMMENT ON DATABASE CursoBD
	IS 'Base de datos para curso CE3101 Base de datos';

-- creacion de schemas
CREATE SCHEMA Hardware_Stored;

COMMENT ON SCHEMA Hardware_Stored
	IS 'Sistema de Ferreterías';

-- Conculta por la base de datosactual
-- sobrela cualestatrabajando
SELECT current_database();

-- consulta para verificar si el schema se creo
SELECT *
FROM information_schema.schemata
WHERE schema_name = 'hardware_stored';