SELECT * FROM cine ;
SELECT * FROM cartelera ORDER BY id_cine asc;
SELECT * FROM pelicula GROUP BY id;

--1.1 peliculas solo en cartelera
SELECT DISTINCT pe.nombre AS nom_pelicula, pe.id AS id_pelicula,ca.id_pelicula AS id_peli,ca.id_cine AS id_cine FROM pelicula AS pe
left JOIN cartelera AS ca 
ON pe.id = ca.id_pelicula
GROUP BY pe.id 
having ca.id_pelicula IS NOT null; 

--1.2 peliculas que tengan clasificacion para todas las edades
SELECT * FROM pelicula WHERE clasificacion_edad IS NOT NULL; 

SELECT *, case 
when clasificacion_edad is not null then clasificacion_edad 
when clasificacion_edad IS null then 0
END AS clasificacion_edad2
FROM pelicula


UPDATE pelicula
SET clasificacion_edad = 0
WHERE clasificacion_edad IS NULL; 


--1.3 --¿cuales son las peliculas con clasificacion general? 

SELECT DISTINCT pe1.id, pe1.nombre AS nom_pelicula FROM pelicula AS pe1
inner JOIN cartelera AS ca 
ON pe1.id = ca.id_pelicula
WHERE  pe1.clasificacion_edad = 0; 

--1.4 crear una lista con los cines disponibles en el momento
SELECT DISTINCT c.* FROM cine AS c
inner JOIN cartelera AS ca
ON c.id = ca.id_cine
;

--1.5 ¿que pelicula se está proyectando en cada cine?
SELECT c1.id_cine,c1.id_pelicula,ci.nombre,ci.estado,ci.pais,p1.nombre,p1.clasificacion_edad FROM cartelera AS c1
JOIN cine as ci 
ON c1.id_cine = ci.id
JOIN pelicula AS p1 
ON c1.id_pelicula = p1.id

--1.6 Actualizar la base de datos, eliminando los cines NO disponibles.

SELECT * FROM cine;
DELETE FROM cine
WHERE id IN (
SELECT c.id FROM cine AS c
LEFT JOIN cartelera AS ca3
ON c.id = ca3.id_cine
WHERE ca3.id_cine IS NULL); 


--1.7 Generar lista de peliculas y sus cines disponibles en dublin 
SELECT c.*, pee.nombre FROM cine AS c
inner JOIN cartelera AS ca
ON c.id = ca.id_cine
INNER JOIN pelicula AS pee
ON ca.id_pelicula = pee.id
WHERE c.estado LIKE 'Dublin' AND c.pais LIKE 'Irlanda';

--1.8 incluir la tabla de genero de las peliculas 
CREATE TABLE genero(
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100)

)

INSERT INTO genero(nombre) VALUES ('Acción'), ('Aventura'), ('Ciencia Ficción'), ('Comedia'), ('Drama'), ('Fantasia'), ('Suspenso'), ('Terror');
SELECT * FROM genero;


--1.9 Agregar el campo id_genero a la tabla de peliculas
SELECT * FROM pelicula;

ALTER TABLE pelicula
ADD COLUMN  id_genero INT; 


ALTER TABLE cine.pelicula ADD CONSTRAINT fk_id_genero FOREIGN KEY (id_genero) REFERENCES cine.genero(id);

--1 a 10: Terror
UPDATE pelicula
SET id_genero = 8
WHERE id BETWEEN 1 AND 10;

--11 a 20: ciencia ficcion
UPDATE pelicula
SET id_genero = 3
WHERE id BETWEEN 11 AND 20;

--21 a 45: Comedia
UPDATE pelicula
SET id_genero = 4
WHERE id BETWEEN 21 AND 45;

--46 a 55: Suspenso
UPDATE pelicula
SET id_genero = 7
WHERE id BETWEEN 46 AND 55;

--demas acción: 56 a 75
UPDATE pelicula
SET id_genero = 1
WHERE id BETWEEN 56 AND 75;

--1.10 Peliculas de suspenso, clasificacion mayor a 18, ciudad de madrid
SELECT peli.nombre AS nombre_pelicula, peli.clasificacion_edad,cin.nombre AS nombre_cine, cin.estado, gen.nombre AS genero FROM pelicula AS peli
JOIN cartelera AS carte
ON peli.id = carte.id_pelicula
JOIN cine AS cin
ON carte.id_cine = cin.id
JOIN genero AS gen
ON peli.id_genero = gen.id
WHERE cin.estado LIKE 'Madrid' AND peli.id_genero = 7 AND peli.clasificacion_edad >= 18;

