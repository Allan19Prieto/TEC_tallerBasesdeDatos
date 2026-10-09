CREATE TABLE hardware_stored.ferreteria(
	id_ferreteria INTEGER GENERATED ALWAYS AS IDENTITY,
	nombre VARCHAR(150) NOT NULL,
	slogan VARCHAR(225),
	cedula_juridica CHAR(20) NOT NULL,
	telefono VARCHAR(20) NOT NULL,
	correo VARCHAR(150) NOT NULL,
	pagina_web VARCHAR(150) NOT NULL,
	direccion VARCHAR(200) NOT NULL,
	fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	usuario_creacion VARCHAR(50) NOT NULL DEFAULT CURRENT_USER,

	CONSTRAINT ferreteria_PK
		PRIMARY KEY (id_ferreteria),
	CONSTRAINT cedula_UQ
		UNIQUE (cedula_juridica),
	CONSTRAINT correo_UQ
		UNIQUE (correo)
);

CREATE TABLE hardware_stored.cliente (
	id_cliente CHAR(10),
	nombre_cliente
)