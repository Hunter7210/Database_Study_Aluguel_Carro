
-- Criando o DB
CREATE DATABASE db_locadora_carros;

-- Criando as tabelas
CREATE TABLE agencias (
pk_num_agencias SERIAL PRIMARY KEY,
contato_agencias VARCHAR(30) NOT NULL,
endereco_agencias VARCHAR(255) NOT NULL,
cidade_agencias VARCHAR(255) NOT NULL,
uf_agencias VARCHAR(2) NOT NULL,
--FOREIGN KEY
fk_id_funcionarios SERIAL,
fk_placa_carros VARCHAR(8)
);

CREATE TABLE cargos (
pk_cod_cargos SERIAL PRIMARY KEY,
nome_cargos VARCHAR(100),
salario_cargos MONEY NOT NULL,
--FOREIGN KEY
fk_id_funcionarios SERIAL 
);

CREATE TABLE funcionarios (
pk_id_funcionarios SERIAL PRIMARY KEY,
nome_funcionarios VARCHAR(255) NOT NULL,
sobrenome_funcionarios VARCHAR(255) NOT NULL,
data_contratacao_funcionarios DATE NOT NULL,
--FOREIGN KEY
fk_cod_cargo SERIAL NOT NULL
);

CREATE TABLE clientes_pj (
pk_cnpj_clientes_pj VARCHAR(11) PRIMARY KEY,
telefone_clientes_pj VARCHAR(20) NOT NULL,
cep_clientes_pj VARCHAR(10) NOT NULL,
nome_clientes_pj VARCHAR(255) NOT NULL,
email_clientes_pj VARCHAR(255) NOT NULL,
senha_cliente_pf VARCHAR(30) NOT NULL
);

CREATE TABLE clientes_pf (
pk_id_clientes_pf SERIAL PRIMARY KEY,
nome_clientes_pf VARCHAR(255) NOT NULL,
sobrenome_clientes_pf VARCHAR(255) NOT NULL,
email_clientes_pf VARCHAR(100) NOT NULL,
celular_clientes_pf VARCHAR(20) NOT NULL,
endereco_clientes_pf VARCHAR(255) NOT NULL,
cidade_clientes_pf VARCHAR(255) NOT NULL,
estado_clientes_pf VARCHAR(255) NOT NULL,
senha_cliente_pf VARCHAR(30) NOT NULL
);

CREATE TABLE carros (
pk_placa_carros VARCHAR(8) PRIMARY KEY,
disponibilidade_carros VARCHAR(50) NOT NULL,
ano_carros DATE NOT NULL,
modelo_carros VARCHAR(100) NOT NULL,
marca_carros VARCHAR(100) NOT NULL
);

CREATE TABLE pagamentos (
pk_id_pagamentos SERIAL PRIMARY KEY,
forma_pagamentos VARCHAR(255) NOT NULL,
data_pagamentos DATE NOT NULL,
status_pagamentos VARCHAR(50) NOT NULL
);

CREATE TABLE manutencoes (
pk_id_manutencoes SERIAL PRIMARY KEY,
data_manutencoes DATE NOT NULL,
tipo_manutencoes VARCHAR(255) NOT NULL,
custo_manutencoes MONEY NOT NULL,
descricao_manutencoes VARCHAR(255)
);

CREATE TABLE feedbacks (
pk_id_feedbacks SERIAL PRIMARY KEY,
data_feedbacks DATE NOT NULL,
avaliacao_feedbacks VARCHAR(5) NOT NULL,
comentario_feedbacks VARCHAR(255) NOT NULL
);

CREATE TABLE aluga (
pk_id_locacao_aluga SERIAL PRIMARY KEY,
valor_total_aluga MONEY NOT NULL,
data_entrega_aluga DATE NOT NULL,
data_retirada_aluga DATE NOT NULL,
-- FOREIGN KEY
fk_id_clientes_pf SERIAL NOT NULL,
fk_placa_carros VARCHAR(8) NOT NULL,
fk_cnpj_clientes_pj VARCHAR(11) NOT NULL,

FOREIGN KEY (fk_id_clientes_pf) REFERENCES clientes_pf (pk_id_clientes_pf),
FOREIGN KEY (fk_placa_carros) REFERENCES carros (pk_placa_carros),
FOREIGN KEY (fk_cnpj_clientes_pj) REFERENCES clientes_pj (pk_cnpj_clientes_pj)
);

CREATE TABLE Recebe (
-- FOREIGN KEY
fk_id_manutencoes SERIAL,
fk_placa_carros VARCHAR(8) NOT NULL,
FOREIGN KEY(fk_id_manutencoes) REFERENCES manutencoes (pk_id_manutencoes),
FOREIGN KEY(fk_placa_carros) REFERENCES carros (pk_placa_carros)
);

CREATE TABLE Envia (
-- FOREIGN KEY
fk_id_feedbacks SERIAL,
fk_id_clientes_pf SERIAL,
FOREIGN KEY(fk_id_feedbacks) REFERENCES feedbacks (pk_id_feedbacks),
FOREIGN KEY(fk_id_clientes_pf) REFERENCES clientes_pf (pk_id_clientes_pf)
);

CREATE TABLE Realiza (
comprovante_realiza VARCHAR(255) NOT NULL,
pk_id_comprovante SERIAL PRIMARY KEY,
-- FOREIGN KEY
fk_id_clientes_pf SERIAL,
fk_cnpj_clientes_pj VARCHAR(11) NOT NULL,
Fk_id_pagamentos SERIAL,
FOREIGN KEY (fk_id_clientes_pf) REFERENCES clientes_pf (pk_id_clientes_pf),
FOREIGN KEY (fk_cnpj_clientes_pj) REFERENCES clientes_pj (pk_cnpj_clientes_pj),
FOREIGN KEY (fk_id_pagamentos) REFERENCES pagamentos (pk_id_pagamentos)
);

ALTER TABLE agencias ADD FOREIGN KEY(fk_id_funcionarios) REFERENCES Funcionarios (pk_id_funcionarios);
ALTER TABLE agencias ADD FOREIGN KEY(fk_placa_carros) REFERENCES Carros (pk_placa_carros);
ALTER TABLE cargos ADD FOREIGN KEY(fk_id_funcionarios) REFERENCES Funcionarios (pk_id_funcionarios);

