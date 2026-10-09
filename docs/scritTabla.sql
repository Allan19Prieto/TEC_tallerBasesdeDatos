
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
SELECT current_dat