CREATE TABLE "cliente" (
  "codigo_cliente" serial Not Null,
  "nome_cliente" varchar(50)Not Null,
  "endereco_cliente" varchar(200),
  "faturamento_acumulado" decimal,
  "limite_credito" decimal Not Null,
  "codigo_vendedor" integer Not Null,
  PRIMARY KEY ("codigo_cliente")
);

CREATE TABLE "vendedor" (
  "codigo_vendedor" serial Not Null,
  "nome_vendedor" varchar(50) not null,
  "idendereco_vendedor" integer,
  "comissao" decimal,
  PRIMARY KEY ("codigo_vendedor")

);

CREATE TABLE "preco" (
  "codigo_preco" serial Not Null,
  "codigo_preco_cotado" integer,
  PRIMARY KEY ("codigo_preco")
);

CREATE TABLE "pedido" (
  "codigo_pedido" serial Not Null,
  "numero_pedido" integer,
  "data_emissao" date,
  "codigo_cliente" integer ,
  "codigo_peca" integer,
  PRIMARY KEY ("codigo_pedido"),
  CONSTRAINT "FK_pedido.codigo_cliente"
    FOREIGN KEY ("codigo_cliente")
      REFERENCES "cliente"("codigo_cliente")
);

CREATE TABLE "armazem" (
  "codigo_armazem" serial Not Null,
  "endereco_armazem" integer,
  "quantidade_peca" integer,
  PRIMARY KEY ("codigo_armazem")
);

CREATE TABLE "peca" (
  "codigo_peca" serial Not Null,
  "descricao" varchar(50),
  "codigo_preco" integer,
  "quantidade_peca" integer,
  "codigo_armazem" integer,
  PRIMARY KEY ("codigo_peca"),
  CONSTRAINT "FK_peca.codigo_armazem"
    FOREIGN KEY ("codigo_armazem")
      REFERENCES "armazem"("codigo_armazem")
);
