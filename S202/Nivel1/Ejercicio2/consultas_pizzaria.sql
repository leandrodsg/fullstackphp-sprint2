-- consultas pizzaria
use pizzaria;

-- 1
-- todos os pedidos com cliente, loja e tipo de entrega
select p.id as pedido_id, concat(c.nome, ' ', c.sobrenome) as cliente,
       l.cidade as cidade_loja, p.tipo_entrega, p.data_hora
from pedido p
join cliente c on p.cliente_id = c.id
join loja l on p.loja_id = l.id
order by p.data_hora desc;

-- 2
-- itens de um pedido especifico
-- mostra nome e quantidade de cada produto
select pp.pedido_id, pr.nome as produto, pp.quantidade, pp.preco_unitario,
       (pp.quantidade * pp.preco_unitario) as subtotal
from pedido_produto pp
join produto pr on pp.produto_id = pr.id
where pp.pedido_id = 2;

-- 3
-- total de entregas feitas por entregador
-- so conta pedidos com entrega e entregador
select f.nome, f.sobrenome, count(*) as total_entregas
from funcionario f
join pedido p on f.id = p.entregador_id
where f.cargo = 'entregador' and p.tipo_entrega = 'domicilio'
group by f.id;

-- 4
-- total de bebidas vendidas por cidade da loja
-- soma a quantidade de bebidas vendidas
select l.cidade, sum(pp.quantidade) as total_bebidas
from pedido_produto pp
join produto pr on pp.produto_id = pr.id
join pedido p on pp.pedido_id = p.id
join loja l on p.loja_id = l.id
where pr.tipo = 'bebida'
group by l.cidade;

-- 5
-- faturamento total por loja
-- soma o valor total dos pedidos
select l.cidade, sum(p.preco_total) as faturamento
from pedido p
join loja l on p.loja_id = l.id
group by l.id, l.cidade;
