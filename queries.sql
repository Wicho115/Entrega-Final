/*CREATE*/

/*Crear una plataforma*/
INSERT INTO plataformas (nombre) VALUES
	("Nintendo DS")
	
/*Crear un videojuego*/
INSERT INTO videojuegos (titulo, fecha_salida, desarrolladora, id_clasificacion, id_plataforma) VALUES
	("God Of War: Ragnarok", "2022-11-09", "Santa Monica Studio", 5, 5),
	
/*Crear un jugador*/
INSERT INTO jugadores (nombre, nacimiento, id_pais) VALUES
	("Líam", "2005-01-03", 141);

/*Crear una relacion entre videojuego y jugador*/
INSERT INTO jugadores_x_videojuegos (id_jugador, id_videojuego) VALUES
	(6, 2)

/*Crear una relacion de videojuego y genero*/
INSERT INTO videojuegos_x_generos (id_videojuego, id_genero) VALUES
	(6,5);
	
	
/*READ*/

/*Leer todos los videojuegos*/
SELECT v.titulo, v.fecha_salida, v.desarrolladora, c.nombre as clasificacion, c.edad_minima , p.nombre as plataforma FROM videojuegos AS v
	INNER JOIN clasificaciones AS c
		ON v.id_clasificacion = c.id_clasificacion
	INNER JOIN plataformas AS p 
		ON v.id_plataforma = p.id_plataforma;
	
/*Leer todos los jugadores*/
SELECT j.nombre, j.nacimiento, p.nombre as pais, p.dominio as pais_dominio FROM jugadores AS j
	INNER JOIN paises AS p 
	ON j.id_jugador = p.id_pais ;

/*Leer todos los videojuegos con un genero en especifico*/
SELECT v.titulo, v.fecha_salida, v.desarrolladora,
g.nombre AS genero,
c.nombre AS clasificacion, c.edad_minima, 
p.nombre AS plataforma FROM videojuegos_x_generos AS vxg
	INNER JOIN videojuegos AS v 
		ON vxg.id_videojuego = v.id_videojuego
	INNER JOIN generos AS g 
		ON vxg.id_genero = g.id_genero
	INNER JOIN clasificaciones AS c
		ON v.id_clasificacion = c.id_clasificacion
	INNER JOIN plataformas AS p
		ON v.id_plataforma = p.id_plataforma
	WHERE g.id_genero = 1;
	
/*Leer todos los generos*/
SELECT * FROM generos;

/*Leer todas las clasificaciones que tienen edad minima*/
SELECT * FROM clasificaciones WHERE edad_minima IS NOT NULL;


/*UPDATE*/

/*Actualizar una plataforma*/
UPDATE plataformas SET nombre = "N DS" WHERE id_plataforma = 6;

/*Actualizar un videojuego*/
UPDATE videojuegos SET desarrolladora = "SIE Santa Monica Studio" WHERE id_videojuego = 6;

/*Actualizar un jugador*/
UPDATE jugadores SET nombre = "Líam David" WHERE id_jugador = 6;

/*Actulizar una relacion entre videojuego y jugador*/
UPDATE jugadores_x_videojuegos SET id_videojuego = 4 WHERE id_jugador_videojeugo = 11; 

/*Actualizar una relacion de videojuego y genero*/
UPDATE videojuegos_x_generos SET id_genero = 2 WHERE id_videojuego_genero = 2;

/*DELETE*/

/*Eliminar una clasificacion*/
DELETE FROM clasificaciones WHERE id_clasificacion = 5;

/*Eliminar jugadores por su pais*/
DELETE FROM jugadores WHERE id_pais = 141;

/*Eliminar videojuegos por plataforma*/
DELETE FROM videojuegos WHERE id_plataforma  = 1;

/*Eliminar una plataforma*/
DELETE FROM plataformas WHERE id_plataforma = 2;

/*Eliminar una relacion de videojuego y genero*/
DELETE FROM videojuegos_x_generos WHERE id_genero = 3;

