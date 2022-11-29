CREATE DATABASE IF NOT EXISTS so_videojuegos;

USE so_videojuegos;


CREATE TABLE IF NOT EXISTS paises(
    id_pais INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    dominio CHAR(2) UNIQUE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS clasificaciones(
    id_clasificacion INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) UNIQUE NOT NULL,
    edad_minima CHAR(2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS plataformas(
    id_plataforma INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS generos(
    id_genero INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS videojuegos(
    id_videojuego INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(70) NOT NULL,
    fecha_salida DATETIME NOT NULL,
    desarrolladora VARCHAR(50) NOT NULL,
    id_clasificacion INTEGER UNSIGNED NOT NULL,
    id_plataforma INTEGER UNSIGNED NOT NULL,
    FOREIGN KEY(id_clasificacion)
        REFERENCES clasificaciones(id_clasificacion)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY(id_plataforma)
        REFERENCES plataformas(id_plataforma)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS jugadores(
    id_jugador INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    nacimiento DATETIME,
    id_pais INTEGER UNSIGNED NOT NULL,
    FOREIGN KEY(id_pais)
        REFERENCES paises(id_pais)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS videojuegos_x_generos(
    id_videojuego_genero INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_videojuego INTEGER UNSIGNED,
    id_genero INTEGER UNSIGNED,
    FOREIGN KEY(id_videojuego)
        REFERENCES videojuegos(id_videojuego)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY(id_genero)
        REFERENCES generos(id_genero)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS jugadores_x_videojuegos(
    id_jugador_videojeugo INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_jugador INTEGER UNSIGNED,
    id_videojuego INTEGER UNSIGNED,
    FOREIGN KEY(id_jugador)
        REFERENCES jugadores(id_jugador)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY(id_videojuego)
        REFERENCES videojuegos(id_videojuego)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
        
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;