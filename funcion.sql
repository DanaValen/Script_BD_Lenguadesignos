/*
La función que se va a crearse sera para obtener la dirección
*/
create database Direccion_usuarios;
use Direccion_usuarios;

create table direcciones(
    id int not null,
    Nombre varchar(20),
    Apellido varchar(20),
    Ciudad varchar(100),
    Direccion varchar(100),
    primary key(id)
);
insert into direcciones(id,Nombre,Apellido,Ciudad,Direccion)
 values(5502,'Natalia','Rico','Bogota','ccccccccc'),(5503,'Carlos','Lopez','Bogota','bbbbbbbb'),(5504,'Camilo','Isaza','Bogota','dddddddd'),(5505,'Helena','Ramirez','Bogota','eeeeeeeeee'),(5506,'Santiago','Hernandez','Bogota','fffffffffff'),(5507,'Paola','Rivera','Bogota','gggggggggggg'),(5508,'Samantha','Martinez','Bogota','hhhhhhhhhhh'),(5509,'Nicolas','Herrera','Bogota','iiiiiiiiii'),(55010,'Tania','Sanchez','Bogota','jjjjjjjjjjjj');

DELIMITER $$
CREATE FUNCTION obtener_direccion(calle VARCHAR(100), ciudad VARCHAR(100), codigo_postal VARCHAR(10))
RETURNS VARCHAR(250)
DETERMINISTIC
BEGIN
    DECLARE direccion VARCHAR(250);
    SET direccion = CONCAT(calle, ', ', ciudad, ', ', codigo_postal);
    RETURN direccion;
END$$
DELIMITER ;

SELECT obtener_direccion('Av. cali','Bogotá' ,'2131');

/*En esta segunda función vamos a crear una función para ingresar una denuncia */

create database Denuncia;
use Denuncia;

create table insertar_denuncia(
    id int not null,
    Nombre varchar(20),
    Apellido varchar(20),
    Ciudad varchar(100),
    Direccion varchar(100),
    Denuncia varchar(2000),
    Nombre_Funcionario varchar(20),
    primary key(id)
);

insert into insertar_denuncia(id,Nombre,Apellido,Ciudad,Direccion,Denuncia,Nombre_Funcionario)
values (5502,'Natalia','Rico','Bogota','ccccccccc','El día de ayer a las 18:00pm, sufri un robo de celular','Aron Lopez'),
	   (5503,'Carlos','Lopez','Bogota','bbbbbbbb','El día de ayer a las 18:00pm, sufri un robo de celular','Fernando Ruiz'),
       (5504,'Camilo','Isaza','Bogota','dddddddd','El día de ayer a las 18:00pm, sufri un robo de celular','Diego Gonzales'),
       (5505,'Helena','Ramirez','Bogota','eeeeeeeeee','El día de ayer a las 18:00pm, sufri un robo de celular','Alexandra Castillos'),
       (5506,'Santiago','Hernandez','Bogota','fffffffffff','El día de ayer a las 18:00pm, sufri un robo de celular','Juieta Romero'),
       (5507,'Paola','Rivera','Bogota','gggggggggggg','El día de ayer a las 18:00pm, sufri un robo de celular','Mauricio Quevedo'),
       (5508,'Samantha','Martinez','Bogota','hhhhhhhhhhh','El día de ayer a las 18:00pm, sufri un robo de celular','Luisa Monsalve'),
       (5509,'Nicolas','Herrera','Bogota','iiiiiiiiii','El día de ayer a las 18:00pm, sufri un robo de celular','Samantha Villalobos'),
       (55010,'Tania','Sanchez','Bogota','jjjjjjjjjjjj','El día de ayer a las 18:00pm, sufri un robo de celular','Carlos Sanchez');

DELIMITER $$
CREATE FUNCTION ingresar_denuncia(descripcion VARCHAR(2000),id varchar(20)) 
RETURNS varchar(20)
DETERMINISTIC
BEGIN
    DECLARE id_denuncia varchar(20);
    INSERT INTO denuncias ( descripcion, id) VALUES (descripcion, id);
    SET id_denuncia = LAST_INSERT_ID();
    RETURN id_denuncia;
END $$
DELIMITER  ;


SELECT ingresar_denuncia( 'robo', 1);
