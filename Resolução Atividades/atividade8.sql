-- 8) Qual o tempo total das músicas que não são do gênero "Gaúcha" e "Pop", e que o 
-- tempo individual de cada música não ultrapassa 4 minutos
select musicas.nome, SEC_TO_TIME(SUM( TIME_TO_SEC( musicas.duracao ) ) ) as duracao_total
from musicas
inner join generos
on musicas.generos_id = generos.id
where generos.descricao <> "Gaúcha" and generos.descricao <> "Pop"
and SUBSTR(musicas.duracao, 1, 2) < '04';
SELECT
    M.NOME AS NOME_DA_MUSICA,
    SUM(TIME_TO_SEC(M.DURACAO)) AS TEMPO_TOTAL_SEGUNDOS
FROM
    MUSICAS M
INNER JOIN GENEROS G ON
    M.GENEROS_ID = G.ID
WHERE
    G.Descricao NOT IN ('Gaúcha', 'Pop')
    AND TIME_TO_SEC(M.DURACAO) <= 240
GROUP BY
    M.NOME;