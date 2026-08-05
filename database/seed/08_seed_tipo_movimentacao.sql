USE ERP_Vendas_BI;
GO

/******************************************************************************
 Projeto.....: ERP_Vendas_BI
 Arquivo.....: 08_seed_tipo_movimentacao.sql
 Descrição...: Seed inicial dos tipos de movimentação de estoque
 Autor.......: Valmir José da Silva de Lucena
******************************************************************************/

SET NOCOUNT ON;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    IF NOT EXISTS
    (
        SELECT 1
        FROM est.TipoMovimentacao
        WHERE Codigo = 'ENTRADA_COMPRA'
    )
    BEGIN
        INSERT INTO est.TipoMovimentacao
        (
            Codigo,
            Descricao,
            TipoOperacao,
            DataCadastro,
            IdUsuarioCadastro,
            RegistroAtivo
        )
        VALUES
        (
            'ENTRADA_COMPRA',
            'Entrada de produtos por compra',
            'E',
            GETDATE(),
            1,
            1
        );
    END;

    IF NOT EXISTS
    (
        SELECT 1
        FROM est.TipoMovimentacao
        WHERE Codigo = 'AJUSTE_ENTRADA'
    )
    BEGIN
        INSERT INTO est.TipoMovimentacao
        (
            Codigo,
            Descricao,
            TipoOperacao,
            DataCadastro,
            IdUsuarioCadastro,
            RegistroAtivo
        )
        VALUES
        (
            'AJUSTE_ENTRADA',
            'Ajuste positivo de estoque',
            'E',
            GETDATE(),
            1,
            1
        );
    END;

    IF NOT EXISTS
    (
        SELECT 1
        FROM est.TipoMovimentacao
        WHERE Codigo = 'DEVOLUCAO_CLIENTE'
    )
    BEGIN
        INSERT INTO est.TipoMovimentacao
        (
            Codigo,
            Descricao,
            TipoOperacao,
            DataCadastro,
            IdUsuarioCadastro,
            RegistroAtivo
        )
        VALUES
        (
            'DEVOLUCAO_CLIENTE',
            'Retorno de produtos devolvidos por clientes',
            'E',
            GETDATE(),
            1,
            1
        );
    END;

    IF NOT EXISTS
    (
        SELECT 1
        FROM est.TipoMovimentacao
        WHERE Codigo = 'VENDA'
    )
    BEGIN
        INSERT INTO est.TipoMovimentacao
        (
            Codigo,
            Descricao,
            TipoOperacao,
            DataCadastro,
            IdUsuarioCadastro,
            RegistroAtivo
        )
        VALUES
        (
            'VENDA',
            'Baixa de estoque por venda',
            'S',
            GETDATE(),
            1,
            1
        );
    END;

    IF NOT EXISTS
    (
        SELECT 1
        FROM est.TipoMovimentacao
        WHERE Codigo = 'AJUSTE_SAIDA'
    )
    BEGIN
        INSERT INTO est.TipoMovimentacao
        (
            Codigo,
            Descricao,
            TipoOperacao,
            DataCadastro,
            IdUsuarioCadastro,
            RegistroAtivo
        )
        VALUES
        (
            'AJUSTE_SAIDA',
            'Ajuste negativo de estoque',
            'S',
            GETDATE(),
            1,
            1
        );
    END;

    IF NOT EXISTS
    (
        SELECT 1
        FROM est.TipoMovimentacao
        WHERE Codigo = 'PERDA'
    )
    BEGIN
        INSERT INTO est.TipoMovimentacao
        (
            Codigo,
            Descricao,
            TipoOperacao,
            DataCadastro,
            IdUsuarioCadastro,
            RegistroAtivo
        )
        VALUES
        (
            'PERDA',
            'Perda por avaria ou vencimento',
            'S',
            GETDATE(),
            1,
            1
        );
    END;

    COMMIT TRANSACTION;

END TRY
BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    THROW;

END CATCH;
GO

PRINT 'Seed de tipos de movimentação executado com sucesso.';
GO