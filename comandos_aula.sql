1) Selecionar os nomes dos gêneros que não tem nenhuma música 
cadastrada.

SELECT generos.descricao
FROM generos
INNER JOIN musicas
ON generos.id = musicas.generos_id
AND musicas.generos_id = null;
-- WHERE musicas.generos_id = null;

SELECT * from musicas;

2) Selecionar os nomes das gravadoras e o nome das músicas do 
gênero "Rock" e "Pop".

select * from generos;

SELECT DISTINCT gravadoras.nome, generos.descricao
FROM generos
INNER JOIN musicas 
ON musicas.generos_id = generos.id
INNER JOIN musicas_has_artistas  
ON musicas.id = musicas_has_artistas.musicas_id 
INNER JOIN artistas 
ON artistas.id = musicas_has_artistas.artistas_id  
INNER JOIN gravadoras 
ON gravadoras.id = artistas.gravadoras_id 
WHERE generos.descricao = 'Pop' AND generos.descricao = 'Rock';
-- WHERE generos.id IN (2,3);


3)Selecionar o nome das gravadoras e o nome dos artistas que 
tem mais de 2 artistas cadastrados.

SELECT gravadoras.nome
, COUNT(gravadoras.id)
FROM artistas 
INNER JOIN gravadoras
ON gravadoras.id = artistas.gravadoras_id
-- Como contar no where
-- where max(gravadoras.id) = 2
GROUP BY gravadoras.id 

4) Selecionar o nome dos clientes, a data de cadastro e o nome do
plano dos clientes que foram cadastrados no ultimo ano.


SELECT clientes.login, clientes.created, planos.descricao 
FROM clientes
INNER JOIN planos
ON clientes.planos_id = planos.id 
WHERE clientes.created > '2023-01-01 00:00:00';

5) Selecionar o nome da gravadora, o nome das músicas e a data de 
cadastro das músicas que foram cadastradas a mais de 2 anos.

SELECT gravadoras.nome , musicas.nome, musicas.created 
FROM musicas 
INNER JOIN musicas_has_artistas  
ON musicas.id = musicas_has_artistas.musicas_id 
INNER JOIN artistas 
ON artistas.id = musicas_has_artistas.artistas_id  
INNER JOIN gravadoras 
ON gravadoras.id = artistas.gravadoras_id 
WHERE musicas.created < '2021-01-01 00:00:00';

6) Selecionar o nome do cliente, o  nome do plano, e as músicas 
dos clientes que tocaram músicas do gênero "Gaúcha" e que tenham 
o plano "Full" ou "Light"

SELECT clientes.login, planos.descricao , musicas.nome  
FROM clientes 
INNER JOIN musicas_has_clientes 
ON musicas_has_clientes.clientes_id = clientes.id
INNER JOIN musicas 
ON musicas_has_clientes.musicas_id = musicas.id
INNER JOIN planos
ON clientes.planos_id = planos.id
WHERE musicas.generos_id = 1
AND (planos.descricao = 'Full' OR planos.descricao = 'Light');

7) Qual nome do plano que possui mais clientes que colocaram música
do Gênero "Funk" e que são das gravadoras "Som Livre", "Sony Music"
ou "USA Discos" e que tem duração menor que 4 minutos. 

SELECT planos.descricao, clientes.login, generos.descricao, 
gravadoras.nome  
FROM musicas 
INNER JOIN musicas_has_clientes 
ON musicas_has_clientes.musicas_id = musicas.id
INNER JOIN clientes 
ON musicas_has_clientes.clientes_id  = clientes.id
INNER JOIN planos 
ON planos.id = clientes.planos_id  
INNER JOIN musicas_has_artistas 
ON musicas_has_artistas.musicas_id = musicas.id
INNER JOIN generos  
ON generos.id = musicas.generos_id  
INNER JOIN artistas 
ON musicas_has_artistas.artistas_id = artistas.id
INNER JOIN gravadoras 
ON gravadoras.id = artistas.gravadoras_id
WHERE generos.descricao = 'Funk'
AND musicas.duracao  < '04:00:00'
AND gravadoras.nome = 'Som Livre' 
OR gravadoras.nome = 'Sony Music'
OR gravadoras.nome = 'USA Discos'

8) Qual o tempo total das músicas que não são do gênero "Gaúcha" e "Pop",
e que o tempo individual de cada música não ultrapassa 4 minutos

SELECT generos.descricao, musicas.duracao 
FROM musicas   
INNER JOIN generos  
ON generos.id = musicas.generos_id
WHERE generos.descricao != 'Gaúcha' 
AND generos.descricao != 'Pop' 
AND musicas.duracao  < '04:00:00'

9) Qual o nome das músicas do gênero "Rock", 
da gravadora "Sony Music" e que tem duração
maior que 10 minutos 

SELECT musicas.nome, generos.descricao, gravadoras.nome, musicas.duracao 
FROM generos 
INNER JOIN musicas 
ON musicas.generos_id  = generos.id 
INNER JOIN musicas_has_artistas 
ON musicas_has_artistas.musicas_id = musicas.id
INNER JOIN artistas 
ON musicas_has_artistas.artistas_id = artistas.id
INNER JOIN gravadoras 
ON gravadoras.id = artistas.gravadoras_id
WHERE generos.descricao = 'Rock'
AND gravadoras.nome = 'Sony Music'
AND musicas.duracao > '10:00:00'

10) Qual o nome das músicas, o nome dos artistas, o nome do gênero e o 
nome clientes que locaram músicas que foram gravadoras entre 01 de 
Janeiro de 1993 e 31 de dezembro de 1999?

SELECT musicas.nome, artistas.nome, generos.descricao, clientes.login,
gravadoras.created 
FROM musicas 
INNER JOIN musicas_has_artistas 
ON musicas_has_artistas.musicas_id = musicas.id
INNER JOIN artistas 
ON musicas_has_artistas.artistas_id = artistas.id
INNER JOIN gravadoras 
ON gravadoras.id = artistas.gravadoras_id
INNER JOIN generos 
ON musicas.generos_id  = generos.id 
INNER JOIN musicas_has_clientes 
ON musicas_has_clientes.musicas_id = musicas.id
INNER JOIN clientes 
ON musicas_has_clientes.clientes_id  = clientes.id
WHERE gravadoras.created BETWEEN DATE('1993-01-01') 
AND DATE('1999-12-31')

11) Qual o nome do gênero que teve mais músicas locadas n período de 01
de Janeiro de 2015 e 31 de Dezembro de 2020

SELECT generos.descricao, generos.created 
FROM musicas 
INNER JOIN generos  
ON generos.id = musicas.generos_id  
WHERE generos.created BETWEEN DATE('2015-01-01')
AND DATE('2020-12-31')


12) Qual o nome da gravadora, que possui o maior valor de contrato e 
que não tem nenhuma música "Funk" lançada no ano de 2000?

SELECT gravadoras.valor_contrato, musicas.generos_id 
FROM gravadoras 
INNER JOIN artistas 
ON gravadoras.id = artistas.gravadoras_id
INNER JOIN musicas_has_artistas  
ON musicas_has_artistas.artistas_id = artistas.id
INNER JOIN musicas 
ON musicas_has_artistas.musicas_id = musicas.id
INNER JOIN generos 
ON musicas.generos_id  = generos.id 
WHERE musicas.generos_id != '4'
AND musicas.lancamento BETWEEN DATE('2000-01-01')
AND DATE ('2020-12-31')

