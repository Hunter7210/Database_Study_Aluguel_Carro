-- REALIZANDO 10 INSERTS DATA 07/06/2024



-- Inserindo dados na tabela aluga
INSERT INTO aluga (valor_total_aluga, data_entrega_aluga, data_retirada_aluga, fk_id_clientes_pf, fk_placa_carros, fk_cnpj_clientes_pj) VALUES 
(1200.00, '2024-02-20', '2024-02-10', 2, 'DEF5678', '23456789000112'),
(1800.00, '2024-02-21', '2024-02-11', 3, 'GHI9101', '34567890000123'),
(2200.00, '2024-02-22', '2024-02-12', 4, 'JKL1121', '45678900000134'),
(2600.00, '2024-02-23', '2024-02-13', 5, 'MNO3141', '56789000000145'),
(1400.00, '2024-02-24', '2024-02-14', 1, 'ABC1234', '12345678000101'),
(3200.00, '2024-02-25', '2024-02-15', 2, 'DEF5678', '23456789000112'),
(2800.00, '2024-02-26', '2024-02-16', 3, 'GHI9101', '34567890000123'),
(2400.00, '2024-02-27', '2024-02-17', 4, 'JKL1121', '45678900000134'),
(2000.00, '2024-02-28', '2024-02-18', 5, 'MNO3141', '56789000000145'),
(1600.00, '2024-02-29', '2024-02-19', 1, 'ABC1234', '12345678000101');

-- Inserindo dados na tabela Recebe
INSERT INTO Recebe (fk_id_manutencoes, fk_placa_carros) VALUES 
(2, 'DEF5678'),
(3, 'GHI9101'),
(4, 'JKL1121'),
(5, 'MNO3141'),
(1, 'ABC1234'),
(3, 'GHI9101'),
(4, 'JKL1121'),
(5, 'MNO3141'),
(1, 'ABC1234'),
(2, 'DEF5678');

-- Inserindo dados na tabela Envia
INSERT INTO Envia (fk_id_feedbacks, fk_id_clientes_pf) VALUES 
(3, 3),
(4, 4),
(5, 5),
(1, 1),
(4, 4),
(5, 5),
(1, 1),
(2, 2),
(5, 5),
(1, 1);

-- Inserindo dados na tabela Realiza
INSERT INTO Realiza (comprovante_realiza, fk_id_clientes_pf, fk_cnpj_clientes_pj, fk_id_pagamentos) VALUES 
('Comprovante 6', 2, '23456789000112', 6),
('Comprovante 7', 3, '34567890000123', 7),
('Comprovante 8', 4, '45678900000134', 8),
('Comprovante 9', 5, '56789000000145', 9),
('Comprovante 10', 1, '12345678000101', 10),
('Comprovante 11', 2, '23456789000112', 1),
('Comprovante 12', 3, '34567890000123', 2),
('Comprovante 13', 4, '45678900000134', 3),
('Comprovante 14', 5, '56789000000145', 4),
('Comprovante 15', 1, '12345678000101', 5);


-- INSERT DE 5 

-- Inserindo dados na tabela clientes_pf
INSERT INTO clientes_pf (nome_clientes_pf, sobrenome_clientes_pf, email_clientes_pf, celular_clientes_pf, endereco_clientes_pf, cidade_clientes_pf, estado_clientes_pf, senha_cliente_pf, fk_nivel_acesso) VALUES 
('Laura', 'Ferreira', 'laura@email.com', '11987654326', 'Rua K, 808', 'São Paulo', 'SP', 'senha321', 2),
('Gabriel', 'Ramos', 'gabriel@email.com', '11987654327', 'Rua L, 909', 'Rio de Janeiro', 'RJ', 'senha321',2),
('Isabela', 'Carvalho', 'isabela@email.com', '11987654328', 'Rua M, 1010', 'Belo Horizonte', 'MG', 'senha321',2),
('Thiago', 'Oliveira', 'thiago@email.com', '11987654329', 'Rua N, 1111', 'Curitiba', 'PR', 'senha321',2),
('Julia', 'Silveira', 'julia@email.com', '11987654330', 'Rua O, 1212', 'Porto Alegre', 'RS', 'senha321',2);

-- Inserindo dados na tabela clientes_pj
INSERT INTO clientes_pj (pk_cnpj_clientes_pj, telefone_clientes_pj, cep_clientes_pj, nome_clientes_pj, email_clientes_pj, senha_cliente_pj) VALUES 
('67890123000156', '1123456794', '01006-000', 'Empresa F', 'contato@empresaf.com', 'senha123'),
('78901234000167', '1123456795', '01007-000', 'Empresa G', 'contato@empresag.com', 'senha123'),
('89012345000178', '1123456796', '01008-000', 'Empresa H', 'contato@empresah.com', 'senha123'),
('90123456000189', '1123456797', '01009-000', 'Empresa I', 'contato@empresai.com', 'senha123'),
('01234567000190', '1123456798', '01010-000', 'Empresa J', 'contato@empresaj.com', 'senha123');

-- Inserindo dados na tabela agencias
INSERT INTO agencias (contato_agencias, endereco_agencias, cidade_agencias, uf_agencias, fk_id_funcionarios, fk_placa_carros) VALUES 
('contato6@agencia.com', 'Rua P, 1414', 'São Paulo', 'SP', 6, 'ABC1234'),
('contato7@agencia.com', 'Rua Q, 1515', 'Rio de Janeiro', 'RJ', 7, 'DEF5678'),
('contato8@agencia.com', 'Rua R, 1616', 'Belo Horizonte', 'MG', 8, 'GHI9101'),
('contato9@agencia.com', 'Rua S, 1717', 'Curitiba', 'PR', 9, 'JKL1121'),
('contato10@agencia.com', 'Rua T, 1818', 'Porto Alegre', 'RS', 10, 'MNO3141');

-- Inserindo dados na tabela pagamentos
INSERT INTO pagamentos (forma_pagamentos, data_pagamentos, status_pagamentos) VALUES 
('Cartão de Débito', '2024-02-10', 'Pago'),
('Transferência Bancária', '2024-02-11', 'Pendente'),
('Boleto Bancário', '2024-02-12', 'Pago'),
('PIX', '2024-02-13', 'Pago'),
('Dinheiro', '2024-02-14', 'Pago');

-- Inserindo dados na tabela manutencoes
INSERT INTO manutencoes (data_manutencoes, tipo_manutencoes, custo_manutencoes, descricao_manutencoes) VALUES 
('2024-02-01', 'Troca de óleo', 250.00, 'Troca de óleo e filtro'),
('2024-02-02', 'Revisão', 600.00, 'Revisão completa'),
('2024-02-03', 'Troca de pneus', 1200.00, 'Troca dos quatro pneus'),
('2024-02-04', 'Alinhamento', 180.00, 'Alinhamento e balanceamento'),
('2024-02-05', 'Freios', 350.00, 'Troca de pastilhas de freio');

-- Inserindo dados na tabela feedbacks
INSERT INTO feedbacks (data_feedbacks, avaliacao_feedbacks, comentario_feedbacks) VALUES 
('2024-06-01', '5', 'Atendimento excelente, carros em ótimo estado'),
('2024-06-02', '4', 'Bom serviço, recomendaria'),
('2024-06-03', '3', 'Alguns problemas com o carro, mas foram resolvidos'),
('2024-06-04', '2', 'Carro sujo e cheio de arranhões'),
('2024-06-05', '1', 'Péssima experiência, carro quebrou durante a viagem');

-- Inserindo mais dados na tabela clientes_pf
INSERT INTO clientes_pf (nome_clientes_pf, sobrenome_clientes_pf, email_clientes_pf, celular_clientes_pf, endereco_clientes_pf, cidade_clientes_pf, estado_clientes_pf, senha_cliente_pf) VALUES 
('Rafael', 'Martins', 'rafael@email.com', '11987654331', 'Rua U, 1919', 'São Paulo', 'SP', 'senha321'),
('Mariana', 'Sousa', 'mariana@email.com', '11987654332', 'Rua V, 2020', 'Rio de Janeiro', 'RJ', 'senha321'),
('Rodrigo', 'Lopes', 'rodrigo@email.com', '11987654333', 'Rua W, 2121', 'Belo Horizonte', 'MG', 'senha321'),
('Carla', 'Dias', 'carla@email.com', '11987654334', 'Rua X, 2222', 'Curitiba', 'PR', 'senha321'),
('Luana', 'Nunes', 'luana@email.com', '11987654335', 'Rua Y, 2323', 'Porto Alegre', 'RS', 'senha321');

-- Inserindo mais dados na tabela clientes_pj
INSERT INTO clientes_pj (pk_cnpj_clientes_pj, telefone_clientes_pj, cep_clientes_pj, nome_clientes_pj, email_clientes_pj, senha_cliente_pj) VALUES 
('12345678000167', '1123456799', '01011-000', 'Empresa K', 'contato@empresak.com', 'senha123'),
('23456789000178', '1123456700', '01012-000', 'Empresa L', 'contato@empresal.com', 'senha123'),
('34567890000189', '1123456701', '01013-000', 'Empresa M', 'contato@empresam.com', 'senha123'),
('45678900000190', '1123456702', '01014-000', 'Empresa N', 'contato@empresan.com', 'senha123'),
('56789000000101', '1123456703', '01015-000', 'Empresa O', 'contato@empresao.com', 'senha123');

-- Inserindo mais dados na tabela agencias
INSERT INTO agencias (contato_agencias, endereco_agencias, cidade_agencias, uf_agencias, fk_id_funcionarios, fk_placa_carros) VALUES 
('contato11@agencia.com', 'Rua Z, 2424', 'São Paulo', 'SP', 11, 'ABC1234'),
('contato12@agencia.com', 'Rua AA, 2525', 'Rio de Janeiro', 'RJ', 12, 'DEF5678'),
('contato13@agencia.com', 'Rua BB, 2626', 'Belo Horizonte', 'MG', 13, 'GHI9101'),
('contato14@agencia.com', 'Rua CC, 2727', 'Curitiba', 'PR', 14, 'JKL1121'),
('contato15@agencia.com', 'Rua DD, 2828', 'Porto Alegre', 'RS', 15, 'MNO3141');

-- Inserindo mais dados na tabela pagamentos
INSERT INTO pagamentos (forma_pagamentos, data_pagamentos, status_pagamentos) VALUES 
('Cartão de Débito', '2024-03-10', 'Pago'),
('Transferência Bancária', '2024-03-11', 'Pendente'),
('Boleto Bancário', '2024-03-12', 'Pago'),
('PIX', '2024-03-13', 'Pago'),
('Dinheiro', '2024-03-14', 'Pago');

-- Inserindo mais dados na tabela manutencoes
INSERT INTO manutencoes (data_manutencoes, tipo_manutencoes, custo_manutencoes, descricao_manutencoes) VALUES 
('2024-03-01', 'Troca de óleo', 250.00, 'Troca de óleo e filtro'),
('2024-03-02', 'Revisão', 600.00, 'Revisão completa'),
('2024-03-03', 'Troca de pneus', 1200.00, 'Troca dos quatro pneus'),
('2024-03-04', 'Alinhamento', 180.00, 'Alinhamento e balanceamento'),
('2024-03-05', 'Freios', 350.00, 'Troca de pastilhas de freio');

-- Inserindo mais dados na tabela feedbacks
INSERT INTO feedbacks (data_feedbacks, avaliacao_feedbacks, comentario_feedbacks) VALUES 
('2024-07-01', '5', 'Ótimo atendimento, carros limpos e novos'),
('2024-07-02', '4', 'Serviço rápido e eficiente'),
('2024-07-03', '3', 'Carro com alguns problemas técnicos, mas atendimento foi bom'),
('2024-07-04', '2', 'Carro sujo e tanque não estava cheio'),
('2024-07-05', '1', 'Carro com problemas mecânicos durante a locação');

-- Inserindo mais dados na tabela niveis_acesso
INSERT INTO niveis_acesso (nivel) VALUES 
('Usuário Comum'),
('Usuário VIP'),
('Atendente');




-- Inserindo mais dados na tabela aluga
INSERT INTO aluga (valor_total_aluga, data_entrega_aluga, data_retirada_aluga, fk_id_clientes_pf, fk_placa_carros, fk_cnpj_clientes_pj) VALUES 
(1200.00, '2024-03-20', '2024-03-10', 6, 'ABC1234', '12345678000167'),
(1800.00, '2024-03-21', '2024-03-11', 7, 'DEF5678', '23456789000178'),
(2400.00, '2024-03-22', '2024-03-12', 8, 'GHI9101', '34567890000189'),
(3000.00, '2024-03-23', '2024-03-13', 9, 'JKL1121', '45678900000190'),
(3600.00, '2024-03-24', '2024-03-14', 10, 'MNO3141', '56789000000101');

-- Inserindo mais dados na tabela Recebe
INSERT INTO Recebe (fk_id_manutencoes, fk_placa_carros) VALUES 
(6, 'ABC1234'),
(7, 'DEF5678'),
(8, 'GHI9101'),
(9, 'JKL1121'),
(10, 'MNO3141');

-- Inserindo mais dados na tabela Envia
INSERT INTO Envia (fk_id_feedbacks, fk_id_clientes_pf) VALUES 
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Inserindo mais dados na tabela Realiza
INSERT INTO Realiza (comprovante_realiza, fk_id_clientes_pf, fk_cnpj_clientes_pj, fk_id_pagamentos) VALUES 
('Comprovante 6', 6, '12345678000167', 6),
('Comprovante 7', 7, '23456789000178', 7),
('Comprovante 8', 8, '34567890000189', 8),
('Comprovante 9', 9, '45678900000190', 9),
('Comprovante 10', 10, '56789000000101', 10);

SELECT * FROM clientes_pf;
 
-- Inserindo mais dados na tabela clientes_pf
INSERT INTO clientes_pf (nome_clientes_pf, sobrenome_clientes_pf, email_clientes_pf, celular_clientes_pf, endereco_clientes_pf, cidade_clientes_pf, estado_clientes_pf, senha_cliente_pf, fk_nivel_acesso) VALUES 
('Rafael', 'Martins', 'rafael@email.com', '11987654331', 'Rua U, 1919', 'São Paulo', 'SP', 'senha321',2),
('Mariana', 'Sousa', 'mariana@email.com', '11987654332', 'Rua V, 2020', 'Rio de Janeiro', 'RJ', 'senha321',2),
('Rodrigo', 'Lopes', 'rodrigo@email.com', '11987654333', 'Rua W, 2121', 'Belo Horizonte', 'MG', 'senha321',2),
('Carla', 'Dias', 'carla@email.com', '11987654334', 'Rua X, 2222', 'Curitiba', 'PR', 'senha321',2),
('Luana', 'Nunes', 'luana@email.com', '11987654335', 'Rua Y, 2323', 'Porto Alegre', 'RS', 'senha321',2);

-- Inserindo mais dados na tabela clientes_pj
INSERT INTO clientes_pj (pk_cnpj_clientes_pj, telefone_clientes_pj, cep_clientes_pj, nome_clientes_pj, email_clientes_pj, senha_cliente_pj) VALUES 
('12345678000167', '1123456799', '01011-000', 'Empresa K', 'contato@empresak.com', 'senha123'),
('23456789000178', '1123456700', '01012-000', 'Empresa L', 'contato@empresal.com', 'senha123'),
('34567890000189', '1123456701', '01013-000', 'Empresa M', 'contato@empresam.com', 'senha123'),
('45678900000190', '1123456702', '01014-000', 'Empresa N', 'contato@empresan.com', 'senha123'),
('56789000000101', '1123456703', '01015-000', 'Empresa O', 'contato@empresao.com', 'senha123');

-- Inserindo mais dados na tabela agencias
INSERT INTO agencias (contato_agencias, endereco_agencias, cidade_agencias, uf_agencias, fk_id_funcionarios, fk_placa_carros) VALUES 
('contato11@agencia.com', 'Rua Z, 2424', 'São Paulo', 'SP', 11, 'ABC1234'),
('contato12@agencia.com', 'Rua AA, 2525', 'Rio de Janeiro', 'RJ', 12, 'DEF5678'),
('contato13@agencia.com', 'Rua BB, 2626', 'Belo Horizonte', 'MG', 13, 'GHI9101'),
('contato14@agencia.com', 'Rua CC, 2727', 'Curitiba', 'PR', 14, 'JKL1121'),
('contato15@agencia.com', 'Rua DD, 2828', 'Porto Alegre', 'RS', 15, 'MNO3141');

-- Inserindo mais dados na tabela pagamentos
INSERT INTO pagamentos (forma_pagamentos, data_pagamentos, status_pagamentos) VALUES 
('Cartão de Débito', '2024-03-10', 'Pago'),
('Transferência Bancária', '2024-03-11', 'Pendente'),
('Boleto Bancário', '2024-03-12', 'Pago'),
('PIX', '2024-03-13', 'Pago'),
('Dinheiro', '2024-03-14', 'Pago');

-- Inserindo mais dados na tabela manutencoes
INSERT INTO manutencoes (data_manutencoes, tipo_manutencoes, custo_manutencoes, descricao_manutencoes) VALUES 
('2024-03-01', 'Troca de óleo', 250.00, 'Troca de óleo e filtro'),
('2024-03-02', 'Revisão', 600.00, 'Revisão completa'),
('2024-03-03', 'Troca de pneus', 1200.00, 'Troca dos quatro pneus'),
('2024-03-04', 'Alinhamento', 180.00, 'Alinhamento e balanceamento'),
('2024-03-05', 'Freios', 350.00, 'Troca de pastilhas de freio');

-- Inserindo mais dados na tabela feedbacks
INSERT INTO feedbacks (data_feedbacks, avaliacao_feedbacks, comentario_feedbacks) VALUES 
('2024-07-01', '5', 'Ótimo atendimento, carros limpos e novos'),
('2024-07-02', '4', 'Serviço rápido e eficiente'),
('2024-07-03', '3', 'Carro com alguns problemas técnicos, mas atendimento foi bom'),
('2024-07-04', '2', 'Carro sujo e tanque não estava cheio'),
('2024-07-05', '1', 'Carro com problemas mecânicos durante a locação');





-- INSERINDO AGORA 40 NOVOS CAMPOS 




















-- Inserindo mais dados na tabela ClientesPF
INSERT INTO clientes_pf (nome_clientes_pf, sobrenome_clientes_pf, email_clientes_pf, celular_clientes_pf, endereco_clientes_pf, cidade_clientes_pf, estado_clientes_pf, senha_cliente_pf, fk_nivel_acesso) VALUES 
('Fernanda', 'Silva', 'fernanda@email.com', '11987654336', 'Rua Z, 2424', 'Salvador', 'BA', 'senha321', 2),
('Diego', 'Oliveira', 'diego@email.com', '11987654337', 'Rua A, 11', 'Recife', 'PE', 'senha321', 2),
('Juliana', 'Pereira', 'juliana@email.com', '11987654338', 'Rua B, 22', 'Fortaleza', 'CE', 'senha321', 2),
('Lucas', 'Santos', 'lucas@email.com', '11987654339', 'Rua C, 33', 'Florianópolis', 'SC', 'senha321', 2),
('Vanessa', 'Souza', 'vanessa@email.com', '11987654340', 'Rua D, 44', 'Brasília', 'DF', 'senha321', 2),
('Pedro', 'Gomes', 'pedro@email.com', '11987654341', 'Rua E, 55', 'Vitória', 'ES', 'senha321', 2),
('Camila', 'Rodrigues', 'camila@email.com', '11987654342', 'Rua F, 66', 'Manaus', 'AM', 'senha321', 2),
('Gustavo', 'Fernandes', 'gustavo@email.com', '11987654343', 'Rua G, 77', 'Goiânia', 'GO', 'senha321', 2),
('Bruna', 'Lima', 'bruna@email.com', '11987654344', 'Rua H, 88', 'Teresina', 'PI', 'senha321', 2),
('Marcelo', 'Almeida', 'marcelo@email.com', '11987654345', 'Rua I, 99', 'Natal', 'RN', 'senha321', 2),
('Thiago', 'Costa', 'thiago@email.com', '11987654346', 'Rua J, 1010', 'Aracaju', 'SE', 'senha321', 2),
('Fernanda', 'Martinez', 'fernanda2@email.com', '11987654347', 'Rua K, 1111', 'Boa Vista', 'RR', 'senha321', 2),
('Rafaela', 'Ferreira', 'rafaela@email.com', '11987654348', 'Rua L, 1212', 'Cuiabá', 'MT', 'senha321', 2),
('Paulo', 'Vieira', 'paulo@email.com', '11987654349', 'Rua M, 1313', 'Palmas', 'TO', 'senha321', 2),
('Amanda', 'Nogueira', 'amanda@email.com', '11987654350', 'Rua N, 1414', 'Porto Velho', 'RO', 'senha321', 2),
('Matheus', 'Ramos', 'matheus@email.com', '11987654351', 'Rua O, 1515', 'Macapá', 'AP', 'senha321', 2),
('Cristina', 'Dias', 'cristina@email.com', '11987654352', 'Rua P, 1616', 'Campo Grande', 'MS', 'senha321', 2),
('Fernando', 'Barbosa', 'fernando@email.com', '11987654353', 'Rua Q, 1717', 'Rio Branco', 'AC', 'senha321', 2),
('Juliano', 'Melo', 'juliano@email.com', '11987654354', 'Rua R, 1818', 'Porto Alegre', 'RS', 'senha321', 2),
('Roberta', 'Oliveira', 'roberta@email.com', '11987654355', 'Rua S, 1919', 'Curitiba', 'PR', 'senha321', 2),
('Carolina', 'Lima', 'carolina@email.com', '11987654356', 'Rua T, 2020', 'Florianópolis', 'SC', 'senha321', 2),
('Ricardo', 'Santos', 'ricardo@email.com', '11987654357', 'Rua U, 2121', 'São Paulo', 'SP', 'senha321', 2),
('Renata', 'Ferreira', 'renata@email.com', '11987654358', 'Rua V, 2222', 'Rio de Janeiro', 'RJ', 'senha321', 2),
('Felipe', 'Silveira', 'felipe@email.com', '11987654359', 'Rua W, 2323', 'Belo Horizonte', 'MG', 'senha321', 2),
('Patricia', 'Barros', 'patricia@email.com', '11987654360', 'Rua X, 2424', 'Salvador', 'BA', 'senha321', 2),
('Luciana', 'Alves', 'luciana@email.com', '11987654361', 'Rua Y, 2525', 'Recife', 'PE', 'senha321', 2),
('André', 'Martins', 'andre@email.com', '11987654362', 'Rua Z, 2626', 'Fortaleza', 'CE', 'senha321', 2),
('Jessica', 'Pereira', 'jessica@email.com', '11987654363', 'Rua A, 2727', 'Florianópolis', 'SC', 'senha321', 2),
('Gabriel', 'Sousa', 'gabriel@email.com', '11987654364', 'Rua B, 2828', 'Brasília', 'DF', 'senha321', 2),
('Ana', 'Gomes', 'ana@email.com', '11987654365', 'Rua C, 2929', 'Vitória', 'ES', 'senha321', 2),
('Isabela', 'Rodrigues', 'isabela@email.com', '11987654366', 'Rua D, 3030', 'Manaus', 'AM', 'senha321', 2),
('Henrique', 'Fernandes', 'henrique@email.com', '11987654367', 'Rua E, 3131', 'Goiânia', 'GO', 'senha321', 2),
('Patricia', 'Lima', 'patricia2@email.com', '11987654368', 'Rua F, 3232', 'Teresina', '

PI', 'senha321', 2),
('Roberto', 'Almeida', 'roberto@email.com', '11987654369', 'Rua G, 3333', 'Natal', 'RN', 'senha321', 2),
('Maria', 'Costa', 'maria@email.com', '11987654370', 'Rua H, 3434', 'Aracaju', 'SE', 'senha321', 2),
('Marcos', 'Martinez', 'marcos@email.com', '11987654371', 'Rua I, 3535', 'Boa Vista', 'RR', 'senha321', 2),
('Carolina', 'Ferreira', 'carolina2@email.com', '11987654372', 'Rua J, 3636', 'Cuiabá', 'MT', 'senha321', 2),
('Felipe', 'Vieira', 'felipe2@email.com', '11987654373', 'Rua K, 3737', 'Palmas', 'TO', 'senha321', 2),
('Bruno', 'Nogueira', 'bruno@email.com', '11987654374', 'Rua L, 3838', 'Porto Velho', 'RO', 'senha321', 2),
('Tatiane', 'Ramos', 'tatiane@email.com', '11987654375', 'Rua M, 3939', 'Macapá', 'AP', 'senha321', 2),
('Gustavo', 'Dias', 'gustavo2@email.com', '11987654376', 'Rua N, 4040', 'Campo Grande', 'MS', 'senha321', 2),
('Leticia', 'Barbosa', 'leticia@email.com', '11987654377', 'Rua O, 4141', 'Rio Branco', 'AC', 'senha321', 2),
('Thais', 'Melo', 'thais@email.com', '11987654378', 'Rua P, 4242', 'Porto Alegre', 'RS', 'senha321', 2);

-- Inserindo mais dados na tabela ClientesPJ
INSERT INTO clientes_pj (cnpj_clientes_pj, telefone_clientes_pj, cep_clientes_pj, nome_clientes_pj, email_clientes_pj, senha_cliente_pj) VALUES 
('67890000101234', '1123456799', '01011-000', 'Empresa P', 'contato@empresap.com', 'senha123'),
('78900001012345', '1123456700', '01012-000', 'Empresa Q', 'contato@empresaq.com', 'senha123'),
('89000010123456', '1123456701', '01013-000', 'Empresa R', 'contato@empresar.com', 'senha123'),
('90000101234567', '1123456702', '01014-000', 'Empresa S', 'contato@empresas.com', 'senha123'),
('00001012345678', '1123456703', '01015-000', 'Empresa T', 'contato@empresat.com', 'senha123'),
('00010123456789', '1123456704', '01016-000', 'Empresa U', 'contato@empresau.com', 'senha123'),
('00101234567890', '1123456705', '01017-000', 'Empresa V', 'contato@empresav.com', 'senha123'),
('01012345678901', '1123456706', '01018-000', 'Empresa W', 'contato@empresaw.com', 'senha123'),
('10123456789012', '1123456707', '01019-000', 'Empresa X', 'contato@empresax.com', 'senha123'),
('01234567890123', '1123456708', '01020-000', 'Empresa Y', 'contato@empresay.com', 'senha123'),
('12345678901234', '1123456709', '01021-000', 'Empresa Z', 'contato@empresaz.com', 'senha123'),
('23456789012345', '1123456710', '01022-000', 'Empresa AA', 'contato@empresaaz.com', 'senha123'),
('34567890123456', '1123456711', '01023-000', 'Empresa BB', 'contato@empresabb.com', 'senha123'),
('45678901234567', '1123456712', '01024-000', 'Empresa CC', 'contato@empresacc.com', 'senha123'),
('56789012345678', '1123456713', '01025-000', 'Empresa DD', 'contato@empresadd.com', 'senha123'),
('67890123456789', '1123456714', '01026-000', 'Empresa EE', 'contato@empresaee.com', 'senha123'),
('78901234567890', '1123456715', '01027-000', 'Empresa FF', 'contato@empresaff.com', 'senha123'),
('89012345678901', '1123456716', '01028-000', 'Empresa GG', 'contato@empresagg.com', 'senha123'),
('90000012345678', '1123456717', '01029-000', 'Empresa HH', 'contato@empresahh.com', 'senha123'),
('00000123456789', '1123456718', '01030-000', 'Empresa II', 'contato@empresaII.com', 'senha123'),
('00001234567890', '1123456719', '01031-000', 'Empresa JJ', 'contato@empresaJJ.com', 'senha123'),
('00012345678901', '1123456720', '01032-000', 'Empresa KK', 'contato@empresaKK.com', 'senha123'),
('00123456789012', '1123456721', '01033-000', 'Empresa LL', 'contato@empresaLL.com', 'senha123'),
('01234567890123', '1123456722', '01034-000', 'Empresa MM', 'contato@empresaMM.com', 'senha123'),
('12345678901234', '1123456723', '01035-000', 'Empresa NN', 'contato@empresaNN.com', 'senha123'),
('23456789012345', '1123456724', '01036-000', 'Empresa OO', 'contato@empresaOO.com', 'senha123'),
('34567890123456', '1123456725', '01037-000', 'Empresa PP', 'contato@empresaPP.com', 'senha123'),
('45678901234567', '1123456726', '01038-000', 'Empresa QQ', 'contato@empresaQQ.com', 'senha123'),
('56789012345678', '1123456727', '01039-000', 'Empresa RR', 'contato@empresaRR.com', 'senha

123'),
('67890123456789', '1123456728', '01040-000', 'Empresa SS', 'contato@empresaSS.com', 'senha123'),
('78901234567890', '1123456729', '01041-000', 'Empresa TT', 'contato@empresaTT.com', 'senha123'),
('89012345678901', '1123456730', '01042-000', 'Empresa UU', 'contato@empresaUU.com', 'senha123'),
('90000012345678', '1123456731', '01043-000', 'Empresa VV', 'contato@empresaVV.com', 'senha123'),
('00000123456789', '1123456732', '01044-000', 'Empresa WW', 'contato@empresaWW.com', 'senha123'),
('00001234567890', '1123456733', '01045-000', 'Empresa XX', 'contato@empresaXX.com', 'senha123'),
('00012345678901', '1123456734', '01046-000', 'Empresa YY', 'contato@empresaYY.com', 'senha123'),
('00123456789012', '1123456735', '01047-000', 'Empresa ZZ', 'contato@empresaZZ.com', 'senha123'),
('01234567890123', '1123456736', '01048-000', 'Empresa AAA', 'contato@empresaAAA.com', 'senha123'),
('12345678901234', '1123456737', '01049-000', 'Empresa BBB', 'contato@empresaBBB.com', 'senha123'),
('23456789012345', '1123456738', '01050-000', 'Empresa CCC', 'contato@empresaCCC.com', 'senha123'),
('34567890123456', '1123456739', '01051-000', 'Empresa DDD', 'contato@empresaDDD.com', 'senha123');

-- Inserindo mais dados na tabela Agencias
INSERT INTO Agencias (contato_agencias, endereco_agencias, cidade_agencias, uf_agencias, fk_id_funcionarios, fk_placa_carros) VALUES 
('contato16@agencia.com', 'Rua A, 1313', 'Salvador', 'BA', 16, 'ABC1234'),
('contato17@agencia.com', 'Rua B, 1414', 'Recife', 'PE', 17, 'DEF5678'),
('contato18@agencia.com', 'Rua C, 1515', 'Fortaleza', 'CE', 18, 'GHI9101'),
('contato19@agencia.com', 'Rua D, 1616', 'Florianópolis', 'SC', 19, 'JKL1121'),
('contato20@agencia.com', 'Rua E, 1717', 'Brasília', 'DF', 20, 'MNO3141'),
('contato21@agencia.com', 'Rua F, 1818', 'Manaus', 'AM', 21, 'ABC1234'),
('contato22@agencia.com', 'Rua G, 1919', 'Goiânia', 'GO', 22, 'DEF5678'),
('contato23@agencia.com', 'Rua H, 2020', 'Teresina', 'PI', 23, 'GHI9101'),
('contato24@agencia.com', 'Rua I, 2121', 'Natal', 'RN', 24, 'JKL1121'),
('contato25@agencia.com', 'Rua J, 2222', 'Aracaju', 'SE', 25, 'MNO3141'),
('contato26@agencia.com', 'Rua K, 2323', 'Boa Vista', 'RR', 26, 'ABC1234'),
('contato27@agencia.com', 'Rua L, 2424', 'Cuiabá', 'MT', 27, 'DEF5678'),
('contato28@agencia.com', 'Rua M, 2525', 'Palmas', 'TO', 28, 'GHI9101'),
('contato29@agencia.com', 'Rua N, 2626', 'Porto Velho', 'RO', 29, 'JKL1121'),
('contato30@agencia.com', 'Rua O, 2727', 'Macapá', 'AP', 30, 'MNO3141'),
('contato31@agencia.com', 'Rua P, 2828', 'Campo Grande', 'MS', 31, 'ABC1234'),
('contato32@agencia.com', 'Rua Q, 2929', 'Rio Branco', 'AC', 32, 'DEF5678'),
('contato33@agencia.com', 'Rua R, 3030', 'Porto Alegre', 'RS', 33, 'GHI9101'),
('contato34@agencia.com', 'Rua S, 3131', 'Curitiba', 'PR', 34, 'JKL1121'),
('contato35@agencia.com', 'Rua T, 3232', 'Florianópolis', 'SC', 35, 'MNO3141'),
('contato36@agencia.com', 'Rua U, 3333', 'São Paulo', 'SP', 36, 'ABC1234'),
('contato37@agencia.com', 'Rua V, 3434', 'Rio de Janeiro', 'RJ', 37, 'DEF5678'),
('contato38@agencia.com', 'Rua W, 3535', 'Belo Horizonte', 'MG', 38, 'GHI9101'),
('contato39@agencia.com', 'Rua X, 3636', 'Salvador', 'BA', 39, 'JKL1121'),
('contato40@agencia.com', 'Rua Y, 3737', 'Recife', 'PE', 40, 'MNO3141'),
('contato41@agencia.com', 'Rua Z, 3838', 'Fortaleza', 'CE', 41, 'ABC1234'),
('contato42@agencia.com', 'Rua AA, 3939', 'Florianópolis', 'SC', 42, 'DEF5678'),
('contato43@agencia.com', 'Rua BB, 4040', 'Brasília', 'DF', 43, 'GHI9101'),
('contato44@agencia.com', 'Rua CC, 4141', 'Manaus', 'AM', 44, 'JKL1121'),
('contato45@agencia.com', 'Rua DD, 4242', 'Goiânia', 'GO', 45, 'MNO3141'),
('contato46@agencia.com', 'Rua EE, 4343', 'Teresina', 'PI', 46, 'ABC1234'),
('contato47@agencia.com', 'Rua FF, 4444

', 'Natal', 'RN', 47, 'DEF5678'),
('contato48@agencia.com', 'Rua GG, 4545', 'Aracaju', 'SE', 48, 'GHI9101'),
('contato49@agencia.com', 'Rua HH, 4646', 'Boa Vista', 'RR', 49, 'JKL1121'),
('contato50@agencia.com', 'Rua II, 4747', 'Cuiabá', 'MT', 50, 'MNO3141');

-- Inserindo mais dados na tabela Pagamentos
INSERT INTO Pagamentos (forma_pagamentos, data_pagamentos, status_pagamentos) VALUES 
('Cartão de Crédito', '2024-06-01', 'Pago'),
('Transferência Bancária', '2024-06-02', 'Pendente'),
('Boleto Bancário', '2024-06-03', 'Pago'),
('PIX', '2024-06-04', 'Pago'),
('Dinheiro', '2024-06-05', 'Pago'),
('Cartão de Débito', '2024-06-06', 'Pago'),
('Transferência Bancária', '2024-06-07', 'Pendente'),
('Boleto Bancário', '2024-06-08', 'Pago'),
('PIX', '2024-06-09', 'Pago'),
('Dinheiro', '2024-06-10', 'Pago'),
('Cartão de Crédito', '2024-06-11', 'Pago'),
('Transferência Bancária', '2024-06-12', 'Pendente'),
('Boleto Bancário', '2024-06-13', 'Pago'),
('PIX', '2024-06-14', 'Pago'),
('Dinheiro', '2024-06-15', 'Pago'),
('Cartão de Débito', '2024-06-16', 'Pago'),
('Transferência Bancária', '2024-06-17', 'Pendente'),
('Boleto Bancário', '2024-06-18', 'Pago'),
('PIX', '2024-06-19', 'Pago'),
('Dinheiro', '2024-06-20', 'Pago'),
('Cartão de Crédito', '2024-06-21', 'Pago'),
('Transferência Bancária', '2024-06-22', 'Pendente'),
('Boleto Bancário', '2024-06-23', 'Pago'),
('PIX', '2024-06-24', 'Pago'),
('Dinheiro', '2024-06-25', 'Pago'),
('Cartão de Débito', '2024-06-26', 'Pago'),
('Transferência Bancária', '2024-06-27', 'Pendente'),
('Boleto Bancário', '2024-06-28', 'Pago'),
('PIX', '2024-06-29', 'Pago'),
('Dinheiro', '2024-06-30', 'Pago'),
('Cartão de Crédito', '2024-07-01', 'Pago'),
('Transferência Bancária', '2024-07-02', 'Pendente'),
('Boleto Bancário', '2024-07-03', 'Pago'),
('PIX', '2024-07-04', 'Pago'),
('Dinheiro', '2024-07-05', 'Pago'),
('Cartão de Débito', '2024-07-06', 'Pago'),
('Transferência Bancária', '2024-07-07', 'Pendente'),
('Boleto Bancário', '2024-07-08', 'Pago'),
('PIX', '2024-07-09', 'Pago'),
('Dinheiro', '2024-07-10', 'Pago');

-- Inserindo mais dados na tabela Manutencoes
INSERT INTO Manutencoes (data_manutencoes, tipo_manutencoes, custo_manutencoes, descricao_manutencoes) VALUES 
('2024-06-01', 'Troca de Óleo', 250.00, 'Troca de óleo e filtro'),
('2024-06-02', 'Revisão', 600.00, 'Revisão completa'),
('2024-06-03', 'Troca de Pneus', 1200.00, 'Troca dos quatro pneus'),
('2024-06-04', 'Alinhamento', 180.00, 'Alinhamento e balanceamento'),
('2024-06-05', 'Freios', 350.00, 'Troca de pastilhas de freio'),
('2024-06-06', 'Troca de Óleo', 250.00, 'Troca de óleo e filtro'),
('2024-06-07', 'Revisão', 600.00, 'Revisão completa'),
('2024-06-08', 'Troca de Pneus', 1200.00, 'Troca dos quatro pneus'),
('2024-06-09', 'Alinhamento', 180.00, 'Alinhamento e balanceamento'),
('2024-06-10', 'Freios', 350.00, 'Troca de pastilhas de freio'),
('2024-06-11', 'Troca de Óleo', 250.00, 'Troca de óleo e filtro'),
('2024-06-12', 'Revisão', 600.00, 'Revisão completa'),
('2024-06-13', 'Troca de Pneus', 1200.00, 'Troca dos quatro pneus'),
('2024-06-14', 'Alinhamento', 180.00, 'Alinhamento e balanceamento'),
('2024-06-15', 'Freios', 350.00, 'Troca de pastilhas de freio'),
('2024-06-16', 'Troca de Óleo', 250.00, 'Troca de óleo e filtro'),
('2024-06-17', 'Revisão', 600.00, 'Revisão completa'),
('2024-06-18', 'Troca de Pneus', 1200.00, 'Troca dos quatro pneus'),
('2024-06-19', 'Alinhamento', 180.00, 'Alinhamento e balanceamento'),
('2024-06-20', 'Freios', 350.00, 'Troca de pastilhas de freio'),
('2024-06-21', 'Troca de Óleo', 250.00, 'Troca de óleo e filtro'),
('2024-06-22', 'Revisão', 600.00, 'Revisão completa'),
('2024-06-23', 'Troca de Pneus', 1200.00, 'Troca dos quatro pneus'),
('2024-06-24', 'Alinhamento', 180.00, 'Alinhamento e balanceamento'),
('2024-06-25', 'Freios', 350.00, 'Troca de pastilhas de freio'),
('2024-06-26', 'Troca de Óleo', 250.00, 'Troca de óleo e filtro'),
('2024-06-27', 'Revisão', 600.00, 'Revisão completa'),
('2024-06-28', 'Troca de Pneus', 1200.00, 'Troca dos quatro pneus'),
('2024-06-29', 'Alinhamento', 180.00, 'Alinhamento e balanceamento'),
('2024-06-30', 'Freios', 350.00, 'Troca de pastilhas de freio');
