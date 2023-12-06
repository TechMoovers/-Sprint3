Create database TechMoovers;


Use TechMoovers;

-- create table clienteEmpresa(
-- idCliente int primary key auto_increment,
-- razaoSocial varchar(50),
-- nomeFantasia varchar(50),
-- cnpj char(14)) ;

-- INSERT INTO clienteEmpresa VALUES 
-- (null, 'JBS S/A', 'Friboi', '02916265004076'),
-- (null, 'Transporte de gado JBS','Uboi', '02916265000160');

-- select * from clienteEmpresa;


create table usuario(
idUsuario int primary key auto_increment,
razaoSocial varchar(50),
nomeFantasia varchar(50),
cnpj char(14),
email varchar(50),
senha char(8),
fkSuporte int
);


INSERT INTO usuario VALUES
(null, 'JBS S/A', 'Friboi', '02916265004076', 'friboi@gmail.com', 'Friboi47', 10),
(null, 'Transporte de gado JBS','Uboi', '02916265000160','uboi@gmail.com', 'uboi1547',11);


create table boi (
idBoi int primary key auto_increment,
qtdEspecies varchar(45),
fkUsuario int,
constraint fkUser foreign key (fkUsuario) references usuario (idUsuario));



insert into boi values
(null, 90 , '1'),
(null, 60 ,'2');


select * from boi;

create table sensores(
idSensores int primary key auto_increment,
umidade decimal,
temperatura decimal,
dtRegistro datetime,
fkAlertaU int,
fkAlertaT int
);

insert into sensores values
(null,'25','10','2023-05-10 20:37',1,2),
(null,'22','35','2023-05-10 20:35',2,1);

create table caminhao(
idTransp int primary key auto_increment,
tipoCarroceria varchar(40),
qtdBovinos int,
placa varchar(7),
fkSensor int,
constraint fksens foreign key (fkSensor) references sensores (idSensores),
fkUsuario int,
constraint fkUsu foreign key (fkUsuario) references usuario (idusuario));

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


create table alertaUmidade(
idAlertaU int primary key auto_increment,
idealU decimal (3,1),
criticoU decimal (3,1),
alertaU decimal (3,1)
);

 insert into alertaUmidade values
 (null, '55.4','75.0','69.5'),
 (null,'54.0','70.0','68.0'); 
 
 select * from alertaUmidade; 


create table alertaTemperatura(
idAlertaT int primary key auto_increment,
idealT decimal (3,1),
criticoT decimal (3,1),
alertaT decimal (3,1)
);

 insert into alertaTemperatura values 
 (null,'25.5','32.5','28.0'), 
 (null,'24.5','33.5','29.0');
 
 select * from alertaTemperatura; 

 
 

  alter table usuario add constraint  fkSup foreign key (fkSuporte) references suporte (idSuporte); 
   alter table sensores  add constraint fkUmi foreign key  (fkAlertaU) references alertaUmidade (idAlertaU); 
    alter table   sensores  add constraint  fkTemp foreign key  (fkAlertaT) references alertaTemperatura (idAlertaT);

-- joins -



select* from boi join usuario  on idUsuario  = fkUsuario;
 
  
-- quantidade de boi de cada especie dentro de um caminhão e de qual cliente é o caminhão.

select usuario.nomeFantasia, boi.qtdEspecies, especie.Especie, especie.tempIdeal,
especie.umiIdeal, caminhao.qtdBovinos, caminhao.placa from boi 
join especie on especie.fkBoi = boi.idBoi
join caminhao on especie.fkCaminhao = idTransp
join usuario on usuario.idUsuario = caminhao.fkUsuario;

-- where clienteEmpresa.nomeFantasia = 'Friboi';

-- select especie.Especie, especie.tempIdeal, especie.umiIdeal , caminhao.qtdBovinos , caminhao.placa, boi.qtdEspecies from especie
-- join caminhao on caminhao.idTransp = especie.fkCaminhao 
-- join boi on boi.qtdEspecies = especie.idEspecie;
  
select usuario.nomeFantasia,  suporte.tipoSuporte, suporte.nmrChamado, suporte.dtChamado, suporte.dtConclusão 
from usuario join suporte on idSuporte = fkSuporte;


SELECT usuario.nomeFantasia, caminhao.placa, caminhao.qtdBovinos, alertaUmidade.idealU, alertaTemperatura.idealT
FROM sensores
JOIN alertaUmidade ON sensores.fkAlertaU = alertaUmidade.idAlertaU
JOIN alertaTemperatura ON sensores.fkAlertaT = alertaTemperatura.idAlertaT
JOIN caminhao ON caminhao.fksensor = caminhao.idTransp
JOIN usuario ON usuario.idUsuario = caminhao.fkUsuario;


  -- drop database TechMoovers;


