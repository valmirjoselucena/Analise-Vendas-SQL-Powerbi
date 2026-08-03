USE ERP_Vendas_BI;
GO

/******************************************************************************
 Projeto.....: ERP_Vendas_BI
 Arquivo.....: 10_seed_pedidos.sql
 Descrição...: Geração de pedidos para análises comerciais
 Autor.......: Valmir José da Silva de Lucena
******************************************************************************/

SET NOCOUNT ON;
GO

DECLARE
    @Contador INT = 1,
    @IdCliente INT,
    @IdVendedor INT,
    @IdLoja INT,
    @ValorProdutos DECIMAL(18,2),
    @ValorDesconto DECIMAL(18,2),
    @ValorFrete DECIMAL(18,2),
    @ValorTotal DECIMAL(18,2),
    @Status VARCHAR(30),
    @DataPedido DATETIME2;

WHILE @Contador <= 2000
BEGIN

    SELECT TOP 1
        @IdCliente = IdCliente
    FROM cad.Cliente
    ORDER BY NEWID();

    SELECT TOP 1
        @IdVendedor = IdVendedor
    FROM cad.Vendedor
    ORDER BY NEWID();

    SELECT TOP 1
        @IdLoja = IdLoja
    FROM cad.Loja
    ORDER BY NEWID();

    SET @ValorProdutos =
        CAST(
            ((ABS(CHECKSUM(NEWID())) % 2900) + 100)
            AS DECIMAL(18,2)
        );

    SET @ValorDesconto =
        ROUND(@ValorProdutos * (
            (ABS(CHECKSUM(NEWID())) % 10) / 100.0
        ),2);

    SET @ValorFrete =
        CAST(
            (ABS(CHECKSUM(NEWID())) % 50)
            AS DECIMAL(18,2)
        );

    SET @ValorTotal =
        @ValorProdutos
        - @ValorDesconto
        + @ValorFrete;

    SET @DataPedido =
        DATEADD
        (
            DAY,
            -(ABS(CHECKSUM(NEWID())) % 550),
            GETDATE()
        );

    SET @Status =
        CASE
            WHEN @Contador % 20 = 0 THEN 'CANCELADO'
            WHEN @Contador % 7 = 0 THEN 'ABERTO'
            ELSE 'FINALIZADO'
        END;

    INSERT INTO com.Pedido
    (
        IdCliente,
        IdVendedor,
        IdLoja,
        DataPedido,
        StatusPedido,
        ValorTotalProdutos,
        ValorDesconto,
        ValorFrete,
        ValorTotalPedido,
        Observacao,
        DataCadastro,
        IdUsuarioCadastro,
        RegistroAtivo
    )
    VALUES
    (
        @IdCliente,
        @IdVendedor,
        @IdLoja,
        @DataPedido,
        @Status,
        @ValorProdutos,
        @ValorDesconto,
        @ValorFrete,
        @ValorTotal,
        'Pedido gerado automaticamente por seed.',
        GETDATE(),
        1,
        1
    );

    SET @Contador += 1;

END;
GO

PRINT '2000 pedidos gerados com sucesso.';
GO

SELECT
    COUNT(*) AS TotalPedidos
FROM com.Pedido;
GO