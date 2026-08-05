USE ERP_Vendas_BI;
GO

/******************************************************************************
 Projeto.....: ERP_Vendas_BI
 Arquivo.....: 06_vw_giro_produtos.sql
 Descrição...: Indicadores de estoque e giro de produtos
 Autor.......: Valmir José da Silva de Lucena
******************************************************************************/

CREATE OR ALTER VIEW dbo.vw_GiroProdutos
AS
SELECT
    P.IdProduto,
    P.CodigoProduto,
    P.NomeProduto,
    C.NomeCategoria,

    SUM(ISNULL(IP.Quantidade, 0)) AS QuantidadeVendida,

    SUM(ISNULL(PL.QuantidadeEstoque, 0)) AS EstoqueAtual,

    SUM(ISNULL(PL.EstoqueMinimo, 0)) AS EstoqueMinimo,

    CASE
        WHEN SUM(ISNULL(PL.QuantidadeEstoque, 0))
             <= SUM(ISNULL(PL.EstoqueMinimo, 0))
        THEN 'BAIXO'
        ELSE 'NORMAL'
    END AS SituacaoEstoque,

    CASE
        WHEN SUM(ISNULL(IP.Quantidade, 0)) = 0
        THEN 0
        ELSE
            SUM(ISNULL(IP.Quantidade, 0))
            /
            NULLIF(SUM(ISNULL(PL.QuantidadeEstoque, 0)),0)
    END AS IndiceGiro

FROM cad.Produto P

INNER JOIN cad.Categoria C
    ON C.IdCategoria = P.IdCategoria

LEFT JOIN com.ItemPedido IP
    ON IP.IdProduto = P.IdProduto

LEFT JOIN est.ProdutoLoja PL
    ON PL.IdProduto = P.IdProduto

GROUP BY
    P.IdProduto,
    P.CodigoProduto,
    P.NomeProduto,
    C.NomeCategoria;
GO