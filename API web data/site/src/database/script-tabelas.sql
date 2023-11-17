-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/
CREATE DATABASE bdPrototipoPi;
USE bdPrototipoPi;

CREATE TABLE clienteEmpresa(
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    razaoSocial VARCHAR(50),
    nomeFantasia VARCHAR(50),
    cnpj CHAR(14)
);

INSERT INTO clienteEmpresa VALUES 
(null, 'JBS S/A', 'Friboi', '02916265004076'),
(null, 'Transporte de gado JBS','Uboi', '02916265000160');


CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario VARCHAR(50),
    emailUsuario VARCHAR(50),
    senhaUsuario char (8),
	FkCliente INT,
    constraint fkcli FOREIGN KEY (FkCliente) REFERENCES clienteEmpresa (idCliente)
);

INSERT INTO usuario VALUES
(null, 'Friboi', 'friboi@gmail.com', 'Friboi47', 1),
(null, 'Uboi', 'uboi@gmail.com', 'uboi1547','2');




CREATE TABLE Especie (
	idEspecie INT PRIMARY KEY AUTO_INCREMENT,
    especieBovino VARCHAR(20),
    temperaturaIdealEspecie DECIMAL,
    CONSTRAINT chkEspecieBovino CHECK (especieBovino IN ('Nelore', 'Angus', 'Brahman', 'Brangus', 'Senepol', 'Hereford'))
);

INSERT INTO Especie VALUES
(null, 'Nelore', 21),
(null,'Angus', 22);



create table Boi (
idBoi int primary key auto_increment,
QtdBois int,
FkCliente int,
FkEspecie int,
constraint FkEsp foreign key (FkEspecie)
references Especie  (idEspecie),
constraint fkClient foreign key (fkCliente)
references clienteEmpresa (idCliente)
);

insert into Boi values
(null, 40 , '1','1'),
(null, 30 ,'2','2');




create table Caminhao ( 
idTransp int primary key auto_increment,
TipoCarroceria varchar(40),
QtdBovinos int,
placaVeiculo char(7),
fkEspecie int,
fkCliente int,
fkDadosSens int,
constraint FkEspe foreign key (FkEspecie)
references Especie  (idEspecie),
constraint fkClint foreign key (fkCliente)
references clienteEmpresa (idCliente)
);

insert into Caminhao values
(null,'fechada','50','hju5478','1','1','1'),
(null,'Aberta', '40','fhu4785','2','2','2');




create table DadosSensores(
idDados int primary key auto_increment,
umidade decimal,
temperatura decimal,
dtregistro DATETIME default current_timestamp,
fkCaminhao int,
constraint fktransp foreign key (fkCaminhao) 
references Caminhao (idTransp)
);



insert into DadosSensores values
(null,'25','10','2023-05-10 20:37','1'),
(null,'22','35','2023-05-10 20:35','2');

alter table Caminhao add constraint fkDadoSens foreign key (fkDadosSens)
references DadosSensores (idDados);




/*
comandos para criar usuário em banco de dados azure, sqlserver,
com permissão de insert + update + delete + select
*/

CREATE USER [usuarioParaAPIWebDataViz_datawriter_datareader]
WITH PASSWORD = '#Gf_senhaParaAPIWebDataViz',
DEFAULT_SCHEMA = dbo;

EXEC sys.sp_addrolemember @rolename = N'db_datawriter',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';

EXEC sys.sp_addrolemember @rolename = N'db_datareader',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';
