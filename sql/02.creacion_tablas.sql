-- creacion de tabla ferreteria
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

-- creacion de tabla clientes 
CREATE TABLE hardware_stored.cliente (
	id_cliente CHAR(10),
	nombre_cliente VARCHAR(200) NOT NULL,
	telefono CHAR(30),
	correo VARCHAR(255),
	direccion TEXT,
	fecha_creacion  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	usuario_creacion VARCHAR(50) NOT NULL DEFAULT CURRENT_USER,
	CONSTRAINT cliente_PK
		PRIMARY KEY (id_cliente)		
);

COMMENT ON TABLE hardware_stored.cliente IS
'Tabla que almacena la informacion de contacto de los clientes corporativos de la organización';
COMMENT ON COLUMN hardware_stored.cliente.id_cliente IS
'LLave primaria de la tabla';
COMMENT ON COLUMN hardware_stored.cliente.nombre_cliente IS
'nombre legal del cliente';
COMMENT ON COLUMN hardware_stored.cliente.telefono IS
'numero telefonico incluyendo código del pais cuando corresponda';
COMMENT ON COLUMN hardware_stored.cliente.correo IS
'Para comunicaciones comerciales y operativas';
COMMENT ON COLUMN hardware_stored.cliente.direccion IS
'direccion física del cliente con fines de contacto';
COMMENT ON COLUMN hardware_stored.cliente.fecha_creacion IS
'fecha y hora en la que el registro fue creado en la tabla';


CREATE TABLE hardware_stored.factura (
	numero_factura CHAR(20) NOT NULL,
	consecutivo INTEGER NOT NULL,
	fecha DATE NOT NULL,
	id_cliente CHAR(10) NOT NULL,
	id_condiciones CHAR(5) NOT NULL,
	fecha_vencimineto DATE,
	id_medio_pago INTEGER NOT NULL,
	observaciones TEXT,
	CONSTRAINT factura_PK
		PRIMARY KEY (numero_factura)
);

ALTER TABLE hardware_stored.factura
	ADD CONSTRAINT cliente_factura_PK
		FOREIGN KEY (id_cliente)
		REFERENCES hardware_stored.cliente(id_cliente);

CREATE TABLE hardware_stored.condicion (
	id_condicion CHAR(5) NOT NULL,
	descripcion VARCHAR(150),
	CONSTRAINT condicion_PK
		PRIMARY KEY (id_condicion)
);

ALTER TABLE hardware_stored.factura
	ADD CONSTRAINT condicion_factura_PK
		FOREIGN KEY (id_condiciones)
		REFERENCES hardware_stored.condicion(id_condicion);

CREATE TABLE hardware_stored.medio_pago (
	id_medio_pago INTEGER NOT NULL,
	descripcion VARCHAR(150),
	CONSTRAINT id_medio_pago_PK
		PRIMARY KEY (id_medio_pago)
);

ALTER TABLE hardware_stored.factura
	ADD CONSTRAINT medio_pago_factura_PK
		FOREIGN KEY (id_medio_pago)
		REFERENCES hardware_stored.medio_pago(id_medio_pago);

CREATE TABLE hardware_stored.proveedor (
	id_proveedor CHAR(5) NOT NULL,
	nombre VARCHAR(150),
	direccion TEXT,
	CONSTRAINT id_proveedor_PK
		PRIMARY KEY (id_proveedor)
);

CREATE TABLE hardware_stored.producto (
	id_producto INTEGER NOT NULL,
	id_proveedor CHAR(5) NOT NULL,
	descripcion VARCHAR(150),
	precio DECIMAL(13,2) NOT NULL,
	iva DECIMAL(4,2) NOT NULL,
	descunto DECIMAL(13,2) NOT NULL,
	CONSTRAINT id_producto_PK
		PRIMARY KEY (id_producto)
);

ALTER TABLE hardware_stored.producto
	ADD CONSTRAINT proveedor_producto_PK
		FOREIGN KEY (id_proveedor)
		REFERENCES hardware_stored.proveedor(id_proveedor);
		
CREATE TABLE hardware_stored.detalle_factura (
	numero_factura CHAR(20) NOT NULL,
	id_producto INTEGER NOT NULL,
	cantidad INTEGER NOT NULL,
	CONSTRAINT detalle_factura_PK
		PRIMARY KEY (numero_factura,id_producto)
);




