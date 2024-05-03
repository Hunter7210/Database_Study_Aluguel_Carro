-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Clientes PJ (
CNPJ VARCHAR(11)  NOT NULL PRIMARY KEY,
Telefone_Empresa VARCHAR(20) NOT NUNLL,
Email_Empresa VARCHAR(255) NOT NULL,
CEP_Empresa VARCHAR(10) NOT NULL,
Nome_Empresa VARCHAR(255) NOT NULL
)

CREATE TABLE Pagamento (
Id_Pagamento INT  NOT NULL PRIMARY KEY,
Forma_Pagamento VARCHAR(255) NOT NULL,
Status_Pagamento VARCHAR(255) NOT NULL,
Data_Pagamento DATE NOT NULL
)

CREATE TABLE Feedback (
Id_Feedback INT NOT NULL PRIMARY KEY,
Avaliacao VARCHAR(5) NOT NULL,
Comentario VARCHAR255NOT NULL,
Data_Feedback DATE NOT NULL
)

CREATE TABLE Realiza (
Comprovante VARCHAR(255),
Id_Comprovante INT NOT NULL,
Id_Cliente_PF VARCHAR(11)  NOT NULL,
CNPJ VARCHAR(11)  NOT NULL,
Id_Pagamento INT  NOT NULL,
PRIMARY KEY(Id_Comprovante,Id_Cliente_PF,CNPJ,Id_Pagamento)
)

CREATE TABLE Clientes PF (
Estado_Cliente VARCHAR(20),
Email_Cliente VARCHAR(100) NOT NULL,
Nome_Cliente VARCHAR(255) NOT NULL,
Id_Cliente_PF VARCHAR(11)  NOT NULL PRIMARY KEY,
Sobrenome_Cliente VARCHAR(255) NOT NULL,
Endereco_Cliente VARCHAR(255) NOT NULL,
Cidade_Cliente VARCHAR(255),
Celular_Cliente VARCHAR(255)
)

CREATE TABLE Aluga (
Data_Entrega DATE NOT NULL,
Data_Retirada DATE NOT NULL,
Id_locacao INT NOT NULL,
Valor_total MONEY NOT NULL,
Id_Cliente_PF VARCHAR(11)  NOT NULL,
Placa VARCHAR(8) NOT NULL,
CNPJ VARCHAR(11)  NOT NULL,
PRIMARY KEY(Id_locacao,Id_Cliente_PF,Placa,CNPJ)
)

CREATE TABLE Recebe (
Placa VARCHAR(8) NOT NULL,
Id_Manutencao INT  NOT NULL
)

CREATE TABLE Carro (
Modelo VARCHAR(100) NOT NULL,
Ano DATE NOT NULL,
Marca VARCHAR(100) NOT NULL,
Placa VARCHAR(8) NOT NULL PRIMARY KEY,
Disponibilidade VARCHAR(255) NOT NULL
)

CREATE TABLE Agência (
Num_Agencia INT NOT NULL PRIMARY KEY,
Contato VARCHAR(100),
Endereco VARCHAR(255) NOT NULL,
Cidade VARCHAR(255) NOT NULL,
Estado(UF) VARCHAR(2) NOT NULL,
Placa VARCHAR(8) NOT NULL,
Id_Funcionario VARCHAR(14),
FOREIGN KEY(Placa) REFERENCES Carro (Placa)
)

CREATE TABLE Funcionarios (
Id_Funcionario VARCHAR(14) PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Salario MONEY,
Sobrenome VARCHAR(255) NOT NULL,
Data_Contratacao DATE NOT NULL
)

CREATE TABLE Cargos (
Cod_Cargo INT NOT NULL PRIMARY KEY,
Salario MONEY,
Nome_cargo VARCHAR(100),
Id_Funcionario VARCHAR(14),
FOREIGN KEY(Id_Funcionario) REFERENCES Funcionarios (Id_Funcionario)
)

CREATE TABLE Envia (
Id_Feedback INT NOT NULL,
Id_Cliente_PF VARCHAR(11)  NOT NULL,
FOREIGN KEY(Id_Feedback) REFERENCES Feedback (Id_Feedback)/*falha: chave estrangeira*/
)

CREATE TABLE Manutencao (
Id_Manutencao INT  NOT NULL PRIMARY KEY,
Tipo_Manutencao VARCHAR(255) NOT NULL,
Descricao VARCHAR(255),
Data_Manutencao DATE NOT NULL,
Custo MONEY NOT NULL,
KM DECIMAL NOT NULL
)

ALTER TABLE Recebe ADD FOREIGN KEY(Placa) REFERENCES Carro (Placa)
ALTER TABLE Recebe ADD FOREIGN KEY(Id_Manutencao) REFERENCES Manutencao (Id_Manutencao)
ALTER TABLE Agência ADD FOREIGN KEY(Id_Funcionario) REFERENCES Funcionarios (Id_Funcionario)
