-- Lista DB


--Ativ 1
    -- Tabela Funcionarios ja existe
        SELECT * FROM  funcionarios;

--Ativ 2
    -- Tabela Reservas é a tabela aluga no meu banco de dados
        SELECT * FROM  aluga;
-- Ativ 3
    CREATE TABLE devolucoes (
        pk_id_devolucoes SERIAL PRIMARY KEY,
        data_devolucoes DATE NOT NULL,
        condicao_veiculo_devolucoes VARCHAR(255),
        custos_adicionais_devolucoes money,
        
        -- FOREIGN KEY
        fk_placa_carros VARCHAR(8) NOT NULL, --Para saber qual carro que esta devolvendo
        fk_id_clientes_pf SERIAL NOT NULL, --Para saber qual cliente que esta devolvendo

        FOREIGN KEY(fk_placa_carros) REFERENCES carros (pk_placa_carros),
        FOREIGN KEY(fk_id_clientes_pf) REFERENCES clientes_pf (pk_id_clientes_pf)
    );
--Ativ 4
    -- Tabela manutencoes ja existe
        SELECT * FROM  manutencoes;

--Ativ 5
    CREATE TABLE seguros (
        pk_id_seguros SERIAL PRIMARY KEY,
        tipo_seguros VARCHAR(25) NOT NULL,
        cobertura_seguros VARCHAR(50) NOT NULL,
        seguradora_seguros VARCHAR(70) NOT NULL,
        valor_franquia_seguros MONEY, --Nem todo seguro tem franquia  

        -- FOREIGN KEY
        fk_placa_carros VARCHAR(8) NOT NULL, --Para saber qual carro que esta devolvendo

        FOREIGN KEY (fk_placa_carros) REFERENCES carros (pk_placa_carros)
    );      


-- ### Seleções Simples (SELECT sem condição):
    -- 1.
        SELECT * FROM clientes_pf;  
    -- 4.
        SELECT * FROM funcionarios;  


-- ### Seleções com Condições (SELECT com condições):
    --5
        SELECT * FROM aluga WHERE aluga.fk_placa_carros = 'DEF5678'; --Mostra o id do cliente que alugou o carro com a devida placa
            --Com isso consigo mostrar as informações dos meu clientes e dos meus carros     
    --6
        SELECT * FROM aluga WHERE aluga.fk_id_clientes_pf = 1;

-- ### Junções com LEFT JOIN e RIGHT JOIN:
    --12
        SELECT cpf.pk_id_clientes_pf, cpf.nome_clientes_pf, cpf.sobrenome_clientes_pf, aluga.pk_id_locacao_aluga, aluga.fk_placa_carros
        FROM clientes_pf cpf
        LEFT JOIN aluga ON cpf.pk_id_clientes_pf = aluga.fk_id_clientes_pf;
    --14
        SELECT aluga.pk_id_locacao_aluga, aluga.data_entrega_aluga, aluga.data_retirada_aluga, aluga.fk_id_clientes_pf, aluga.fk_placa_carros, carros.modelo_carros, carros.marca_carros
        FROM aluga
        LEFT JOIN carros ON aluga.fk_placa_carros = carros.pk_placa_carros;
