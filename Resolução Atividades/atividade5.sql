-- 5) Selecionar o nome da gravadora, o nome das músicas e a data de cadastro 
-- das músicas que foram cadastradas a mais de 2 anos
select gravadoras.nome, musicas.nome, musicas.created
from musicas_has_artistas
join artistas
on musicas_has_artistas.artistas_id = artistas.id
join musicas
on musicas_has_artistas.musicas_id = musicas.id
join gravadoras 
on artistas.gravadoras_id = gravadoras.id
where year(now()) - year(musicas.created) >= 2;
select gravadoras.nome, musicas.nome, musicas.created
from musicas_has_artistas
join artistas
on musicas_has_artistas.artistas_id = artistas.id
join musicas
on musicas_has_artistas.musicas_id = musicas.id
join gravadoras 
on artistas.gravadoras_id = gravadoras.id
where musicas.CREATED < DATE_SUB(NOW(), INTERVAL 2 YEAR);