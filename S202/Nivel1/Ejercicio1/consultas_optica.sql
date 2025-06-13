-- 1
-- Todos fornecedores cadastrados no sistema
select * from fornecedor;

-- 2
-- Oculos disponíveis mostrando quem é o fornecedor de cada
-- Relaciona oculos com fornecedores pelo fornecedor_id
select o.id, o.marca, o.tipo_armacao, o.preco, f.nome as fornecedor
from oculos o
join fornecedor f on o.fornecedor_id = f.id;

--3
-- todos os clientes cadastrados na ótica
select * from cliente;

--4
-- relacionamento de indicações entre clientes
-- Relaciona indicações com cliente 2x
-- 1 para pegar o nome do cliente indicado
-- 2 para pegar o nome do cliente que fez a indicação
select c.nome as cliente, i.nome as indicado_por
from indicacoes ind
join cliente c on ind.cliente_id = c.id
join cliente i on ind.indicado_por_id = i.id;

--5
-- Todas as vendas realizadas mostrando cliente e vendedor
-- Relaciona tabela venda com cliente e funcionário
select v.id, v.data, c.nome as cliente, f.nome as funcionario
from venda v
join cliente c on v.cliente_id = c.id
join funcionario f on v.funcionario_id = f.id;

--6
-- Mostra quais oculos foram vendidos em cada venda
-- Usa a tabela venda_oculos para relacionamento N:M
select v.id as venda_id, o.marca, o.preco
from venda v
join venda_oculos vo on v.id = vo.venda_id
join oculos o on vo.oculos_id = o.id;

--7
-- Todas as vendas com informações completas
-- Inclui dados da venda, cliente, vendedor e produtos comprados
select v.id, v.data, c.nome as cliente, f.nome as funcionario, 
       o.marca, o.preco
from venda v
join cliente c on v.cliente_id = c.id
join funcionario f on v.funcionario_id = f.id
join venda_oculos vo on v.id = vo.venda_id
join oculos o on vo.oculos_id = o.id;

--8
-- Calcula quantas compras cada cliente realizou
-- Agrupa as vendas por cliente e conta quantas há para cada um
select c.nome, count(v.id) as total_vendas
from cliente c
join venda v on c.id = v.cliente_id
group by c.id;

--9
-- Oculos vendidos por cada funcionário no ano de 2025
-- venda_oculos relaciona com vendas e óculos
select f.nome as funcionario, o.marca, o.preco
from funcionario f
join venda v on f.id = v.funcionario_id
join venda_oculos vo on v.id = vo.venda_id
join oculos o on vo.oculos_id = o.id
where year(v.data) = 2025;

--10
-- Fornecedores que tiveram seus óculos vendidos
-- DISTINCT para listar cada fornecedor apenas uma vez
select distinct f.nome as fornecedor
from fornecedor f
join oculos o on f.id = o.fornecedor_id
join venda_oculos vo on o.id = vo.oculos_id;