USE ERP_Vendas_BI;
GO

CREATE INDEX IX_Produto_Categoria
ON cad.Produto(IdCategoria);
GO

CREATE INDEX IX_Produto_Nome
ON cad.Produto(NomeProduto);
GO

CREATE INDEX IX_Produto_CodigoBarras
ON cad.Produto(CodigoBarras);
GO