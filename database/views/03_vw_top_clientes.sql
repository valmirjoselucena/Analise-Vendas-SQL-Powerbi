USE ERP_Vendas_BI;
GO

/******************************************************************************
 Projeto.....: ERP_Vendas_BI
 Arquivo.....: 03_vw_top_clientes.sql
 Descrição...: Ranking de clientes por faturamento
 Autor.......: Valmir José da Silva de Lucena
******************************************************************************/

CREATE OR ALTER VIEW dbo.vw_TopClientes
AS
SELECT
    C.IdCliente,
    C.NomeCliente,
    C.CPF,
    CI.NomeCidade,

    COUNT(DISTINCT P.IdPedido) AS QuantidadePedidos,

    SUM(P.ValorTotalPedido) AS ValorTotalComprado,

    AVG(P.ValorTotalPedido) AS TicketMedio,

    MIN(P.DataPedido) AS PrimeiraCompra,

    MAX(P.DataPedido) AS UltimaCompra,

    DATEDIFF(
        DAY,
        MAX(P.DataPedido),
        GETDATE()
    ) AS DiasSemComprar

FROM cad.Cliente C

INNER JOIN com.Pedido P
    ON P.IdCliente = C.IdCliente

LEFT JOIN cad.Cidade CI
    ON CI.IdCidade = C.IdCidade

WHERE P.StatusPedido = 'FINALIZADO'

GROUP BY
    C.IdCliente,
    C.NomeCliente,
    C.CPF,
    CI.NomeCidade;
GO