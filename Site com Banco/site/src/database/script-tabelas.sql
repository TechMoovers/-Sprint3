Create database techmoovers;
Use techmoovers;

Create table Usuario(
idCadastro int primary key auto_increment,
razao varchar(50),
nome varchar(45),
email varchar(45),
senha varchar(45),
cnpj char(14));

select * from Usuario;

