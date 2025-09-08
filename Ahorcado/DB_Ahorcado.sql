drop database if exists DB_Ahorcado;
create database DB_Ahorcado;
use DB_Ahorcado;

create table Palabras(
id int auto_increment,
palabra varchar(50),
constraint pk_id primary key (id)
);

Delimiter //

create procedure sp_agregarpalabras(
in palabra varchar(50)
)
begin
	insert into Palabras(palabra)
    values (palabra);
    
end//
Delimiter //

call sp_agregarpalabras("PUBERTAD");
call sp_agregarpalabras("CARRETILLA");
call sp_agregarpalabras("DECAPITAR");
call sp_agregarpalabras("BERMUDAS");
call sp_agregarpalabras("ASESINAR");
call sp_agregarpalabras("MICROBIO");
call sp_agregarpalabras("DINAMARCA");
call sp_agregarpalabras("PUBLICIDAD");
call sp_agregarpalabras("HARDWARE");
call sp_agregarpalabras("FRAMBUESA");
call sp_agregarpalabras("ELECTROENCEFALOGRAFISTA");
call sp_agregarpalabras("ESTERNOCLEIDOMASTOIDEO");
call sp_agregarpalabras("OTORRINOLARINGOLOGISTA");
call sp_agregarpalabras("ANTICONSTITUCIONALMENTE");
call sp_agregarpalabras("INCOMPRENSIBLEMENTE");
call sp_agregarpalabras("HIPERCOAGULABILIDAD");
call sp_agregarpalabras("NEUMONOULTRAMICROSCOPICO");
call sp_agregarpalabras("CONTRARREVOLUCIONARIO");
call sp_agregarpalabras("DESAFORTUNADAMENTE");
call sp_agregarpalabras("INTERNACIONALIZACION");
call sp_agregarpalabras("ELECTROCARDIOGRAFISTA");
call sp_agregarpalabras("BIOELECTROMAGNETISMO");
call sp_agregarpalabras("MICROELECTROMECANICO");
call sp_agregarpalabras("HIPERPARATIROIDISMO");
call sp_agregarpalabras("SUPERCONDUCTIVIDAD");
call sp_agregarpalabras("INSTITUCIONALIZACION");
call sp_agregarpalabras("AUTORREGULATORIAMENTE");
call sp_agregarpalabras("MICROPALEONTOLOGISTA");
call sp_agregarpalabras("DESOXIRRIBONUCLEICO");
call sp_agregarpalabras("HIPOPOTOMONSTRUOSESQUIPEDALIOFOBIA");

select * from Palabras;



