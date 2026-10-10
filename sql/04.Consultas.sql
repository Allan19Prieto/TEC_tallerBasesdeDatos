-- Consulta 1
select * from hardware_stored.factura;
select * from hardware_stored.cliente;
select * from hardware_stored.detalle_factura;
select * from hardware_stored.producto;

SELECT f.numero_factura, f.fecha, c.nombre_cliente, 
FROM hardware_stored.factura AS f
INNER JOIN hardware_stored.cliente AS c
ON f.id_cliente = c.id_cliente;

-- consulta 2
SELECT f.numero_factura, c.nombre_cliente, p.descripcion, df.cantidad
FROM hardware_stored.factura AS f
INNER JOIN hardware_stored.cliente AS c
ON f.id_cliente = c.id_cliente
INNER JOIN hardware_stored.detalle_factura AS df
ON f.numero_factura = df.numero_factura
INNER JOIN hardware_stored.producto AS p
ON df.id_producto = p.id_producto;

-- Consulta 3
SELECT
    p.descripcion,
    SUM(df.cantidad) as unv
FROM hardware_stored.producto AS p
INNER JOIN hardware_stored.detalle_factura AS df
    ON p.id_producto = df.id_producto
GROUP BY p.descripcion
ORDER BY unv DESC;

-- Consulta 4
SELECT
    c.nombre_cliente,
    SUM(df.cantidad * p.precio) AS total_comprado
FROM hardware_stored.cliente AS c
INNER JOIN hardware_stored.factura AS f
    ON c.id_cliente = f.id_cliente
INNER JOIN hardware_stored.detalle_factura AS df
    ON f.numero_factura = df.numero_factura
INNER JOIN hardware_stored.producto AS p
    ON df.id_producto = p.id_producto
GROUP BY c.nombre_cliente
ORDER BY total_comprado DESC;

--consulta 5
SELECT
    c.id_cliente,
    c.nombre_cliente,
    f.numero_factura
FROM hardware_stored.cliente AS c
LEFT OUTER JOIN hardware_stored.factura AS f
    ON c.id_cliente = f.id_cliente
WHERE f.numero_factura IS NULL;

--Consulta 6
SELECT
    p.descripcion,
    df.cantidad
FROM hardware_stored.detalle_factura AS df
RIGHT OUTER JOIN hardware_stored.producto AS p
    ON df.id_producto = p.id_producto;

-- Consulta 7
WITH ventas_producto AS (
    SELECT
        p.descripcion,
        SUM(df.cantidad) AS total_vendido
    FROM hardware_stored.producto AS p
    INNER JOIN hardware_stored.detalle_factura AS df
        ON p.id_producto = df.id_producto
    GROUP BY p.descripcion
),
promedio AS (
    SELECT
        AVG(total_vendido) AS cantidad_promedio
    FROM ventas_producto
)
SELECT
    descripcion,
    total_vendido
FROM ventas_producto
WHERE total_vendido > (
    SELECT cantidad_promedio
    FROM promedio
)
ORDER BY total_vendido DESC;

select * from hardware_stored.proveedor;
--Reto
WITH compras_cliente AS (
    SELECT
        c.id_cliente,
        c.nombre_cliente,
        COUNT(DISTINCT f.numero_factura) AS cantidad_facturas,
        SUM(df.cantidad * p.precio) AS total_comprado,
        STRING_AGG(
            DISTINCT pr.nombre,
            ', ' ORDER BY pr.nombre
        ) AS proveedores
    FROM hardware_stored.cliente AS c
    INNER JOIN hardware_stored.factura AS f
        ON c.id_cliente = f.id_cliente
    INNER JOIN hardware_stored.detalle_factura AS df
        ON f.numero_factura = df.numero_factura
    INNER JOIN hardware_stored.producto AS p
        ON df.id_producto = p.id_producto
    LEFT JOIN hardware_stored.proveedor AS pr
        ON p.id_proveedor = pr.id_proveedor
    GROUP BY
        c.id_cliente,
        c.nombre_cliente
    HAVING SUM(df.cantidad * p.precio) > 0
)
SELECT
    id_cliente,
    nombre_cliente,
    cantidad_facturas,
    total_comprado,
    proveedores
FROM compras_cliente
WHERE total_comprado > (
    SELECT AVG(total_comprado)
    FROM compras_cliente
)
ORDER BY total_comprado DESC;