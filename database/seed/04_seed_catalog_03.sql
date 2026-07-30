USE ERP_Vendas_BI;
GO

DECLARE @Produtos TABLE(Categoria varchar(100),CodigoProduto varchar(30),CodigoBarras varchar(20),NomeProduto varchar(200),Descricao varchar(500),Unidade varchar(10),Peso decimal(10,3),Custo decimal(18,2),Venda decimal(18,2),Estoque decimal(18,4),EstoqueMinimo decimal(18,4));
INSERT INTO @Produtos VALUES
('Redes','RED051','7890000000051','Produto RED 51','Descrição 51','UN',1.000,355,507,20,5),
('Redes','RED052','7890000000052','Produto RED 52','Descrição 52','UN',1.000,360,514,20,5),
('Redes','RED053','7890000000053','Produto RED 53','Descrição 53','UN',1.000,365,521,20,5),
('Redes','RED054','7890000000054','Produto RED 54','Descrição 54','UN',1.000,370,528,20,5),
('Redes','RED055','7890000000055','Produto RED 55','Descrição 55','UN',1.000,375,535,20,5),
('Redes','RED056','7890000000056','Produto RED 56','Descrição 56','UN',1.000,380,542,20,5),
('Redes','RED057','7890000000057','Produto RED 57','Descrição 57','UN',1.000,385,549,20,5),
('Redes','RED058','7890000000058','Produto RED 58','Descrição 58','UN',1.000,390,556,20,5),
('Redes','RED059','7890000000059','Produto RED 59','Descrição 59','UN',1.000,395,563,20,5),
('Redes','RED060','7890000000101','Produto RED 60','Descrição 60','UN',1.000,400,570,20,5),
('Redes','RED061','7890000000161','Produto RED 61','Descrição 61','UN',1.000,405,577,20,5),
('Redes','RED062','7890000000162','Produto RED 62','Descrição 62','UN',1.000,410,584,20,5),
('Redes','RED063','7890000000163','Produto RED 63','Descrição 63','UN',1.000,415,591,20,5),
('Redes','RED064','7890000000064','Produto RED 64','Descrição 64','UN',1.000,420,598,20,5),
('Redes','RED065','7890000000065','Produto RED 65','Descrição 65','UN',1.000,425,605,20,5),
('Telefonia','TEL066','7890000000066','Produto TEL 66','Descrição 66','UN',1.000,430,612,20,5),
('Telefonia','TEL067','7890000000067','Produto TEL 67','Descrição 67','UN',1.000,435,619,20,5),
('Telefonia','TEL068','7890000000068','Produto TEL 68','Descrição 68','UN',1.000,440,626,20,5),
('Telefonia','TEL069','7890000000069','Produto TEL 69','Descrição 69','UN',1.000,445,633,20,5),
('Telefonia','TEL070','7890000000070','Produto TEL 70','Descrição 70','UN',1.000,450,640,20,5),
('Telefonia','TEL071','7890000000071','Produto TEL 71','Descrição 71','UN',1.000,455,647,20,5),
('Telefonia','TEL072','7890000000072','Produto TEL 72','Descrição 72','UN',1.000,460,654,20,5),
('Telefonia','TEL073','7890000000073','Produto TEL 73','Descrição 73','UN',1.000,465,661,20,5),
('Telefonia','TEL074','7890000000074','Produto TEL 74','Descrição 74','UN',1.000,470,668,20,5),
('Telefonia','TEL075','7890000000075','Produto TEL 75','Descrição 75','UN',1.000,475,675,20,5);

INSERT INTO cad.Produto
(IdCategoria,CodigoProduto,CodigoBarras,NomeProduto,Descricao,UnidadeMedida,Peso,PrecoCustoAtual,PrecoVendaAtual,EstoqueAtual,EstoqueMinimo,DataCadastro,IdUsuarioCadastro,RegistroAtivo)
SELECT c.IdCategoria,p.CodigoProduto,p.CodigoBarras,p.NomeProduto,p.Descricao,p.Unidade,p.Peso,p.Custo,p.Venda,p.Estoque,p.EstoqueMinimo,GETDATE(),1,1
FROM @Produtos p JOIN cad.Categoria c ON c.NomeCategoria=p.Categoria
WHERE NOT EXISTS(SELECT 1 FROM cad.Produto x WHERE x.CodigoProduto=p.CodigoProduto);
GO