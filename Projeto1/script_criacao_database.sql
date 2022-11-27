/* Modelo_logicol: */

CREATE DATABASE empresa_seguros;

USE empresa_seguros;

CREATE TABLE clientes (
    CPF VARCHAR(45) NOT NULL UNIQUE,
    nome VARCHAR(45) NOT NULL,
    sexo VARCHAR(45) NOT NULL,
    id_cliente INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    estado VARCHAR(45) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    rua VARCHAR(45) NOT NULL,
    numero VARCHAR(45) NOT NULL
);

CREATE TABLE telefones (
    tipo VARCHAR(45) NOT NULL,
    numero VARCHAR(45) NOT NULL,
    id_cliente INTEGER NOT NULL,
    id_telefone INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT
);

CREATE TABLE carros (
    id_carro INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    placa VARCHAR(45) NOT NULL UNIQUE,
    marca VARCHAR(45),
    modelo VARCHAR(45),
    ano INTEGER,
    chassi VARCHAR(45) NOT NULL UNIQUE,
    cor VARCHAR(45)
);

CREATE TABLE sinistros (
    id_sinistro INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    data DATE NOT NULL,
    hora INTEGER NOT NULL,
    local VARCHAR(45) NOT NULL,
    condutor VARCHAR(45) NOT NULL,
    id_carro INTEGER NOT NULL,
    tipo_ocorrencia VARCHAR(45) NOT NULL
);

CREATE TABLE apolices (
    id_apolice INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_cliente INTEGER NOT NULL,
    id_carro INTEGER NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    valor_assegurado FLOAT NOT NULL,
    valor_franquia FLOAT NOT NULL
);
 
ALTER TABLE telefones ADD CONSTRAINT fk_clientes_telefones
    FOREIGN KEY (id_cliente)
    REFERENCES clientes (id_cliente);
 
ALTER TABLE sinistros ADD CONSTRAINT fk_carros_sinistros
    FOREIGN KEY (id_carro)
    REFERENCES carros (id_carro);
 
ALTER TABLE apolices ADD CONSTRAINT fk_clientes_apolices
    FOREIGN KEY (id_cliente)
    REFERENCES clientes (id_cliente);
 
ALTER TABLE apolices ADD CONSTRAINT fk_carros_apolices
    FOREIGN KEY (id_carro)
    REFERENCES carros (id_carro);