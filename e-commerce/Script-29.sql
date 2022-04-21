CREATE TABLE "funcionario" (
  "codigo_func" serial Not Null,
  "nome_func" varchar(50) Not Null ,
  "cpf_func" char(11) Not Null,
  "salario" decimal,
  PRIMARY KEY ("codigo_func")
);

CREATE TABLE "cliente" (
  "codigo_cliente" serial Not Null,
  "cpf_cliente" char(11) Unique,
  "nomecompleto_cliente" varchar(50) Not Null,
  "login_cliente" varchar(10) Not Null,
  "senha_cliente" varchar(10) Not Null,
  "codigo_contato" integer,
  "data_nasc_cliente" date ,
  "codigo_endereco" integer,
  "data_de_cadastro" timestamp Not Null,
  PRIMARY KEY ("codigo_cliente")
);

CREATE TABLE "categoria" (
  "codigo_categoria" serial Not null,
  "nome_categoria" varchar(20),
  PRIMARY KEY ("codigo_categoria")
);

CREATE TABLE "endereco" (
  "codigo_endereco" serial Not Null,
  "logradouro" varchar(50),
  "complemento" varchar(20),
  "bairro" varchar(20),
  "cidade" varchar(20),
  "UF" varchar(2),
  "cep" integer,
  PRIMARY KEY ("codigo_endereco")

);

CREATE TABLE "contato"(
  "codigo_contato" serial Not Null,
  "telefone_fixo" char(10),
  "telefone_celular"char(11),
  "email"varchar(30),
  PRIMARY KEY ("codigo_contato")
);

CREATE TABLE "pedido" (
  "codigo_compra" serial Not Null,
  "data_compra" timestamp,
  "quantidade_comprada" integer Not Null,
  "codigo_produto" integer Not Null,
  "codigo_cliente" integer Not Null,
  PRIMARY KEY ("codigo_compra"),
  CONSTRAINT "FK_pedido.codigo_cliente"
    FOREIGN KEY ("codigo_cliente")
      REFERENCES "cliente"("codigo_cliente")
);


CREATE TABLE "produto" (
  "codigo_produto" serial Not Null,
  "nome_produto" varchar(50) Not Null,
  "qtd_estoque" integer Not Null,
  "data_fabricacao" date,
  "vl_unitario" decimal Not Null,
  "data_cadastro" timestamp,
  "codigo_func" integer ,
  "codigo_categoria" integer,
  PRIMARY KEY ("codigo_produto"),
  CONSTRAINT "FK_produto.codigo_categoria"
    FOREIGN KEY ("codigo_categoria")
      REFERENCES "categoria"("codigo_categoria"),
  CONSTRAINT "FK_produto.codigo_func"
    FOREIGN KEY ("codigo_func")
      REFERENCES "funcionario"("codigo_func")
);

--------------------------------------------------------------------------------------------

alter table cliente add CONSTRAINT "FK_cliente.codigo_endereco" FOREIGN KEY ("codigo_endereco")
 REFERENCES "endereco"("codigo_endereco"); 

alter table cliente add CONSTRAINT "FK_cliente.codigo_contato" FOREIGN KEY ("codigo_contato")
 REFERENCES "contato"("codigo_contato");

alter table pedido add CONSTRAINT "FK_pedido.codigo_produto" FOREIGN KEY ("codigo_produto")
 REFERENCES "produto"("codigo_produto");

--------------------------------------------------------------------------------------------

INSERT INTO funcionario(nome_func, cpf_func, salario) VALUES 
('Joãoo Gomes', '14432253045', 2500),
('Larissa Manoela', '17591845004', 2500);

INSERT INTO funcionario(nome_func, cpf_func, salario) VALUES 
('Frederico Silva', '14982253333', 2100);

INSERT INTO funcionario(nome_func, cpf_func, salario) VALUES 
('Neymar Junior', '85732551379', 2200);

INSERT INTO funcionario(nome_func, cpf_func, salario) VALUES 
('Priscila Alcantara', '56235654413', 1800);

INSERT INTO funcionario(nome_func, cpf_func, salario) VALUES 
('Bruno Gagliasso', '93168640700', 1500);

INSERT INTO funcionario(nome_func, cpf_func, salario) VALUES 
('Claudia Raia', '93658640788', Null )

select * from funcionario;


INSERT INTO endereco(logradouro, complemento, bairro, cidade, "UF", cep)VALUES
('Rua Melo Franco', '200', 'Alto', 'Teresópolis', 'RJ', 25960530);

insert into endereco(logradouro, complemento, bairro, cidade, "UF", cep) values
('Rua Braga', '210', 'Varzea', 'Teresópolis', 'RJ', 25960630),
('Rua dos Montes', '192', 'Rosario', 'Petropolis', 'RJ', 25785432),
('Avenida Oliveira Botelho', '1092', 'Vargem Grande', 'Nazare', 'SP', 26543279),
('Estrada das Figueiras', '562', 'Gradim', 'Niteroi', 'ES', 27653489),
('Rua Sem Saída', '01', 'Morro de Deus', 'Itaipuacu', 'RJ', 20983000),
('Rua dos Passaros', 's/n', 'Posse', 'Carmo', 'SP', 25967854);

select * from endereco;

INSERT INTO contato(telefone_fixo, telefone_celular, email)
VALUES('2126425875', '21999826532', 'luiz@gmail.com');

insert into contato(telefone_fixo, telefone_celular, email)
values('2226578954','22985432765', 'fernada@hotmail.com'),
('2126785490', '21908725321', 'lauro1@uol.com'),
('2127124456', '21988765433', 'mamalurdes@gmail.com'),
('2126423455', '21987650283', 'joaomoura@gmail.com'),
('2227856643', '21999926544', 'pessoaant@hotmail.com');

select * from contato;

INSERT INTO cliente(cpf_cliente, nomecompleto_cliente, login_cliente, senha_cliente, codigo_contato, data_nasc_cliente, codigo_endereco, data_de_cadastro)
VALUES('55937547055', 'Luiz Carlos Martins', 'martins', 'mar123', 1, '1985-05-03', 1, '2022-03-03');

INSERT INTO cliente(cpf_cliente, nomecompleto_cliente, login_cliente, senha_cliente, codigo_contato, data_nasc_cliente, codigo_endereco, data_de_cadastro)
VALUES('88783825070', 'Fernanda Abreu Silva', 'fernanda', 'fefe12', 2, '1996-08-23', 2, '2022-03-07');

INSERT INTO cliente(cpf_cliente, nomecompleto_cliente, login_cliente, senha_cliente, codigo_contato, data_nasc_cliente, codigo_endereco, data_de_cadastro)
VALUES('01687733686', 'Lauro Cunha Bezerra', 'lauro2021', 'cunhalauro', 3, '1984-02-29', 3, '2021-08-21');

INSERT INTO cliente(cpf_cliente, nomecompleto_cliente, login_cliente, senha_cliente, codigo_contato, data_nasc_cliente, codigo_endereco, data_de_cadastro)
VALUES('17366281867', 'Maria de Lurdes Figueira', 'mamalurdes', '2735ma', 4, '1955-09-02', 4, '2021-05-11');

INSERT INTO cliente(cpf_cliente, nomecompleto_cliente, login_cliente, senha_cliente, codigo_contato, data_nasc_cliente, codigo_endereco, data_de_cadastro)
VALUES('72739071205', 'João Francisco Moura', 'mourajoao', '2022Joao', 5, '1985-04-16', 5, '2021-06-17');

INSERT INTO cliente(cpf_cliente, nomecompleto_cliente, login_cliente, senha_cliente, codigo_contato, data_nasc_cliente, codigo_endereco, data_de_cadastro)
VALUES('77389324651', 'Antonia Pessoa', 'antoninha', 'ant0nia', 6, '2000-07-26', 6, '2022-03-27');

INSERT INTO cliente(cpf_cliente, nomecompleto_cliente, login_cliente, senha_cliente, codigo_contato, data_nasc_cliente, codigo_endereco, data_de_cadastro)
VALUES('58749324651', 'Bernadete Pessoa', 'antoninha', 'ota', 6, '2001-07-28', 6, '2022-03-27');

select * from cliente;


----------------------------------------------------------------------------------------------------
INSERT INTO categoria(nome_categoria)values
('Cabelo'),
('Perfumaria'),
('Maquiagem');

INSERT INTO categoria(nome_categoria)values
('Skincare'),
('Coloração'),
('Esmalteria');

select * from categoria;


INSERT INTO produto(nome_produto, qtd_estoque, data_fabricacao, vl_unitario, data_cadastro, codigo_func, codigo_categoria)
VALUES('Shampoo Argan',32,'2022-01-25',48.99,'2022-01-30 00:00:00',1,1);

INSERT INTO produto(nome_produto, qtd_estoque, data_fabricacao, vl_unitario, data_cadastro, codigo_func, codigo_categoria)
VALUES('Shampoo Argan 200 ml',32,'2022-01-25',48.99,'2022-01-30 00:00:00',1,1);

INSERT INTO produto(nome_produto, qtd_estoque, data_fabricacao, vl_unitario, data_cadastro, codigo_func, codigo_categoria)
VALUES('Máscara Hidratação',123,'2022-01-25',62.99,'2022-01-30 00:00:00',1,1);

INSERT INTO produto(nome_produto, qtd_estoque, data_fabricacao, vl_unitario, data_cadastro, codigo_func, codigo_categoria)
VALUES('Creme de pentear',333,'2022-01-25',20.90,'2022-01-30 00:00:00',1,1);

INSERT INTO produto(nome_produto, qtd_estoque, data_fabricacao, vl_unitario, data_cadastro, codigo_func, codigo_categoria)
VALUES('Óleo Capilar Argan',200,'2022-01-25',34.90,'2022-01-30 00:00:00',1,1);

INSERT INTO produto(nome_produto, qtd_estoque, data_fabricacao, vl_unitario, data_cadastro, codigo_func, codigo_categoria)values
('Sabonete Líquido Mediterrâneo',176,'2021-12-05',25.99,'2022-03-01 00:00:00',1,2);

INSERT INTO produto(nome_produto, qtd_estoque, data_fabricacao, vl_unitario, data_cadastro, codigo_func, codigo_categoria)values
('Sabonete Barra Amazônia ',198,'2021-12-15',6.99,'2022-01-25 00:00:00',1,2);

INSERT INTO produto(nome_produto, qtd_estoque, data_fabricacao, vl_unitario, data_cadastro, codigo_func, codigo_categoria)values
('Antitranspirante Aloe Vera',198,'2021-12-16',20.99,'2022-03-01 00:00:00',2,2);

INSERT INTO produto(nome_produto, qtd_estoque, data_fabricacao, vl_unitario, data_cadastro, codigo_func, codigo_categoria)values
('Hidratante Corporal Caribe',244,'2021-12-17',56.90,'2022-03-06 00:00:00',2,2);

INSERT INTO produto(nome_produto, qtd_estoque, data_fabricacao, vl_unitario, data_cadastro, codigo_func, codigo_categoria)values
('Body Splash Lavanda',211,'2021-11-25',75.00,'2022-02-15 00:00:00',2,2);

INSERT INTO produto (nome_produto,qtd_estoque,data_fabricacao,vl_unitario,data_cadastro,codigo_func,codigo_categoria) VALUES
 ('Lapis de Olho',213,'2021-12-05',33.99,'2022-03-01 00:00:00',1,3);

 INSERT INTO produto (nome_produto,qtd_estoque,data_fabricacao,vl_unitario,data_cadastro,codigo_func,codigo_categoria) VALUES
 ('Rímel Sensacional',231,'2021-12-16',49.99,'2022-03-01 00:00:00',2,3);

INSERT INTO produto (nome_produto,qtd_estoque,data_fabricacao,vl_unitario,data_cadastro,codigo_func,codigo_categoria) VALUES
 ('Pó Iluminador Ilumina Geral',166,'2021-12-15',39.99,'2022-01-25 00:00:00',1,3);

INSERT INTO produto (nome_produto,qtd_estoque,data_fabricacao,vl_unitario,data_cadastro,codigo_func,codigo_categoria) VALUES
 ('Paleta de sombra Tons pastéis',172,'2021-12-17',99.99,'2022-03-06 00:00:00',2,3);

INSERT INTO produto (nome_produto,qtd_estoque,data_fabricacao,vl_unitario,data_cadastro,codigo_func,codigo_categoria) VALUES
 ('Batom Líquido Nude',135,'2021-11-25',54.90,'2022-02-15 00:00:00',2,3);

 INSERT INTO produto(nome_produto, qtd_estoque, data_fabricacao, vl_unitario, data_cadastro, codigo_func, codigo_categoria)
VALUES('Vitamina C',122,'2022-02-15',118.99,'2022-03-20 00:00:00',3,4);

INSERT INTO produto(nome_produto, qtd_estoque, data_fabricacao, vl_unitario, data_cadastro, codigo_func, codigo_categoria)
VALUES('Argila Verde',141,'2021-12-25',18.99,'2021-12-22 00:00:00',4,4);

INSERT INTO produto(nome_produto, qtd_estoque, data_fabricacao, vl_unitario, data_cadastro, codigo_func, codigo_categoria)
VALUES('Tinta Loiro Mel',100,'2022-01-15',28.99,'2021-12-12 00:00:00',5,5);

INSERT INTO produto(nome_produto, qtd_estoque, data_fabricacao, vl_unitario, data_cadastro, codigo_func, codigo_categoria)
VALUES('Po descolorante',110,'2022-02-05',21.99,'2022-01-22 00:00:00',4,5);

INSERT INTO produto(nome_produto, qtd_estoque, data_fabricacao, vl_unitario, data_cadastro, codigo_func, codigo_categoria)
VALUES('Esmalte Bege',132,'2022-03-25',8.99,'2022-04-01 00:00:00',5,6);

INSERT INTO produto(nome_produto, qtd_estoque, data_fabricacao, vl_unitario, data_cadastro, codigo_func, codigo_categoria)
VALUES('Acetona',121,'2021-12-25',4.99,'2022-03-13 00:00:00',4,6);

select * from produto;

INSERT INTO produto(nome_produto, qtd_estoque, data_fabricacao, vl_unitario, data_cadastro, codigo_func, codigo_categoria)
VALUES('Esmalte Bege',132,'2022-03-25',8.99,'2022-04-01 00:00:00',5,6);

INSERT INTO produto(nome_produto, qtd_estoque, data_fabricacao, vl_unitario, data_cadastro, codigo_func, codigo_categoria)
VALUES('Acetona',121,'2021-12-25',4.99,'2022-03-13 00:00:00',4,6);

select * from produto;


insert into pedido(quantidade_comprada, data_compra, codigo_produto, codigo_cliente)
values (2,'2022-03-03', 5, 6),
       (3,'2022-03-03', 20, 1),
       (5,'2022-03-03', 15, 4),
       (1,'2022-03-04', 11, 2),
       (3,'2022-03-04', 9, 5),
       (2,'2022-03-04', 2, 3);