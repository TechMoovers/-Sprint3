Create database Exercicio11;

use Exercicio11;

create table Departamento(
idDepto int primary key,
nomeDepto varchar(50),
fkGerente int,
dataInicioGer datetime);

insert into Departamento (idDepto, nomeDepto, fkGerente, dataInicioGer) values
(105,'Pesquisa',2,'2008-05-22'),
(104,'Pesquisa',7,'2015-01-01'),
(101,'Pesquisa',8,'2001-06-19');

create table Funcionario(
idFunc int primary key,
nomeFunc varchar(30),
salario decimal(10,2),
sexo char(1),
fkSupervisor int,
dataNasc datetime,
fkDepto int);

insert into Funcionario (idFunc, salario, sexo, fkSupervisor, dataNasc,fkDepto) values
(1,'Joao Silva',3500,'m',2,'1985-01-09',105),
(2,'Fernando Wong',4500,'m',8,'1970-01-19',105),
(3,'Alice Sousa',2500,'f',7,'1988-01-19',104),
(4,'Janice Morais',4300,'f',8,'1970-06-20',104),
(5,'Ronaldo Lima',3800,'m',1,'1982-09-15',105),
(6,'Joice Leite',2500,'f',1,'1992-07-31',105),
(7,'Antonio Pereira',2500,'m',4,'1989-03-29',104),
(8,'Juliano Brito',5500,'m',null,'1957-11-10',101);




