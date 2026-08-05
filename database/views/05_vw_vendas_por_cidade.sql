USE ERP_Vendas_BI;
GO

/******************************************************************************
 Projeto.....: ERP_Vendas_BI
 Arquivo.....: 05_vw_vendas_por_cidade.sql
 Descrição...: Consolidado de vendas por cidade
 Autor.......: Valmir José da Silva de Lucena
******************************************************************************/

CREATE OR ALTER VIEW dbo.vw_VendasPorCidade
AS
SELECT
    CI.IdCidade,
    CI.NomeCidade,

    COUNT(DISTINCT C.IdCliente) AS QuantidadeClientes,

    COUNT(DISTINCT P.IdPedido) AS QuantidadePedidos,

    SUM(P.ValorTotalPedido) AS FaturamentoTotal,

    AVG(P.ValorTotalPedido) AS TicketMedio,

    MIN(P.DataPedido) AS PrimeiraVenda,

    MAX(P.DataPedido) AS UltimaVenda

FROM cad.Cidade CI

INNER JOIN cad.Cliente C
    ON C.IdCidade = CI.IdCidade

INNER JOIN com.Pedido P
    ON P.IdCliente = C.IdCliente

WHERE P.StatusPedido = 'FINALIZADO'

GROUP BY
    CI.IdCidade,
    CI.NomeCidade;
GO