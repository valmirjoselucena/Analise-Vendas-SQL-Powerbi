USE ERP_Vendas_BI;
GO

/******************************************************************************
 Projeto.....: ERP_Vendas_BI
 Arquivo.....: 07_seed_produto_loja.sql
 Descrição...: Distribuição de estoque dos produtos por loja
 Autor.......: Valmir José da Silva de Lucena
******************************************************************************/

SET NOCOUNT ON;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    --------------------------------------------------------------------------
    -- LOJA MATRIZ
    --------------------------------------------------------------------------

    INSERT INTO est.ProdutoLoja
    (
        IdProduto,
        IdLoja,
        QuantidadeEstoque,
        EstoqueMinimo,
        EstoqueReservado,
        DataCadastro,
        IdUsuarioCadastro,
        RegistroAtivo
    )
    SELECT
        P.IdProduto,
        1,
        150 + (P.IdProduto % 100),
        15,
        P.IdProduto % 10,
        GETDATE(),
        1,
        1
    FROM cad.Produto P
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM est.ProdutoLoja PL
        WHERE PL.IdProduto = P.IdProduto
        AND PL.IdLoja = 1
    );

    --------------------------------------------------------------------------
    -- FILIAL SHOPPING
    --------------------------------------------------------------------------

    INSERT INTO est.ProdutoLoja
    (
        IdProduto,
        IdLoja,
        QuantidadeEstoque,
        EstoqueMinimo,
        EstoqueReservado,
        DataCadastro,
        IdUsuarioCadastro,
        RegistroAtivo
    )
    SELECT
        P.IdProduto,
        2,
        80 + (P.IdProduto % 70),
        10,
        P.IdProduto % 5,
        GETDATE(),
        1,
        1
    FROM cad.Produto P
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM est.ProdutoLoja PL
        WHERE PL.IdProduto = P.IdProduto
        AND PL.IdLoja = 2
    );

    COMMIT TRANSACTION;

END TRY
BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    THROW;

END CATCH;
GO

PRINT 'Seed de ProdutoLoja executado com sucesso.';
GO

SELECT
    COUNT(*) AS TotalRegistros
FROM est.ProdutoLoja;
GO