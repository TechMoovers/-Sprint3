Create database TechMoovers;


Use TechMoovers;

create table clienteEmpresa(
idCliente int primary key auto_increment,
razaoSocial varchar(50),
nomeFantasia varchar(50),
cnpj char(14)) ;

INSERT INTO clienteEmpresa VALUES 
(null, 'JBS S/A', 'Friboi', '02916265004076'),
(null, 'Transporte de gado JBS','Uboi', '02916265000160');

select * from clienteEmpresa;


create table usuario(
idUsuario int primary key auto_increment,
nome varchar(50),
email varchar(50),
senha char(8),
fkCliente int,
constraint fkCli foreign key (fkCliente) references clienteEmpresa(idCliente),
fkSuporte int);


INSERT INTO usuario VALUES
(null, 'Friboi', 'friboi@gmail.com', 'Friboi47', 2,10),
(null, 'Uboi', 'uboi@gmail.com', 'uboi1547',1,11);


create table boi (
idBoi int primary key auto_increment,
qtdBois varchar(45),
fkClienteEmpresa int,
foreign key (fkClienteEmpresa) references clienteEmpresa(idCliente));

alter table boi rename column qtdBois to qtdEspecies;

insert into boi values
(null, 90 , '1'),
(null, 60 ,'2');


select * from boi;

create table sensores(
idSensores int primary key auto_increment,
umidade decimal,
temperatura decimal,
dtRegistro datetime);

insert into sensores values
(null,'25','10','2023-05-10 20:37'),
(null,'22','35','2023-05-10 20:35');

create table caminhao(
idTransp int primary key auto_increment,
tipoCarroceria varchar(40),
qtdBovinos int,
placa varchar(7),
fkSensor int,
constraint fksens foreign key (fkSensor) references sensores (idSensores),
fkCliente int,
foreign key (fkCliente) references clienteEmpresa(idCliente));

select * from caminhao;

insert into Caminhao values
(null,'fechada','50','hju5478','1','1'),
(null,'Aberta', '40','fhu4785','2','2');


  create table especie (
  idEspecie int,
  fkCaminhao int,
  fkBoi int,
  primary key (idEspecie, fkCaminhao, fkBoi),
  Especie varchar(45),
  tempIdeal varchar (45),
  umiIdeal varchar (45),
  constraint fkCam foreign key (fkCaminhao) references caminhao (idTransp),
  constraint fkBoi foreign key (fkBoi) references boi (idBoi),
  CONSTRAINT chkEspecieBovino CHECK (especie IN ('Nelore', 'Angus', 'Brahman', 'Brangus', 'Senepol', 'Hereford'))
  );

  insert into especie values 
  (1,1,2,'Nelore','16°C a 23°C','60% a 70%'),
  (2,2,1,'Angus','19°C a 28°C', '50% a 80%');
  
  select * from especie;
  
create table suporte(
idSuporte int primary key auto_increment,
tipoSuporte varchar(80),
nmrChamado int,
dtChamado datetime,
dtConclusão datetime ) auto_increment = 10;

insert into suporte values 
(null,'Sensor de temperatura','014587','2023-11-12','2023-11-12'),
(null,'arduino desplugou', '01245','2023-11-10','2023-11-13');

select * from suporte;

alter table usuario add constraint fkSup foreign key (fkSuporte) references suporte (idSuporte);

-- joins -

select*from clienteEmpresa join usuario on idCliente = FkCliente;

select* from boi join clienteEmpresa  on idCliente = fkClienteEmpresa;
 
  
-- quantidade de boi de cada especie dentro de um caminhão e de qual cliente é o caminhão.

select clienteEmpresa.nomeFantasia, boi.qtdEspecies, especie.Especie, especie.tempIdeal,
especie.umiIdeal, caminhao.qtdBovinos, caminhao.placa from boi 
join especie on especie.fkBoi = boi.idBoi
join caminhao on especie.fkCaminhao = idTransp
join clienteEmpresa on clienteEmpresa.idCliente = caminhao.fkCliente;

-- where clienteEmpresa.nomeFantasia = 'Friboi';

-- select especie.Especie, especie.tempIdeal, especie.umiIdeal , caminhao.qtdBovinos , caminhao.placa, boi.qtdEspecies from especie
-- join caminhao on caminhao.idTransp = especie.fkCaminhao 
-- join boi on boi.qtdEspecies = especie.idEspecie;
  
select usuario.nome,  suporte.tipoSuporte, suporte.nmrChamado, suporte.dtChamado, suporte.dtConclusão 
from usuario join suporte on idSuporte = fkSuporte;

 drop database TechMoovers;


