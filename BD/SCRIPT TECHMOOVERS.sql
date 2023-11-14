Create database TechMoovers;

Use TechMoovers;

create table clienteEmpresa(
idCliente int primary key auto_increment,
razaoSocial varchar(50),
nomeFantasia varchar(50),
cnpj char(14)) auto_increment = 1;

create table suporte(
idSuporte int primary key auto_increment,
tipoSuporte varchar(80),
dtSuporte datetime) auto_increment = 10;

create table usuario(
idUsuario int primary key,
nome varchar(50),
email varchar(50),
senha char(8),
fkCliente int,
foreign key (fkCliente) references clienteEmpresa(idCliente),
fkSuporte int,
foreign key (fkSuporte) references suporte(idSuporte));

create table especie(
idEspecie int primary key,
especie varchar(20),
tempEspecie decimal);

create table boi (
idBoi int primary key auto_increment,
qtdBois varchar(45),
fkEspecie int,
foreign key (fkEspecie) references especie(idEspecie),
fkClienteEmpresa int,
foreign key (fkClienteEmpresa) references clienteEmpresa(idCliente));

create table caminhao(
idTransp int primary key,
tipoCarroceria varchar(40),
placa varchar(7),
qtdBovinos int,
fkEspecie int,
foreign key (fkEspecie) references especie(idEspecie),
fkCliente int,
foreign key (fkCliente) references clienteEmpresa(idCliente));

create table sensor(
idDados int primary key auto_increment,
umidade decimal,
temperatura decimal,
dtRegistro datetime,
fkCaminhao int,
foreign key (fkCaminhao) references caminhao(idTransp));





