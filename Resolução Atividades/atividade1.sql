-- 1) Selecionar os nomes dos gêneros 
-- que não tem nenhuma música cadastrada
select generos.descricao from generos
left join musicas
on generos.id = musicas.generos_id
where generos.id not in 
(select musicas.generos_id from musicas);
select generos.descricao from generos
left join musicas
on generos.id = musicas.generos_id
where musicas.generos_id is null;