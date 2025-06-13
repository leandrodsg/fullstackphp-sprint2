-- insert fornecedores
insert into fornecedor (nome, rua, numero, cidade, codigo_postal, pais, telefone, fax, nif)
values 
('LentesVision', 'Av. Catalunya', '45', 'Barcelona', '08001', 'España', '+34 931234567', '+34 931234568', 'B12345678'),
('Óptica Total', 'Carrer Major', '12', 'Girona', '17001', 'España', '+34 972345678', NULL, 'C98765432');

-- insert oculos
insert into oculos (marca, graduacao_esquerda, graduacao_direita, tipo_armacao, cor_armacao, cor_vidro, preco, fornecedor_id)
values 
('Rayban', '-1.25', '-1.00', 'metalica', 'preto', 'cinza', 179.90, 1),
('Oakley', '-2.00', '-2.50', 'plastica', 'azul', 'transparente', 249.90, 1),
('Vogue', NULL, NULL, 'flutuante', 'vermelho', 'verde', 149.00, 2);

-- insert clientes
insert into cliente (nome, endereco, telefone, email, data_registro)
values 
('Joana Silva', 'Rua das Flores, 100', '+34 912345678', 'joana@email.com', '2025-06-01'),
('Carlos Lima', 'Rua do Sol, 55', '+34 913456789', 'carlos@email.com', '2025-06-02');

-- insert indicacao com xcarlos indicado por joana
insert into indicacoes (cliente_id, indicado_por_id)
values (2, 1);

-- insert funcionario
insert into funcionario (nome)
values ('Ana Torres');

-- insert venda (Carlos comprou com Ana no dia 06/06/2025)
insert into venda (data, cliente_id, funcionario_id)
values ('2025-06-06', 2, 1);

-- insert venda_oculos o carlos comprou 2 oculos Rayban e Vogue
insert into venda_oculos (venda_id, oculos_id)
values (1, 1), (1, 3);
