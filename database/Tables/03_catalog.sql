USE ERP_Vendas_BI;
GO

/*==============================================================================
TABELA: Categoria
SCHEMA : cad
DESCRIÇÃO:
Armazena as categorias dos produtos comercializados.
==============================================================================*/

CREATE TABLE cad.Categoria
(
    IdCategoria INT IDENTITY(1,1) NOT NULL,

    NomeCategoria VARCHAR(100) NOT NULL,

    Descricao VARCHAR(300) NULL,

    DataCadastro DATETIME2 NOT NULL
        CONSTRAINT DF_Categoria_DataCadastro DEFAULT(GETDATE()),

    IdUsuarioCadastro INT NOT NULL,

    DataAlteracao DATETIME2 NULL,

    IdUsuarioAlteracao INT NULL,

    DataExclusao DATETIME2 NULL,

    IdUsuarioExclusao INT NULL,

    RegistroAtivo BIT NOT NULL
        CONSTRAINT DF_Categoria_RegistroAtivo DEFAULT(1),

    CONSTRAINT PK_Categoria
        PRIMARY KEY CLUSTERED (IdCategoria),

    CONSTRAINT UQ_Categoria_Nome
        UNIQUE (NomeCategoria),

    CONSTRAINT FK_Categoria_UsuarioCadastro
        FOREIGN KEY (IdUsuarioCadastro)
        REFERENCES seg.Usuario(IdUsuario),

    CONSTRAINT FK_Categoria_UsuarioAlteracao
        FOREIGN KEY (IdUsuarioAlteracao)
        REFERENCES seg.Usuario(IdUsuario),

    CONSTRAINT FK_Categoria_UsuarioExclusao
        FOREIGN KEY (IdUsuarioExclusao)
        REFERENCES seg.Usuario(IdUsuario)
);
GO


/*==============================================================================
TABELA: Produto
SCHEMA : cad
DESCRIÇÃO:
Cadastro de produtos comercializados pela empresa.
==============================================================================*/

CREATE TABLE cad.Produto
(
    IdProduto INT IDENTITY(1,1) NOT NULL,

    IdCategoria INT NOT NULL,

    CodigoProduto VARCHAR(30) NOT NULL,

    CodigoBarras VARCHAR(20) NULL,

    NomeProduto VARCHAR(200) NOT NULL,

    Descricao VARCHAR(500) NULL,

    UnidadeMedida VARCHAR(10) NOT NULL,

    Peso DECIMAL(10,3) NULL,

    PrecoCustoAtual DECIMAL(18,2) NOT NULL,

    PrecoVendaAtual DECIMAL(18,2) NOT NULL,

    EstoqueAtual DECIMAL(18,4) NOT NULL
        CONSTRAINT DF_Produto_EstoqueAtual DEFAULT(0),

    EstoqueMinimo DECIMAL(18,4) NOT NULL
        CONSTRAINT DF_Produto_EstoqueMinimo DEFAULT(0),

    DataCadastro DATETIME2 NOT NULL
        CONSTRAINT DF_Produto_DataCadastro DEFAULT(GETDATE()),

    IdUsuarioCadastro INT NOT NULL,

    DataAlteracao DATETIME2 NULL,

    IdUsuarioAlteracao INT NULL,

    DataExclusao DATETIME2 NULL,

    IdUsuarioExclusao INT NULL,

    RegistroAtivo BIT NOT NULL
        CONSTRAINT DF_Produto_RegistroAtivo DEFAULT(1),

    CONSTRAINT PK_Produto
        PRIMARY KEY CLUSTERED (IdProduto),

    CONSTRAINT FK_Produto_Categoria
        FOREIGN KEY (IdCategoria)
        REFERENCES cad.Categoria(IdCategoria),

    CONSTRAINT FK_Produto_UsuarioCadastro
        FOREIGN KEY (IdUsuarioCadastro)
        REFERENCES seg.Usuario(IdUsuario),

    CONSTRAINT FK_Produto_UsuarioAlteracao
        FOREIGN KEY (IdUsuarioAlteracao)
        REFERENCES seg.Usuario(IdUsuario),

    CONSTRAINT FK_Produto_UsuarioExclusao
        FOREIGN KEY (IdUsuarioExclusao)
        REFERENCES seg.Usuario(IdUsuario),

    CONSTRAINT UQ_Produto_Codigo
        UNIQUE (CodigoProduto),

    CONSTRAINT UQ_Produto_CodigoBarras
        UNIQUE (CodigoBarras),

    CONSTRAINT CK_Produto_PrecoCusto
        CHECK (PrecoCustoAtual >= 0),

    CONSTRAINT CK_Produto_PrecoVenda
        CHECK (PrecoVendaAtual >= 0),

    CONSTRAINT CK_Produto_EstoqueAtual
        CHECK (EstoqueAtual >= 0),

    CONSTRAINT CK_Produto_EstoqueMinimo
        CHECK (EstoqueMinimo >= 0)
);
GO