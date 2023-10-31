-- 6) Selecionar o nome do cliente, o nome do plano, e as músicas dos clientes 
-- que locaram músicas do gênero "Gaúcha" e que tenham o plano "Full" ou "Light".
-- As duas soluções abaixo são iguais, porque quando não especificamos o tipo
-- de join, o MySQL assume que estamos falando de inner join
SELECT
    C.LOGIN AS 'Nome do Cliente',
    P.DESCRICAO AS 'Nome do Plano',
    M.NOME AS 'Nome da Música'
FROM
    CLIENTES C
INNER JOIN PLANOS P ON
    C.PLANOS_ID = P.ID
INNER JOIN MUSICAS_HAS_CLIENTES MC ON
    C.ID = MC.CLIENTES_ID
INNER JOIN MUSICAS M ON
    MC.MUSICAS_ID = M.ID
INNER JOIN GENEROS G ON
    M.GENEROS_ID = G.ID
WHERE
    G.DESCRICAO = 'GAÚCHA'
    AND (P.DESCRICAO = 'FULL'
        OR P.DESCRICAO = 'LIGHT');
        
select
    c.login as nome_cliente,
    p.descricao as nome_plano,
    m.nome as nome_musica
from
    clientes c
join planos p on
    c.planos_id = p.id
join musicas_has_clientes mc on
    c.id = mc.clientes_id
join musicas m on
    mc.musicas_id = m.id
join generos g on
    m.generos_id = g.id
where
    g.descricao = 'Gaúcha'
    and (p.descricao = 'Full'
        or p.descricao = 'Light');