USE ERP_Vendas_BI;
GO

/******************************************************************************
 Projeto.....: ERP_Vendas_BI
 Arquivo.....: 04_vw_performance_vendedores.sql
 Descrição...: Performance comercial dos vendedores
 Autor.......: Valmir José da Silva de Lucena
******************************************************************************/

CREATE OR ALTER VIEW dbo.vw_PerformanceVendedores
AS
SELECT
    V.IdVendedor,
    V.NomeVendedor,
    V.PercentualComissao,

    COUNT(DISTINCT P.IdPedido) AS QuantidadePedidos,

    COUNT(DISTINCT P.IdCliente) AS QuantidadeClientes,

    SUM(P.ValorTotalPedido) AS FaturamentoTotal,

    AVG(P.ValorTotalPedido) AS TicketMedio,

    SUM(
        P.ValorTotalPedido
        * (V.PercentualComissao / 100.0)
    ) AS ComissaoEstimada,

    MIN(P.DataPedido) AS PrimeiraVenda,

    MAX(P.DataPedido) AS UltimaVenda

FROM cad.Vendedor V

INNER JOIN com.Pedido P
    ON P.IdVendedor = V.IdVendedor

WHERE P.StatusPedido = 'FINALIZADO'

GROUP BY
    V.IdVendedor,
    V.NomeVendedor,
    V.PercentualComissao;
GO