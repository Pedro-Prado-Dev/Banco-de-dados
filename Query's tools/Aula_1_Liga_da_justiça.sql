create table if not exists vilao(
	idVilao serial not null primary key ,
    nome varchar(45) not null,
    qntCrimes int not null
);

create table if not exists agente(
	idAgente serial not null primary key ,
    nome varchar(45) not null,
    endereco varchar(100),
    sexo varchar(1)
);


create table if not exists missao(
	idMissao serial not null primary key ,
    nome varchar(45) not null,
    local varchar(100),
    duracao int,
    vilaoId int,
    constraint fk_vilao
		foreign key(vilaoId) references Vilao(idVilao)
        on delete cascade on update cascade
);



create table if not exists escala (
	agenteId int,
    missaoId int,
		constraint fk_agente
			foreign key(agenteId) references agente(idAgente)
            on delete cascade on update cascade,
		constraint fk_missao
			foreign key(missaoId) references missao(idMissao)
            on delete cascade on update cascade
            
);

INSERT INTO Agente(Nome, Endereco, Sexo) VALUES
('Batman', 'Gotham', 'M'),
('Ravena', 'Emília-Romanha', 'F'),
('Viúva Negra', 'União Soviética', 'F');

INSERT INTO Vilao (Nome, qntCrimes) VALUES
('Coringa', 1500),
('Pinguim', 200),
('General Dreykov', 30);

INSERT INTO Missao(Nome, Local, Duracao, VilaoId) VALUES
('Operação Sala Vermelha', 'União Soviética', 90, 3),
('Operação 2 Sala Vermelha', 'União Soviética', 200, 3),
('Roubo de Banco', 'Gotham', 20, 1),
('Destruição da Cidade', 'Gotham', 65, 2);

INSERT INTO Escala(AgenteId, MissaoId) VALUES
(3, 1), (3, 2), (1, 3), (1, 4), (2, 4);

Select * from vilao where qntCrimes = (select max(qntCrimes) from vilao);
Select * from missao where duracao = (select min(duracao) from 	missao);

Select avg(duracao) duracao_media from missao;

Select * from missao limit 1 offset 2;

Select count(*) from missao m join vilao v on m.vilaoid = v.idvilao 
where qntCrimes > 100;
Select m.nome,v.nome from missao m join vilao v on m.vilaoid = v.idvilao 
where qntCrimes > 100;

Select 
	a.nome,
	m.nome,
	m.duracao,
	v.nome,
	v.qntCrimes
From
	agente a
Join 
	escala e on a.idagente = e.agenteid
Join 
	missao m on e.missaoid = m.idmissao
Join
	vilao v on m.vilaoid = v.idvilao
Where
	m.duracao >= 30
And 
	v.qntcrimes > 40;