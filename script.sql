CREATE DATABASE libros;

\c libros;

CREATE TABLE autor(
  codigo_autor SERIAL,
  nombre_autor VARCHAR NOT NULL,
  apellido_autor VARCHAR NOT NULL,
  PRIMARY KEY (codigo_autor)
);

CREATE TABLE editorial(
  codigo_editorial SERIAL,
  nombre_editorial VARCHAR NOT NULL,
  PRIMARY KEY (codigo_editorial)
);

CREATE TABLE lector(
  codigo_lector SERIAL,
  nombre_lector VARCHAR NOT NULL,
  apellido_lector VARCHAR NOT NULL,
  PRIMARY KEY (codigo_lector)
);

CREATE TABLE libro(
 codigo_libro SERIAL,
 titulo_libro VARCHAR NOT NULL,
 PRIMARY KEY (codigo_libro) 
);

CREATE TABLE libro_autor(
  codigo_libro INT NOT NULL,
  codigo_autor INT NOT NULL,
  FOREIGN KEY (codigo_libro) REFERENCES libro(codigo_libro),
  FOREIGN KEY (codigo_autor) REFERENCES autor(codigo_autor)
);

CREATE TABLE ejemplar(
  codigo_ejemplar SERIAL,
  codigo_libro INT NOT NULL,
  codigo_editorial INT NOT NULL,
  FOREIGN KEY (codigo_libro) REFERENCES libro(codigo_libro),
  FOREIGN KEY (codigo_editorial) REFERENCES editorial(codigo_editorial)
);

CREATE TABLE arriendo(
  fecha_inicio DATE,
  codigo_ejemplar INT,
  codigo_lector INT,
  fecha_devolucion DATE,
  PRIMARY KEY (fecha_inicio, codigo_ejemplar, codigo_lector),
  FOREIGN KEY (codigo_ejemplar) REFERENCES ejemplar(codigo_ejemplar),
  FOREIGN KEY (codigo_lector) REFERENCES lector(codigo_lector)
);
