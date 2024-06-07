
-- Criando o DB
CREATE DATABASE db_locadora_carros_Heitor;

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
senha_cliente_pj VARCHAR(30) NOT NULL
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

ALTER TABLE agencias ADD FOREIGN KEY (fk_id_funcionarios) REFERENCES funcionarios (pk_id_funcionarios);
ALTER TABLE agencias ADD FOREIGN KEY (fk_placa_carros) REFERENCES Carros (pk_placa_carros);
ALTER TABLE cargos ADD FOREIGN KEY(fk_id_funcionarios) REFERENCES Funcionarios (pk_id_funcionarios);
ALTER TABLE clientes_pj ALTER COLUMN pk_cnpj_clientes_pj TYPE VARCHAR(18); 
ALTER TABLE aluga ALTER COLUMN fk_cnpj_clientes_pj TYPE VARCHAR(18); 
ALTER TABLE realiza ALTER COLUMN fk_cnpj_clientes_pj TYPE VARCHAR(18); 
ALTER TABLE clientes_pf ALTER COLUMN senha_cliente_pf TYPE VARCHAR(255); 
ALTER TABLE clientes_pj ALTER COLUMN senha_cliente_pj TYPE VARCHAR(255); 



-- ALTERAÇÃO 24/05/2024
    CREATE TABLE niveis_acesso (
        pk_nivel_acesso SERIAL PRIMARY KEY,
        nivel VARCHAR(20)
    )

    INSERT INTO niveis_acesso (nivel) VALUES
    ('Administrador'),
    ('Usuário Comum'),
    ('Moderador');


    ALTER TABLE clientes_pf ADD COLUMN fk_nivel_acesso SERIAL;
    
    UPDATE clientes_pf SET fk_nivel_acesso =2 WHERE fk_nivel_acesso <> 2;
    
    ALTER TABLE clientes_pf ADD FOREIGN KEY (fk_nivel_acesso) REFERENCES niveis_acesso (pk_nivel_acesso);

    SELECT * FROM niveis_acesso;
    SELECT * FROM clientes_pf;


    CREATE TABLE administradores(
        pk_id_administradores SERIAL PRIMARY KEY,
        cpf_administradores VARCHAR(14) NOT NULL,
        --FOREIGN KEY 
        fk_nivel_acesso SERIAL,

        FOREIGN KEY (fk_nivel_acesso) REFERENCES niveis_acesso (pk_nivel_acesso)
    );


    INSERT INTO administradores (cpf_administradores, fk_nivel_acesso) VALUES
        ('123.456.789-00', 1),
        ('987.654.321-00', 1),
        ('111.222.333-44', 1);

    SELECT * FROM administradores;
    SELECT * FROM niveis_acesso;
    SELECT * FROM clientes_pf;

    ALTER TABLE administradores ADD COLUMN senha_administradores VARCHAR(30);

    UPDATE administradores SET senha_administradores = 'senha321' WHERE cpf_administradores =  '123.456.789-00';
    UPDATE administradores SET senha_administradores = 'senha123' WHERE cpf_administradores =  '987.654.321-00';
    UPDATE administradores SET senha_administradores = 'senha213' WHERE cpf_administradores =  '111.222.333-44';




-- Alteração 02/06/2024
    CREATE TABLE categorias_carros (
        pk_id_categorias SERIAL PRIMARY KEY,
        nome_categorias VARCHAR(255) NOT NULL
       );
    SELECT * FROM categorias_carros;
    SELECT * FROM carros;
    
    ALTER TABLE carros ADD COLUMN fk_id_categorias SERIAL;
    
    ALTER TABLE carros ADD FOREIGN KEY (fk_id_categorias) REFERENCES categorias_carros (pk_id_categorias);


    ALTER TABLE carros ADD COLUMN img_carros VARCHAR(255);

    UPDATE carros SET img_carros = 'http://localhost:3000/images/carro-suv.png' WHERE carros.fk_id_categorias = 2;


    ALTER TABLE categorias_carros ADD COLUMN valor_diario MONEY;


-- REALIZANDO O INSERTS

-- Inserindo dados na tabela cargos
INSERT INTO cargos (nome_cargos, salario_cargos, fk_id_funcionarios) VALUES 
('Gerente', 8000.00, 1), 
('Assistente', 3000.00,2), 
('Analista', 5000.00,3), 
('Desenvolvedor', 7000.00,4), 
('Estagiário', 1500.00,5);

-- Inserindo dados na tabela funcionarios
INSERT INTO funcionarios (nome_funcionarios, sobrenome_funcionarios, data_contratacao_funcionarios, fk_cod_cargo) VALUES 
('João', 'Silva', '2020-01-15', 1),
('Maria', 'Oliveira', '2019-03-22', 2),
('Pedro', 'Santos', '2018-07-30', 3),
('Ana', 'Souza', '2021-10-05', 4),
('Carlos', 'Lima', '2022-12-01', 5);

-- Inserindo dados na tabela carros
INSERT INTO carros (pk_placa_carros, disponibilidade_carros, ano_carros, modelo_carros, marca_carros) VALUES 
('ABC1234', 'Disponível', '2022-01-01', 'Civic', 'Honda'),
('DEF5678', 'Disponível', '2021-01-01', 'Corolla', 'Toyota'),
('GHI9101', 'Disponível', '2020-01-01', 'Sentra', 'Nissan'),
('JKL1121', 'Disponível', '2019-01-01', 'Focus', 'Ford'),
('MNO3141', 'Disponível', '2018-01-01', 'Cruze', 'Chevrolet');

-- Inserindo dados na tabela agencias
INSERT INTO agencias (contato_agencias, endereco_agencias, cidade_agencias, uf_agencias, fk_id_funcionarios, fk_placa_carros) VALUES 
('contato1@agencia.com', 'Rua A, 123', 'São Paulo', 'SP', 1, 'ABC1234'),
('contato2@agencia.com', 'Rua B, 456', 'Rio de Janeiro', 'RJ', 2, 'DEF5678'),
('contato3@agencia.com', 'Rua C, 789', 'Belo Horizonte', 'MG', 3, 'GHI9101'),
('contato4@agencia.com', 'Rua D, 101', 'Curitiba', 'PR', 4, 'JKL1121'),
('contato5@agencia.com', 'Rua E, 202', 'Porto Alegre', 'RS', 5, 'MNO3141');

-- Inserindo dados na tabela clientes_pj
INSERT INTO clientes_pj (pk_cnpj_clientes_pj, telefone_clientes_pj, cep_clientes_pj, nome_clientes_pj, email_clientes_pj, senha_cliente_pj) VALUES 
('12345678000101', '1123456789', '01001-000', 'Empresa A', 'contato@empresaa.com', 'senha123'),
('23456789000112', '1123456790', '01002-000', 'Empresa B', 'contato@empresab.com', 'senha123'),
('34567890000123', '1123456791', '01003-000', 'Empresa C', 'contato@empresac.com', 'senha123'),
('45678900000134', '1123456792', '01004-000', 'Empresa D', 'contato@empresad.com', 'senha123'),
('56789000000145', '1123456793', '01005-000', 'Empresa E', 'contato@empresae.com', 'senha123');

-- Inserindo dados na tabela clientes_pf
INSERT INTO clientes_pf (nome_clientes_pf, sobrenome_clientes_pf, email_clientes_pf, celular_clientes_pf, endereco_clientes_pf, cidade_clientes_pf, estado_clientes_pf, senha_cliente_pf) VALUES 
('Fernando', 'Almeida', 'fernando@cliente.com', '11987654321', 'Rua F, 303', 'São Paulo', 'SP', 'senha321'),
('Juliana', 'Pereira', 'juliana@cliente.com', '11987654322', 'Rua G, 404', 'Rio de Janeiro', 'RJ', 'senha321'),
('Ricardo', 'Ferreira', 'ricardo@cliente.com', '11987654323', 'Rua H, 505', 'Belo Horizonte', 'MG', 'senha321'),
('Patricia', 'Costa', 'patricia@cliente.com', '11987654324', 'Rua I, 606', 'Curitiba', 'PR', 'senha321'),
('Marcos', 'Rocha', 'marcos@cliente.com', '11987654325', 'Rua J, 707', 'Porto Alegre', 'RS', 'senha321');

-- Inserindo dados na tabela pagamentos
INSERT INTO pagamentos (forma_pagamentos, data_pagamentos, status_pagamentos) VALUES 
('Cartão de Crédito', '2024-01-10', 'Pago'),
('Boleto Bancário', '2024-01-11', 'Pendente'),
('PIX', '2024-01-12', 'Pago'),
('Transferência Bancária', '2024-01-13', 'Pago'),
('Dinheiro', '2024-01-14', 'Pago');

-- Inserindo dados na tabela manutencoes
INSERT INTO manutencoes (data_manutencoes, tipo_manutencoes, custo_manutencoes, descricao_manutencoes) VALUES 
('2024-01-01', 'Troca de óleo', 200.00, 'Troca de óleo e filtro'),
('2024-01-02', 'Revisão', 500.00, 'Revisão completa'),
('2024-01-03', 'Troca de pneus', 1000.00, 'Troca dos quatro pneus'),
('2024-01-04', 'Alinhamento', 150.00, 'Alinhamento e balanceamento'),
('2024-01-05', 'Freios', 300.00, 'Troca de pastilhas de freio');

-- Inserindo dados na tabela feedbacks
INSERT INTO feedbacks (data_feedbacks, avaliacao_feedbacks, comentario_feedbacks) VALUES 
('2024-05-01', '5', 'Excelente serviço'),
('2024-05-02', '4', 'Muito bom'),
('2024-05-03', '3', 'Bom, mas pode melhorar'),
('2024-05-04', '2', 'Abaixo do esperado'),
('2024-05-05', '1', 'Péssimo atendimento');

-- Inserindo dados na tabela aluga
INSERT INTO aluga (valor_total_aluga, data_entrega_aluga, data_retirada_aluga, fk_id_clientes_pf, fk_placa_carros, fk_cnpj_clientes_pj) VALUES 
(1000.00, '2024-01-20', '2024-01-10', 1, 'ABC1234', '12345678000101'),
(1500.00, '2024-01-21', '2024-01-11', 2, 'DEF5678', '23456789000112'),
(2000.00, '2024-01-22', '2024-01-12', 3, 'GHI9101', '34567890000123'),
(2500.00, '2024-01-23', '2024-01-13', 4, 'JKL1121', '45678900000134'),
(3000.00, '2024-01-24', '2024-01-14', 5, 'MNO3141', '56789000000145');

-- Inserindo dados na tabela Recebe
INSERT INTO Recebe (fk_id_manutencoes, fk_placa_carros) VALUES 
(1, 'ABC1234'),
(2, 'DEF5678'),
(3, 'GHI9101'),
(4, 'JKL1121'),
(5, 'MNO3141');

-- Inserindo dados na tabela Envia
INSERT INTO Envia (fk_id_feedbacks, fk_id_clientes_pf) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserindo dados na tabela Realiza
INSERT INTO Realiza (comprovante_realiza, fk_id_clientes_pf, fk_cnpj_clientes_pj, fk_id_pagamentos) VALUES 
('Comprovante 1', 1, '12345678000101', 1),
('Comprovante 2', 2, '23456789000112', 2),
('Comprovante 3', 3, '34567890000123', 3),
('Comprovante 4', 4, '45678900000134', 4),
('Comprovante 5', 5, '56789000000145', 5);



INSERT INTO categorias_carros VALUES (1, 'Hatch'), (2,'SUV'),(3,'Sport'), (4,'Sedã'), (5,'Cabriolet'), (6,'Wagon'), (7,'Minivan'), (8,'Pick-up');

UPDATE categorias_carros SET valor_diario = 100.00 WHERE pk_id_categorias = 1;  

UPDATE categorias_carros SET valor_diario = 210.00 WHERE pk_id_categorias = 2;  

UPDATE categorias_carros SET valor_diario = 420.00 WHERE pk_id_categorias = 3;  

UPDATE categorias_carros SET valor_diario = 190.00 WHERE pk_id_categorias = 4;  

UPDATE categorias_carros SET valor_diario = 570.00 WHERE pk_id_categorias = 5;  

UPDATE categorias_carros SET valor_diario = 200.00 WHERE pk_id_categorias = 6;  

UPDATE categorias_carros SET valor_diario = 440.00 WHERE pk_id_categorias = 7;

UPDATE categorias_carros SET valor_diario = 250.00 WHERE pk_id_categorias = 8;  


SELECT * FROM categorias_carros;

SELECT carros.*, aluga.data_entrega_aluga FROM carros INNER JOIN aluga ON carros.pk_placa_carros = aluga.fk_placa_carros ORDER BY pk_placa_carros;



SELECT carros.*, categorias_carros.nome_categorias FROM carros INNER JOIN categorias_carros ON carros.fk_id_categorias = categorias_carros.pk_id_categorias  ORDER BY fk_id_categorias;


UPDATE carros 
SET disponibilidade_carros = 'Indisponível' 
WHERE marca_carros = 'Honda';



select * FROM  aluga;
select * FROM  carros;
SELECT * FROM clientes_pf;
SELECT * FROM cargos;
SELECT * FROM pagamentos;


SELECT * FROM clientes_pf;


SELECT * FROM clientes_pf;


SELECT * FROM clientes_pf;


SELECT * FROM clientes_pf;


SELECT * FROM clientes_pf;

























