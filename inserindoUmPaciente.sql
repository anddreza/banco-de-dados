INSERT INTO PACIENTE (
`ID` ,
`CPF`,
`NOME`,
`DATA_NASCIMENTO`,
`ENDERECO`,
`Bairros_idBairros` ,
`CEP`,
`NOME_MAE`,
`EMAIL`,
`NOME_SOCIAL`,
`PRONTUARIO`,
`UF_idUF`, 
`Cidades_IdCidade`, 
`Religiao_idReligiao`,
`Tipo_Sanguineos_idTiposSanguineos`,
`Plano_Saude_idPlano`,
`Generos_idGeneros`,
`Estado_Civil_idEstadosCivis`,
`TELEFONE_IDTELEFONE`
)VALUES(

1, "12345678901", "VINICIUS", "2000-01-01", "RUA MIGUEL SALAI, 122", "1", "89251380", "MARIA", "VINICIUS@GMAIL.COM",
NULL, "1", 1, 1, 1, 1, 1, 1, 1, 1
);

SELECT * FROM PACIENTE;
