--Uma consulta mostrando todos os produtos cadastrados, com o nome da categoria e o nome do funcionário que o cadastrou; 
select nome_produto, nome_func, nome_categoria   FROM produto 
INNER JOIN funcionario ON funcionario.codigo_func = produto.codigo_func 
INNER JOIN categoria ON categoria.codigo_categoria = produto.codigo_categoria;


--Uma consulta mostrando todos os pedidos feitos (sem os itens do pedido), com o nome e telefone do cliente; 
select codigo_compra, cliente.nomecompleto_cliente, cliente.codigo_contato  
	from pedido inner join cliente 
		on cliente.codigo_cliente = pedido.codigo_cliente;
	
	
--Uma consulta mostrando a quantidade de pedidos por cliente, com resultado ordenado por nome do cliente, de modo crescente. 
SELECT pedido.quantidade_comprada, cliente.nomecompleto_cliente
FROM cliente INNER JOIN pedido
ON pedido.codigo_cliente = cliente.codigo_cliente order by cliente.nomecompleto_cliente;


--Utilize o inner join para uma consulta coerente em 3 tabelas.(consulta para saber localidade e contato do cliente)
select  cliente.nomecompleto_cliente, endereco."UF" , contato.email  FROM cliente
inner join endereco on endereco.codigo_endereco=cliente.codigo_endereco
inner join contato on contato.codigo_contato=cliente.codigo_contato;


--Um SQL que mude o salário de todos os funcionários: eles passarão a ganhar R$ 500,00 a mais; 
update funcionario set salario = (salario + 500.00)



--Um SQL que altere o e-mail e o telefone de um cliente qualquer cadastrado. 
update contato set telefone_fixo = '2127124496', email = 'lurdes2022@gmail.com' where codigo_contato = 4 


--SQL de exclusão, dos clientes que foram cadastrados contendo o caractere ‘e’ no nome ou que possuem uma senha com menos de 4 caracteres. 
select * from cliente where cliente.nomecompleto_cliente like '%e%';
select * from cliente where length(cliente.senha_cliente)<4;                                                                           
delete from cliente where cliente.nomecompleto_cliente like '%e%' and  length(clientes.senha)<4;


--Faça uso de outro join para consultar os dados, mesmo que nulos, da tabela funcionario. 
SELECT salario 
FROM funcionario 
LEFT JOIN produto  
ON produto.codigo_func = funcionario.codigo_func;


--Uma consulta mostrando todos os pedidos feitos, com seus itens, mostrando: número do pedido, nome do cliente, data do pedido, nome do produto comprado e a quantidade comprada de cada produto; (2 pontos)
select pedido.codigo_compra, produto.nome_produto, cliente.nomecompleto_cliente, pedido.data_compra, pedido.quantidade_comprada from pedido
inner join cliente on cliente.codigo_cliente = pedido.codigo_cliente
inner join produto on produto.codigo_produto = pedido. codigo_produto;



-- Bonus 
SELECT nomecompleto_cliente AS nome
FROM cliente c ;



