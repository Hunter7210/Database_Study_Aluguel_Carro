-- CREATE DATABASE db_locadora_carros;


CREATE TABLE Cliente_PJ (
CNPJ VARCHAR(11)  NOT NULL PRIMARY KEY,
Telefone_Empresa VARCHAR(20) NOT NULL,
Email_Empresa VARCHAR(255) NOT NULL,
CEP_Empresa VARCHAR(10) NOT NULL,
Nome_Empresa VARCHAR(255) NOT NULL
);

CREATE TABLE Pagamento (
Id_Pagamento INT  NOT NULL PRIMARY KEY,
Forma_Pagamento VARCHAR(255) NOT NULL,
Status_Pagamento VARCHAR(255) NOT NULL,
Data_Pagamento DATE NOT NULL
);

CREATE TABLE Feedback (
Id_Feedback INT NOT NULL PRIMARY KEY,
Avaliacao VARCHAR(5) NOT NULL,
Comentario VARCHAR(255) NOT NULL,
Data_Feedback DATE NOT NULL
);

CREATE TABLE Realiza (
Comprovante VARCHAR(255),
Id_Comprovante INT NOT NULL,
Id_Cliente_PF VARCHAR(11)  NOT NULL,
CNPJ VARCHAR(11)  NOT NULL,
Id_Pagamento INT  NOT NULL,
PRIMARY KEY(Id_Comprovante,Id_Cliente_PF,CNPJ,Id_Pagamento)
);

CREATE TABLE Clientes_PF (
Estado_Cliente VARCHAR(20),
Email_Cliente VARCHAR(100) NOT NULL,
Nome_Cliente VARCHAR(255) NOT NULL,
Id_Cliente_PF VARCHAR(11)  NOT NULL PRIMARY KEY,
Sobrenome_Cliente VARCHAR(255) NOT NULL,
Endereco_Cliente VARCHAR(255) NOT NULL,
Cidade_Cliente VARCHAR(255),
Celular_Cliente VARCHAR(255)
);

CREATE TABLE Aluga (
Data_Entrega DATE NOT NULL,
Data_Retirada DATE NOT NULL,
Id_locacao INT NOT NULL,
Valor_total MONEY NOT NULL,
Id_Cliente_PF VARCHAR(11)  NOT NULL,
Placa VARCHAR(8) NOT NULL,
CNPJ VARCHAR(11)  NOT NULL,
PRIMARY KEY(Id_locacao,Id_Cliente_PF,Placa,CNPJ)
);

CREATE TABLE Recebe (
Placa VARCHAR(8) NOT NULL,
Id_Manutencao INT  NOT NULL
);

CREATE TABLE Carro (
Modelo VARCHAR(100) NOT NULL,
Ano DATE NOT NULL,
Marca VARCHAR(100) NOT NULL,
Placa VARCHAR(8) NOT NULL PRIMARY KEY,
Disponibilidade VARCHAR(255) NOT NULL
);

CREATE TABLE Agencia (
Num_Agencia INT NOT NULL PRIMARY KEY,
Contato VARCHAR(100),
Endereco VARCHAR(255) NOT NULL,
Cidade VARCHAR(255) NOT NULL,
Estado_UF VARCHAR(2) NOT NULL,
Placa VARCHAR(8) NOT NULL,
Id_Funcionario VARCHAR(14),
FOREIGN KEY(Placa) REFERENCES Carro (Placa)
);

CREATE TABLE Funcionarios (
Id_Funcionario VARCHAR(14) PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Salario MONEY,
Sobrenome VARCHAR(255) NOT NULL,
Data_Contratacao DATE NOT NULL
);

CREATE TABLE Cargos (
Cod_Cargo INT NOT NULL PRIMARY KEY,
Salario MONEY,
Nome_cargo VARCHAR(100),
Id_Funcionario VARCHAR(14),
FOREIGN KEY(Id_Funcionario) REFERENCES Funcionarios (Id_Funcionario)
);

CREATE TABLE Envia (
Id_Feedback INT NOT NULL,
Id_Cliente_PF VARCHAR(11)  NOT NULL,
FOREIGN KEY(Id_Feedback) REFERENCES Feedback (Id_Feedback)/*falha: chave estrangeira*/
);

CREATE TABLE Manutencao (
Id_Manutencao INT  NOT NULL PRIMARY KEY,
Tipo_Manutencao VARCHAR(255) NOT NULL,
Descricao VARCHAR(255),
Data_Manutencao DATE NOT NULL,
Custo MONEY NOT NULL,
KM DECIMAL NOT NULL
);

ALTER TABLE Recebe ADD FOREIGN KEY(Placa) REFERENCES Carro (Placa);
ALTER TABLE Recebe ADD FOREIGN KEY(Id_Manutencao) REFERENCES Manutencao (Id_Manutencao);
ALTER TABLE Agencia ADD FOREIGN KEY(Id_Funcionario) REFERENCES Funcionarios (Id_Funcionario);


-- CREATE DATABASE db_locadora_carros;


CREATE TABLE Cliente_PJ (
CNPJ VARCHAR(11)  NOT NULL PRIMARY KEY,
Telefone_Empresa VARCHAR(20) NOT NULL,
Email_Empresa VARCHAR(255) NOT NULL,
CEP_Empresa VARCHAR(10) NOT NULL,
Nome_Empresa VARCHAR(255) NOT NULL
);

CREATE TABLE Pagamento (
Id_Pagamento INT  NOT NULL PRIMARY KEY,
Forma_Pagamento VARCHAR(255) NOT NULL,
Status_Pagamento VARCHAR(255) NOT NULL,
Data_Pagamento DATE NOT NULL
);

CREATE TABLE Feedback (
Id_Feedback INT NOT NULL PRIMARY KEY,
Avaliacao VARCHAR(5) NOT NULL,
Comentario VARCHAR(255) NOT NULL,
Data_Feedback DATE NOT NULL
);

CREATE TABLE Realiza (
Comprovante VARCHAR(255),
Id_Comprovante INT NOT NULL,
Id_Cliente_PF VARCHAR(11)  NOT NULL,
CNPJ VARCHAR(11)  NOT NULL,
Id_Pagamento INT  NOT NULL,
PRIMARY KEY(Id_Comprovante,Id_Cliente_PF,CNPJ,Id_Pagamento)
);

CREATE TABLE Clientes_PF (
Estado_Cliente VARCHAR(20),
Email_Cliente VARCHAR(100) NOT NULL,
Nome_Cliente VARCHAR(255) NOT NULL,
Id_Cliente_PF VARCHAR(11)  NOT NULL PRIMARY KEY,
Sobrenome_Cliente VARCHAR(255) NOT NULL,
Endereco_Cliente VARCHAR(255) NOT NULL,
Cidade_Cliente VARCHAR(255),
Celular_Cliente VARCHAR(255)
);

CREATE TABLE Aluga (
Data_Entrega DATE NOT NULL,
Data_Retirada DATE NOT NULL,
Id_locacao INT NOT NULL,
Valor_total MONEY NOT NULL,
Id_Cliente_PF VARCHAR(11)  NOT NULL,
Placa VARCHAR(8) NOT NULL,
CNPJ VARCHAR(11)  NOT NULL,
PRIMARY KEY(Id_locacao,Id_Cliente_PF,Placa,CNPJ)
);

CREATE TABLE Recebe (
Placa VARCHAR(8) NOT NULL,
Id_Manutencao INT  NOT NULL
);

CREATE TABLE Carro (
Modelo VARCHAR(100) NOT NULL,
Ano DATE NOT NULL,
Marca VARCHAR(100) NOT NULL,
Placa VARCHAR(8) NOT NULL PRIMARY KEY,
Disponibilidade VARCHAR(255) NOT NULL
);

CREATE TABLE Agencia (
Num_Agencia INT NOT NULL PRIMARY KEY,
Contato VARCHAR(100),
Endereco VARCHAR(255) NOT NULL,
Cidade VARCHAR(255) NOT NULL,
Estado_UF VARCHAR(2) NOT NULL,
Placa VARCHAR(8) NOT NULL,
Id_Funcionario VARCHAR(14),
FOREIGN KEY(Placa) REFERENCES Carro (Placa)
);

CREATE TABLE Funcionarios (
Id_Funcionario VARCHAR(14) PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Salario MONEY,
Sobrenome VARCHAR(255) NOT NULL,
Data_Contratacao DATE NOT NULL
);

CREATE TABLE Cargos (
Cod_Cargo INT NOT NULL PRIMARY KEY,
Salario MONEY,
Nome_cargo VARCHAR(100),
Id_Funcionario VARCHAR(14),
FOREIGN KEY(Id_Funcionario) REFERENCES Funcionarios (Id_Funcionario)
);

CREATE TABLE Envia (
Id_Feedback INT NOT NULL,
Id_Cliente_PF VARCHAR(11)  NOT NULL,
FOREIGN KEY(Id_Feedback) REFERENCES Feedback (Id_Feedback)/*falha: chave estrangeira*/
);

CREATE TABLE Manutencao (
Id_Manutencao INT  NOT NULL PRIMARY KEY,
Tipo_Manutencao VARCHAR(255) NOT NULL,
Descricao VARCHAR(255),
Data_Manutencao DATE NOT NULL,
Custo MONEY NOT NULL,
KM DECIMAL NOT NULL
);

ALTER TABLE Recebe ADD FOREIGN KEY(Placa) REFERENCES Carro (Placa);
ALTER TABLE Recebe ADD FOREIGN KEY(Id_Manutencao) REFERENCES Manutencao (Id_Manutencao);
ALTER TABLE Agencia ADD FOREIGN KEY(Id_Funcionario) REFERENCES Funcionarios (Id_Funcionario);

--INSERINDO OS DADOS FICTICIOS NAS TABELAS -- PARA TESTE --

-- Inserindo dados na tabela Cliente_PJ
INSERT INTO Cliente_PJ (CNPJ, Telefone_Empresa, Email_Empresa, CEP_Empresa, Nome_Empresa)
VALUES
('12345678901', '1122334455', 'empresa1@email.com', '12345-678', 'Empresa A'),
('23456789012', '2233445566', 'empresa2@email.com', '23456-789', 'Empresa B'),
('34567890123', '3344556677', 'empresa3@email.com', '34567-890', 'Empresa C'),
('45678901234', '4455667788', 'empresa4@email.com', '45678-901', 'Empresa D'),
('56789012345', '5566778899', 'empresa5@email.com', '56789-012', 'Empresa E'),
('67890123456', '6677889900', 'empresa6@email.com', '67890-123', 'Empresa F'),
('78901234567', '7788990011', 'empresa7@email.com', '78901-234', 'Empresa G'),
('89012345678', '8899001122', 'empresa8@email.com', '89012-345', 'Empresa H'),
('90123456789', '9900112233', 'empresa9@email.com', '90123-456', 'Empresa I'),
('01234567890', '0011223344', 'empresa10@email.com', '01234-567', 'Empresa J');

-- Inserindo dados na tabela Pagamento
INSERT INTO Pagamento (Id_Pagamento, Forma_Pagamento, Status_Pagamento, Data_Pagamento)
VALUES
(1, 'Cartão de Crédito', 'Concluído', '2024-04-01'),
(2, 'Boleto Bancário', 'Pendente', '2024-04-02'),
(3, 'Transferência Bancária', 'Concluído', '2024-04-03'),
(4, 'Pix', 'Concluído', '2024-04-04'),
(5, 'Dinheiro', 'Pendente', '2024-04-05'),
(6, 'Cartão de Débito', 'Concluído', '2024-04-06'),
(7, 'Boleto Bancário', 'Pendente', '2024-04-07'),
(8, 'Transferência Bancária', 'Concluído', '2024-04-08'),
(9, 'Pix', 'Concluído', '2024-04-09'),
(10, 'Dinheiro', 'Pendente', '2024-04-10');

-- Inserindo dados na tabela Feedback
INSERT INTO Feedback (Id_Feedback, Avaliacao, Comentario, Data_Feedback)
VALUES
(1, '5/5', 'Excelente serviço!', '2024-04-01'),
(2, '4/5', 'Gostei, mas poderia melhorar.', '2024-04-02'),
(3, '3/5', 'Mediano.', '2024-04-03'),
(4, '5/5', 'Recomendo!', '2024-04-04'),
(5, '2/5', 'Não gostei.', '2024-04-05'),
(6, '4/5', 'Atendimento rápido.', '2024-04-06'),
(7, '5/5', 'Muito bom!', '2024-04-07'),
(8, '3/5', 'Poderia ser melhor.', '2024-04-08'),
(9, '4/5', 'Voltarei a usar.', '2024-04-09'),
(10, '5/5', 'Satisfeito.', '2024-04-10');

-- Inserindo dados na tabela Clientes_PF
INSERT INTO Clientes_PF (Estado_Cliente, Email_Cliente, Nome_Cliente, Id_Cliente_PF, Sobrenome_Cliente, Endereco_Cliente, Cidade_Cliente, Celular_Cliente)
VALUES
('SP', 'cliente1@email.com', 'Cliente', '12345678901', 'Um', 'Rua Um, 123', 'São Paulo', '1122334455'),
('RJ', 'cliente2@email.com', 'Cliente', '23456789012', 'Dois', 'Rua Dois, 456', 'Rio de Janeiro', '2233445566'),
('MG', 'cliente3@email.com', 'Cliente', '34567890123', 'Três', 'Rua Três, 789', 'Belo Horizonte', '3344556677'),
('RS', 'cliente4@email.com', 'Cliente', '45678901234', 'Quatro', 'Rua Quatro, 1011', 'Porto Alegre', '4455667788'),
('SC', 'cliente5@email.com', 'Cliente', '56789012345', 'Cinco', 'Rua Cinco, 1213', 'Florianópolis', '5566778899'),
('BA', 'cliente6@email.com', 'Cliente', '67890123456', 'Seis', 'Rua Seis, 1415', 'Salvador', '6677889900'),
('PE', 'cliente7@email.com', 'Cliente', '78901234567', 'Sete', 'Rua Sete, 1617', 'Recife', '7788990011'),
('CE', 'cliente8@email.com', 'Cliente', '89012345678', 'Oito', 'Rua Oito, 1819', 'Fortaleza', '8899001122'),
('PA', 'cliente9@email.com', 'Cliente', '90123456789', 'Nove', 'Rua Nove, 2021', 'Belém', '9900112233'),
('PR', 'cliente10@email.com', 'Cliente', '01234567890', 'Dez', 'Rua Dez, 2223', 'Curitiba', '0011223344');

-- Inserindo dados na tabela Aluga
INSERT INTO Aluga (Data_Entrega, Data_Retirada, Id_locacao, Valor_total, Id_Cliente_PF, Placa, CNPJ)
VALUES
('2024-04-01', '2024-04-05', 1, 500.00, '12345678901', 'ABC1234', '12345678901'),
('2024-04-02', '2024-04-06', 2, 600.00, '23456789012', 'DEF5678', '23456789012'),
('2024-04-03', '2024-04-07', 3, 700.00, '34567890123', 'GHI9101', '34567890123'),
('2024-04-04', '2024-04-08', 4, 800.00, '45678901234', 'JKL2345', '45678901234'),
('2024-04-05', '2024-04-09', 5, 900.00, '56789012345', 'MNO3456', '56789012345'),
('2024-04-06', '2024-04-10', 6, 1000.00, '67890123456', 'PQR4567', '67890123456'),
('2024-04-07', '2024-04-11', 7, 1100.00, '78901234567', 'STU5678', '78901234567'),
('2024-04-08', '2024-04-12', 8, 1200.00, '89012345678', 'VWX6789', '89012345678'),
('2024-04-09', '2024-04-13', 9, 1300.00, '90123456789', 'YZA7890', '90123456789'),
('2024-04-10', '2024-04-14', 10, 1400.00, '01234567890', 'BCD8901', '01234567890');

-- Inserindo dados na tabela Carro
INSERT INTO Carro (Modelo, Ano, Marca, Placa, Disponibilidade)
VALUES
('Modelo A', '2020-01-01', 'Marca X', 'ABC1234', 'Disponível'),
('Modelo B', '2020-01-02', 'Marca Y', 'DEF5678', 'Disponível'),
('Modelo C', '2020-01-03', 'Marca Z', 'GHI9101', 'Disponível'),
('Modelo D', '2020-01-04', 'Marca X', 'JKL2345', 'Disponível'),
('Modelo E', '2020-01-05', 'Marca Y', 'MNO3456', 'Disponível'),
('Modelo F', '2020-01-06', 'Marca Z', 'PQR4567', 'Disponível'),
('Modelo G', '2020-01-07', 'Marca X', 'STU5678', 'Disponível'),
('Modelo H', '2020-01-08', 'Marca Y', 'VWX6789', 'Disponível'),
('Modelo I', '2020-01-09', 'Marca Z', 'YZA7890', 'Disponível'),
('Modelo J', '2020-01-10', 'Marca X', 'BCD8901', 'Disponível');

-- Inserindo dados na tabela Agencia
-- Inserindo dados na tabela Agencia
INSERT INTO Agencia (Num_Agencia, Contato, Endereco, Cidade, Estado_UF, Placa, Id_Funcionario)
VALUES
(1, 'Gerente A', 'Rua Um, 123', 'São Paulo', 'SP', 'ABC1234', '01234567890123'),
(2, 'Gerente B', 'Rua Dois, 456', 'Rio de Janeiro', 'RJ', 'DEF5678', '12345678901234'),
(3, 'Gerente C', 'Rua Três, 789', 'Belo Horizonte', 'MG', 'GHI9101', '23456789012345'),
(4, 'Gerente D', 'Rua Quatro, 1011', 'Porto Alegre', 'RS', 'JKL2345', '34567890123456'),
(5, 'Gerente E', 'Rua Cinco, 1213', 'Florianópolis', 'SC', 'MNO3456', '45678901234567'),
(6, 'Gerente F', 'Rua Seis, 1415', 'Salvador', 'BA', 'PQR4567', '56789012345678'),
(7, 'Gerente G', 'Rua Sete, 1617', 'Recife', 'PE', 'STU5678', '67890123456789'),
(8, 'Gerente H', 'Rua Oito, 1819', 'Fortaleza', 'CE', 'VWX6789', '78901234567890'),
(9, 'Gerente I', 'Rua Nove, 2021', 'Belém', 'PA', 'YZA7890', '89012345678901'),
(10, 'Gerente J', 'Rua Dez, 2223', 'Curitiba', 'PR', 'BCD8901', '90123456789012');

-- Inserindo dados na tabela Funcionarios
INSERT INTO Funcionarios (Id_Funcionario, Nome, Salario, Sobrenome, Data_Contratacao)
VALUES
('01234567890123', 'Funcionário', 3000.00, 'Um', '2020-01-01'),
('12345678901234', 'Funcionário', 3200.00, 'Dois', '2020-01-02'),
('23456789012345', 'Funcionário', 3400.00, 'Três', '2020-01-03'),
('34567890123456', 'Funcionário', 3600.00, 'Quatro', '2020-01-04'),
('45678901234567', 'Funcionário', 3800.00, 'Cinco', '2020-01-05'),
('56789012345678', 'Funcionário', 4000.00, 'Seis', '2020-01-06'),
('67890123456789', 'Funcionário', 4200.00, 'Sete', '2020-01-07'),
('78901234567890', 'Funcionário', 4400.00, 'Oito', '2020-01-08'),
('89012345678901', 'Funcionário', 4600.00, 'Nove', '2020-01-09'),
('90123456789012', 'Funcionário', 4800.00, 'Dez', '2020-01-10');

-- Inserindo dados na tabela Cargos
INSERT INTO Cargos (Cod_Cargo, Salario, Nome_cargo, Id_Funcionario)
VALUES
(1, 3000.00, 'Cargo A', '01234567890123'),
(2, 3200.00, 'Cargo B', '12345678901234'),
(3, 3400.00, 'Cargo C', '23456789012345'),
(4, 3600.00, 'Cargo D', '34567890123456'),
(5, 3800.00, 'Cargo E', '45678901234567'),
(6, 4000.00, 'Cargo F', '56789012345678'),
(7, 4200.00, 'Cargo G', '67890123456789'),
(8, 4400.00, 'Cargo H', '78901234567890'),
(9, 4600.00, 'Cargo I', '89012345678901'),
(10, 4800.00, 'Cargo J', '90123456789012');

-- Inserindo dados na tabela Manutencao
INSERT INTO Manutencao (Id_Manutencao, Tipo_Manutencao, Descricao, Data_Manutencao, Custo, KM)
VALUES
(1, 'Preventiva', 'Troca de óleo e filtro', '2024-04-01', 100.00, 10000),
(2, 'Corretiva', 'Troca de pneu furado', '2024-04-02', 150.00, 15000),
(3, 'Preventiva', 'Verificação geral', '2024-04-03', 120.00, 12000),
(4, 'Corretiva', 'Reparo do sistema elétrico', '2024-04-04', 200.00, 20000),
(5, 'Preventiva', 'Troca de filtro de ar', '2024-04-05', 80.00, 8000),
(6, 'Corretiva', 'Substituição da bateria', '2024-04-06', 180.00, 18000),
(7, 'Preventiva', 'Revisão completa', '2024-04-07', 250.00, 25000),
(8, 'Corretiva', 'Reparo do sistema de freios', '2024-04-08', 220.00, 22000),
(9, 'Preventiva', 'Alinhamento e balanceamento', '2024-04-09', 90.00, 9000),
(10, 'Corretiva', 'Substituição do radiador', '2024-04-10', 300.00, 30000);