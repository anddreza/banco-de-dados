-- Crie uma query que retorne uma coluna nomeada como
-- 'Nome Completo' com o nome completo dos Alunos da academia,
-- uma coluna com o logradouro e outra com o número.

SELECT CONCAT(Aluno.Nome,' ', Aluno.Sobrenome) AS 'Nome Completo',
Endereco.Logradouro, Telefone.Telefone_Contato  
FROM Aluno 
INNER JOIN Endereco 
ON Endereco.Endereco_ID = Aluno.Endereco_ID 
INNER JOIN Telefone
ON Telefone.Telefone_ID = Aluno.Telefone_ID


Escreva uma query que retorne uma coluna nomeada como
'Nome Completo' com o nome completo dos Alunos da academia, 
uma coluna com telefone e outra com o cep dessa pessoa.

SELECT CONCAT(Aluno.Nome,' ', Aluno.Sobrenome) AS 'Nome Completo',
Telefone.Telefone_Contato, Endereco.CEP
FROM Aluno 
INNER JOIN Telefone
ON Aluno.Telefone_ID = Telefone.Telefone_ID 
INNER JOIN Endereco 
ON Endereco.Endereco_ID = Aluno.Endereco_ID 


Escreva uma query que retorne uma coluna nomeada como 
'Nome Completo' com o nome completo dos Alunos da academia,
uma coluna com telefone de contato e outra com o cep dessa
pessoa.

SELECT CONCAT(Aluno.Nome,' ', Aluno.Sobrenome) AS 'Nome Completo',
Telefone.Telefone_Emergencia, Endereco.CEP
FROM Aluno 
INNER JOIN Telefone
ON Aluno.Telefone_ID = Telefone.Telefone_ID 
INNER JOIN Endereco 
ON Endereco.Endereco_ID = Aluno.Endereco_ID 

Crie uma query que retorne uma coluna nomeada como
'Nome Completo' com o nome completo de todos os Alunos da 
academia e uma coluna com o nome 'Horario', mostrando o 
período dessa pessoa. 

SELECT CONCAT(Aluno.Nome,' ', Aluno.Sobrenome) AS 'Nome Completo',
Horario.Periodo AS 'Horario'
FROM Aluno 
INNER JOIN Treino 
ON Treino.Aluno_ID = Aluno.Aluno_ID
INNER JOIN Horario 
ON Treino.Horario_ID = Horario.Horario_ID 

Escreva uma query que retorne o nome do Aluno e o nome do 
Instrutor responável pelo seu treino, e o tipo de plano, 
ordenado por tipo de plano.



