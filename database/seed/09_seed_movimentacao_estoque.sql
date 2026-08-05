USE ERP_Vendas_BI;
GO

/******************************************************************************
 Projeto.....: ERP_Vendas_BI
 Arquivo.....: 09_seed_movimentacao_estoque.sql
 Descrição...: Geração inicial de movimentações de estoque
 Autor.......: Valmir José da Silva de Lucena
******************************************************************************/

SET NOCOUNT ON;
GO

DECLARE
    @IdProduto INT,
    @IdLoja INT,
    @Contador INT = 1,
    @Quantidade DECIMAL(18,4),
    @ValorCusto DECIMAL(18,2),
    @DataMovimentacao DATETIME2,
    @TipoMovimentacao INT;

WHILE @Contador <= 1000
BEGIN

    SELECT TOP 1
        @IdProduto = IdProduto
    FROM cad.Produto
    ORDER BY NEWID();

    SELECT TOP 1
        @IdLoja = IdLoja
    FROM cad.Loja
    ORDER BY NEWID();

    SELECT TOP 1
        @TipoMovimentacao = IdTipoMovimentacao
    FROM est.TipoMovimentacao
    ORDER BY NEWID();

    SELECT
        @ValorCusto = PrecoCustoAtual
    FROM cad.Produto
    WHERE IdProduto = @IdProduto;

    SET @Quantidade = (ABS(CHECKSUM(NEWID())) % 20) + 1;

    SET @DataMovimentacao =
        DATEADD
        (
            DAY,
            -(ABS(CHECKSUM(NEWID())) % 550),
            GETDATE()
        );

    INSERT INTO est.MovimentacaoEstoque
    (
        IdProduto,
        IdLoja,
        IdTipoMovimentacao,
        Quantidade,
        ValorCusto,
        DocumentoOrigem,
        Observacao,
        DataMovimentacao,
        DataCadastro,
        IdUsuarioCadastro,
        RegistroAtivo
    )
    VALUES
    (
        @IdProduto,
        @IdLoja,
        @TipoMovimentacao,
        @Quantidade,
        @ValorCusto,
        CONCAT('DOC-', FORMAT(@Contador,'000000')),
        'Movimentação gerada por seed',
        @DataMovimentacao,
        GETDATE(),
        1,
        1
    );

    SET @Contador += 1;

END;
GO

PRINT '1000 movimentações de estoque geradas com sucesso.';
GO

SELECT COUNT(*) AS TotalMovimentacoes
FROM est.MovimentacaoEstoque;
GO