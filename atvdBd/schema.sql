PRAGMA foreign_keys = ON;

CREATE TABLE Participante ( 
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telefone TEXT
);

CREATE TABLE Evento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    local TEXT NOT NULL,
    data TEXT NOT NULL
);

CREATE TABLE Pagamento (
    id INTEGER PRIMARY KEY,
    id_incricao INTEGER NOT NULL,
    valor REAL NOT NULL CHECK (valor >= 0),
    data_pagamento TEXT,
    status TEXT,
    FOREIGN KEY(id_incricao) REFERENCES Inscricao(id)
);

CREATE TABLE Inscricao(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_evento  INTEGER NOT NULL ,
    id_participante  INTEGER NOT NULL ,
    data_inscricao TEXT,
    status TEXT,
    FOREIGN KEY(id_evento) REFERENCES Evento(id),
    FOREIGN KEY(id_participante) REFERENCES Participante(id)
);

INSERT INTO Participante (nome, email, telefone) VALUES
('Herick','herick@gmail','34997942783'),
('Yasmin','yasgatinha@hotmail','3409897965'),
('Gedeon','Gegedelas@yahoo','3495949392');

INSERT INTO Evento (nome, descricao, local, data) VALUES
('Corrida do Sando', 'Corridinha', 'Lagoa Formosa', '10/09/2025'),
('Camp LOL', 'Campeonato de lol', 'Patos de Minas', '20/09/2025');


INSERT INTO Inscricao (id_evento, id_participante, data_inscricao, status) VALUES
(2,1,'04/09/2025','Confirmada'),
(2,2,'19/09/2025','Confirmada'),
(1,3,'02/09/2025','Cancelada'),
(1,1,'01/09/2025','Confirmada');

INSERT INTO Pagamento (id_incricao, valor, data_pagamento, status) VALUES
(1,'100','04/09/2025','Pago'),
(2,'100','20/09/2025','Pago'),
(3,'110','02/09/2025','Pendente'),
(4,'110','02/09/2025','Pago');




