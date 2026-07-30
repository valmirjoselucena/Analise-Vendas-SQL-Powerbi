USE ERP_Vendas_BI;
GO

/*==============================================================================
TABELA: Estado
SCHEMA : cad
==============================================================================*/

CREATE TABLE cad.Estado
(
    IdEstado INT IDENTITY(1,1) NOT NULL,

    UF CHAR(2) NOT NULL,

    NomeEstado VARCHAR(100) NOT NULL,

    DataCadastro DATETIME2 NOT NULL
        CONSTRAINT DF_Estado_DataCadastro
        DEFAULT(GETDATE()),

    IdUsuarioCadastro INT NOT NULL,

    DataAlteracao DATETIME2 NULL,

    IdUsuarioAlteracao INT NULL,

    DataExclusao DATETIME2 NULL,

    IdUsuarioExclusao INT NULL,

    RegistroAtivo BIT NOT NULL
        CONSTRAINT DF_Estado_RegistroAtivo
        DEFAULT(1),

    CONSTRAINT PK_Estado
        PRIMARY KEY CLUSTERED(IdEstado),

    CONSTRAINT UQ_Estado_UF
        UNIQUE(UF),

    CONSTRAINT UQ_Estado_Nome
        UNIQUE(NomeEstado),

    CONSTRAINT FK_Estado_UsuarioCadastro
        FOREIGN KEY(IdUsuarioCadastro)
        REFERENCES seg.Usuario(IdUsuario),

    CONSTRAINT FK_Estado_UsuarioAlteracao
        FOREIGN KEY(IdUsuarioAlteracao)
        REFERENCES seg.Usuario(IdUsuario),

    CONSTRAINT FK_Estado_UsuarioExclusao
        FOREIGN KEY(IdUsuarioExclusao)
        REFERENCES seg.Usuario(IdUsuario)
);
GO


/*==============================================================================
TABELA: Cidade
SCHEMA : cad
==============================================================================*/

CREATE TABLE cad.Cidade
(
    IdCidade INT IDENTITY(1,1) NOT NULL,

    IdEstado INT NOT NULL,

    NomeCidade VARCHAR(150) NOT NULL,

    DataCadastro DATETIME2 NOT NULL
        CONSTRAINT DF_Cidade_DataCadastro
        DEFAULT(GETDATE()),

    IdUsuarioCadastro INT NOT NULL,

    DataAlteracao DATETIME2 NULL,

    IdUsuarioAlteracao INT NULL,

    DataExclusao DATETIME2 NULL,

    IdUsuarioExclusao INT NULL,

    RegistroAtivo BIT NOT NULL
        CONSTRAINT DF_Cidade_RegistroAtivo
        DEFAULT(1),

    CONSTRAINT PK_Cidade
        PRIMARY KEY CLUSTERED(IdCidade),

    CONSTRAINT FK_Cidade_Estado
        FOREIGN KEY(IdEstado)
        REFERENCES cad.Estado(IdEstado),

    CONSTRAINT FK_Cidade_UsuarioCadastro
        FOREIGN KEY(IdUsuarioCadastro)
        REFERENCES seg.Usuario(IdUsuario),

    CONSTRAINT FK_Cidade_UsuarioAlteracao
        FOREIGN KEY(IdUsuarioAlteracao)
        REFERENCES seg.Usuario(IdUsuario),

    CONSTRAINT FK_Cidade_UsuarioExclusao
        FOREIGN KEY(IdUsuarioExclusao)
        REFERENCES seg.Usuario(IdUsuario),

    CONSTRAINT UQ_Cidade
        UNIQUE(IdEstado, NomeCidade)
);
GO

/*==============================================================================
TABELA: Pais
SCHEMA : cad
==============================================================================*/

CREATE TABLE cad.Pais
(
    IdPais INT IDENTITY(1,1) PRIMARY KEY,

    NomePais VARCHAR(100) NOT NULL,

    Sigla CHAR(2) NOT NULL,

    CodigoISO CHAR(3) NOT NULL
);