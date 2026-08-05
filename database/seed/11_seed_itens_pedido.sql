USE ERP_Vendas_BI;
GO

/******************************************************************************
 Projeto.....: ERP_Vendas_BI
 Arquivo.....: 11_seed_itens_pedido.sql
 Descrição...: Geração de itens para os pedidos
 Autor.......: Valmir José da Silva de Lucena
******************************************************************************/

SET NOCOUNT ON;
GO

DECLARE
    @PedidoAtual INT = 1,
    @UltimoPedido INT,
    @ItensPedido INT,
    @Contador INT,
    @IdProduto INT,
    @Quantidade DECIMAL(18,4),
    @PrecoVenda DECIMAL(18,2),
    @PrecoCusto DECIMAL(18,2),
    @PercentualDesconto DECIMAL(5,2),
    @ValorDesconto DECIMAL(18,2),
    @ValorTotal DECIMAL(18,2);

SELECT
    @UltimoPedido = MAX(IdPedido)
FROM com.Pedido;

WHILE @PedidoAtual <= @UltimoPedido
BEGIN

    SET @ItensPedido = (ABS(CHECKSUM(NEWID())) % 4) + 1;
    SET @Contador = 1;

    WHILE @Contador <= @ItensPedido
    BEGIN

        SELECT TOP 1
            @IdProduto = IdProduto,
            @PrecoVenda = PrecoVendaAtual,
            @PrecoCusto = PrecoCustoAtual
        FROM cad.Produto
        ORDER BY NEWID();

        SET @Quantidade =
            CAST(
                (ABS(CHECKSUM(NEWID())) % 5) + 1
                AS DECIMAL(18,4)
            );

        SET @PercentualDesconto =
            CAST(
                (ABS(CHECKSUM(NEWID())) % 15)
                AS DECIMAL(5,2)
            );

        SET @ValorDesconto =
            ROUND(
                (@PrecoVenda * @Quantidade)
                * (@PercentualDesconto / 100.0),
                2
            );

        SET @ValorTotal =
            ROUND(
                (@PrecoVenda * @Quantidade)
                - @ValorDesconto,
                2
            );

        INSERT INTO com.ItemPedido
        (
            IdPedido,
            IdProduto,
            Quantidade,
            PrecoVenda,
            PrecoCusto,
            PercentualDesconto,
            ValorDesconto,
            ValorTotal,
            DataCadastro,
            IdUsuarioCadastro,
            RegistroAtivo
        )
        VALUES
        (
            @PedidoAtual,
            @IdProduto,
            @Quantidade,
            @PrecoVenda,
            @PrecoCusto,
            @PercentualDesconto,
            @ValorDesconto,
            @ValorTotal,
            GETDATE(),
            1,
            1
        );

        SET @Contador += 1;

    END;

    SET @PedidoAtual += 1;

END;
GO

PRINT 'Itens de pedido gerados com sucesso.';
GO

SELECT
    COUNT(*) AS TotalItensPedido
FROM com.ItemPedido;
GO