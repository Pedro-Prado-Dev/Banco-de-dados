create table if not exists Funcionario(
	Id serial not NULL primary key,
	nome VARCHAR(45) not NULL,
	endereco VARCHAR(45) not NULL
);

Create table if not exists Dependente(
	Id serial not null primary key,
    nome VARCHAR(45) not NULL,
	endereco VARCHAR(45) not NULL,
    FuncionarioId int not null,
    Constraint fk_funcionario
		Foreign key(FuncionarioId) references Funcionario(id)
        On update cascade on delete cascade
);
select * from Funcionario;
select * from Dependente;


--Alterando a tabela Funcionario
alter table Funcionario add if not exists Documento varchar(45);
alter table Funcionario alter column Documento varchar(10); --column não é necessário
alter table Funcionario drop Documento;

--Excluindo a tabela Dependente com referencia depois a tabela Funcionario
drop table Dependente;
drop table Funcionario;

--Inserindo na tabela um registro por vez
Insert into Funcionario(nome, endereco) values('Gabriela','Rua 1');
Insert into Funcionario(nome, endereco) values('Guilherme','Rua 1');
Insert into Funcionario(nome, endereco) values('Thiago','Rua 2');

--Inserindo na tabela mais de um registro
Insert into Dependente(nome,endereco, FuncionarioId) values
('Roberto','Rua 3',1),('Fernando','Rua 3',1);

--Atualizando informações dentro da tabela
Update Funcionario set endereco = 'Rua 20' where id = 2;
Update Funcionario set endereco = 'Rua 10' where nome = 'Guilherme';

--Deletando informações dentro da tabela
Delete from Funcionario where id = 3;
Delete from Funcionario where nome = 'Thiago';

--Busca edentro do Banco de Dados
Select Nome, Endereco from Dependente;
Select * from Funcionario where nome like 'T__%';

Select f.nome, d.nome from Funcionario as f join Dependente as d 
on f.id = d.funcionarioid; --As opicional
Select f.nome, d.nome from Funcionario f join Dependente d 
on f.id = d.funcionarioid where d.id >= 2;
Select f.nome, d.nome from Funcionario f left join Dependente d 
on f.id = d.funcionarioid;
Select f.nome, d.nome from Funcionario f right join Dependente d 
on f.id = d.funcionarioid;

