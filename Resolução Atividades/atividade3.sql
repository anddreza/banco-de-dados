-- 3) Selecionar o nome das gravadoras e o nome dos artistas que tem mais 
-- de 2 artistas cadastrados
select gravadoras.nome as Gravadora, art1.nome as Artista
from artistas as art1
inner join gravadoras
on art1.gravadoras_id = gravadoras.id
-- vai verificar se existe mais de um artista na gravadora
where exists 
    (select 1 from artistas as art2
        where art1.gravadoras_id = art2.gravadoras_id 
        and art1.id <> art2.id);

-----

SELECT g.nome AS nome_gravadora, a.nome AS nome_artista
FROM gravadoras g
JOIN artistas a ON g.id = a.gravadoras_id
WHERE (
    SELECT COUNT(*)
    FROM artistas
    WHERE gravadoras_id = g.id
) > 2;