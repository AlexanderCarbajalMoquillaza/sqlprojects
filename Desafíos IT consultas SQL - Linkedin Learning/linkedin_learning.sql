/*
-----CINE-----
*/
SELECT * FROM cine ;
SELECT * FROM cartelera ORDER BY id_cine asc;
SELECT * FROM pelicula GROUP BY id;

/*
----1.1 peliculas solo en cartelera-----
*/
SELECT DISTINCT pe.nombre AS nom_pelicula, pe.id AS id_pelicula,ca.id_pelicula AS id_peli,ca.id_cine AS id_cine FROM pelicula AS pe
left JOIN cartelera AS ca 
ON pe.id = ca.id_pelicula
GROUP BY pe.id 
having ca.id_pelicula IS NOT NULL; 

/*
--1.2 peliculas que tengan clasificacion para todas las edades--
*/
SELECT * FROM pelicula WHERE clasificacion_edad IS NOT NULL; 

SELECT *, case 
when clasificacion_edad is not null then clasificacion_edad 
when clasificacion_edad IS null then 0
END AS clasificacion_edad2
FROM pelicula


UPDATE pelicula
SET clasificacion_edad = 0
WHERE clasificacion_edad IS NULL; 

/*
--1.3 --¿cuales son las peliculas con clasificacion general? ---
*/
SELECT DISTINCT pe1.id, pe1.nombre AS nom_pelicula FROM pelicula AS pe1
inner JOIN cartelera AS ca 
ON pe1.id = ca.id_pelicula
WHERE  pe1.clasificacion_edad = 0; 

/*
--1.4 crear una lista con los cines disponibles en el momento---
*/
SELECT DISTINCT c.* FROM cine AS c
inner JOIN cartelera AS ca
ON c.id = ca.id_cine
;

/*
--1.5 ¿que pelicula se está proyectando en cada cine?--
*/
SELECT c1.id_cine,c1.id_pelicula,ci.nombre,ci.estado,ci.pais,p1.nombre,p1.clasificacion_edad FROM cartelera AS c1
JOIN cine as ci 
ON c1.id_cine = ci.id
JOIN pelicula AS p1 
ON c1.id_pelicula = p1.id


/*
--1.6 Actualizar la base de datos, eliminando los cines NO disponibles.---
*/
SELECT * FROM cine;
DELETE FROM cine
WHERE id IN (
SELECT c.id FROM cine AS c
LEFT JOIN cartelera AS ca3
ON c.id = ca3.id_cine
WHERE ca3.id_cine IS NULL); 

/*
--1.7 Generar lista de peliculas y sus cines disponibles en dublin
*/ 
SELECT c.*, pee.nombre FROM cine AS c
inner JOIN cartelera AS ca
ON c.id = ca.id_cine
INNER JOIN pelicula AS pee
ON ca.id_pelicula = pee.id
WHERE c.estado LIKE 'Dublin' AND c.pais LIKE 'Irlanda';

/*
--1.8 incluir la tabla de genero de las peliculas
*/ 
CREATE TABLE genero(
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100)

)

INSERT INTO genero(nombre) VALUES ('Acción'), ('Aventura'), ('Ciencia Ficción'), ('Comedia'), ('Drama'), ('Fantasia'), ('Suspenso'), ('Terror');
SELECT * FROM genero;

/*
--1.9 Agregar el campo id_genero a la tabla de peliculas
*/
SELECT * FROM pelicula;

ALTER TABLE pelicula
ADD COLUMN  id_genero INT; 


ALTER TABLE cine.pelicula ADD CONSTRAINT fk_id_genero FOREIGN KEY (id_genero) REFERENCES cine.genero(id);

/*
--1 a 10: Terror
*/
UPDATE pelicula
SET id_genero = 8
WHERE id BETWEEN 1 AND 10;

/*
--11 a 20: ciencia ficcion
*/
UPDATE pelicula
SET id_genero = 3
WHERE id BETWEEN 11 AND 20;

/*
--21 a 45: Comedia
*/
UPDATE pelicula
SET id_genero = 4
WHERE id BETWEEN 21 AND 45;

/*
--46 a 55: Suspenso
*/
UPDATE pelicula
SET id_genero = 7
WHERE id BETWEEN 46 AND 55;

/*
--demas acción: 56 a 75
*/
UPDATE pelicula
SET id_genero = 1
WHERE id BETWEEN 56 AND 75;

/*
--1.10 Peliculas de suspenso, clasificacion mayor a 18, ciudad de madrid---
*/
SELECT peli.nombre AS nombre_pelicula, peli.clasificacion_edad,cin.nombre AS nombre_cine, cin.estado, gen.nombre AS genero FROM pelicula AS peli
JOIN cartelera AS carte
ON peli.id = carte.id_pelicula
JOIN cine AS cin
ON carte.id_cine = cin.id
JOIN genero AS gen
ON peli.id_genero = gen.id
WHERE cin.estado LIKE 'Madrid' AND peli.id_genero = 7 AND peli.clasificacion_edad >= 18;



/*
-----BICICLETA-----
*/
SELECT * FROM bicicleta.categoria;
SELECT * FROM bicicleta.cliente;
SELECT * FROM bicicleta.detalle_factura;
SELECT * FROM bicicleta.empleado;
SELECT * FROM bicicleta.factura;
SELECT * FROM bicicleta.marca;
SELECT* FROM bicicleta.producto;

/*
--2.1. Generar una lista de todas las bicicletas de tipo montaña que no pertenezcan a la marca Escoza
*/
SELECT pr.nombre AS nombre_bici, pr.precio AS precio,ma.nombre AS marca ,ca.nombre AS categoria FROM producto AS pr
JOIN marca AS ma 
ON pr.id_marca = ma.id
JOIN categoria AS ca
ON pr.id_categoria = ca.id
WHERE ca.nombre LIKE '%Montaña%' AND ma.id <> 2; 

/*
--2.2. Generar una lista de bicicletas con rango de precio entre $400 y $600
*/
SELECT * FROM producto
WHERE precio BETWEEN 400 AND 600
ORDER BY precio;

/*
--2.3. Descubrir que bicicletas tienen un precio por encima del promedio de los demas
*/
SELECT * FROM producto
WHERE precio > (SELECT AVG(precio) FROM producto);


/*
--2.4. Obtener una lista de clientes cuyas facturas hayan tenido un monto total igual o superior a $4500
en el video al agrupar por id de la tabla factura, no está considerando el detalle de la factura, ya que puede existir en una factura varias compras, por ello, 
solo le muestra 11 resultados. En mi consulta si he considerado el detalle de la factura para saber la cantidad de productos comprados en una sola factura, para
así multiplicar cantidad x precio unitario y agruparlos por id_cliente para la suma total que ha pogado los clientes con un saldo mayor a $4500
*/

CREATE VIEW v_precio_total_cliente AS
SELECT  cl.id AS id_cliente, cl.nombre, cl.apellido, f.id AS id_factura, df.cantidad, df.precio_unitario, (df.cantidad*df.precio_unitario) AS precio_total FROM cliente AS cl
JOIN factura AS f
ON cl.id = f.id_cliente
JOIN bicicleta.detalle_factura AS df
ON f.id = df.id_factura;

SELECT * FROM v_precio_total_cliente;

SELECT vpt.id_cliente, vpt.nombre, vpt.apellido, sum(precio_total) AS total_facturado_por_cliente FROM v_precio_total_cliente AS vpt
GROUP BY id_cliente
HAVING total_facturado_por_cliente >= 4500
ORDER BY nombre;

/*
--2.5. Lista de bicicletas hibridas y urbanas disponibles en bicitemp
*/
SELECT pr1.nombre AS bicicleta, pr1.precio, cat1.nombre AS categoria FROM producto AS pr1
JOIN categoria AS cat1
ON pr1.id_categoria = cat1.id
WHERE pr1.id_categoria = 1 or pr1.id_categoria = 8;

/*
--2.6. Etiquetar las bicicletas según la cantidad vendida
--mostrar: id bicicleta, nombre de la bicicleta, cantidad vendida, etiqueta
--Etiqueta: Más de 10 bicicletas: muy vendidas / 7 a 10: vendidas / menos de 7: menos vendidas
*/
SELECT prod.id, prod.nombre, SUM(df1.cantidad) AS cantidad_vendida,
    CASE 
        WHEN SUM(df1.cantidad) > 10 THEN 'muy vendidas'
        WHEN SUM(df1.cantidad) >= 7 AND SUM(df1.cantidad) <= 10 THEN 'vendidas'
        WHEN SUM(df1.cantidad) < 7 THEN 'menos vendidas'
    END AS etiqueta
FROM producto AS prod
JOIN detalle_factura AS df1 
ON prod.id = df1.id_producto
GROUP BY prod.id, prod.nombre
ORDER BY cantidad_vendida;


/*
--2.7. Etiquetar todas las bicicletas de la categoria Motocross como 'Bicicletas para competencia' y todas las demas como 'Recreativas'
Campos: id bicicleta, nombre bicicleta, etiqueta
*/
SELECT prod1.id, prod1.nombre, 
case
	when cate.id = 6 then 'Bicicletas para competencia'
	when cate.id <> 6 then 'Recreativas'
END AS etiqueta
FROM producto AS prod1
JOIN categoria AS cate
ON prod1.id_categoria = cate.id

/*
--2.8. Generar una lista con todas las facturas que se han emitido desde el primero de mayo del 2022
*/
SELECT fac.id,fac.fecha,clie.nombre AS nombre_cliente,clie.apellido as apellido_cliente, clie.email FROM factura AS fac
JOIN cliente AS clie
ON fac.id_cliente = clie.id
WHERE fecha >= '2022-05-01'
ORDER BY fecha


/*
--2.9. lista de 2 vendedores que más vendieron en el año 2021
*/
SELECT  factu.id_empleado, emp.nombre AS nombre_empleado, emp.apellido AS apellido_empleado, SUM(precio_total) AS total_vendido_x_empleado, factu.fecha FROM v_precio_total_cliente AS vptc
JOIN factura AS factu 
ON vptc.id_factura = factu.id
JOIN empleado AS emp
ON factu.id_empleado = emp.id
GROUP BY id_empleado
HAVING factu.fecha>='2021-01-01' AND factu.fecha<='2021-12-31'
ORDER BY total_vendido_x_empleado DESC
LIMIT 2;


/*
--2.10. Generar lista con nombres e e-mail de todos los clientes y empleados
*/
SELECT * FROM bicicleta.categoria;
SELECT * FROM bicicleta.cliente;
SELECT * FROM bicicleta.detalle_factura;
SELECT * FROM bicicleta.empleado;
SELECT * FROM bicicleta.factura;
SELECT * FROM bicicleta.marca;
SELECT * FROM bicicleta.producto;

SELECT clien.nombre,clien.apellido,clien.email, 
case
		when clien.email not LIKE '%bicitemp%' then 'Cliente'	
	END AS 'Empleado_Cliente'
FROM cliente AS clien
UNION 
SELECT emplea.nombre,emplea.apellido,emplea.email,
	case
		when emplea.email LIKE '%bicitemp%' then 'Empleado'		
	END AS 'Empleado_Cliente'
FROM empleado AS emplea;

-- CREATE TABLE prueba1(
-- id INT AUTO_INCREMENT PRIMARY KEY,
-- nombre VARCHAR(45) NOT NULL,
-- apellido VARCHAR(45) NOT NULL,
-- email VARCHAR(45) NOT NULL
-- )
-- 
-- INSERT INTO prueba1  SELECT * FROM empleado;
-- SELECT * FROM prueba1;