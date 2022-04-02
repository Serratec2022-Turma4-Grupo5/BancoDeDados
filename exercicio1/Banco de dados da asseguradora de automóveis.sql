CREATE TABLE "apolice" (
  "id_politicas" serial Not Null,
  "valor_seguro" decimal Not Null,
  "id_cliente" integer,
  PRIMARY KEY ("id_politicas")
);

CREATE TABLE "acidente" (
  "id_acidente" serial Not Null,
  "data_acidente" varchar(10) Not Null,
  "hora_acidente" varchar(5) Not Null,
  "local_acidente" varchar(100) Not Null,
  "id_chassi" varchar(17),
  PRIMARY KEY ("id_acidente")
);

CREATE TABLE "cliente" (
  "id_cliente" serial Not Null,
  "nome_cliente" varchar(20) Not Null,
  "sobrenome_cliente" varchar(50) Not Null,
  "endereco_cliente" varchar(100) Not Null,
  "telefone_cliente" varchar(50),
  PRIMARY KEY ("id_cliente")
);

CREATE TABLE "carro" (
  "id_chassi" varchar(17) Not Null,
  "id_placa" varchar(8) Not Null,
  "modelo_carro" varchar(50) Not Null,
  "id_politicas" integer Not Null,
  PRIMARY KEY ("id_chassi")
);

