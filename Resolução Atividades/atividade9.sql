-- 9) Qual o nome das músicas do gênero "Rock", da gravadora 
-- "Sony Music" e que tem duração maior que 10 minutos
select musicas.nome, musicas.duracao
from musicas
inner join musicas_has_artistas
on musicas.id = musicas_has_artistas.musicas_id
inner join artistas
on musicas_has_artistas.artistas_id = artistas.id
inner join gravadoras
on artistas.gravadoras_id = gravadoras.id
where gravadoras.nome = "Sony Music"
and SUBSTR(musicas.duracao, 1, 2) > '10:00'