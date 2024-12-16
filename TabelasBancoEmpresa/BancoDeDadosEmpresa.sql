a--um fornecedor pode fornecer diversos produtos

CREATE TABLE IF NOT EXISTS Minhaempresa(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    cnpjEmpresa VARCHAR(14) NOT NULL,
    enderecoCidadeEstado VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS fornecedores(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	nome VARCHAR(60) NOT NULL,
	cnpjFornecedor VARCHAR(14) NOT NULL,
    contrato INT UNSIGNED NOT NULL AUTO_INCREMENT,
    UNIQUE KEY (contrato),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS produtos(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
    categoria ENUM('Eletronico', 'Alimento', 'Roupa', 'Cosmeticos', 'Higiene Pessoal'),
    quantidade INT NOT NULL,
    preco INT UNSIGNED NOT NULL,
    fornecedor_id INT UNSIGNED,
    contratoFornecedor_id INT UNSIGNED,
    PRIMARY KEY (id),
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedores (id),
    FOREIGN KEY (contratoFornecedor_id) REFERENCES fornecedores (contrato)
);

CREATE TABLE IF NOT EXISTS setores(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nomeSetor ENUM ('Limpeza', 'Administrativo', 'Comercial', 'Financeiro', 'RH', 'Operacional') NOT NULL,
    descricao VARCHAR (200) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS colaborador(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nomeUsuario VARCHAR(40) NOT NULL,
    senha VARCHAR(20) NOT NULL,
    papel VARCHAR (50) NOT NULL
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS cliente(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cpf VARCHAR(11),
    cnpjCliente VARCHAR(14),
    UNIQUE KEY (cpf),
    UNIQUE KEY (cnpjCliente),
    PRIMARY KEY (id)
)