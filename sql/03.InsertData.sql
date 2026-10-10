Insert INTO hardware_stored.ferreteria (
	nombre,
	slogan,
	cedula_juridica,
	telefono,
	correo,
	pagina_web,
	direccion
)
VALUES
(
	'Ferretería Valle Central S.A.',
	'Construyendo el futuro de Costa Rica',
	'3-101-654321',
	'(506) 2222-1234',
	'info@fervalcr.com',
	'www.fervalcr.com',
	'San José, Costa Rica'
),
(
	'FerreTec S.A.',
	'Tecnología Ferretera de Costa Rica',
	'3-101-123456',
	'(506) 3333-9876',
	'Cotiza@tecfer.com',
	'www.tecfer.com',
	'Cartago, Costa Rica'
),
(
	'Ferretería El Constructor',
	'Todo para construir',
	'310112233',
	'2222-1111',
	'info@constructor.com',
	'www.constructor.com',
	'Cartago'
);

Insert INTO hardware_stored.cliente (
	id_cliente,
	nombre_cliente,
	telefono,
	correo,
	direccion
)
VALUES
(
	'HORIZ00001',
	'Constructora Horizonte S.A.',
	'(506) 8888-5566',
	'compras@constructorahorizonte.cr',
	'Del Banco de Costa Rica 200 metros al norte, Edificio Torre Azul, Piso 3, Oficina 305, San José, Costa Rica'
),
(
	'INFOI00001',
	'Compañía InfoIA S.A.',
	'(506) 8991-3684',
	'Operaciones@InfoIA.com',
	'Del TEC, 2 Kilómetros Sur, Edificio MonteZur, Oficina 333, Cartago, Costa Rica'
),
(
	'1',
	'Juan Pérez',
	'88881111',
	'juan@gmail.com',
	'Cartago'
),
(
	'2',
	'María López',
	'88882222',
	'maria@gmail.com',
	'San José'
),
(
	'3',
	'Carlos Rodríguez',
	'88883333',
	'carlos@gmail.com',
	'Heredia'
),
(
	'4',
	'Ana Vargas',
	'88884444',
	'ana@gmail.com',
	'Alajuela'
);

Insert into hardware_stored.condicion
(id_condicion, descripcion)
values
('1','Crédito a 30 días'),
('2','Crédito a 60 días'),
('3','Contado');

INSERT INTO hardware_stored.medio_pago
(id_medio_pago, descripcion)
VALUES
(1, 'Transferencia Bancaria'),
(2, 'SINPE Móvil'),
(3, 'Efectivo'),
(4, 'Tarjeta Crédito'),
(5, 'Transferencia Internacional');

INSERT INTO hardware_stored.factura
(numero_factura, consecutivo, fecha, id_cliente, id_condiciones,
fecha_vencimineto, id_medio_pago, observaciones)
VALUES
('001-00012345', 12345, '2024-05-22', 'HORIZ00001', '1', '2024-06-21', 1, 'Agradecemos su preferencia'),
('333-00098765', 98765, '2026-08-29', 'INFOI00001', '2', '2026-10-20', 2, 'Cliente preferencial'),
('1001', 1001, '2026-09-17', '1', '3', '2026-10-15', 1, 'Venta mostrador'),
('1002', 1002, '2026-09-17', '2', '2', '2026-10-15', 2, 'Cliente frecuente'),
('1003', 1003, '2026-09-17', '3', '1', '2026-10-15', 3, 'Proyecto construcción');

INSERT INTO hardware_stored.proveedor (id_proveedor, nombre, direccion)
VALUES
(10001, 'Tu Proveedor Favorito S.A.', 'Cartago, Costa Rica'),
(10002, 'Herramientas y mucho más S.A.', 'San José, Costa Rica'),
(1, 'CEMEX', 'San José'),
(2, 'Holcim', 'Cartago'),
(3, 'Construmarket', 'Alajuela');

INSERT INTO hardware_stored.producto
(id_producto, id_proveedor, descripcion, precio, iva, descunto)
VALUES
(333, 10001, 'Cemento Holcim Fuerte 50 kg', 6500.00, 13.00, 0.00),
(854, 10001, 'Varilla de hierro #3 (6 m)', 4200.00, 13.00, 0.00),
(57, 10001, 'Block de Concreto 12x20x40', 890.00, 13.00, 0.00),
(274, 10002, 'Pintura Látex Blanca 180 L', 28750.00, 13.00, 1437.50),
(176, 10002, 'Tubo PVC 1/2''(6m)"', 1850.00, 13.00, 0.00),
(1, 1, 'Cemento Gris 50kg', 8500.00, 13.00, 0.00),
(2, 2, 'Varilla #3', 4500.00, 13.00, 5.00),
(3, 2, 'Varilla #4', 6200.00, 13.00, 3.00),
(4, 3, 'Pintura Blanca Galón', 12000.00, 13.00, 10.00),
(5, 3, 'Martillo Profesional', 9500.00, 13.00, 0.00);

INSERT INTO hardware_stored.detalle_factura
(numero_factura, id_producto, cantidad)
VALUES
('001-00012345', 333, 20),
('001-00012345', 854, 15),
('001-00012345', 57, 100),
('001-00012345', 274, 5),
('001-00012345', 176, 25),
('1001', 1, 5),
('1001', 5, 1),
('1002', 2, 10),
('1002', 3, 8),
('1003', 1, 20),
('1003', 4, 5),
('1003', 5, 2);
