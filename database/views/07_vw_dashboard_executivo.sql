USE ERP_Vendas_BI;
GO

/******************************************************************************
 Projeto.....: ERP_Vendas_BI
 Arquivo.....: 07_vw_dashboard_executivo.sql
 Descrição...: Indicadores executivos para dashboard
 Autor.......: Valmir José da Silva de Lucena
******************************************************************************/

CREATE OR ALTER VIEW dbo.vw_DashboardExecutivo
AS
SELECT
    COUNT(DISTINCT P.IdPedido) AS TotalPedidos,

    COUNT(DISTINCT CASE
        WHEN P.StatusPedido = 'FINALIZADO'
        THEN P.IdPedido
    END) AS PedidosFinalizados,

    COUNT(DISTINCT CASE
        WHEN P.StatusPedido = 'CANCELADO'
        THEN P.IdPedido
    END) AS PedidosCancelados,

    COUNT(DISTINCT P.IdCliente) AS ClientesAtivos,

    COUNT(DISTINCT P.IdVendedor) AS VendedoresAtivos,

    COUNT(DISTINCT IP.IdProduto) AS ProdutosVendidos,

    SUM(IP.Quantidade) AS QuantidadeItensVendidos,

    SUM(P.ValorTotalPedido) AS FaturamentoTotal,

    AVG(P.ValorTotalPedido) AS TicketMedio,

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
            )
            / SUM(IP.ValorTotal)
    END AS MargemPercentual

FROM com.Pedido P
INNER JOIN com.ItemPedido IP
    ON IP.IdPedido = P.IdPedido
WHERE P.StatusPedido = 'FINALIZADO';
GO