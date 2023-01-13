create table if not exists cliente (
	cpf varchar(14) not null primary key,
	nome varchar(45) not null,
	telefone varchar(45) not null
);
create table if not exists produto(
	id int not null primary key,
	nome varchar(45) not null,
	tipoMadeira varchar(45),
	preco int not null,
	qtEstoque int
);
create table if not exists compra(
	cpfCliente varchar(14),
	idProduto int,
	datacompra varchar(45),
	qtComprada int,
	taxaEntrega float4,
	constraint fk_cliente
		foreign key(cpfCliente) references cliente(cpf)
		on delete cascade on update cascade,
	constraint fk_produto
		foreign key(idProduto) references produto(id)
		on delete cascade on update cascade
);
select * from cliente;
select * from compra;
select * from produto;

drop table compra;
drop table cliente;
drop table produto;
-- Questão 1
alter table cliente add cep varchar(9);	
alter table produto alter column preco type float;
alter table compra drop taxaEntrega;

--Adicionando Elementos
insert into cliente(cpf,nome,telefone) values 
('492.441.760-25','Luciano','(35)99875-5572'),
('456.841.862-03','Flavio','(35)3473-8562'),
('192.041.526-14','Paola','(35)3471-1519'),
('556.851.862-88','Aline','(11)99822-9639');

insert into produto(id,nome,tipoMadeira,preco,qtEstoque) values
(0300,'Baleia Azul','Carvalho',29.90,3),
(0301,'Moinho de Vento','Ipê',24.90,2),
(0400,'Conjunto de Banquinhos','Carvalho',42,4),
(0500,'Porta-chaves','Goiabão',8.90,7),
(0501,'Mini Avião','Mogno',27.90,4),
(0502,'Tronco Esculpido','Goiabão',69.90,2),
(0503,'Vaso de Flores','Aroeira',9.90,4),
(0504,'Urso Pardo','Aroeira',28.90,2),
(0505,'Peixe Dourado','Ipê',37.90,2),
(0800,'Galinha Pintada','Carvalho',11.90,4),
(0801,'Flauta','Mogno',18.90,2),
(0802,'Guitarra', 'Alder', 1000, 5),
(0900,'Tábua de Corte','Carvalho',8.90,4);

--Questão 2
update cliente set cep = '35460-153' where cpf = '556.851.862-88';
update cliente set telefone = '(35)98834-4676' where cpf = '492.441.760-25';
update produto set nome = 'Banquinhos Infantis', preco =15.90,
qtEstoque = 12 where id = 0400; 

--Questão 3 
insert into compra(cpfCliente,idProduto,datacompra,qtcomprada) values
('492.441.760-25', '0301', '2018-08-20', '1'),
('556.851.862-88', '0503', '2020-11-12', '2'),
('456.841.862-03', '0802', '2020-10-30', '1');

select c.nome, p.nome, com.datacompra, com.qtcomprada from cliente c
join compra com on c.cpf = com.cpfcliente
join produto p on p.id = com.idproduto

--Questão 4
select * from produto where preco = (select	max(preco)from produto);
select * from produto where preco = (select	min(preco)from produto);
select avg(qtEstoque) Quantidade_em_estoque from produto;
select count(*) from cliente 