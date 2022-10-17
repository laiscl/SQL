CREATE DATABASE IMOVEIS
go

USE IMOVEIS
go

-- Tabelas

CREATE TABLE Bairro (
       cd_Bairro            int NOT NULL,
       cd_Cidade            int NOT NULL,
       sg_Estado            char(2) NOT NULL,
       nm_Bairro            varchar(20) NULL
)
go

CREATE TABLE Cidade (
       cd_Cidade            int NOT NULL,
       sg_Estado            char(2) NOT NULL,
       nm_Cidade            varchar(20) NULL
)
go

CREATE TABLE Comprador (
       cd_Comprador         int NOT NULL,
       nm_Comprador         varchar(20) NULL,
       ds_Endereco          varchar(20) NULL,
       cd_CPF               int NULL,
       nm_Cidade            varchar(20) NULL,
       nm_Bairro            varchar(20) NULL,
       sg_Estado            varchar(20) NULL,
       cd_Telefone          varchar(20) NULL,
       ds_Email             varchar(20) NULL
)
go

CREATE TABLE Estado (
       sg_Estado            char(2) NOT NULL,
       nm_Estado            varchar(20) NULL
)
go

CREATE TABLE Faixa_Imovel (
       cd_Faixa             int NOT NULL,
       nm_Faixa             varchar(30) NULL,
       vl_Maximo            money NULL,
       vl_Minimo            money NULL
)
go

CREATE TABLE Imovel (
       cd_Imovel            int NOT NULL,
       cd_Vendedor          int NULL,
       cd_Bairro            int NULL,
       cd_Cidade            int NULL,
       sg_Estado            char(2) NULL,
       ds_Endereco          varchar(40) NULL,
       qt_AreaUtil          decimal(10,2) NULL,
       qt_AreaTotal         decimal(10,2) NULL,
       ds_Imovel            varchar(300) NULL,
       vl_Imovel            money NULL,
       qt_Ofertas           int NULL,
       ic_Vendido           char(1) NULL,
       dt_Lancto            datetime NULL,
       qt_ImovelIndicado    int NULL
)
go

CREATE TABLE Oferta (
       cd_Comprador         int NOT NULL,
       cd_Imovel            int NOT NULL,
       vl_Oferta            money NULL,
       dt_Oferta            datetime NULL
)
go

CREATE TABLE Vendedor (
       cd_Vendedor          int NOT NULL,
       nm_Vendedor          varchar(40) NULL,
       ds_Endereco          varchar(40) NULL,
       cd_CPF               decimal(11) NULL,
       nm_Cidade            varchar(20) NULL,
       nm_Bairro            varchar(20) NULL,
       sg_Estado            char(2) NULL,
       cd_Telefone          varchar(20) NULL,
       ds_Email             varchar(80) NULL
)
go
Create Table Contrato (
	cd_Contrato int not null,
	cd_Imovel int,
	cd_Comprador int,
	dt_Contrato datetime,
	vl_Contrato money,
	qt_Parcela int)
go
Create Table Parcelas (
	cd_Contrato int not null,
	qt_Parcela int not null,
	vl_Parcela money,
	dt_Vencimento datetime,
	dt_Pagamento datetime,
	vl_Multa money)
go
Create Table Inadimplentes (
	cd_Imovel int not null,
	qt_Parcela int not null,
	dt_Vencimento datetime,
	vl_Parcela money)
go

-- Chaves Primárias

ALTER TABLE Bairro
       ADD PRIMARY KEY (cd_Bairro, cd_Cidade, sg_Estado)
go
ALTER TABLE Cidade
       ADD PRIMARY KEY (cd_Cidade, sg_Estado)
go
ALTER TABLE Comprador
       ADD PRIMARY KEY (cd_Comprador)
go
ALTER TABLE Estado
       ADD PRIMARY KEY (sg_Estado)
go
ALTER TABLE Faixa_Imovel
       ADD PRIMARY KEY (cd_Faixa)
go
ALTER TABLE Imovel
       ADD PRIMARY KEY (cd_Imovel)
go
ALTER TABLE Oferta
       ADD PRIMARY KEY (cd_Comprador, cd_Imovel)
go
ALTER TABLE Vendedor
       ADD PRIMARY KEY (cd_Vendedor)
go
Alter Table Contrato
	   Add Primary Key (cd_Contrato)
go
Alter Table Parcelas
	   Add Primary Key (cd_Contrato, qt_Parcela)
go
Alter Table Inadimplentes
	   Add Primary Key (cd_Imovel, qt_Parcela)
go
-- Chaves Estrangeiras

ALTER TABLE Bairro
       ADD FOREIGN KEY (cd_Cidade, sg_Estado)
                             REFERENCES Cidade
go
ALTER TABLE Cidade
       ADD FOREIGN KEY (sg_Estado)
                             REFERENCES Estado
go
ALTER TABLE Imovel
       ADD FOREIGN KEY (cd_Vendedor)
                             REFERENCES Vendedor
go
ALTER TABLE Imovel
       ADD FOREIGN KEY (cd_Bairro, cd_Cidade, sg_Estado)
                             REFERENCES Bairro
go
ALTER TABLE Oferta
       ADD FOREIGN KEY (cd_Comprador)
                             REFERENCES Comprador
go
ALTER TABLE Oferta
       ADD FOREIGN KEY (cd_Imovel)
                             REFERENCES Imovel
go
Alter Table Parcelas
	   Add Foreign Key (cd_Contrato)
                             References Contrato
go
Alter Table Contrato
	   Add Foreign Key (cd_Imovel)
                             References Imovel
go
Alter Table Inadimplentes
	   Add Foreign Key (cd_Imovel)
                             References Imovel
go
-- Registros
insert into Estado
	values( 'SP','SÃO PAULO')
go
insert into Estado
	values( 'RJ','RIO DE JANEIRO')
go


insert into Cidade
	values( 1,'SP','SÃO PAULO')
go
insert into Cidade
	values(2,'SP','SANTO ANDRÉ')
go
insert into Cidade
	values(3,'SP','CAMPINAS')
go
insert into Cidade
	values(1,'RJ','RIO DE JANEIRO')
go
insert into Cidade
	values(2,'RJ','NITEROI')
go


insert into Bairro
	values(1,1,'SP','JARDINS')
go
insert into Bairro
	values(2,1,'SP','MORUMBI')
go
insert into Bairro
	values(3,1,'SP','AEROPORTO')
go
insert into Bairro
	values(1,1,'RJ','AEROPORTO')
go
insert into Bairro
	values(2,1,'RJ','NITEROI')
go


insert into Vendedor (cd_Vendedor, nm_Vendedor,ds_Endereco,ds_Email)
	values(1,'MARIA DA SILVA','RUA DO GRITO, 45','msilva@nova.com')
go
insert into Vendedor (cd_Vendedor, nm_Vendedor,ds_Endereco,ds_Email)
	values(2,'MARCO ANDRADE','AV. DA SAUDADE,325','mandrade@nova.com')
go
insert into Vendedor (cd_Vendedor, nm_Vendedor,ds_Endereco,ds_Email)
	values(3,'ANDRÉ CARDOSO','AV. BRASIL, 401','acardoso@nova.com')
go
insert into Vendedor (cd_Vendedor, nm_Vendedor,ds_Endereco,ds_Email)
	values(4,'TATIANA SOUZA','RUA DO IMPERADOR, 778','tsouza@nova.com')
go


insert into Imovel 
	(cd_Imovel,cd_Vendedor,cd_Bairro,cd_Cidade,sg_Estado,ds_Endereco,qt_AreaUtil,qt_AreaTotal,vl_Imovel)
	values(1,1,1,1,'SP','AL. TIETE, 3304/101',250,400,180000)
go
insert into Imovel
		(cd_Imovel,cd_Vendedor,cd_Bairro,cd_Cidade,sg_Estado,ds_Endereco,qt_AreaUtil,qt_AreaTotal,vl_Imovel)
	values(2,1,2,1,'SP','AV. MORUMBI, 2230',150,250,135000)
go
insert into Imovel
	(cd_Imovel,cd_Vendedor,cd_Bairro,cd_Cidade,sg_Estado,ds_Endereco,qt_AreaUtil,qt_AreaTotal,vl_Imovel)
	values(3,2,1,1,'RJ','R. GAL. OSORIO, 445/34',250,400,185000)
go
insert into Imovel
	(cd_Imovel,cd_Vendedor,cd_Bairro,cd_Cidade,sg_Estado,ds_Endereco,qt_AreaUtil,qt_AreaTotal,vl_Imovel)
	values(4,2,2,1,'RJ','R. D. PEDRO I, 882',120,200,110000)
go
insert into Imovel
	(cd_Imovel,cd_Vendedor,cd_Bairro,cd_Cidade,sg_Estado,ds_Endereco,qt_AreaUtil,qt_AreaTotal,vl_Imovel)
	values(5,3,3,1,'SP','AV. RUBENS BERTA, 2355',110,200,95000)
go
insert into Imovel
	(cd_Imovel,cd_Vendedor,cd_Bairro,cd_Cidade,sg_Estado,ds_Endereco,qt_AreaUtil,qt_AreaTotal,vl_Imovel)
	values(6,4,1,1,'RJ','R. GETULIO VARGAS, 552',200,300,99000)
go


insert into Comprador (cd_Comprador,nm_Comprador,ds_Endereco,ds_Email)
	values(1,'EMMANUEL ANTUNES','R. SARAIVA, 452','eantunes@nova.com')
go
insert into Comprador (cd_Comprador,nm_Comprador,ds_Endereco,ds_Email)
	values(2,'JOANA PEREIRA','AV PROTUGAL, 52','jpereira@nova.com')
go
insert into Comprador (cd_Comprador,nm_Comprador,ds_Endereco,ds_Email)
	values(3,'RONALDO CAMPELO','R. ESTADOS UNIDOS','rcampelo@nova.com')
go
insert into Comprador (cd_Comprador,nm_Comprador,ds_Endereco,ds_Email)
	values(4,'MANFRED AUGUSTO','AV. BRASIL,351','maugusto@nova.com')
go


insert into Oferta
	values(1,1,170000,'10-01-2009')
go
insert into Oferta
	values(1,3,180000,'10-01-2009')
go
insert into Oferta
	values(2,2,135000,'15-01-2009')
go
insert into Oferta
	values(2,4,100000,'15-02-2009')
go
insert into Oferta
	values(3,1,160000,'15-01-2009')
go
insert into Oferta
	values(3,2,140000,'20-02-2009')
go

-- 1.Liste todas as linhas e os campos cd_Comprador, nm_Comprador e ds_Email da tabela COMPRADOR
select cd_Comprador,nm_Comprador, ds_Email
	From Comprador
-- 2.Liste todas as linhas e os campos cd_Vendedor, nm_Vendedor e ds_Email da tabela VENDEDOR em ordem alfabética
select cd_Vendedor, nm_Vendedor, ds_Email
From Vendedor
Order by nm_Vendedor;
-- 3.Liste as colunas cd_Imovel, cd_Vendedor e vl_Imovel de todos os imóveis do vendedor 2.
select cd_Imovel, cd_Vendedor, vl_Imovel
From Imovel
Where cd_Vendedor = 2
-- 4.Liste as colunas cd_Imovel, cd_Vendedor, vl_Imovel e sg_Estado dos imóveis cujo preço de venda seja inferior a 150 mil e sejam do Estado do RJ.
select cd_Imovel, cd_Vendedor, vl_Imovel, sg_Estado
From Imovel
Where vl_Imovel < 150000 and sg_Estado = 'RJ'
-- 5.Liste as colunas cd_Imovel, cd_Vendedor, vl_Imovel e sg_Estado dos imóveis cujo preço de venda seja inferior a 150 mil ou seja do vendedor não seja 2.
select cd_Imovel, cd_Vendedor, vl_Imovel, sg_Estado
From Imovel
Where vl_Imovel < 150000 and cd_Vendedor <> 2;
-- 6. Liste as colunas cd_Comprador, nm_Comprador, ds_Endereco e sg_Estado da tabela COMPRADOR em que o Estado seja nulo.
select cd_Comprador, nm_Comprador, ds_Endereco, sg_Estado
From Comprador
Where sg_Estado is null;
-- 7.Liste todas as ofertas cujo valor esteja entre 100 mil e 150 mil
select *
from Oferta
Where vl_Oferta between 100000 and 150000;
-- 8. Liste todos os vendedores que tenham a letra A na segunda posição do nome.
select nm_vendedor
from vendedor
Where nm_Vendedor like '_a%';
-- 9. Liste todas as ofertas cujo imóvel seja 2 ou 3 e o valor da oferta seja maior que 130 mil, em ordem decrescente de data.
select *
from oferta
where cd_Imovel in(2,3) and vl_Oferta >130000
Order by dt_Oferta desc
--10. Liste todos os imóveis cujo preço de venda esteja entre 110 mil e 200 mil ou seja do vendedor 1 em ordem de área útil.
select *
from imovel 
Where (vl_Imovel between 110000 and 200000) or cd_Vendedor = 1
order by qt_AreaUtil

--11. Mostre o maior, o menor, o total e a média de preço de venda dos imóveis.
select MAX(vl_Imovel) maior, MIN(vl_Imovel) menor, AVG (vl_Imovel) média, SUM(vl_Imovel) soma_total
from Imovel
--12. Modifique o comando anterior para que sejam mostrados os mesmos índices por bairro.

select cd_Bairro, cd_Cidade, sg_Estado, MAX(vl_Imovel) maior, MIN(vl_Imovel) menor, AVG (vl_Imovel) média, SUM(vl_Imovel) soma_total
from Imovel
Group by cd_Bairro, cd_Cidade, sg_Estado

/*1. Liste o total de ofertas por comprador de 2008 a 2009 mostrando o total geral no final da listagem*/
Select cd_Comprador, sum(vl_Oferta) 
	From Oferta 
	Where Year(dt_Oferta) Between 2008 and 2009 
	Group by cd_Comprador with Rollup --soma total

/*2. Liste o valor médio de todos os Imóveis por bairro, somente do estado de São Paulo e coloque o resultado em ordem decrescente de valor.*/
Select cd_Bairro, cd_Cidade, sg_Estado, AVG(vl_Imovel) as Media
	From Imovel
	Group By cd_Bairro, cd_Cidade, sg_Estado
	Having sg_Estado = 'sp'
	Order by Media desc
/*3. Liste o maior valor de imóvel por vendedor, somente para os vendedores 1 e 2.*/
Select cd_Vendedor, Max(vl_Imovel)Maior_Valor
	From Imovel
	Group By cd_Vendedor
	Having cd_Vendedor in (1,2)
/*4. Mostre a quantidade de imóveis cujo preço de venda seja inferior a 150 mil por Estado e a área total inferior a 300.*/
Select sg_Estado, Count(*) VL_TOTAL
	From Imovel 
	Where vl_Imovel < 150000 and qt_AreaTotal < 300
	Group by sg_Estado
/*5. Escreva o comando para apresentar o preço médio dos Imóveis por código de vendedor. 
Considere somente aqueles que custam mais de  100000 e o valor médio não ultrapasse 200000.*/
Select cd_Vendedor, AVG(vl_Imovel) Media_Imovel
	From Imovel
	Where vl_Imovel >100000
	Group by cd_Vendedor
	Having AVG(vl_Imovel) <= 200000
/*6. Apresente o preço máximo, o preço mínimo e o preço médio dos 
Imóveis cujos os estados são “SP”, “RJ” ou “MG” por código de Cidade, colocar em ordem crescente de estado.*/
Select cd_Cidade, sg_Estado, MAX(vl_Imovel) Preço_Maior, MIN(vl_Imovel) Preço_Menor, AVG(vl_Imovel) Preço_Médio
	From Imovel
	Group By cd_Cidade, sg_Estado
	Having sg_Estado in ('SP', 'RJ', 'MG')
	Order By sg_Estado

/*7. Escreva o comando para apresentar o preço médio das ofertas por 
comprador, somente para as ofertas feitas em outubro de 2009.*/

Select cd_Comprador, AVG(vl_Oferta) Media
	From Oferta 
	Where Month(dt_Oferta) = 10 and Year (dt_Oferta) = 2009
	Group By cd_Comprador

/*8. Mostre soma das ofertas por mês, somente o ano de 2009, cujo 
valor esteja entre 100 mil e 250 mil.*/

Select Month(dt_Oferta), SUM(vl_Oferta)
	From Oferta	
	Where Year(dt_Oferta) = 2009 and vl_Oferta between 100000 and 250000
	Group By Month (dt_Oferta)
