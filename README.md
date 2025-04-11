# sistema_marmoraria
Script SQL do sistema de pedidos para marmoraria
# Sistema de Marmoraria

Este projeto é um banco de dados feito em MySQL para controle de uma marmoraria. Ele foi pensado para organizar o cadastro de funcionários, clientes, pedidos, pagamentos, entregas e também o controle de estoque e tipos de mármores.

##  Funcionalidades principais

- Cadastro de funcionários para login no sistema
- Registro de clientes e pedidos
- Controle de tipos de mármore e preços por m²
- Registro de pagamentos e status
- Controle de entregas (pendente, entregue, atrasado)
- Gerenciamento de estoque (entrada e saída de materiais)

##  Estrutura das tabelas

O banco possui as seguintes tabelas:

- funcionarios: login e dados dos funcionários
- clientes: dados do cliente, como nome, telefone e endereço
- pedidos: pedido feito pelo cliente com metragem e tipo de mármore
- pagamentos: forma de pagamento e status (pago, pendente, parcial)
- entregas: datas e status das entregas
- estoque: materiais usados e quantidade
- movimentacoes_estoque: entrada e saída de estoque
- marmores: lista de mármores disponíveis com preço por m²
