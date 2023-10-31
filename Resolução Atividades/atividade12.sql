-- 12) Qual o nome da gravadora, que possui o maior valor de 
-- contrato e que não tem nenhuma música "Funk" lançada 
-- no ano de 2000?
-- Para resolver esta questão, precisamos criar uma view primeiro
create or replace view tirar as (
select musicas.id from musicas where 
    DATE_FORMAT(musicas.lancamento,  "%Y") = 2000
    and musicas.generos_id = 4
);
select distinct(gravadoras.nome), gravadoras.valor_contrato
from musicas_has_artistas
inner join musicas
on musicas_has_artistas.musicas_id = musicas.id
inner join artistas 
on musicas_has_artistas.artistas_id = artistas.id
inner join generos
on musicas.generos_id = generos.id
inner join gravadoras
on artistas.gravadoras_id = gravadoras.id
where musicas.id not in (select * from tirar)
order by gravadoras.valor_contrato desc
limit 1;