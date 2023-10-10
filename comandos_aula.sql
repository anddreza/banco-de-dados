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


