-- 4) Selecionar o nome dos clientes, a data de cadastro e o nome do plano 
-- dos plano que foram cadastrados no último ano
-- Esta solução retorna todos os registros do ano anterior, independente se 
-- é de janeiro ou dezembro de 2022
select clientes.login, year(clientes.created), planos.descricao
from clientes
inner join planos
on clientes.planos_id = planos.id
where year(clientes.created) = year(curdate()) - 1;
-- Esta solução retorna todos os registros exatamente de um ano atrás até a data atual
-- ou seja, os registros cadastrados nos últimos 365 dias
SELECT CONCAT(CL.ID, ' - ', CL.LOGIN) AS 'Login do Cliente',
CL.CREATED as 'Data do Cadastro',
CONCAT(CL.PLANOS_ID, ' - ', PL.DESCRICAO) AS 'Tipo de Plano'
FROM
    CLIENTES CL
    JOIN PLANOS PL ON CL.PLANOS_ID = PL.ID
WHERE
    CL.CREATED >= DATE_SUB(NOW(), INTERVAL 1 YEAR);