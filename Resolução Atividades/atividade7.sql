-- 7) Qual o nome do plano que possui mais clientes que locaram 
-- músicas do Gênero "Funk" e que são das gravadoras 
-- "Som Livre", "Sony Music" ou "USA Discos" e que tem 
-- duração menor que 4 minutos
SELECT 
    planos.descricao, count(*) as QntdLocacoes
FROM
    planos
        INNER JOIN
    clientes ON planos.id = clientes.planos_id
        INNER JOIN
    musicas_has_clientes ON clientes.id = musicas_has_clientes.clientes_id
        INNER JOIN
    musicas ON musicas_has_clientes.musicas_id = musicas.id
        INNER JOIN
    generos ON musicas.generos_id = generos.id
        INNER JOIN
    musicas_has_artistas ON musicas.id = musicas_has_artistas.musicas_id
        INNER JOIN
    artistas ON musicas_has_artistas.artistas_id = artistas.id
        INNER JOIN
    gravadoras ON artistas.gravadoras_id = gravadoras.id
WHERE
    generos.descricao = 'Funk'
        AND gravadoras.nome = 'Som Livre'
        OR gravadoras.nome = 'Sony Music'
        OR gravadoras.nome = 'USA Discos'
        AND musicas.duracao < 4
group by planos.descricao
order by count(*) desc
limit 1;