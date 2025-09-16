-- limpar caso existam (útil durante desenvolvimento)
DROP TABLE IF EXISTS pagamento;
DROP TABLE IF EXISTS inscricao;
DROP TABLE IF EXISTS evento;
DROP TABLE IF EXISTS participante;

-- Tabela participante
CREATE TABLE participante (
id SERIAL PRIMARY KEY,
nome TEXT NOT NULL,
email TEXT NOT NULL UNIQUE,
telefone TEXT
);

-- Tabela evento
CREATE TABLE evento (
id SERIAL PRIMARY KEY,
nome TEXT NOT NULL,
descricao TEXT,
local TEXT NOT NULL,
data DATE NOT NULL
);

-- Tabela inscricao (associa Evento <-> Participante) - resolve N:M
CREATE TABLE inscricao (
id SERIAL PRIMARY KEY,
id_evento INTEGER NOT NULL REFERENCES evento(id) ON DELETE CASCADE,
id_participante INTEGER NOT NULL REFERENCES participante(id) ON DELETE CASCADE,
data_inscricao DATE,
status TEXT -- ex.: 'confirmada', 'cancelada'
);

-- Tabela pagamento (1:1 com inscricao)
CREATE TABLE pagamento (
id SERIAL PRIMARY KEY,
id_inscricao INTEGER UNIQUE REFERENCES inscricao(id) ON DELETE CASCADE,
valor NUMERIC(10,2),
data_pagamento DATE,
status TEXT -- ex.: 'pago', 'pendente'
);

--Tipos de Dados
--INTEGER, INT
--SMALLINT, BIGINT
--DECIMAL(p,p)/NUMERIC(p,s)
--REAL, FLOAT, DOUBLE PRECISION

CREATE TABLE autor(
    autor_id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    bio TEXT,
    email VARCHAR(255) UNIQUE
);

CREATE TABLE livro(
    livro_id SERIAL PRIMARY KEY,
    titulo VARCHAR(250) NOT NULL,
    CONSTRAINT fk_livro_autor FOREIGN KEY (autor_id) REFERENCES autor(autor_id) ON DELETE CASCADE
);


--SELECT -- LISTA DE COLUNA
--FROM -- TABELA
--WHERE -- CONDIÇÃO
---GROUP BY -- COLUNAS
--HAVING -- CONDIÇÕES DE GRUPO public
--ORDER BY <COLUNAS> [ASC|DESC]
--LIMIT <N>

SELECT * FROM participante;

SELECT * FROM pagamento;

SELECT id_inscricao, valor, data_pagamento 
FROM pagamento
WHERE status = 'pago'
ORDER BY valor ASC;
