-- Criando o DB
CREATE DATABASE db_aluguel_carro;


-- Criando as tabelas
CREATE TABLE Agencia (
Contato VARCHAR(100) NOT NULL,
Num_Agencia INT NOT NULL PRIMARY KEY,
Endereco VARCHAR(255) NOT NULL,
UF VARCHAR(2) NOT NULL,
Cidade VARCHAR(255) NOT NULL,
Id_Funcionario INT NOT NULL,
Placa VARCHAR(8) NOT NULL
);

CREATE TABLE Cargos (
Cod_Cargo INT NOT NULL PRIMARY KEY,
Salario MONEY,
Nome_cargo VARCHAR(100),
Id_Funcionario INT NOT NULL
);

CREATE TABLE Funcionarios (
Id_Funcionario INT NOT NULL PRIMARY KEY,
Salario MONEY,
Sobrenome VARCHAR(255) NOT NULL,
Data_Contratacao DATE NOT NULL,
Nome VARCHAR(255) NOT NULL
);

CREATE TABLE Clientes_pj (
CNPJ VARCHAR(11)  NOT NULL PRIMARY KEY,
Telefone_Empresa VARCHAR(20) NOT NULL,
CEP_Empresa VARCHAR(10) NOT NULL,
Nome_Empresa VARCHAR(255) NOT NULL,
Email_Empresa VARCHAR(255) NOT NULL
);

CREATE TABLE Carro (
Disponibilidade VARCHAR(50) NOT NULL,
Ano DATE NOT NULL,
Modelo VARCHAR(100) NOT NULL,
Marca VARCHAR(100) NOT NULL,
Placa VARCHAR(8) NOT NULL PRIMARY KEY
);

CREATE TABLE Clientes_pf (
Sobrenome_Cliente VARCHAR(255) NOT NULL,
Id_Cliente_PF INT NOT NULL PRIMARY KEY,
Nome_Cliente VARCHAR(255) NOT NULL,
Endereco_Cliente VARCHAR(255) NOT NULL,
Cidade_Cliente VARCHAR(255) NOT NULL,
Estado_Cliente VARCHAR(255) NOT NULL,
Celular_Cliente VARCHAR(20) NOT NULL,
Email_Cliente VARCHAR(100) NOT NULL
);

CREATE TABLE Pagamento (
Id_Pagamento INT NOT NULL PRIMARY KEY,
Forma_Pagamento VARCHAR(255) NOT NULL,
Data_Pagamento DATE NOT NULL,
Status_Pagamento VARCHAR(50)
);

CREATE TABLE Manutencao (
Descricao VARCHAR(255),
Id_Manutencao INT NOT NULL PRIMARY KEY,
Data_Manutencao DATE NOT NULL,
Tipo_Manutencao VARCHAR(255) NOT NULL,
KM DECIMAL NOT NULL,
Custo MONEY NOT NULL
);

CREATE TABLE Feedback (
Data_Feedback DATE NOT NULL,
Avaliacao VARCHAR(5) NOT NULL,
Comentario VARCHAR(255) NOT NULL,
Id_Feedback INT NOT NULL PRIMARY KEY
);

CREATE TABLE Aluga (
Valor_total MONEY NOT NULL,
Id_locacao INT NOT NULL,
Data_Entrega DATE NOT NULL,
Data_Retirada DATE NOT NULL,
Id_Cliente_PF INT NOT NULL,
Placa VARCHAR(8) NOT NULL,
CNPJ VARCHAR(11)  NOT NULL,
PRIMARY KEY(Id_locacao,Id_Cliente_PF,Placa,CNPJ)
);

CREATE TABLE Recebe (
Id_Manutencao INT NOT NULL,
Placa VARCHAR(8) NOT NULL,
FOREIGN KEY(Id_Manutencao) REFERENCES Manutencao (Id_Manutencao),
FOREIGN KEY(Placa) REFERENCES Carro (Placa)
);

CREATE TABLE Envia (
Id_Feedback INT NOT NULL,
Id_Cliente_PF INT NOT NULL,
FOREIGN KEY(Id_Feedback) REFERENCES Feedback (Id_Feedback),
FOREIGN KEY(Id_Cliente_PF) REFERENCES Clientes_pf (Id_Cliente_PF)
);

CREATE TABLE Realiza (
Comprovante VARCHAR(255) NOT NULL,
Id_Comprovante INT NOT NULL,
Id_Cliente_PF INT NOT NULL,
CNPJ VARCHAR(11)  NOT NULL,
Id_Pagamento INT NOT NULL,
PRIMARY KEY(Id_Comprovante,Id_Cliente_PF,CNPJ,Id_Pagamento)
);

ALTER TABLE Agencia ADD FOREIGN KEY(Id_Funcionario) REFERENCES Funcionarios (Id_Funcionario);
ALTER TABLE Agencia ADD FOREIGN KEY(Placa) REFERENCES Carro (Placa);
ALTER TABLE Cargos ADD FOREIGN KEY(Id_Funcionario) REFERENCES Funcionarios (Id_Funcionario);





-- Adicionando dados à tabela Agência
INSERT INTO Agencia (Contato, Num_Agencia, Endereco, UF, Cidade, Id_Funcionario, Placa)
VALUES 
('João Silva', 1234, 'Rua das Flores, 123', 'SP', 'São Paulo', 1, 'ABC1234'),
('Maria Santos', 5678, 'Av. Principal, 456', 'RJ', 'Rio de Janeiro', 2, 'DEF5678'),
('Pedro Oliveira', 91011, 'Rua da Praia, 789', 'BA', 'Salvador', 3, 'GHI9101');

-- Adicionando dados à tabela Cargos
INSERT INTO Cargos (Cod_Cargo, Salario, Nome_cargo, Id_Funcionario)
VALUES 
(1, 5000.00, 'Gerente', 1),
(2, 3000.00, 'Vendedor', 2),
(3, 2500.00, 'Atendente', 3);

-- Adicionando dados à tabela Funcionarios
INSERT INTO Funcionarios (Id_Funcionario, Salario, Sobrenome, Data_Contratacao, Nome)
VALUES 
(1, 6000.00, 'Silva', '2023-01-15', 'João'),
(2, 3500.00, 'Santos', '2023-02-20', 'Maria'),
(3, 2800.00, 'Oliveira', '2023-03-10', 'Pedro');

-- Adicionando dados à tabela Clientes_PJ
INSERT INTO Clientes_PJ (CNPJ, Telefone_Empresa, CEP_Empresa, Nome_Empresa, Email_Empresa)
VALUES 
('12345678901', '1234-5678', '12345-678', 'Empresa A', 'empresa_a@example.com'),
('56789012345', '5678-9012', '56789-012', 'Empresa B', 'empresa_b@example.com'),
('90123456789', '9012-3456', '90123-456', 'Empresa C', 'empresa_c@example.com');

-- Adicionando dados à tabela Carro
INSERT INTO Carro (Disponibilidade, Ano, Modelo, Marca, Placa)
VALUES 
('Disponível', '2022-01-01', 'Sedan', 'Toyota', 'ABC1234'),
('Disponível', '2021-01-01', 'Hatchback', 'Honda', 'DEF5678'),
('Alugado', '2023-01-01', 'SUV', 'Ford', 'GHI9101');

-- Adicionando dados à tabela Clientes_PF
INSERT INTO Clientes_PF (Sobrenome_Cliente, Id_Cliente_PF, Nome_Cliente, Endereco_Cliente, Cidade_Cliente, Estado_Cliente, Celular_Cliente, Email_Cliente)
VALUES 
('Ferreira', 1, 'Ana', 'Rua das Flores, 123', 'São Paulo', 'SP', '9876-5432', 'ana@example.com'),
('Santana', 2, 'Carlos', 'Av. Principal, 456', 'Rio de Janeiro', 'RJ', '8765-4321', 'carlos@example.com'),
('Oliveira', 3, 'Mariana', 'Rua da Praia, 789', 'Salvador', 'BA', '7654-3210', 'mariana@example.com');

-- Adicionando dados à tabela Pagamento
INSERT INTO Pagamento (Id_Pagamento, Forma_Pagamento, Data_Pagamento, Status_Pagamento)
VALUES 
(1, 'Cartão de Crédito', '2024-05-01', 'Concluído'),
(2, 'Transferência Bancária', '2024-05-02', 'Pendente'),
(3, 'Dinheiro', '2024-05-03', 'Concluído');

-- Adicionando dados à tabela Manutencao
INSERT INTO Manutencao (Descricao, Id_Manutencao, Data_Manutencao, Tipo_Manutencao, KM, Custo)
VALUES 
('Troca de óleo', 1, '2024-04-01', 'Preventiva', 10000, 100.00),
('Substituição de pneus', 2, '2024-04-15', 'Corretiva', 20000, 300.00),
('Reparo de motor', 3, '2024-05-01', 'Corretiva', 25000, 500.00);

-- Adicionando dados à tabela Feedback
INSERT INTO Feedback (Data_Feedback, Avaliacao, Comentario, Id_Feedback)
VALUES 
('2024-05-01', '5/5', 'Excelente serviço!', 1),
('2024-05-02', '4/5', 'Bom atendimento.', 2),
('2024-05-03', '3/5', 'Poderia melhorar.', 3);

-- Adicionando dados na tabela Aluga
INSERT INTO Aluga (Valor_total, Id_locacao, Data_Entrega, Data_Retirada, Id_Cliente_PF, Placa, CNPJ)
VALUES 
(250.00, 1, '2024-05-01', '2024-05-05', 1, 'ABC1234', '12345678901'),
(300.00, 2, '2024-05-03', '2024-05-07', 2, 'DEF5678', '56789012345'),
(200.00, 3, '2024-05-02', '2024-05-06', 3, 'GHI9101', '90123456789');

-- Adicionando dados na tabela Recebe
INSERT INTO Recebe (Id_Manutencao, Placa)
VALUES 
(1, 'ABC1234'),
(2, 'DEF5678'),
(3, 'GHI9101');

-- Adicionando dados na tabela Envia
INSERT INTO Envia (Id_Feedback, Id_Cliente_PF)
VALUES 
(1, 1),
(2, 2),
(3, 3);

-- Adicionando dados na tabela Realiza
INSERT INTO Realiza (Comprovante, Id_Comprovante, Id_Cliente_PF, CNPJ, Id_Pagamento)
VALUES 
('Recibo001', 1, 1, '12345678901', 1),
('Recibo002', 2, 2, '56789012345', 2),
('Recibo003', 3, 3, '90123456789', 3);


-- Adicionando 20 novos dados à tabela Agência
INSERT INTO Agencia (Contato, Num_Agencia, Endereco, UF, Cidade, Id_Funcionario, Placa)
VALUES 
('José Oliveira', 2345, 'Av. das Palmeiras, 456', 'RJ', 'Rio de Janeiro', 4, 'JKL2345'),
('Ana Silva', 6789, 'Rua Principal, 789', 'SP', 'São Paulo', 5, 'MNO6789'),
('Marcos Santos', 111213, 'Av. da Praia, 1011', 'BA', 'Salvador', 6, 'PQR1112'),
('Cristina Lima', 141516, 'Rua das Pedras, 1314', 'RS', 'Porto Alegre', 7, 'STU1415'),
('Fernando Oliveira', 171819, 'Rua das Flores, 1617', 'MG', 'Belo Horizonte', 8, 'VWX1718'),
('Amanda Souza', 202122, 'Av. Central, 1920', 'PE', 'Recife', 9, 'YZA2021'),
('Ricardo Pereira', 232425, 'Rua da Mata, 2223', 'CE', 'Fortaleza', 10, 'BCD2324'),
('Camila Rodrigues', 262728, 'Av. do Sol, 2526', 'PR', 'Curitiba', 11, 'EFG2627'),
('Rodrigo Santos', 293031, 'Rua da Montanha, 2829', 'SC', 'Florianópolis', 12, 'HIJ2930'),
('Luciana Oliveira', 323334, 'Av. dos Ventos, 3233', 'ES', 'Vitória', 13, 'KLM3233'),
('Paulo Silva', 353637, 'Rua do Mar, 3435', 'GO', 'Goiânia', 14, 'NOP3536'),
('Carla Souza', 383940, 'Av. da Lua, 3637', 'MT', 'Cuiabá', 15, 'QRS3839'),
('Mariana Lima', 414243, 'Rua das Estrelas, 4041', 'PA', 'Belém', 16, 'TUV4142'),
('Diego Santos', 444546, 'Av. das Árvores, 4344', 'AM', 'Manaus', 17, 'WXY4445'),
('Bruna Oliveira', 474849, 'Rua do Céu, 4647', 'AC', 'Rio Branco', 18, 'ZAB4748'),
('Gustavo Pereira', 505152, 'Av. dos Anjos, 4950', 'RO', 'Porto Velho', 19, 'CDE5051'),
('Fabiana Rodrigues', 535455, 'Rua da Aurora, 5253', 'RR', 'Boa Vista', 20, 'FGH5354'),
('Roberto Lima', 555657, 'Av. do Arco-Íris, 5556', 'TO', 'Palmas', 21, 'IJK5556'),
('Larissa Silva', 575859, 'Rua da Neblina, 5758', 'PI', 'Teresina', 22, 'LMN5758'),
('Pedro Rodrigues', 606162, 'Av. das Nuvens, 6061', 'RN', 'Natal', 23, 'OPQ6061');

-- Adicionando 20 novos dados à tabela Cargos
INSERT INTO Cargos (Cod_Cargo, Salario, Nome_cargo, Id_Funcionario)
VALUES 
(4, 2000.00, 'Assistente', 4),
(5, 1800.00, 'Estagiário', 5),
(6, 3500.00, 'Supervisor', 6),
(7, 2700.00, 'Assistente', 7),
(8, 2200.00, 'Estagiário', 8),
(9, 4000.00, 'Gerente', 9),
(10, 3200.00, 'Vendedor', 10),
(11, 2500.00, 'Atendente', 11),
(12, 2600.00, 'Assistente', 12),
(13, 2400.00, 'Estagiário', 13),
(14, 3800.00, 'Supervisor', 14),
(15, 3000.00, 'Assistente', 15),
(16, 2800.00, 'Estagiário', 16),
(17, 4200.00, 'Gerente', 17),
(18, 3300.00, 'Vendedor', 18),
(19, 2700.00, 'Atendente', 19),
(20, 2900.00, 'Assistente', 20),
(21, 2600.00, 'Estagiário', 21),
(22, 3900.00, 'Supervisor', 22),
(23, 3100.00, 'Assistente', 23);

-- Adicionando 20 novos dados à tabela Funcionarios
INSERT INTO Funcionarios (Id_Funcionario, Salario, Sobrenome, Data_Contratacao, Nome)
VALUES 
(4, 1800.00, 'Oliveira', '2023-04-15', 'José'),
(5, 1600.00, 'Silva', '2023-05-20', 'Ana'),
(6, 3300.00, 'Santos', '2023-06-10', 'Marcos'),
(7, 2500.00, 'Lima', '2023-07-15', 'Cristina'),
(8, 2000.00, 'Oliveira', '2023-08-20', 'Fernando'),
(9, 3800.00, 'Souza', '2023-09-10', 'Amanda'),
(10, 3000.00, 'Pereira', '2023-10-15', 'Ricardo'),
(11, 2300.00, 'Rodrigues', '2023-11-20', 'Camila'),
(12, 2400.00, 'Santos', '2023-12-10', 'Rodrigo'),
(13, 2200.00, 'Oliveira', '2024-01-15', 'Luciana'),
(14, 3600.00, 'Silva', '2024-02-20', 'Paulo'),
(15, 2800.00, 'Souza', '2024-03-10', 'Carla'),
(16, 2600.00, 'Lima', '2024-04-15', 'Mariana'),
(17, 4000.00, 'Santos', '2024-05-01', 'Diego'),
(18, 3100.00, 'Oliveira', '2024-06-15', 'Bruna'),
(19, 3400.00, 'Pereira', '2024-07-20', 'Gustavo'),
(20, 2500.00, 'Rodrigues', '2024-08-10', 'Fabiana'),
(21, 2400.00, 'Lima', '2024-09-15', 'Roberto'),
(22, 3900.00, 'Silva', '2024-10-20', 'Larissa'),
(23, 3200.00, 'Rodrigues', '2024-11-10', 'Pedro');

-- Adicionando 20 novos dados à tabela Clientes_PJ
INSERT INTO Clientes_PJ (CNPJ, Telefone_Empresa, CEP_Empresa, Nome_Empresa, Email_Empresa)
VALUES 
('12345678901', '1234567890', '12345678', 'Empresa A', 'empresa_a@example.com'),
('23456789012', '2345678901', '23456789', 'Empresa B', 'empresa_b@example.com'),
('34567890123', '3456789012', '34567890', 'Empresa C', 'empresa_c@example.com'),
('45678901234', '4567890123', '45678901', 'Empresa D', 'empresa_d@example.com'),
('56789012345', '5678901234', '56789012', 'Empresa E', 'empresa_e@example.com'),
('67890123456', '6789012345', '67890123', 'Empresa F', 'empresa_f@example.com'),
('78901234567', '7890123456', '78901234', 'Empresa G', 'empresa_g@example.com'),
('89012345678', '8901234567', '89012345', 'Empresa H', 'empresa_h@example.com'),
('90123456789', '9012345678', '90123456', 'Empresa I', 'empresa_i@example.com'),
('12345678901', '1234567890', '12345678', 'Empresa J', 'empresa_j@example.com'),
('23456789012', '2345678901', '23456789', 'Empresa K', 'empresa_k@example.com'),
('34567890123', '3456789012', '34567890', 'Empresa L', 'empresa_l@example.com'),
('45678901234', '4567890123', '45678901', 'Empresa M', 'empresa_m@example.com'),
('56789012345', '5678901234', '56789012', 'Empresa N', 'empresa_n@example.com'),
('67890123456', '6789012345', '67890123', 'Empresa O', 'empresa_o@example.com'),
('78901234567', '7890123456', '78901234', 'Empresa P', 'empresa_p@example.com'),
('89012345678', '8901234567', '89012345', 'Empresa Q', 'empresa_q@example.com'),
('90123456789', '9012345678', '90123456', 'Empresa R', 'empresa_r@example.com'),
('12345678901', '1234567890', '12345678', 'Empresa S', 'empresa_s@example.com'),
('23456789012', '2345678901', '23456789', 'Empresa T', 'empresa_t@example.com');

-- Adicionando 20 novos dados à tabela Carro
INSERT INTO Carro (Disponibilidade, Ano, Modelo, Marca, Placa)
VALUES 
('Disponível', '2023-01-01', 'Sedan', 'Toyota', 'JKL2345'),
('Disponível', '2022-01-01', 'Hatchback', 'Honda', 'MNO6789'),
('Alugado', '2024-01-01', 'SUV', 'Ford', 'PQR1112'),
('Disponível', '2023-01-01', 'Sedan', 'Toyota', 'STU1415'),
('Disponível', '2022-01-01', 'Hatchback', 'Honda', 'VWX1718'),
('Alugado', '2024-01-01', 'SUV', 'Ford', 'YZA2021'),
('Disponível', '2023-01-01', 'Sedan', 'Toyota', 'BCD2324'),
('Disponível', '2022-01-01', 'Hatchback', 'Honda', 'EFG2627'),
('Alugado', '2024-01-01', 'SUV', 'Ford', 'HIJ2930'),
('Disponível', '2023-01-01', 'Sedan', 'Toyota', 'KLM3233'),
('Disponível', '2022-01-01', 'Hatchback', 'Honda', 'NOP3536'),
('Alugado', '2024-01-01', 'SUV', 'Ford', 'QRS3839'),
('Disponível', '2023-01-01', 'Sedan', 'Toyota', 'TUV4142'),
('Disponível', '2022-01-01', 'Hatchback', 'Honda', 'WXY4445'),
('Alugado', '2024-01-01', 'SUV', 'Ford', 'ZAB4748'),
('Disponível', '2023-01-01', 'Sedan', 'Toyota', 'CDE5051'),
('Disponível', '2022-01-01', 'Hatchback', 'Honda', 'FGH5354'),
('Alugado', '2024-01-01', 'SUV', 'Ford', 'IJK5556'),
('Disponível', '2023-01-01', 'Sedan', 'Toyota', 'LMN5758'),
('Disponível', '2022-01-01', 'Hatchback', 'Honda', 'OPQ6061');

-- Adicionando 20 novos dados à tabela Clientes_PF
INSERT INTO Clientes_PF (Sobrenome_Cliente, Id_Cliente_PF, Nome_Cliente, Endereco_Cliente, Cidade_Cliente, Estado_Cliente, Celular_Cliente, Email_Cliente)
VALUES 
('Ferreira', 24, 'Rafael', 'Av. das Flores, 121', 'São Paulo', 'SP', '9876-5432', 'rafael@example.com'),
('Santana', 25, 'Juliana', 'Rua Principal, 325', 'Rio de Janeiro', 'RJ', '8765-4321', 'juliana@example.com'),
('Oliveira', 26, 'Thiago', 'Av. da Praia, 101', 'Salvador', 'BA', '7654-3210', 'thiago@example.com'),
('Silva', 27, 'Laura', 'Rua das Pedras, 131', 'Porto Alegre', 'RS', '6543-2109', 'laura@example.com'),
('Santos', 28, 'Gabriel', 'Rua da Mata, 222', 'Belo Horizonte', 'MG', '5432-1098', 'gabriel@example.com'),
('Lima', 29, 'Fernanda', 'Av. Central, 303', 'Recife', 'PE', '4321-0987', 'fernanda@example.com'),
('Oliveira', 30, 'Vanessa', 'Rua da Montanha, 282', 'Fortaleza', 'CE', '3210-9876', 'vanessa@example.com'),
('Rodrigues', 31, 'Lucas', 'Av. dos Ventos, 323', 'Vitória', 'ES', '2109-8765', 'lucas@example.com'),
('Santos', 32, 'Aline', 'Rua do Mar, 343', 'Goiânia', 'GO', '1098-7654', 'aline@example.com'),
('Oliveira', 33, 'Leonardo', 'Av. da Lua, 363', 'Cuiabá', 'MT', '0987-6543', 'leonardo@example.com'),
('Pereira', 34, 'Isabela', 'Rua das Estrelas, 404', 'Belém', 'PA', '9876-5432', 'isabela@example.com'),
('Rodrigues', 35, 'Roberto', 'Av. das Árvores, 434', 'Manaus', 'AM', '8765-4321', 'roberto@example.com'),
('Lima', 36, 'Carolina', 'Rua do Céu, 464', 'Rio Branco', 'AC', '7654-3210', 'carolina@example.com'),
('Silva', 37, 'Rodrigo', 'Av. dos Anjos, 495', 'Porto Velho', 'RO', '6543-2109', 'rodrigo@example.com'),
('Souza', 38, 'Julia', 'Rua da Aurora, 525', 'Boa Vista', 'RR', '5432-1098', 'julia@example.com'),
('Santos', 39, 'Daniel', 'Av. do Arco-Íris, 555', 'Palmas', 'TO', '4321-0987', 'daniel@example.com'),
('Lima', 40, 'Patricia', 'Rua da Neblina, 575', 'Teresina', 'PI', '3210-9876', 'patricia@example.com'),
('Silva', 41, 'Thais', 'Av. das Nuvens, 606', 'Natal', 'RN', '2109-8765', 'thais@example.com'),
('Oliveira', 42, 'Felipe', 'Av. da Neblina, 636', 'João Pessoa', 'PB', '0987-6543', 'felipe@example.com'),
('Santos', 43, 'Amanda', 'Rua das Rosas, 666', 'Aracaju', 'SE', '8765-4321', 'amanda@example.com');

-- Adicionando 20 novos dados à tabela Pagamento
INSERT INTO Pagamento (Id_Pagamento, Forma_Pagamento, Data_Pagamento, Status_Pagamento)
VALUES 
(4, 'Cartão de Débito', '2024-05-04', 'Pendente'),
(5, 'Dinheiro', '2024-05-05', 'Concluído'),
(6, 'Boleto Bancário', '2024-05-06', 'Concluído'),
(7, 'Transferência Bancária', '2024-05-07', 'Pendente'),
(8, 'Cartão de Crédito', '2024-05-08', 'Concluído'),
(9, 'Dinheiro', '2024-05-09', 'Pendente'),
(10, 'Boleto Bancário', '2024-05-10', 'Pendente'),
(11, 'Transferência Bancária', '2024-05-11', 'Concluído'),
(12, 'Cartão de Crédito', '2024-05-12', 'Pendente'),
(13, 'Dinheiro', '2024-05-13', 'Concluído'),
(14, 'Boleto Bancário', '2024-05-14', 'Pendente'),
(15, 'Transferência Bancária', '2024-05-15', 'Concluído'),
(16, 'Cartão de Crédito', '2024-05-16', 'Pendente'),
(17, 'Dinheiro', '2024-05-17', 'Concluído'),
(18, 'Boleto Bancário', '2024-05-18', 'Pendente'),
(19, 'Transferência Bancária', '2024-05-19', 'Concluído'),
(20, 'Cartão de Crédito', '2024-05-20', 'Pendente'),
(21, 'Dinheiro', '2024-05-21', 'Concluído'),
(22, 'Boleto Bancário', '2024-05-22', 'Pendente'),
(23, 'Transferência Bancária', '2024-05-23', 'Concluído');

-- Adicionando 20 novos dados à tabela Manutencao
INSERT INTO Manutencao (Descricao, Id_Manutencao, Data_Manutencao, Tipo_Manutencao, KM, Custo)
VALUES 
('Troca de óleo', 4, '2024-04-01', 'Preventiva', 15000, 120.00),
('Substituição de pneus', 5, '2024-04-15', 'Corretiva', 25000, 400.00),
('Reparo de motor', 6, '2024-05-01', 'Corretiva', 30000, 600.00),
('Troca de óleo', 7, '2024-04-01', 'Preventiva', 20000, 150.00),
('Substituição de pneus', 8, '2024-04-15', 'Corretiva', 30000, 500.00),
('Reparo de motor', 9, '2024-05-01', 'Corretiva', 35000, 700.00),
('Troca de óleo', 10, '2024-04-01', 'Preventiva', 25000, 180.00),
('Substituição de pneus', 11, '2024-04-15', 'Corretiva', 35000, 600.00),
('Reparo de motor', 12, '2024-05-01', 'Corretiva', 40000, 800.00),
('Troca de óleo', 13, '2024-04-01', 'Preventiva', 30000, 200.00),
('Substituição de pneus', 14, '2024-04-15', 'Corretiva', 40000, 700.00),
('Reparo de motor', 15, '2024-05-01', 'Corretiva', 45000, 900.00),
('Troca de óleo', 16, '2024-04-01', 'Preventiva', 35000, 220.00),
('Substituição de pneus', 17, '2024-04-15', 'Corretiva', 45000, 800.00),
('Reparo de motor', 18, '2024-05-01', 'Corretiva', 50000, 1000.00),
('Troca de óleo', 19, '2024-04-01', 'Preventiva', 40000, 250.00),
('Substituição de pneus', 20, '2024-04-15', 'Corretiva', 50000, 900.00),
('Reparo de motor', 21, '2024-05-01', 'Corretiva', 55000, 1100.00),
('Troca de óleo', 22, '2024-04-01', 'Preventiva', 45000, 280.00),
('Substituição de pneus', 23, '2024-04-15', 'Corretiva', 55000, 1000.00);

-- Adicionando 20 novos dados à tabela Feedback
INSERT INTO Feedback (Data_Feedback, Avaliacao, Comentario, Id_Feedback)
VALUES 
('2024-05-01', 'Bom', 'Serviço rápido e eficiente.', 4),
('2024-05-02', 'Regular', 'Poderia melhorar o atendimento ao cliente.', 5),
('2024-05-03', 'Ótimo', 'Carro em perfeito estado.', 6),
('2024-05-04', 'Bom', 'Preço justo.', 7),
('2024-05-05', 'Excelente', 'Atendimento muito cordial.', 8),
('2024-05-06', 'Regular', 'Carro sujo por dentro.', 9),
('2024-05-07', 'Bom', 'Entrega do carro demorou um pouco.', 10),
('2024-05-08', 'Ótimo', 'Facilidade no processo de aluguel.', 11),
('2024-05-09', 'Bom', 'Carro em bom estado.', 12),
('2024-05-10', 'Excelente', 'Atendimento rápido.', 13),
('2024-05-11', 'Regular', 'Carro com cheiro de cigarro.', 14),
('2024-05-12', 'Bom', 'Preço acessível.', 15),
('2024-05-13', 'Excelente', 'Carro limpo e em bom estado.', 16),
('2024-05-14', 'Ótimo', 'Atendimento eficiente.', 17),
('2024-05-15', 'Regular', 'Demorou para entregar o carro.', 18),
('2024-05-16', 'Bom', 'Facilidade de pagamento.', 19),
('2024-05-17', 'Excelente', 'Carro novo.', 20),
('2024-05-18', 'Ótimo', 'Atendimento cortês.', 21),
('2024-05-19', 'Regular', 'Carro com barulhos estranhos.', 22),
('2024-05-20', 'Bom', 'Preço justo.', 23);

-- Adicionando 20 novos dados à tabela Aluga
INSERT INTO Aluga (Valor_total, Id_locacao, Data_Entrega, Data_Retirada, Id_Cliente_PF, Placa, CNPJ)
VALUES 
(500.00, 4, '2024-05-01', '2024-05-05', 24, 'JKL2345', '12345678901'),
(600.00, 5, '2024-05-02', '2024-05-06', 25, 'MNO6789', '56789012345'),
(700.00, 6, '2024-05-03', '2024-05-07', 26, 'PQR1112', '90123456789'),
(800.00, 7, '2024-05-04', '2024-05-08', 27, 'STU1415', '12345678901'),
(900.00, 8, '2024-05-05', '2024-05-09', 28, 'VWX1718', '56789012345'),
(1000.00, 9, '2024-05-06', '2024-05-10', 29, 'YZA2021', '90123456789'),
(1100.00, 10, '2024-05-07', '2024-05-11', 30, 'BCD2324', '12345678901'),
(1200.00, 11, '2024-05-08', '2024-05-12', 31, 'EFG2627', '56789012345'),
(1300.00, 12, '2024-05-09', '2024-05-13', 32, 'HIJ2930', '90123456789'),
(1400.00, 13, '2024-05-10', '2024-05-14', 33, 'KLM3233', '12345678901'),
(1500.00, 14, '2024-05-11', '2024-05-15', 34, 'NOP3536', '56789012345'),
(1600.00, 15, '2024-05-12', '2024-05-16', 35, 'QRS3839', '90123456789'),
(1700.00, 16, '2024-05-13', '2024-05-17', 36, 'TUV4142', '12345678901'),
(1800.00, 17, '2024-05-14', '2024-05-18', 37, 'WXY4445', '56789012345'),
(1900.00, 18, '2024-05-15', '2024-05-19', 38, 'ZAB4748', '90123456789'),
(2000.00, 19, '2024-05-16', '2024-05-20', 39, 'CDE5051', '12345678901'),
(2100.00, 20, '2024-05-17', '2024-05-21', 40, 'FGH5354', '56789012345'),
(2200.00, 21, '2024-05-18', '2024-05-22', 41, 'IJK5556', '90123456789'),
(2300.00, 22, '2024-05-19', '2024-05-23', 42, 'LMN5758', '12345678901'),
(2400.00, 23, '2024-05-20', '2024-05-24', 43, 'OPQ6061', '56789012345');


-- Adicionando 20 novos dados à tabela Recebe
INSERT INTO Recebe (Id_Manutencao, Placa)
VALUES 
(4, 'JKL2345'),
(5, 'MNO6789'),
(6, 'PQR1112'),
(7, 'STU1415'),
(8, 'VWX1718'),
(9, 'YZA2021'),
(10, 'BCD2324'),
(11, 'EFG2627'),
(12, 'HIJ2930'),
(13, 'KLM3233'),
(14, 'NOP3536'),
(15, 'QRS3839'),
(16, 'TUV4142'),
(17, 'WXY4445'),
(18, 'ZAB4748'),
(19, 'CDE5051'),
(20, 'FGH5354'),
(21, 'IJK5556'),
(22, 'LMN5758'),
(23, 'OPQ6061');

-- Adicionando 20 novos dados à tabela Envia
INSERT INTO Envia (Id_Feedback, Id_Cliente_PF)
VALUES 
(4, 24),
(5, 25),
(6, 26),
(7, 27),
(8, 28),
(9, 29),
(10, 30),
(11, 31),
(12, 32),
(13, 33),
(14, 34),
(15, 35),
(16, 36),
(17, 37),
(18, 38),
(19, 39),
(20, 40),
(21, 41),
(22, 42),
(23, 43);

-- Atualizando os dados da tabela Realiza com os CNPJs corrigidos
INSERT INTO Realiza (Comprovante, Id_Comprovante, Id_Cliente_PF, CNPJ, Id_Pagamento)
VALUES 
('XYZ123', 4, 24, '12345678901', 4),
('XYZ124', 5, 25, '56789012345', 5),
('XYZ125', 6, 26, '90123456789', 6),
('XYZ126', 7, 27, '12345678901', 7),
('XYZ127', 8, 28, '56789012345', 8),
('XYZ128', 9, 29, '90123456789', 9),
('XYZ129', 10, 30, '12345678901', 10),
('XYZ130', 11, 31, '56789012345', 11),
('XYZ131', 12, 32, '90123456789', 12),
('XYZ132', 13, 33, '12345678901', 13),
('XYZ133', 14, 34, '56789012345', 14),
('XYZ134', 15, 35, '90123456789', 15),
('XYZ135', 16, 36, '12345678901', 16),
('XYZ136', 17, 37, '56789012345', 17),
('XYZ137', 18, 38, '90123456789', 18),
('XYZ138', 19, 39, '12345678901', 19),
('XYZ139', 20, 40, '56789012345', 20),
('XYZ140', 21, 41, '90123456789', 21),
('XYZ141', 22, 42, '12345678901', 22),
('XYZ142', 23, 43, '56789012345', 23);


ALTER TABLE feedback ALTER COLUMN avaliacao TYPE VARCHAR(30);




--REALIZAÇÃO DE CONSULTAS EM SQL
    --SELECT:
        -- 1.0
            SELECT * FROM carro;

        --1.1
            SELECT clientes_pf.nome_cliente, aluga.data_retirada FROM clientes_pf INNER JOIN aluga ON aluga.id_cliente_pf = clientes_pf.id_cliente_pf WHERE aluga.data_retirada BETWEEN '2024-02-01' AND '2024-05-30';
            SELECT * FROM clientes_pf;
            SELECT * FROM aluga;
        
        --1.2
            SELECT funcionarios.nome, agencia.num_agencia FROM funcionarios INNER JOIN agencia ON agencia.id_funcionario = funcionarios.id_funcionario WHERE agencia.num_agencia = 1234;
            SELECT * FROM funcionarios;
            SELECT * FROM agencia;

        --1.3
            SELECT pagamento.id_pagamento, CONCAT(clientes_pf.nome_cliente,'',clientes_pf.sobrenome_cliente) AS nome_cliente, pagamento.forma_pagamento FROM pagamento INNER JOIN clientes_pf ON clientes_pf.id_cliente_pf = pagamento.id_pagamento WHERE id_cliente_pf = 1; 

            SELECT * FROM clientes_pf;
            SELECT * FROM pagamento;


        --1.4
            SELECT recebe.placa FROM recebe
            INNER JOIN manutencao ON recebe.id_manutencao = manutencao.id_manutencao WHERE manutencao.tipo_manutencao = 'Corretiva';


            SELECT * FROM manutencao;
            SELECT * FROM carro;
            SELECT * FROM recebe;

        --1.5
            SELECT cpf.Nome_Cliente, COUNT(*) AS Total_Alugueis FROM aluga al
            INNER JOIN Clientes_pf cpf ON al.Id_Cliente_PF = cpf.Id_Cliente_PF
            GROUP BY cpf.Nome_Cliente HAVING COUNT(*) > 1;


            SELECT * FROM cliente_pf;
            SELECT * FROM aluga;
            SELECT * FROM recebe;

        -- 1.6
            ALTER TABLE funcionarios ADD COLUMN cidade_natal VARCHAR(255);

UPDATE funcionarios
SET cidade_natal = CASE
    WHEN id_funcionario = 1 THEN 'São Paulo'
    WHEN id_funcionario = 2 THEN 'Rio de Janeiro'
    WHEN id_funcionario = 3 THEN 'Belo Horizonte'
    WHEN id_funcionario = 4 THEN 'Salvador'
    WHEN id_funcionario = 5 THEN 'Brasília'
    WHEN id_funcionario = 6 THEN 'Fortaleza'
    WHEN id_funcionario = 7 THEN 'Manaus'
    WHEN id_funcionario = 8 THEN 'Curitiba'
    WHEN id_funcionario = 9 THEN 'Recife'
    WHEN id_funcionario = 10 THEN 'Goiânia'
    WHEN id_funcionario = 11 THEN 'Belém'
    WHEN id_funcionario = 12 THEN 'Porto Alegre'
    WHEN id_funcionario = 13 THEN 'São Luís'
    WHEN id_funcionario = 14 THEN 'Campinas'
    WHEN id_funcionario = 15 THEN 'Guarulhos'
    WHEN id_funcionario = 16 THEN 'Santo André'
    WHEN id_funcionario = 17 THEN 'Duque de Caxias'
    WHEN id_funcionario = 18 THEN 'Nova Iguaçu'
    WHEN id_funcionario = 19 THEN 'São Bernardo do Campo'
    WHEN id_funcionario = 20 THEN 'Maceió'
    WHEN id_funcionario = 21 THEN 'São Gonçalo'
    WHEN id_funcionario = 22 THEN 'Feira de Santana'
    WHEN id_funcionario = 23 THEN 'Ribeirão Preto'
END;

SELECT DISTINCT c.*
FROM carro c
JOIN aluga a ON c.placa = a.placa
JOIN clientes_pf cl ON a.id_cliente_pf = cl.id_cliente_pf
JOIN funcionarios f ON cl.cidade_cliente = f.cidade_natal
WHERE f.id_funcionario = 3;


            SELECT * FROM funcionarios;
            SELECT * FROM carro;
            SELECT * FROM aluga;
            SELECT * FROM clientes_pf;

    -- 2 UPDATE
        -- 2.0
           UPDATE aluga SET valor_total = 400 
            WHERE aluga.placa IN (SELECT carro.placa FROM carro WHERE carro.marca = 'Toyota');

        --2.1
            UPDATE aluga SET data_entrega = '2024-04-02'
            WHERE aluga.placa = '3' AND aluga.id_cliente_pf = '25';

        --2.2
            UPDATE carro SET disponibilidade = 'Disponivel'
            WHERE carro.placa = 'HIJ2930';

           

    --3 ALTER TABLE
        --3.0
            ALTER TABLE Carro 
            ADD COLUMN status_disponibilidade VARCHAR(50);
        --3.1
            ALTER TABLE Pagamento
            ALTER COLUMN valor DECIMAL(10,2);
        --3.2
            ALTER TABLE Clientes_pf
            DROP COLUMN telefone;
    
    --4 JOIN
        --4.0
            SELECT Clientes_pf.nome_cliente AS nome_cliente, Carro.modelo, aluga.data_retirada FROM aluga
            JOIN Clientes_pf ON aluga.id_cliente_pf = Clientes_pf.id_cliente_pf
            JOIN Carro ON aluga.placa = Carro.placa;

        --4.1
            SELECT Clientes_pf.nome_cliente AS nome_cliente, Pagamento.status_pagamento FROM Pagamento
            JOIN Clientes_pf ON Pagamento.id_pagamento = Clientes_pf.id_cliente_pf;

        --4.2
            SELECT Clientes_pf.nome_cliente AS nome_cliente, Carro.modelo, Feedback.comentario FROM Feedback
            JOIN aluga ON Feedback.id_feedback = aluga.id_locacao
            JOIN Clientes_pf ON aluga.id_cliente_pf = Clientes_pf.id_cliente_pf
            JOIN Carro ON aluga.placa = Carro.placa;

    --5 INNER JOIN 
        --5.0
        SELECT Carro.modelo, Carro.placa FROM Carro 
        JOIN Agencia ON Carro.placa = Agencia.placa
        WHERE Agencia.num_agencia = '6789' AND Carro.disponibilidade = 'Disponível';

    --5.1
        SELECT Aluga.*, clientes_pf.nome_cliente AS nome_cliente FROM Aluga
        JOIN clientes_pf ON Aluga.id_cliente_pf = clientes_pf.id_cliente_pf
        WHERE clientes_pf.cidade_cliente = 'São Paulo'; 

    --5.2
        SELECT DISTINCT Funcionarios.nome FROM funcionarios
        JOIN Agencia ON funcionarios.id_funcionario = agencia.id_funcionario
        JOIN Carro ON agencia.placa = carro.placa WHERE Carro.marca = 'Toyota';

    --6 lEFT JOIN 
        --6.0
            SELECT carro.modelo, carro.modelo, feedback.avaliacao, feedback.comentario From carro
            LEFT JOIN carro.placa = feedback.id_feedback

        -- 6.1
            SELECT clientes_pf.*, Aluga.placa FROM clientes_pf
            LEFT JOIN Aluga ON clientes_pf.id_cliente_pf = aluga.id_cliente_pf;

        --6.2
            SELECT agencia.num_agencia, count(carro.placa) FROM agencia
            LEFT JOIN carro ON agencia.placa = carro.placa AND carro.disponibilidade = 'Disponível' 
            GROUP BY agencia.num_agencia;

    --7 RIGHT JOIN --As atividades nesta pagina não  fazem sentido, pois se quero exibir TODOS os carros incluindo alguns, ele ainda estara dentro de TODOS 
        --7.1
            SELECT feedback.avaliacao, feedback.comentario from feedback;
        
        --7.2
            SELECT carro.marca, carro.modelo FROM carro;
        
        --7.3
            SELECT manutencao.descricao, manutencao.tipo_manutencao FROM manutencao;

    --8 Subconsultas (Subqueries)
        --8.1
            SELECT aluga.id_cliente_pf, COUNT(*) FROM aluga GROUP BY aluga.id_cliente_pf HAVING count(*)>1; 
        --8.2
            SELECT Carro.modelo,COUNT(*) AS total_alugueis FROM Aluga
            JOIN Feedback ON Aluga.id_locacao = Feedback.id_feedback
            JOIN Carro ON Aluga.placa = Carro.placa
            WHERE Feedback.avaliacao = 'Bom'
            GROUP BY Carro.modelo
            ORDER BY total_alugueis DESC LIMIT 1;
    --9 Agregações
        -- 9.0.1
            SELECT COUNT(pagamento.id_pagamento)  AS vendas_1_mês FROM pagamento WHERE pagamento.data_pagamento BETWEEN '2024-05-01' AND  '2024-05-30';

        --9.0.2
            SELECT AVG(manutencao.data_manutencao) AS media_dias_manutencao FROM aluga
            JOIN carro ON aluga.placa = carro.placa
            JOIN recebe ON carro.placa = recebe.placa
            JOIN manutencao ON recebe.id_manutencao = manutencao.id_manutencao
            WHERE manutencao.status = 'Concluída';

        --9.1.0
            SELECT COUNT(carro.placa) FROM carro;

        --9.1.1
            SELECT SUM(aluga.valor_total) FROM aluga where aluga.data_entrega BETWEEN '2024-01-01' AND '2024-06-30';

        --9.1.2
            SELECT AVG(aluga.valor_total) FROM aluga;

        --9.2.0
            SELECT modelo, COUNT(*) AS total_carros FROM carro
            GROUP BY modelo;

        --9.2.1
            SELECT MONTH(aluga.data_retirada) AS mes, YEAR(data_inicio) AS ano, SUM(valor_total) AS total_alugueis FROM aluga
            GROUP BY mes, ano;

        --9.2.2
            SELECT pagamento.forma_pagamento, SUM(aluga.valor_total) AS total_pagamentos FROM pagamento
            INNER JOIN realiza ON pagamento.id_pagamento = realiza.id_pagamento
            INNER JOIN aluga ON realiza.id_pagamento = aluga.id_locacao
            GROUP BY pagamento.forma_pagamento;

        --9.3.0
            SELECT COUNT(*) AS total_carros_disponiveis FROM carro
            INNER JOIN agencia ON carro.placa = agencia.placa
            WHERE agencia.num_agencia = '1234';

        --9.3.1
            SELECT SUM(valor_total) AS total_arrecadado FROM aluga
            INNER JOIN clientes_pf ON aluga.id_cliente_pf = clientes_pf.id_cliente_pf
            WHERE clientes_pf.cidade_cliente = 'São Paulo';

        --9.3.2
            SELECT AVG(DATEDIFF(aluga.data_retirada, aluga.data_entrega)) AS media_dias_alugados FROM aluga
            INNER JOIN carro ON aluga.placa = carro.placa
            WHERE carro.marca = 'Toyota';

        --9.4.0
            SELECT COUNT(*) AS total_alugueis_excedidos FROM aluga
            WHERE aluga.valor_total > 100.00;
        
        --9.4.1
            SELECT SUM(aluga.valor_total) AS total_pagamentos FROM aluga
            WHERE clientes_pf.id_cliente_pf IN (
                SELECT aluga.id_cliente_pf FROM aluga
                GROUP BY aluga.id_cliente_pf
                HAVING COUNT(*) > 1
            );
        
        --9.4.2
            SELECT AVG(manutencao.data_manutencao) AS media_dias_manutencao FROM manutencao
            WHERE custo > custo_limite;


    -- 10 INDEXAÇÃO
        
        -- Indexar em banco de dados é otimizar a busca de um determinado valor. Basicamente se temos um banco de dados de 20000 linhas e queremos encontrar um valor especifico usamos : SELECT * FROM xxx; Porem esta query demora, então para otimizar esta busca usamos o INDEX para buscar a informaçõa apenas em um determinado intervalo

        --Comparação de desempenho:

        -- Consultas em tabelas indexadas vs. não indexadas: Quando uma consulta é executada em uma tabela indexada, o banco de dados pode usar o índice para localizar rapidamente as linhas relevantes, o que resulta em tempos de resposta mais rápidos para a consulta. Por outro lado, em uma tabela não indexada, o banco de dados pode precisar percorrer todas as linhas da tabela para encontrar os resultados desejados, especialmente em consultas que envolvem filtragem, classificação ou junção de grandes conjuntos de dados. Isso pode levar a tempos de resposta mais longos, especialmente em tabelas com muitas linhas.












