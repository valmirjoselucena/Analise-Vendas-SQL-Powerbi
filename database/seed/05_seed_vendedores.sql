USE ERP_Vendas_BI;
GO

/******************************************************************************
 Projeto.....: ERP_Vendas_BI
 Arquivo.....: 05_seed_vendedores.sql
 Descrição...: Seed inicial de vendedores
 Autor.......: Valmir José da Silva de Lucena
******************************************************************************/

SET NOCOUNT ON;
GO

BEGIN TRY

    BEGIN TRANSACTION;

    --------------------------------------------------------------------------
    -- VENDEDORES
    --------------------------------------------------------------------------

    IF NOT EXISTS (SELECT 1 FROM cad.Vendedor WHERE CPF = '11111111111')
    BEGIN
        INSERT INTO cad.Vendedor
        (
            NomeVendedor,
            CPF,
            Telefone,
            Email,
            PercentualComissao,
            DataAdmissao,
            DataCadastro,
            IdUsuarioCadastro,
            RegistroAtivo
        )
        VALUES
        (
            'Carlos Henrique Souza',
            '11111111111',
            '(62)99999-0001',
            'carlos.souza@empresa.com.br',
            5.00,
            '2023-01-10',
            GETDATE(),
            1,
            1
        );
    END;

    IF NOT EXISTS (SELECT 1 FROM cad.Vendedor WHERE CPF = '11111111112')
    BEGIN
        INSERT INTO cad.Vendedor
        (
            NomeVendedor,
            CPF,
            Telefone,
            Email,
            PercentualComissao,
            DataAdmissao,
            DataCadastro,
            IdUsuarioCadastro,
            RegistroAtivo
        )
        VALUES
        (
            'Juliana Martins Lima',
            '11111111112',
            '(62)99999-0002',
            'juliana.lima@empresa.com.br',
            4.50,
            '2023-02-15',
            GETDATE(),
            1,
            1
        );
    END;

    IF NOT EXISTS (SELECT 1 FROM cad.Vendedor WHERE CPF = '11111111113')
    BEGIN
        INSERT INTO cad.Vendedor
        (
            NomeVendedor,
            CPF,
            Telefone,
            Email,
            PercentualComissao,
            DataAdmissao,
            DataCadastro,
            IdUsuarioCadastro,
            RegistroAtivo
        )
        VALUES
        (
            'Rafael Oliveira Santos',
            '11111111113',
            '(62)99999-0003',
            'rafael.santos@empresa.com.br',
            5.50,
            '2022-09-05',
            GETDATE(),
            1,
            1
        );
    END;

    IF NOT EXISTS (SELECT 1 FROM cad.Vendedor WHERE CPF = '11111111114')
    BEGIN
        INSERT INTO cad.Vendedor
        (
            NomeVendedor,
            CPF,
            Telefone,
            Email,
            PercentualComissao,
            DataAdmissao,
            DataCadastro,
            IdUsuarioCadastro,
            RegistroAtivo
        )
        VALUES
        (
            'Fernanda Costa Alves',
            '11111111114',
            '(62)99999-0004',
            'fernanda.alves@empresa.com.br',
            4.75,
            '2024-01-20',
            GETDATE(),
            1,
            1
        );
    END;

    IF NOT EXISTS (SELECT 1 FROM cad.Vendedor WHERE CPF = '11111111115')
    BEGIN
        INSERT INTO cad.Vendedor
        VALUES
        (
            'Lucas Almeida Rocha',
            '11111111115',
            '(62)99999-0005',
            'lucas.rocha@empresa.com.br',
            6.00,
            '2021-11-18',
            GETDATE(),
            1,
            NULL,NULL,NULL,NULL,
            1
        );
    END;

    IF NOT EXISTS (SELECT 1 FROM cad.Vendedor WHERE CPF = '11111111116')
    BEGIN
        INSERT INTO cad.Vendedor
        VALUES
        (
            'Mariana Ferreira Gomes',
            '11111111116',
            '(62)99999-0006',
            'mariana.gomes@empresa.com.br',
            5.25,
            '2023-06-01',
            GETDATE(),
            1,
            NULL,NULL,NULL,NULL,
            1
        );
    END;

    IF NOT EXISTS (SELECT 1 FROM cad.Vendedor WHERE CPF = '11111111117')
    BEGIN
        INSERT INTO cad.Vendedor
        VALUES
        (
            'Bruno Henrique Pereira',
            '11111111117',
            '(62)99999-0007',
            'bruno.pereira@empresa.com.br',
            4.80,
            '2022-07-11',
            GETDATE(),
            1,
            NULL,NULL,NULL,NULL,
            1
        );
    END;

    IF NOT EXISTS (SELECT 1 FROM cad.Vendedor WHERE CPF = '11111111118')
    BEGIN
        INSERT INTO cad.Vendedor
        VALUES
        (
            'Camila Rodrigues Silva',
            '11111111118',
            '(62)99999-0008',
            'camila.silva@empresa.com.br',
            5.10,
            '2023-10-02',
            GETDATE(),
            1,
            NULL,NULL,NULL,NULL,
            1
        );
    END;

    IF NOT EXISTS (SELECT 1 FROM cad.Vendedor WHERE CPF = '11111111119')
    BEGIN
        INSERT INTO cad.Vendedor
        VALUES
        (
            'Eduardo Mendes Costa',
            '11111111119',
            '(62)99999-0009',
            'eduardo.costa@empresa.com.br',
            5.75,
            '2021-05-14',
            GETDATE(),
            1,
            NULL,NULL,NULL,NULL,
            1
        );
    END;

    IF NOT EXISTS (SELECT 1 FROM cad.Vendedor WHERE CPF = '11111111120')
    BEGIN
        INSERT INTO cad.Vendedor
        VALUES
        (
            'Patricia Barros Lima',
            '11111111120',
            '(62)99999-0010',
            'patricia.lima@empresa.com.br',
            4.90,
            '2024-02-01',
            GETDATE(),
            1,
            NULL,NULL,NULL,NULL,
            1
        );
    END;

    --------------------------------------------------------------------------

    COMMIT TRANSACTION;

END TRY

BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    THROW;

END CATCH;
GO

PRINT 'Seed de vendedores executado com sucesso.';
GO

SELECT
    COUNT(*) AS TotalVendedores
FROM cad.Vendedor;
GO