USE ERP_Vendas_BI;
GO

/******************************************************************************
 Projeto.....: ERP_Vendas_BI
 Arquivo.....: 08_vw_top_produtos_cidade.sql
 Descrição...: Ranking de produtos vendidos por cidade
 Autor.......: Valmir José da Silva de Lucena
******************************************************************************/

CREATE OR ALTER VIEW dbo.vw_TopProdutosCidade
AS
SELECT
    CI.IdCidade,
    CI.NomeCidade,

    PR.IdProduto,
    PR.CodigoProduto,
    PR.NomeProduto,

    CAT.NomeCategoria,

    COUNT(DISTINCT P.IdPedido) AS QuantidadePedidos,

    SUM(IP.Quantidade) AS QuantidadeVendida,

    SUM(IP.ValorTotal) AS ReceitaTotal,

    SUM(IP.PrecoCusto * IP.Quantidade) AS CustoTotal,

    SUM(IP.ValorTotal)
        - SUM(IP.PrecoCusto * IP.Quantidade) AS MargemBruta

FROM com.ItemPedido IP

INNER JOIN com.Pedido P
    ON P.IdPedido = IP.IdPedido

INNER JOIN cad.Cliente CL
    ON CL.IdCliente = P.IdCliente

INNER JOIN cad.Cidade CI
    ON CI.IdCidade = CL.IdCidade

INNER JOIN cad.Produto PR
    ON PR.IdProduto = IP.IdProduto

INNER JOIN cad.Categoria CAT
    ON CAT.IdCategoria = PR.IdCategoria

WHERE P.StatusPedido = 'FINALIZADO'

GROUP BY
    CI.IdCidade,
    CI.NomeCidade,
    PR.IdProduto,
    PR.CodigoProduto,
    PR.NomeProduto,
    CAT.NomeCategoria;
GO