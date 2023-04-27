create database salud;
use salud;
create table sede
(
ID_S tinyint unsigned auto_increment primary key,
N_trabajadores tinyint not null,
Direccion_s varchar(255) not null,
nit mediumint not null,
telefono_s mediumint not null,
Estado_s enum("ACTIVO","NO ACTIVO") default"ACTIVO" NOT NULL
);
create table usuario
(
Id_u tinyint unsigned auto_increment unique,
Nombre varchar(255) not null,
Apellidos varchar(255) not null,
T_universitario varchar(255) null ,
t_identificacion enum("ti","cc","rc") not null,
n_identificacion bigint unsigned not null unique primary key,
correo varchar(255) not null,
telefono bigint not null,
contrasena varchar(255) not null,
estado_u ENUM("ACTIVO", "NO ACTIVO") DEFAULT "ACTIVO" NOT NULL,
direccion_u varchar(255) not null,
Fecha_N DATE not null,
ID_S tinyint unsigned   null,
foreign key(ID_S) references sede (ID_S) ,
tipo_usuario  ENUM("paciente", "doctor","Administrador")  default"Paciente" not NULL
);
create table agenda
(
Id_agenda bigint unsigned auto_increment primary key,
H_inicio time not null,
H_final time not null,
f_inicio date not null,
f_final date not null,
n_identificacion bigint  unsigned not null ,
foreign key(n_identificacion) references usuario(n_identificacion),
estado enum('Activa','No activa') default 'Activa'
);
create table cita
(
idcita tinyint unsigned auto_increment primary key,
hora time not null,
fecha date not null,
n_identificacion bigint  unsigned not null ,
foreign key(n_identificacion) references usuario(n_identificacion)  ,
ID_S tinyint unsigned not null ,
foreign key(ID_S) references sede (ID_S) ,
estado_cita enum("ACTIVA","NO ACTIVA") DEFAULT "ACTIVA" NOT NULL,
Id_agenda  bigint unsigned not null,
foreign key(Id_agenda) references agenda(Id_agenda),
citapac enum('tomada','no tomada') default'no tomada'
);
/*punto 2*/
select * from usuario where Id_u<=5;
/*punto1*/
SELECT 
	Id_u AS Identificador,
    Nombre,
    Apellidos,
    T_universitario,
    t_identificacion,
    correo,
    tipo_usuario
FROM usuario;
select*from usuario where  Id_u=2 or  Id_u=4 or  Id_u=6 or  Id_u=8 or  Id_u=10 or  Id_u=12
 select count(*) from usuario where  Id_u % 2 = 0;
 select count(*) from sede where  ID_S % 2 = 0;
  select count(*) from cita where  idcita % 2 = 0;
   select count(*) from agenda where  Id_agenda % 2 = 0;


select * from sede where Id_u<=5;
select * from cita where Id_u<=5;
select * from agenda where Id_u<=5;
SELECT cita.hora,cita.fecha,usuario.Nombre,usuario.Apellidos,agenda.H_inicio,agenda.H_final,agenda.f_inicio,agenda.f_final,agenda.n_identificacion from usuario INNER JOIN cita ON usuario.n_identificacion = cita.n_identificacion inner join agenda  on  agenda.Id_agenda = cita.Id_agenda 
where agenda.n_identificacion=numi and estado='Activa'and citapac='tomada' ;





















