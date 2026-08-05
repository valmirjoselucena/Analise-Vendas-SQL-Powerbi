USE ERP_Vendas_BI;
GO

/* 04_seed_catalog_01.sql
   Lote 1 - Categorias + Produtos
*/

-- Categorias
INSERT INTO cad.Categoria (NomeCategoria,Descricao,DataCadastro,IdUsuarioCadastro,RegistroAtivo)
SELECT v.Nome,v.Descricao,GETDATE(),1,1
FROM (VALUES
('Notebooks','Computadores portáteis'),
('Monitores','Monitores LCD/LED'),
('Periféricos','Mouse, teclado e acessórios'),
('Armazenamento','SSD, HD e Pen Drive'),
('Redes','Equipamentos de rede'),
('Telefonia','Smartphones e telefonia'),
('Impressoras','Impressoras e multifuncionais')
) v(Nome,[Descricao])
WHERE NOT EXISTS (SELECT 1 FROM cad.Categoria c WHERE c.NomeCategoria=v.Nome);

DECLARE @Produtos TABLE(
Categoria varchar(100),CodigoProduto varchar(30),CodigoBarras varchar(20),
NomeProduto varchar(200),Descricao varchar(500),Unidade varchar(10),
Peso decimal(10,3),Custo decimal(18,2),Venda decimal(18,2),
Estoque decimal(18,4),EstoqueMinimo decimal(18,4));

INSERT INTO @Produtos VALUES
('Notebooks','NB001','7890000000001','Notebook Dell Inspiron 15','Notebook Dell Inspiron','UN',1.80,2800,3499,15,5),
('Notebooks','NB002','7890000000002','Notebook Lenovo ThinkPad E14','Notebook Lenovo','UN',1.70,3200,3999,10,3),
('Monitores','MON001','7890000000003','Monitor LG 24 IPS','Monitor IPS 24','UN',3.2,700,1099,20,5),
('Monitores','MON002','7890000000004','Monitor Samsung 27 Curvo','Monitor Curvo','UN',4.1,980,1499,12,4),
('Periféricos','PER001','7890000000005','Mouse Logitech M90','Mouse USB','UN',0.09,35,69.9,80,20),
('Periféricos','PER002','7890000000006','Teclado Logitech K120','Teclado USB','UN',0.45,55,109.9,60,15),
('Periféricos','PER003','7890000000007','Webcam Logitech C270','Webcam HD','UN',0.18,120,199.9,25,5),
('Armazenamento','ARM001','7890000000008','SSD Kingston 480GB','SSD SATA','UN',0.08,180,299.9,40,10),
('Armazenamento','ARM002','7890000000009','SSD WD Blue 1TB','SSD NVMe','UN',0.08,350,529.9,30,8),
('Armazenamento','ARM003','7890000000010','HD Seagate 2TB','HD 3.5','UN',0.45,280,429.9,25,6),
('Redes','RED001','7890000000050','Roteador TP-Link AX3000','WiFi 6','UN',0.55,420,649.9,18,5),
('Redes','RED002','7890000000012','Switch TP-Link 8 Portas','Gigabit','UN',0.60,170,289.9,20,5),
('Telefonia','TEL001','7890000000013','Samsung Galaxy A56','Smartphone','UN',0.22,1450,1999,15,4),
('Telefonia','TEL002','7890000000014','Motorola Edge 60','Smartphone','UN',0.22,1700,2399,12,3),
('Impressoras','IMP001','7890000000015','HP LaserJet','Laser','UN',5.5,890,1299,8,2);

INSERT INTO cad.Produto(
IdCategoria,CodigoProduto,CodigoBarras,NomeProduto,Descricao,UnidadeMedida,Peso,
PrecoCustoAtual,PrecoVendaAtual,EstoqueAtual,EstoqueMinimo,
DataCadastro,IdUsuarioCadastro,RegistroAtivo)
SELECT c.IdCategoria,p.CodigoProduto,p.CodigoBarras,p.NomeProduto,p.Descricao,p.Unidade,p.Peso,
p.Custo,p.Venda,p.Estoque,p.EstoqueMinimo,GETDATE(),1,1
FROM @Produtos p
JOIN cad.Categoria c ON c.NomeCategoria=p.Categoria
WHERE NOT EXISTS(SELECT 1 FROM cad.Produto x WHERE x.CodigoProduto=p.CodigoProduto);

SELECT COUNT(*) AS TotalCategorias FROM cad.Categoria;
SELECT COUNT(*) AS TotalProdutos FROM cad.Produto;