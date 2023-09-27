create table if not exists produto(
	codigo_produto integer not null auto_increment, 
	descricao_produto varchar(30) not null, 
	preco_produto float not null,
	
	primary key(codigo_produto)
);

-- alterar o campo descricao_produto da tabela produto 
-- para o tipo varchar(50)
ALTER TABLE produto
-- foi utilizado o CHANGE aqui e não estava correto
MODIFY COLUMN descricao_produto varchar(50);

ALTER TABLE produto 
ADD COLUMN peso float;

select * from produto; 

create table if not exists nota_fiscal(
	numero_nf integer not null auto_increment,
	data_nf date not null,
	valor_nf float not null,
	
	primary key(numero_nf)
);

-- alterar a tabela nota_fiscal, adicionando o campo ICMS, do tipo float depois do campo numero_nf
ALTER TABLE nota_fiscal 
ADD COLUMN icms float not null
AFTER numero_nf;

select * from nota_fiscal;


create table if not exists itens(
	produto_codigo_produto integer not null auto_increment, 
	nota_fiscal_numero_nf integer not null, 
	num_item integer not null, 
	qtde_item integer not null,
	
	primary key(produto_codigo_produto)
);
select * from itens;
ALTER TABLE itens DROP PRIMARY KEY produto_codigo_produto
ADD PRIMARY KEY num_item;
