create table if not exists telecomunicacoes(
	cpf integer not null auto_increment, 
	nome varchar(200) not null, 
	data_nascimento integer not null, 
	endereco varchar(200) not null, 
	cep integer not null, 
	bairro varchar(200) not null, 
	cidade varchar(100) not null, 
	uf varchar(2) not null,
	
	primary key(cpf)
);

-- adicionar novo campo a tabela: 
-- https://cursos.alura.com.br/forum/topico-incluir-nova-coluna-em-tabela-existente-227158

ALTER TABLE telecomunicacoes
ADD COLUMN data_ultima_compra integer not null;


select * from telecomunicacoes;

insert into telecomunicacoes (
	cpf, nome, data_nascimento, endereco, 
	cep, bairro, cidade, uf, data_ultima_compra
)values(
  01808177282, "João da Silva", 25/11/1969, "Rua Antônio Numes", 
  88045963, "Palmeiras", "Londrina", "PR", 25/11/2020
);


insert into telecomunicacoes (
	cpf, nome, data_nascimento, endereco, 
	cep, bairro, cidade, uf, data_ultima_compra
)values(
  676936410, "Ana Regina Fagundes", 21/09/1986, "Rua Palmeias Novas", 
  88078923, "Leblon", "Rio de Janeiro", "RJ", 25/11/2021
);

insert into telecomunicacoes (
	cpf, nome, data_nascimento, endereco, 
	cep, bairro, cidade, uf, data_ultima_compra
)values(
  03350314, "Fernando Soares", 05/03/1990, "Rua Palmeias Novas", 
  88048917, "Copacabana", "Rio de Janeiro", "RJ", 25/11/2022
);

-- Selecionar todos os clientes que residam na cidade do Rio de Janeiro.
SELECT nome, cidade from telecomunicacoes
WHERE cidade = "Rio de Janeiro";

-- Deletar os clientes que residam na cidade de Londrina.
delete from telecomunicacoes where cidade = "Londrina"; 

