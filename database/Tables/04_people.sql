USE ERP_Vendas_BI;
GO

/*==============================================================================
TABELA: Cliente
SCHEMA : cad
DESCRIÇÃO:
Cadastro dos clientes da empresa.
==============================================================================*/

CREATE TABLE cad.Cliente
(
    IdCliente INT IDENTITY(1,1) NOT NULL,

    NomeCliente VARCHAR(150) NOT NULL,

    CPF CHAR(11) NOT NULL,

    DataNascimento DATE NULL,

    Telefone VARCHAR(20) NULL,

    Email VARCHAR(150) NULL,

    Logradouro VARCHAR(150) NULL,

    Numero VARCHAR(20) NULL,

    Complemento VARCHAR(100) NULL,

    Bairro VARCHAR(100) NULL,

    CEP CHAR(8) NULL,

    IdCidade INT NULL,

    PermiteCredito BIT NOT NULL
        CONSTRAINT DF_Cliente_PermiteCredito DEFAULT(0),

    LimiteCredito DECIMAL(18,2) NOT NULL
        CONSTRAINT DF_Cliente_LimiteCredito DEFAULT(0),

    DataCadastro DATETIME2 NOT NULL
        CONSTRAINT DF_Cliente_DataCadastro DEFAULT(GETDATE()),

    IdUsuarioCadastro INT NOT NULL,

    DataAlteracao DATETIME2 NULL,

    IdUsuarioAlteracao INT NULL,

    DataExclusao DATETIME2 NULL,

    IdUsuarioExclusao INT NULL,

    RegistroAtivo BIT NOT NULL
        CONSTRAINT DF_Cliente_RegistroAtivo DEFAULT(1),


    CONSTRAINT PK_Cliente
        PRIMARY KEY CLUSTERED(IdCliente),


    CONSTRAINT UQ_Cliente_CPF
        UNIQUE(CPF),


    CONSTRAINT FK_Cliente_Cidade
        FOREIGN KEY(IdCidade)
        REFERENCES cad.Cidade(IdCidade),


    CONSTRAINT FK_Cliente_UsuarioCadastro
        FOREIGN KEY(IdUsuarioCadastro)
        REFERENCES seg.Usuario(IdUsuario),


    CONSTRAINT FK_Cliente_UsuarioAlteracao
        FOREIGN KEY(IdUsuarioAlteracao)
        REFERENCES seg.Usuario(IdUsuario),


    CONSTRAINT FK_Cliente_UsuarioExclusao
        FOREIGN KEY(IdUsuarioExclusao)
        REFERENCES seg.Usuario(IdUsuario),


    CONSTRAINT CK_Cliente_LimiteCredito
        CHECK(LimiteCredito >= 0)
);
GO


/*==============================================================================
TABELA: Vendedor
SCHEMA : cad
DESCRIÇÃO:
Cadastro dos vendedores responsáveis pelas vendas.
==============================================================================*/

CREATE TABLE cad.Vendedor
(
    IdVendedor INT IDENTITY(1,1) NOT NULL,

    NomeVendedor VARCHAR(150) NOT NULL,

    CPF CHAR(11) NOT NULL,

    Telefone VARCHAR(20) NULL,

    Email VARCHAR(150) NULL,

    PercentualComissao DECIMAL(5,2) NOT NULL
        CONSTRAINT DF_Vendedor_Comissao DEFAULT(0),

    DataAdmissao DATE NULL,

    DataCadastro DATETIME2 NOT NULL
        CONSTRAINT DF_Vendedor_DataCadastro DEFAULT(GETDATE()),

    IdUsuarioCadastro INT NOT NULL,

    DataAlteracao DATETIME2 NULL,

    IdUsuarioAlteracao INT NULL,

    DataExclusao DATETIME2 NULL,

    IdUsuarioExclusao INT NULL,

    RegistroAtivo BIT NOT NULL
        CONSTRAINT DF_Vendedor_RegistroAtivo DEFAULT(1),


    CONSTRAINT PK_Vendedor
        PRIMARY KEY CLUSTERED(IdVendedor),


    CONSTRAINT UQ_Vendedor_CPF
        UNIQUE(CPF),


    CONSTRAINT CK_Vendedor_Comissao
        CHECK(PercentualComissao >= 0),


    CONSTRAINT FK_Vendedor_UsuarioCadastro
        FOREIGN KEY(IdUsuarioCadastro)
        REFERENCES seg.Usuario(IdUsuario),


    CONSTRAINT FK_Vendedor_UsuarioAlteracao
        FOREIGN KEY(IdUsuarioAlteracao)
        REFERENCES seg.Usuario(IdUsuario),


    CONSTRAINT FK_Vendedor_UsuarioExclusao
        FOREIGN KEY(IdUsuarioExclusao)
        REFERENCES seg.Usuario(IdUsuario)
);
GO


/*==============================================================================
TABELA: Loja
SCHEMA : cad
DESCRIÇÃO:
Cadastro das unidades comerciais.
==============================================================================*/

CREATE TABLE cad.Loja
(
    IdLoja INT IDENTITY(1,1) NOT NULL,

    RazaoSocial VARCHAR(200) NOT NULL,

    NomeFantasia VARCHAR(150) NOT NULL,

    CNPJ CHAR(14) NOT NULL,

    InscricaoEstadual VARCHAR(30) NULL,

    Telefone VARCHAR(20) NULL,

    Email VARCHAR(150) NULL,

    Logradouro VARCHAR(150) NULL,

    Numero VARCHAR(20) NULL,

    Complemento VARCHAR(100) NULL,

    Bairro VARCHAR(100) NULL,

    CEP CHAR(8) NULL,

    IdCidade INT NULL,

    DataCadastro DATETIME2 NOT NULL
        CONSTRAINT DF_Loja_DataCadastro DEFAULT(GETDATE()),

    IdUsuarioCadastro INT NOT NULL,

    DataAlteracao DATETIME2 NULL,

    IdUsuarioAlteracao INT NULL,

    DataExclusao DATETIME2 NULL,

    IdUsuarioExclusao INT NULL,

    RegistroAtivo BIT NOT NULL
        CONSTRAINT DF_Loja_RegistroAtivo DEFAULT(1),


    CONSTRAINT PK_Loja
        PRIMARY KEY CLUSTERED(IdLoja),


    CONSTRAINT UQ_Loja_CNPJ
        UNIQUE(CNPJ),


    CONSTRAINT FK_Loja_Cidade
        FOREIGN KEY(IdCidade)
        REFERENCES cad.Cidade(IdCidade),


    CONSTRAINT FK_Loja_UsuarioCadastro
        FOREIGN KEY(IdUsuarioCadastro)
        REFERENCES seg.Usuario(IdUsuario),


    CONSTRAINT FK_Loja_UsuarioAlteracao
        FOREIGN KEY(IdUsuarioAlteracao)
        REFERENCES seg.Usuario(IdUsuario),


    CONSTRAINT FK_Loja_UsuarioExclusao
        FOREIGN KEY(IdUsuarioExclusao)
        REFERENCES seg.Usuario(IdUsuario)
);
GO