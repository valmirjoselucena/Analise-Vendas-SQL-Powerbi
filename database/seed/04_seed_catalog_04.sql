USE ERP_Vendas_BI;
GO

DECLARE @Produtos TABLE(Categoria varchar(100),CodigoProduto varchar(30),CodigoBarras varchar(20),NomeProduto varchar(200),Descricao varchar(500),Unidade varchar(10),Peso decimal(10,3),Custo decimal(18,2),Venda decimal(18,2),Estoque decimal(18,4),EstoqueMinimo decimal(18,4));
INSERT INTO @Produtos VALUES
('Telefonia','TEL076','7890000000076','Produto TEL 76','Descrição 76','UN',1.000,480,682,20,5),
('Telefonia','TEL077','7890000000077','Produto TEL 77','Descrição 77','UN',1.000,485,689,20,5),
('Telefonia','TEL078','7890000000078','Produto TEL 78','Descrição 78','UN',1.000,490,696,20,5),
('Telefonia','TEL079','7890000000079','Produto TEL 79','Descrição 79','UN',1.000,495,703,20,5),
('Telefonia','TEL080','7890000000080','Produto TEL 80','Descrição 80','UN',1.000,500,710,20,5),
('Impressoras','IMP081','7890000000081','Produto IMP 81','Descrição 81','UN',1.000,505,717,20,5),
('Impressoras','IMP082','7890000000082','Produto IMP 82','Descrição 82','UN',1.000,510,724,20,5),
('Impressoras','IMP083','7890000000083','Produto IMP 83','Descrição 83','UN',1.000,515,731,20,5),
('Impressoras','IMP084','7890000000084','Produto IMP 84','Descrição 84','UN',1.000,520,738,20,5),
('Impressoras','IMP085','7890000000085','Produto IMP 85','Descrição 85','UN',1.000,525,745,20,5),
('Impressoras','IMP086','7890000000086','Produto IMP 86','Descrição 86','UN',1.000,530,752,20,5),
('Impressoras','IMP087','7890000000087','Produto IMP 87','Descrição 87','UN',1.000,535,759,20,5),
('Impressoras','IMP088','7890000000088','Produto IMP 88','Descrição 88','UN',1.000,540,766,20,5),
('Impressoras','IMP089','7890000000089','Produto IMP 89','Descrição 89','UN',1.000,545,773,20,5),
('Impressoras','IMP090','7890000000090','Produto IMP 90','Descrição 90','UN',1.000,550,780,20,5),
('Impressoras','IMP091','7890000000091','Produto IMP 91','Descrição 91','UN',1.000,555,787,20,5),
('Impressoras','IMP092','7890000000092','Produto IMP 92','Descrição 92','UN',1.000,560,794,20,5),
('Impressoras','IMP093','7890000000093','Produto IMP 93','Descrição 93','UN',1.000,565,801,20,5),
('Impressoras','IMP094','7890000000094','Produto IMP 94','Descrição 94','UN',1.000,570,808,20,5),
('Impressoras','IMP095','7890000000095','Produto IMP 95','Descrição 95','UN',1.000,575,815,20,5),
('Impressoras','IMP096','7890000000096','Produto IMP 96','Descrição 96','UN',1.000,580,822,20,5),
('Impressoras','IMP097','7890000000097','Produto IMP 97','Descrição 97','UN',1.000,585,829,20,5),
('Impressoras','IMP098','7890000000098','Produto IMP 98','Descrição 98','UN',1.000,590,836,20,5),
('Impressoras','IMP099','7890000000099','Produto IMP 99','Descrição 99','UN',1.000,595,843,20,5),
('Impressoras','IMP100','7890000000100','Produto IMP 100','Descrição 100','UN',1.000,600,850,20,5);

INSERT INTO cad.Produto
(IdCategoria,CodigoProduto,CodigoBarras,NomeProduto,Descricao,UnidadeMedida,Peso,PrecoCustoAtual,PrecoVendaAtual,EstoqueAtual,EstoqueMinimo,DataCadastro,IdUsuarioCadastro,RegistroAtivo)
SELECT c.IdCategoria,p.CodigoProduto,p.CodigoBarras,p.NomeProduto,p.Descricao,p.Unidade,p.Peso,p.Custo,p.Venda,p.Estoque,p.EstoqueMinimo,GETDATE(),1,1
FROM @Produtos p JOIN cad.Categoria c ON c.NomeCategoria=p.Categoria
WHERE NOT EXISTS(SELECT 1 FROM cad.Produto x WHERE x.CodigoProduto=p.CodigoProduto);
GO