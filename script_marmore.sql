CREATE database loja;
use loja;
-- Tabela de funcionários (para login no sistema)
CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,  
    nome VARCHAR(100) NOT NULL, 
    cpf varchar (20) unique not null,
    senha VARCHAR(255) NOT NULL,        
    cargo VARCHAR(50),                  
    data_contratacao DATE,              
    ativo BOOLEAN DEFAULT TRUE        -- Se o funcionário está ativo no sistema
);

-- Tabela de clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(9) NOT NULL,
    email VARCHAR(100),
    endereco VARCHAR(200) NOT NULL,
    cidade VARCHAR(50) NOT NULL,        
    estado VARCHAR(2),
    cep VARCHAR(10),                    
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de pedidos
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    descricao TEXT,
    tipo_marmore VARCHAR(100),
    metragem DECIMAL(10,2),
    preco_total DECIMAL(10,2),
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

-- Tabela de pagamentos
CREATE TABLE pagamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    forma_pagamento VARCHAR(50),
    valor_pago DECIMAL(10,2),
    data_pagamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status_pagamento ENUM('Pendente', 'Pago', 'Parcial') DEFAULT 'Pendente',
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE
);

-- Tabela de entregas
CREATE TABLE entregas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    data_prevista DATE,
    data_entrega DATE,
    status_entrega ENUM('Pendente', 'Entregue', 'Atrasado') DEFAULT 'Pendente',
    observacoes TEXT,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE
);

-- Tabela de estoque
CREATE TABLE estoque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_item VARCHAR(100) NOT NULL,    -- Nome do material
    tipo VARCHAR(50),                   -- Tipo (ex: mármore, ferramenta, etc.)
    quantidade DECIMAL(10,2) NOT NULL,  -- Quantidade atual
    unidade_medida VARCHAR(10),         -- Ex: m², kg, un
    preco_unitario DECIMAL(10,2),       -- Preço por unidade
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabela de movimentações de estoque
CREATE TABLE movimentacoes_estoque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estoque_id INT NOT NULL,
    tipo_movimentacao ENUM('Entrada', 'Saída') NOT NULL,
    quantidade DECIMAL(10,2) NOT NULL,
    data_movimentacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    funcionario_id INT,
    observacao TEXT,
    FOREIGN KEY (estoque_id) REFERENCES estoque(id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id)
);
-- Tabela de mármores
CREATE TABLE marmores (
    id INT AUTO_INCREMENT PRIMARY KEY,      
    nome VARCHAR(100) NOT NULL,             
    preco_m2 DECIMAL(10,2) NOT NULL         
);

INSERT INTO marmores (nome, preco_m2) VALUES
('Verde Ubatuba', 400.00),       
('Preto Sao Gabriel', 600.00),         
('Branco Prime', 1200.00),  
('Amarelo Icarai', 550.00),    
('Cinza Corumbar', 380.00),
('Cinza Ocre', 400.00),  
('Preto Via Lactea',770.00),
('Branco Itaunas', 900.00), 
('Ornamental', 680.00), 
('Bege Bahia', 700.00);