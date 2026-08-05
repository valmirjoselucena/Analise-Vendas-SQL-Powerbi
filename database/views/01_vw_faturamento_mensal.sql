USE ERP_Vendas_BI;
GO

/******************************************************************************
 Projeto.....: ERP_Vendas_BI
 Arquivo.....: 01_vw_faturamento_mensal.sql
 Descrição...: Consolidado de faturamento mensal
 Autor.......: Valmir José da Silva de Lucena
******************************************************************************/

CREATE OR ALTER VIEW dbo.vw_FaturamentoMensal
AS
SELECT
    YEAR(P.DataPedido) AS Ano,
    MONTH(P.DataPedido) AS Mes,
    COUNT(DISTINCT P.IdPedido) AS QtdePedidos,
    COUNT(DISTINCT P.IdCliente) AS QtdeClientes,
    SUM(P.ValorTotalPedido) AS FaturamentoBruto,
    AVG(P.ValorTotalPedido) AS TicketMedio
FROM com.Pedido P
WHERE P.StatusPedido = 'FINALIZADO'
GROUP BY
    YEAR(P.DataPedido),
    MONTH(P.DataPedido);
GO