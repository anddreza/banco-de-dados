-- 11) Qual o nome do gênero que teve mais músicas locadas no 
-- período de 01 de Janeiro de 2015 e 31 de Dezembro de 2020
select generos.descricao, count(*) as QntdLocacoes
from clientes
inner join musicas_has_clientes
on clientes.id = musicas_has_clientes.clientes_id
inner join musicas
on musicas_has_clientes.musicas_id = musicas.id
inner join generos
on musicas.generos_id = generos.id
where musicas_has_clientes.data between '2015-01-01' and '2020-12-31'
group by generos.descricao
order by count(*) desc
limit 1;