CREATE TABLE IF NOT EXISTS FILMES(
	id INT(30) NOT NULL AUTO_INCREMENT,
    titulo_filme VARCHAR(100) NOT NULL,
  	classificacao_imd VARCHAR(100) NOT NULL,  
  	ano_lancamento INTEGER(4) NOT NULL,
  	custo INTEGER(30) NOT NULL,
  	faturamento INTEGER(30) NOT NULL, 
  	id_companhia VARCHAR(100) NOT NULL,
  	idioma VARCHAR(50) NOT NULL,
  	
  PRIMARY KEY(id)	
);
