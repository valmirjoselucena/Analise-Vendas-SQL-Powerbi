CREATE TABLE est.MovimentacaoEstoque
(
    IdMovimentacaoEstoque INT IDENTITY(1,1) NOT NULL,

    IdProduto INT NOT NULL,

    IdLoja INT NOT NULL,

    IdTipoMovimentacao INT NOT NULL,


    Quantidade DECIMAL(18,4) NOT NULL,


    ValorCusto DECIMAL(18,2) NOT NULL,


    DocumentoOrigem VARCHAR(50) NULL,


    Observacao VARCHAR(300) NULL,


    DataMovimentacao DATETIME2 NOT NULL
        DEFAULT(GETDATE()),


    DataCadastro DATETIME2 NOT NULL
        DEFAULT(GETDATE()),


    IdUsuarioCadastro INT NOT NULL,


    DataAlteracao DATETIME2 NULL,

    IdUsuarioAlteracao INT NULL,


    RegistroAtivo BIT NOT NULL
        DEFAULT(1),


    CONSTRAINT PK_MovimentacaoEstoque
        PRIMARY KEY(IdMovimentacaoEstoque)
);
GO