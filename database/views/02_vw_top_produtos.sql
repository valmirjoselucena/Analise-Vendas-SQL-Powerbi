USE ERP_Vendas_BI;
GO

/******************************************************************************
 Projeto.....: ERP_Vendas_BI
 Arquivo.....: 02_vw_top_produtos.sql
 Descrição...: Ranking de produtos vendidos
 Autor.......: Valmir José da Silva de Lucena
******************************************************************************/

CREATE OR ALTER VIEW dbo.vw_TopProdutos
AS
SELECT
    PR.IdProduto,
    PR.CodigoProduto,
    PR.NomeProduto,
    C.NomeCategoria,

    COUNT(DISTINCT IP.IdPedido) AS QtdePedidos,

    SUM(IP.Quantidade) AS QuantidadeVendida,

    SUM(IP.ValorTotal) AS ReceitaTotal,

    SUM(IP.PrecoCusto * IP.Quantidade) AS CustoTotal,

    SUM(IP.ValorTotal)
      - SUM(IP.PrecoCusto * IP.Quantidade) AS MargemBruta,

    CASE
        WHEN SUM(IP.ValorTotal) = 0 THEN 0
        ELSE
        (
            (
                SUM(IP.ValorTotal)
                - SUM(IP.PrecoCusto * IP.Quantidade)
            ) * 100.0
        ) / SUM(IP.ValorTotal)
    END AS MargemPercentual

FROM com.ItemPedido IP
INNER JOIN cad.Produto PR
    ON PR.IdProduto = IP.IdProduto

INNER JOIN cad.Categoria C
    ON C.IdCategoria = PR.IdCategoria

GROUP BY
    PR.IdProduto,
    PR.CodigoProduto,
    PR.NomeProduto,
    C.NomeCategoria;
GO