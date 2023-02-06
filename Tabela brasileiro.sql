create database brasileiro;
use brasileiro;

create table campeonato (
	id_campeonato int primary key auto_increment,
    nome varchar(45) not null ,
    ano varchar(5) not null
);

create table estadio_local (
	id_estadio_local int primary key auto_increment,
    cidade varchar(45) not null,
    estado varchar(45) not null
);

create table estadio (
	id_estadio int primary key auto_increment,
    nome varchar (45) not null,
    capacidade int(6) not null,
    id_estadio_local int,
    constraint FK_estadio_local foreign key (id_estadio_local) references estadio_local(id_estadio_local)
);

create table clube (
	id_clube int primary key auto_increment,
	nome varchar (45) not null,
    tecnico varchar (50) not null,
	classificacao tinyint not null,
	pontuacao int (5) not null,
	saldogols int (3) not null,
    vitorias int (2) not null,
    derrotas int (2) not null,
    empates int (2) not null
);

create table jogador (
	id_jogador int primary key auto_increment,
	nome varchar (45) not null,
    idade int(2) not null,
	posicao varchar (45) not null,
	nacionalidade varchar (45) not null,
    peso decimal not null,
    altura varchar(5) not null,
    id_clube int,
    constraint FK_clube foreign key (id_clube) references clube(id_clube)
);


create table partida (
	id_partida int primary key auto_increment,
	data_hora datetime not null,
	clube_estadio varchar (45),
    id_estadio int,
    constraint FK_estadio foreign key (id_estadio) references estadio(id_estadio),
    id_campeonato int,
    constraint FK_campeonato foreign key (id_campeonato) references campeonato(id_campeonato)
);

create table clube_partida (
	id_clube int,
	id_partida int,
    gols int,
    vitoria int (2) not null,
    derrota int (2) not null,
    empate int (2) not null,
    constraint PK_clube_partida primary key(id_clube, id_partida),
    constraint FK_clubeP foreign key (id_clube) references clube(id_clube),
    constraint FK_partida foreign key (id_partida) references partida(id_partida)
);

create table escalacao (
	id_jogador int,
    id_partida int,
    gols int,
	assistencias int,
	cartaoA int(2),
	cartaoV int(2),
    faltas int, 
    constraint PK_escalacao primary key(id_jogador, id_partida),
    constraint FK_jogador foreign key (id_jogador) references jogador(id_jogador),
    constraint FK_partida_escalacao foreign key (id_partida) references partida(id_partida)
);

insert into campeonato values(0, "Brasileirão", 2022);

insert into estadio_local
VALUES
 (0, 'Rio de Janeiro', 'RJ'), 
 (0, 'São Paulo', 'SP'),
 (0, 'Santos', 'SP'),
 (0, 'Belo Horizonte', 'MG'),
 (0, 'Porto Alegre', 'RS');
 
insert into estadio
VALUES
(0,'maracanã', 78838, 1),
(0, 'allianz parque' , 45000, 2),
(0, 'vila belmiro', 16068, 3),
(0, 'são Januário', 21880, 1),
(0, 'BeiraRio', 50842, 5),
(0, 'Nilton Santos', 46831, 1),
(0, 'Neo Química Arena', 49205, 2),
(0, 'Cícero Pompeu de Toledo', 66795, 2),
(0, 'Mineirão',61927, 4);

insert into clube (id_clube, classificacao, nome, pontuacao, vitorias, empates, derrotas, saldogols, tecnico)
VALUES
(0, 1, 'Palmeiras', 81, 23, 12, 3, 39, 'Abel Ferreira'),
(0, 2, 'Internacional', 73, 20, 13, 5, 27, 'Mano menezes'),
(0, 3, 'Fluminense', 70, 21, 7, 10	,22,'Fernando Diniz'),
(0, 4, 'Corinthians', 65 , 18 , 11 , 9 , 8 , 'Vitor Pereira'),
(0, 5, 'Flamengo',	62, 18, 8, 12, 21, 'Dorival Júnior'),
(0, 6, 'São Paulo', 54, 13, 15, 10, 13, 'Rogerio Ceni'),
(0, 7, 'Botafogo', 53 , 15, 8, 15,'-2' ,'Luis castro'),
(0, 8, 'Santos', 47, 12, 11, 15, 3, 'Orlando ribeiro'),
(0, 9, 'Cruzeiro', 39, 11, 7, 5 , 14, 'Paulo Pezzolano'),
(0, 10, 'Vasco da Gama', 33, 10, 3, 10, 12, 'Jorge de amorim');

-- id_jogador começa com 4

insert into jogador (id_jogador, nome, posicao, idade, nacionalidade, altura, peso, id_clube) 
VALUES
(0,'Weverton', 'Goleiro', 34, 'Brasil', '1,89', 91, 1),
(0, 'Renan', 'Zagueiro', 20, 'Brasil', '1,84', 78, 1),
(0, 'Gustavo Gómez', 'Zagueiro', 29,'Paraguai', '1,85', 86, 1),
(0, 'Rony', 'Centroavante', 27, 'Brasil', '1,67', 63, 1),
(0, 'Endrick', 'Centroavante', 15, 'Brasil', '1,73', 60, 1);

insert into jogador(id_jogador, nome, posicao, idade, nacionalidade, altura, peso, id_clube) 
VALUES 
(0,'Santos', 'Goleiro', 32, 'Brasil', '1,89', 79, 5),
(0,'Leo pereira ', 'zagueiro', 26, 'Brasil', '1,89', 84, 5),
(0,'David Luiz ', 'zagueiro', 35, 'Brasil', '1,89', 86, 5),
(0,'Pedro ', 'atacante', 25, 'Brasil', '1,89', 78, 5),
(0,'Gabriel Barbosa ', 'atacante', 26, 'Brasil', '1,89', 68, 5);

insert into jogador(id_jogador, nome, posicao, idade, nacionalidade, altura, peso, id_clube) 
VALUES
(0, 'Cássio', 'Goleiro', 35, 'Brasil', '1,95', 92, 4),
(0, 'João Victor', 'Zagueiro', 23, 'Brasil', '1,87', 77, 4),
(0, 'Fabián Balbuena', 'Zagueiro', 30, 'Paraguai', '1,88', 88, 4),
(0, 'Yuri Alberto', 'Centroavante', 21, 'Brasil', '1,83', 78, 4),
(0, 'Róger Guedes', 'Centroavante', 25, 'Brasil', '1,82', 76, 4);

insert into jogador(id_jogador, nome, posicao, idade, nacionalidade, altura, peso, id_clube) 
VALUES
(0, 'João Paulo', 'Goleiro', 27, 'Brasil', '1,88', 86, 8),
(0, 'Kaiky', 'Zagueiro', 18, 'Brasil', '1,86', 76, 8),
(0, 'Eduardo Bauermann', 'Zagueiro', 26, 'Brasil', '1,87', 85, 8),
(0, 'Marcos Leonardo', 'Centroavante', 19, 'Brasil', '1,74', 70, 8),
(0, 'Bryan Angulo', 'Centroavante', 26, 'Equador', '1,83', 70, 8);

insert into jogador(id_jogador, nome, posicao, idade, nacionalidade, altura, peso, id_clube) 
VALUES
(0, 'Marcos Felipe', 'Goleiro', 26, 'Brasil', '1,88', 83, 3),
(0, 'Nino', 'Zagueiro', 25, 'Brasil', '1,88', 82, 3),
(0, 'David Duarte', 'Zagueiro', 27, 'Brasil', '1,92', 89, 3),
(0, 'Michel Araújo', 'Ponta Direita', 25, 'Uruguai', '1,78', 74, 3),
(0, 'John Kennedy', 'Centroavante', 20, 'Brasil', '1,81', 71, 3);

insert into jogador(id_jogador, nome, posicao, idade, nacionalidade, altura, peso, id_clube) 
VALUES
(0, 'Thiago Rodrigues ' , 'goleiro' , 34 , 'Brasil' , 1.9 , 80, 10),
(0, 'Danilo Boza' , 'zagueiro' , 24 , 'Brasil' , 1.84 , 76, 10),
(0, 'Matheus Antunes' , 'zagueiro' , 29 , 'Brasil' , 1.78 , 68, 10),
(0, 'Bruno Tubarão' , 'atacante' , 27 , 'Brasil' , 1.80 , 70, 10),
(0, 'Figueiredo' , 'atacante' , 21 , 'Brasil' , 1.78, 75, 10);

insert into jogador(id_jogador, nome, posicao, idade, nacionalidade, altura, peso, id_clube) 
VALUES
(0, 'Rafael Cabral' , 'goleiro' , 32 , 'Brasil' , 1.86 , 83, 9),
(0, 'Matheus Bidu' , 'zagueiro' , 23 , 'Brasil' , 1.72 , 72, 9),
(0, 'Geovane de Jesus' , 'zagueiro' , 21 , 'Brasil' , 1.76 , 70, 9),
(0, 'Luvannor Henrique' , 'atacante' , 32 , 'Brasil' , 1.82 , 78, 9),
(0, 'Edu' , 'atacante' , 29 , 'Brasil' , 1.84 , 79, 9);

insert into jogador(id_jogador, nome, posicao, idade, nacionalidade, altura, peso, id_clube) 
VALUES
(0, 'Gatito Fernández', 'Goleiro', 34, 'Paraguai', '1,91', 86, 7),
(0, 'Adryelson', 'Zagueiro', 24, 'Brasil', '1,85', 78, 7),
(0, 'Kanu', 'Zagueiro', 25, 'Brasil', '1,86', 74, 7),
(0, 'Patrick de Paula', 'Meia Central', 22, 'Brasil', '1,78', 78, 7),
(0, 'Matheus Nascimento', 'Centroavante', 18, 'Brasil', '1,82', 71, 7);

insert into jogador(id_jogador, nome, posicao, idade, nacionalidade, altura, peso, id_clube) 
VALUES
(0, 'Felipe Alves' , 'goleiro' , 34 , 'Brasil' , 1.87 , 79, 6),
(0, 'Nahuel Ferraresi' , 'zagueiro' , 24 , 'Brasil' , 1.9 , 80, 6),
(0, 'Reinaldo Manoel' , 'zagueiro' , 33 , 'Brasil' , 1.79 , 79, 6),
(0, 'Giuliano Galoppo' , 'atacante' , 23 , 'Brasil' , 1.79 , 73, 6),
(0, 'Nahuel Bustos' , 'atacante', 24 , 'Brasil' , 1.76 , 74, 6);

insert into jogador(id_jogador, nome, posicao, idade, nacionalidade, altura, peso, id_clube) 
VALUES
(0, 'Daniel', 'Goleiro', 28, 'Brasil', '1,88', 93,2),
(0, 'Bruno Méndez', 'Zagueiro', 22, 'Uruguai', '1,80', 81,2),
(0, 'Vitão', 'Zagueiro', 22, 'Brasil', '1,85', 75,2),
(0, 'Alan Patrick', 'Meia Ofensivo', 31, 'Brasil', '1,77', 68,2),
(0, 'Yuri Alberto', 'Centroavante', 21, 'Brasil', '1,83', 78,2);

insert into partida(id_partida, data_hora, clube_estadio, id_estadio, id_campeonato)
VALUES
(0, '2022-01-01 19:00:00', 'Flamengo', 1, 1),
(0, '2022-01-01 19:00:00', 'Corinthians', 7, 1),
(0, '2022-01-01 20:30:00', 'Palmeiras', 2, 1),
(0, '2022-01-01 21:30:00', 'Cruzeiro', 9, 1),
(0, '2022-01-01 21:30:00', 'Internacional', 5, 1);

insert into clube_partida(id_partida, id_clube, gols, vitoria, derrota, empate)
VALUES
(1, 5, 3, 1 , 0, 0),
(1, 8, 1, 0 , 1, 0),

(2, 4, 0, 0 , 1, 0),
(2, 6, 2, 1, 0, 0),

(3, 1, 5, 1 , 0, 0),
(3, 7, 2, 0, 1, 0),

(4, 9, 0, 0 , 0, 1),
(4, 10, 0, 0, 0, 1),

(5, 2, 4, 1 , 0, 0),
(5, 3, 3, 0, 1, 0);

insert into escalacao(id_partida, id_jogador, gols, assistencias, cartaoA, cartaoV, faltas)
VALUES
(1, 6, 0, 0, 0, 0, 0),
(1, 7, 0, 0, 1, 0, 1),
(1, 8, 1, 0, 1, 0, 2),
(1, 10, 2, 1 , 0, 1, 0),
(1, 9, 0, 0, 0, 0, 1),

(1, 16, 0, 0, 1, 0, 1),
(1, 18, 0, 0, 0, 1, 0),
(1, 17, 1, 0, 0, 0, 0),
(1, 20, 0, 1, 0, 0, 3),
(1, 19, 0, 0, 0, 0, 0),

(2, 11, 0, 0, 0, 0, 0),
(2, 12, 0, 0, 1, 0, 2),
(2, 13, 0, 0, 1, 1, 0),
(2, 14, 0, 0, 1, 0, 0),
(2, 15, 0, 0, 0, 1, 0),

(2, 41, 1, 0, 0, 0, 0),
(2, 42, 0, 0, 0, 0, 2),
(2, 43, 0, 0, 2, 1, 0),
(2, 44, 1, 0, 1, 0, 1),
(2, 45, 0, 1, 1, 0, 1),

(3, 1, 0, 1, 0, 0, 0),
(3, 2, 0, 1, 0, 0, 2),
(3, 3, 1, 0, 0, 1, 0),
(3, 4, 1, 2, 0, 0, 0),
(3, 5, 3, 1, 0, 0, 4),

(3, 36, 0, 0, 1, 0, 1),
(3, 37, 0, 0, 0, 0, 0),
(3, 38, 0, 1, 0, 0, 3),
(3, 39, 0, 1, 0, 0, 0),
(3, 40, 2, 0, 0, 0, 5),

(4, 31, 0, 0, 0, 0, 0),
(4, 32, 0, 0, 1, 0, 2),
(4, 33, 0, 0, 1, 0, 0),
(4, 34, 0, 0, 1, 0, 0),
(4, 35, 0, 0, 1, 1, 0),

(4, 21, 0, 0, 1, 0, 0),
(4, 22, 0, 0, 1, 0, 2),
(4, 23, 0, 0, 1, 1, 0),
(4, 24, 0, 0, 1, 0, 0),
(4, 25, 0, 0, 0, 1, 0),

(5, 46, 0, 0, 1, 0, 1),
(5, 47, 0, 2, 0, 0, 4),
(5, 48, 1, 0, 2, 1, 0),
(5, 49, 1, 1, 1, 0, 0),
(5, 50, 2, 0, 0, 1, 0),

(5, 21, 0, 0, 0, 0, 0),
(5, 22, 0, 0, 1, 0, 2),
(5, 23, 0, 1, 0, 0, 0),
(5, 24, 2, 0, 0, 0, 3),
(5, 25, 1, 1, 0, 0, 0);

-- 1 -  Estadios e locais dos proximos jogos --
select e.id_estadio, e.nome, el.cidade, el.estado, e.capacidade from estadio as e
inner join estadio_local as el on e.id_estadio_local = el.id_estadio_local;
-- where e.nome = 'Vila Belmiro';

-- 2 - Mostra as caracteristicas dos jogadores de um time específico -- 
select j.nome, j.posicao, j.idade, j.altura, c.nome as nomeTime from jogador as j 
inner join clube as c on j.id_clube = c.id_clube
where c.nome = 'Flamengo'
order by j.nome ;

-- 3 - Resultados de uma rodada --
select c.classificacao, c.nome as Clubes, c.tecnico, cp.vitoria, cp.derrota, cp.empate from clube_partida as cp
inner join partida as p on p.id_partida = cp.id_partida
inner join clube as c on c.id_clube = cp.id_clube
order by classificacao;

-- 4 - Local , hora e data de quando vão ocorrer os jogos --
select C.nome as Campeonato, p.data_hora,clu.nome as Confronto, p.clube_estadio as Casa, e.nome as Estádio, el.cidade, el.estado, e.capacidade , cp.gols from partida as p
inner join estadio as e on e.id_estadio = p.id_estadio
inner join estadio_local as el on el.id_estadio_local = e.id_estadio_local
inner join campeonato as C on C.id_campeonato = p.id_campeonato
inner join clube_partida as cp on cp.id_partida = p.id_partida
inner join clube as clu on clu.id_clube = cp.id_clube 
where p.id_partida = 1;

-- 5 -  Estatística dos jogadores de uma partida --
select j.nome as Jogador,c.nome as Clube, e.gols, e.assistencias, e.faltas , e.cartaoA , e.cartaoV , e.id_partida as partida from escalacao as e
inner join jogador as j on j.id_jogador = e.id_jogador
inner join clube as c on c.id_clube = j.id_clube
where e.id_partida = 5
order by e.gols desc;
