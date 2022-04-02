CREATE TABLE "funcionario" (
  "id_funcionario" serial not null,
  "salario_funcionario" integer,
  "id_tel_funcionario" integer,
  PRIMARY KEY ("id_funcionario")
);

CREATE TABLE "telefone_funcionario" (
  "id_tel_funcionario" integer,
  "telefone_funcionario" integer Unique,
  CONSTRAINT "FK_telefone_funcionario.id_tel_funcionario"
    FOREIGN KEY ("id_tel_funcionario")
      REFERENCES "funcionario"("id_funcionario")
);


CREATE TABLE "fornecedor" (
  "id_fornecedor" integer,
  "logradouro_fornecedor" varchar(100),
  "bairro_fornecedor" varchar(100),
  "cidade_fornecedor" varchar(100),
  "cep_fornecedor" integer,
  "id_projeto" integer,
  "id_pecas" integer,
  PRIMARY KEY ("id_fornecedor")
);

CREATE TABLE "projeto" (
  "id_projeto" integer,
  "id_funcionario" integer,
  "orcamento_projeto" integer,
  "id_pecas" integer,
  "id_fornecedor" integer,
  "id_data_hora" date,
  PRIMARY KEY ("id_projeto"),
  CONSTRAINT "FK_projeto.id_projeto"
    FOREIGN KEY ("id_projeto")
      REFERENCES "projeto"("id_projeto"),
  CONSTRAINT "FK_projeto.id_funcionario"
    FOREIGN KEY ("id_funcionario")
      REFERENCES "funcionario"("id_funcionario")
);

CREATE TABLE "deposito" (
  "id_deposito" integer,
  "logradouro_deposito" varchar(100),
  "bairro_deposito" varchar(100),
  "cidade_deposito" varchar(100),
  "cep_deposito" integer,
  PRIMARY KEY ("id_deposito")
);

CREATE TABLE "peca" (
  "id_pecas" integer,
  "peso_pecas" integer,
  "cor_pecas" varchar(30),
  "id_projeto" integer,
  "id_fornecedor" integer,
  "id_deposito" integer,
  PRIMARY KEY ("id_pecas"),
  CONSTRAINT "FK_peca.id_deposito"
    FOREIGN KEY ("id_deposito")
      REFERENCES "deposito"("id_deposito")
);


CREATE TABLE "departamento" (
  "id_departamento" integer,
  "id_funcionario" integer,
  "setor" varchar(50),
  PRIMARY KEY ("id_departamento")
);

CREATE TABLE "tempo" (
  "id_data_hora" integer,
  "inicio_projeto" date,
  "horas_totais" time,
  PRIMARY KEY ("id_data_hora")
);