CREATE INDEX IX_ProdutoLoja_Produto
ON est.ProdutoLoja(IdProduto);


CREATE INDEX IX_ProdutoLoja_Loja
ON est.ProdutoLoja(IdLoja);


CREATE INDEX IX_MovimentacaoEstoque_Produto
ON est.MovimentacaoEstoque(IdProduto);


CREATE INDEX IX_MovimentacaoEstoque_Data
ON est.MovimentacaoEstoque(DataMovimentacao);