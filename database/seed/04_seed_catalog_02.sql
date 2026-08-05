USE ERP_Vendas_BI;
GO

DECLARE @Produtos TABLE(Categoria varchar(100),CodigoProduto varchar(30),CodigoBarras varchar(20),NomeProduto varchar(200),Descricao varchar(500),Unidade varchar(10),Peso decimal(10,3),Custo decimal(18,2),Venda decimal(18,2),Estoque decimal(18,4),EstoqueMinimo decimal(18,4));
INSERT INTO @Produtos VALUES
('Periféricos','PER026','7890000000026','Produto PER 26','Descrição 26','UN',1.000,230,332,20,5),
('Periféricos','PER027','7890000000027','Produto PER 27','Descrição 27','UN',1.000,235,339,20,5),
('Periféricos','PER028','7890000000060','Produto PER 28','Descrição 28','UN',1.000,240,346,20,5),
('Periféricos','PER029','7890000000029','Produto PER 29','Descrição 29','UN',1.000,245,353,20,5),
('Periféricos','PER030','7890000000030','Produto PER 30','Descrição 30','UN',1.000,250,360,20,5),
('Periféricos','PER031','7890000000031','Produto PER 31','Descrição 31','UN',1.000,255,367,20,5),
('Periféricos','PER032','7890000000032','Produto PER 32','Descrição 32','UN',1.000,260,374,20,5),
('Periféricos','PER033','7890000000033','Produto PER 33','Descrição 33','UN',1.000,265,381,20,5),
('Periféricos','PER034','7890000000034','Produto PER 34','Descrição 34','UN',1.000,270,388,20,5),
('Periféricos','PER035','7890000000061','Produto PER 35','Descrição 35','UN',1.000,275,395,20,5),
('Armazenamento','ARM036','7890000000036','Produto ARM 36','Descrição 36','UN',1.000,280,402,20,5),
('Armazenamento','ARM037','7890000000037','Produto ARM 37','Descrição 37','UN',1.000,285,409,20,5),
('Armazenamento','ARM038','7890000000038','Produto ARM 38','Descrição 38','UN',1.000,290,416,20,5),
('Armazenamento','ARM039','7890000000039','Produto ARM 39','Descrição 39','UN',1.000,295,423,20,5),
('Armazenamento','ARM040','7890000000040','Produto ARM 40','Descrição 40','UN',1.000,300,430,20,5),
('Armazenamento','ARM041','7890000000041','Produto ARM 41','Descrição 41','UN',1.000,305,437,20,5),
('Armazenamento','ARM042','7890000000042','Produto ARM 42','Descrição 42','UN',1.000,310,444,20,5),
('Armazenamento','ARM043','7890000000043','Produto ARM 43','Descrição 43','UN',1.000,315,451,20,5),
('Armazenamento','ARM044','7890000000044','Produto ARM 44','Descrição 44','UN',1.000,320,458,20,5),
('Armazenamento','ARM045','7890000000045','Produto ARM 45','Descrição 45','UN',1.000,325,465,20,5),
('Armazenamento','ARM046','7890000000046','Produto ARM 46','Descrição 46','UN',1.000,330,472,20,5),
('Armazenamento','ARM047','7890000000047','Produto ARM 47','Descrição 47','UN',1.000,335,479,20,5),
('Armazenamento','ARM048','7890000000048','Produto ARM 48','Descrição 48','UN',1.000,340,486,20,5),
('Armazenamento','ARM049','7890000000049','Produto ARM 49','Descrição 49','UN',1.000,345,493,20,5),
('Armazenamento','ARM050','7890000000062','Produto ARM 50','Descrição 50','UN',1.000,350,500,20,5);

INSERT INTO cad.Produto
(IdCategoria,CodigoProduto,CodigoBarras,NomeProduto,Descricao,UnidadeMedida,Peso,PrecoCustoAtual,PrecoVendaAtual,EstoqueAtual,EstoqueMinimo,DataCadastro,IdUsuarioCadastro,RegistroAtivo)
SELECT c.IdCategoria,p.CodigoProduto,p.CodigoBarras,p.NomeProduto,p.Descricao,p.Unidade,p.Peso,p.Custo,p.Venda,p.Estoque,p.EstoqueMinimo,GETDATE(),1,1
FROM @Produtos p JOIN cad.Categoria c ON c.NomeCategoria=p.Categoria
WHERE NOT EXISTS(SELECT 1 FROM cad.Produto x WHERE x.CodigoProduto=p.CodigoProduto);