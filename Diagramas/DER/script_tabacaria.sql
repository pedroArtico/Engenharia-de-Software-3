/*** Criacao da tabela */
-- 

create table Funcionario(
codigo numeric(6,0) not null,
nome varchar(20) not null,
rg char(11) not null,
cargo varchar(20) not null,
primary key (codigo)
)

-- Tabela caixa

create table Caixa(
codigo numeric(6,0) not null,
n_caixa  int not null,
primary key (codigo),
foreign key (codigo) references Funcionario (codigo)
)

-- Tabela entregador

create table Entregador(
codigo numeric(6,0) not null,
n_veiculo int not null,
primary key (codigo),
foreign key (codigo) references Funcionario (codigo)
)

-- Tabela produto

create table Produto(
codigo numeric(6,0) not null,
descricao char(20),
preco_uni numeric(5,2),
primary key (codigo)
) 

-- Tabela produto perecivel

create table Produto_Perecivel(
codigo numeric(6,0) not null,
data_validade date,
primary key (codigo),
foreign key (codigo) references Produto (codigo)
)

-- Tabela Fornecedor

create table Fornecedor(
codigo numeric(6,0) not null,
nome varchar(20),
descricao varchar(30),
primary key (codigo)
)
-- Tabela Venda
create table Venda(
codigo numeric(6,0) not null,
dat date,
hora time,
cod_c numeric(6,0)  not null,
cod_p numeric(6,0)  not null,
valor numeric(5,2),
unique (dat),
unique (hora),
unique (cod_p),
unique (cod_c),
primary key (codigo),
foreign key (cod_p) references Produto (codigo),
foreign key (cod_c) references Caixa (codigo)
)

create index dat_index
on Venda (dat)

-- Tabela entrega

create table Entrega(
codigo numeric(6,0) not null,
dat date,
hora time,
cod_e numeric(6,0)  not null,
cod_p numeric(6,0)  not null,
cod_v  numeric(6,0),
unique (dat),
unique (hora),
unique (cod_p),
unique (cod_e),
primary key (codigo),
foreign key (cod_p) references Produto (codigo),
foreign key (cod_e) references Entregador (codigo),
foreign key (cod_v) references Venda (codigo)
)

-- Tabela Fornecimento

create table Fornecimento (
 cod_p numeric(6,0) not null,
 cod_f numeric(6,0) not null,
 preco_p numeric (5,2) not null,
foreign key (cod_p) references Produto (codigo),
foreign key (cod_f) references Fornecedor (codigo)
)
 
 insert Produto
 values (123, 'essencia de menta', 4.5)
 
 select * 
 from Produto
 
 delete from produto
 where codigo = 123