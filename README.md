# Taller de bases de datos con PostgreSQL

## Objetivo

Realizar un taller práctico de bases de datos utilizando PostgreSQL, que permita crear una base de datos, organizar sus objetos mediante esquemas y desarrollar consultas SQL para almacenar, relacionar y analizar información.

## Objetivos específicos

- Crear una base de datos en PostgreSQL.
- Crear esquemas para organizar tablas y otros objetos.
- Definir tablas con tipos de datos y restricciones.
- Establecer relaciones mediante claves primarias y foráneas.
- Insertar, actualizar y eliminar registros.
- Realizar consultas SQL con filtros, ordenamientos, agrupaciones y relaciones entre tablas.

## Herramientas

- PostgreSQL.
- pgAdmin o psql para ejecutar los scripts.
- Git y GitHub para controlar versiones y documentar el taller.

## Estructura del repositorio

```text
taller-postgresql/
├── README.md
├── sql/
│   ├── 01_crear_base_datos.sql
│   ├── 02_crear_esquemas.sql
│   ├── 03_crear_tablas.sql
│   ├── 04_insertar_datos.sql
│   └── 05_consultas.sql
└── docs/
    ├── modelo-relacional.png
    └── resultados.md
```

## Desarrollo del taller

### 1. Crear la base de datos

Crear una base de datos llamada `taller_postgresql`:

```sql
CREATE DATABASE taller_postgresql;
```

### 2. Conectarse a la base de datos

En pgAdmin, abrir una nueva herramienta de consultas sobre
`taller_postgresql`.

En psql, utilizar:

```text
\connect taller_postgresql
```

### 3. Crear los esquemas

Crear los esquemas necesarios para organizar las tablas:

```sql
CREATE SCHEMA taller;
```

Los objetos se identificarán utilizando el nombre del esquema.
Por ejemplo: `taller.clientes`.

### 4. Crear las tablas

Definir las tablas del taller, incluyendo:

- Tipos de datos adecuados.
- Claves primarias (`PRIMARY KEY`).
- Claves foráneas (`FOREIGN KEY`).
- Restricciones como `NOT NULL`, `UNIQUE` y `CHECK`, según corresponda.

### 5. Insertar datos de prueba

Agregar datos ficticios que permitan comprobar las relaciones y
ejecutar las consultas del taller.

### 6. Desarrollar consultas

Resolver los ejercicios utilizando:

- `SELECT` para recuperar información.
- `WHERE` para filtrar registros.
- `ORDER BY` para ordenar resultados.
- `JOIN` para relacionar tablas.
- `GROUP BY` y funciones de agregación para resumir información.
- `HAVING` para filtrar grupos.

Practicar también la modificación de datos mediante `UPDATE` y
`DELETE`.

## Instrucciones de ejecución

1. Clonar o descargar este repositorio.
2. Iniciar PostgreSQL y conectarse al servidor.
3. Ejecutar `sql/01_crear_base_datos.sql` fuera de una transacción.
4. Conectarse a la base de datos `taller_postgresql`.
5. Ejecutar los archivos restantes en este orden:
   - `02_crear_esquemas.sql`.
   - `03_crear_tablas.sql`.
   - `04_insertar_datos.sql`.
   - `05_consultas.sql`.
6. Revisar los resultados de cada consulta.

> Los scripts de creación están pensados para ejecutarse inicialmente
> sobre una base de datos nueva. Repetirlos puede generar errores si
> los objetos ya existen.

## Documentación de los ejercicios

Para cada ejercicio, registrar en `docs/resultados.md`:

1. Enunciado del ejercicio.
2. Consulta SQL utilizada.
3. Explicación breve de la solución.
4. Resultado obtenido o captura de pantalla.

## Entregables

- Scripts SQL de creación de la base de datos, esquemas y tablas.
- Script de inserción de datos de prueba.
- Consultas SQL que resuelven los ejercicios.
- Diagrama del modelo relacional.
- Documentación de los resultados.

## Criterios de verificación

- La base de datos y los esquemas se crean correctamente.
- Las tablas tienen claves y restricciones adecuadas.
- Los datos respetan las relaciones definidas.
- Las consultas producen los resultados solicitados.
- Los scripts se pueden ejecutar siguiendo las instrucciones.
