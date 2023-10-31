-- 2) Selecionar os nomes das gravadoras 
-- e o nome das músicas do gênero "Rock" e "Pop"
select concat(mu.id, ' - ', mu.nome) as 'id e nome da musica',
concat(g.id, ' - ', g.nome) as 'id e nome da gravadora',
concat(ge.id, ' - ', ge.descricao) as 'id e nome do genero'
from gravadoras g
join artistas a on 
g.id = a.gravadoras_id
join musicas_has_artistas na
on a.id = na.artistas_id
join musicas mu on
na.musicas_id = mu.id
join generos ge
on mu.generos_id = ge.id
where ge.descricao in ('Rock', 'Pop')
group by mu.id
order by mu.id asc;
select distinct (musicas.nome) as Música, gravadoras.nome as Gravadora
from musicas_has_artistas
inner join musicas
on musicas_has_artistas.musicas_id = musicas.id
inner join artistas
on musicas_has_artistas.artistas_id = artistas.id
inner join gravadoras
on artistas.gravadoras_id = gravadoras.id
inner join generos
on generos.id = musicas.generos_id
where generos.descricao = "Rock" or generos.descricao = "Pop";