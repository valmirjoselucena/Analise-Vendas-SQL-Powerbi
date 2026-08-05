USE ERP_Vendas_BI;
GO

/*==============================================================================
TABELA: Pedido
SCHEMA : com
DESCRIÇÃO:
Cabeçalho das vendas realizadas.
==============================================================================*/

CREATE TABLE com.Pedido
(
    IdPedido INT IDENTITY(1,1) NOT NULL,

    IdCliente INT NOT NULL,

    IdVendedor INT NULL,

    IdLoja INT NOT NULL,

    DataPedido DATETIME2 NOT NULL
        CONSTRAINT DF_Pedido_DataPedido DEFAULT(GETDATE()),


    StatusPedido VARCHAR(30) NOT NULL
        CONSTRAINT DF_Pedido_Status DEFAULT('ABERTO'),


    ValorTotalProdutos DECIMAL(18,2) NOT NULL
        CONSTRAINT DF_Pedido_ValorProdutos DEFAULT(0),


    ValorDesconto DECIMAL(18,2) NOT NULL
        CONSTRAINT DF_Pedido_Desconto DEFAULT(0),


    ValorFrete DECIMAL(18,2) NOT NULL
        CONSTRAINT DF_Pedido_Frete DEFAULT(0),


    ValorTotalPedido DECIMAL(18,2) NOT NULL
        CONSTRAINT DF_Pedido_Total DEFAULT(0),


    Observacao VARCHAR(500) NULL,


    DataCadastro DATETIME2 NOT NULL
        CONSTRAINT DF_Pedido_DataCadastro DEFAULT(GETDATE()),


    IdUsuarioCadastro INT NOT NULL,


    DataAlteracao DATETIME2 NULL,


    IdUsuarioAlteracao INT NULL,


    DataExclusao DATETIME2 NULL,


    IdUsuarioExclusao INT NULL,


    RegistroAtivo BIT NOT NULL
        CONSTRAINT DF_Pedido_RegistroAtivo DEFAULT(1),



    CONSTRAINT PK_Pedido
        PRIMARY KEY CLUSTERED(IdPedido),



    CONSTRAINT FK_Pedido_Cliente
        FOREIGN KEY(IdCliente)
        REFERENCES cad.Cliente(IdCliente),



    CONSTRAINT FK_Pedido_Vendedor
        FOREIGN KEY(IdVendedor)
        REFERENCES cad.Vendedor(IdVendedor),



    CONSTRAINT FK_Pedido_Loja
        FOREIGN KEY(IdLoja)
        REFERENCES cad.Loja(IdLoja),



    CONSTRAINT FK_Pedido_UsuarioCadastro
        FOREIGN KEY(IdUsuarioCadastro)
        REFERENCES seg.Usuario(IdUsuario),



    CONSTRAINT FK_Pedido_UsuarioAlteracao
        FOREIGN KEY(IdUsuarioAlteracao)
        REFERENCES seg.Usuario(IdUsuario),



    CONSTRAINT FK_Pedido_UsuarioExclusao
        FOREIGN KEY(IdUsuarioExclusao)
        REFERENCES seg.Usuario(IdUsuario),



    CONSTRAINT CK_Pedido_Status
        CHECK(StatusPedido IN
        (
            'ABERTO',
            'FINALIZADO',
            'CANCELADO'
        ))

);
GO



/*==============================================================================
TABELA: ItemPedido
SCHEMA : com
DESCRIÇÃO:
Itens pertencentes a uma venda.
==============================================================================*/

CREATE TABLE com.ItemPedido
(
    IdItemPedido INT IDENTITY(1,1) NOT NULL,


    IdPedido INT NOT NULL,


    IdProduto INT NOT NULL,


    Quantidade DECIMAL(18,4) NOT NULL,


    PrecoVenda DECIMAL(18,2) NOT NULL,


    PrecoCusto DECIMAL(18,2) NOT NULL,


    PercentualDesconto DECIMAL(5,2) NOT NULL
        CONSTRAINT DF_ItemPedido_Desconto DEFAULT(0),


    ValorDesconto DECIMAL(18,2) NOT NULL
        CONSTRAINT DF_ItemPedido_ValorDesconto DEFAULT(0),


    ValorTotal DECIMAL(18,2) NOT NULL,



    DataCadastro DATETIME2 NOT NULL
        CONSTRAINT DF_ItemPedido_DataCadastro DEFAULT(GETDATE()),



    IdUsuarioCadastro INT NOT NULL,



    DataAlteracao DATETIME2 NULL,


    IdUsuarioAlteracao INT NULL,


    DataExclusao DATETIME2 NULL,


    IdUsuarioExclusao INT NULL,


    RegistroAtivo BIT NOT NULL
        CONSTRAINT DF_ItemPedido_RegistroAtivo DEFAULT(1),



    CONSTRAINT PK_ItemPedido
        PRIMARY KEY CLUSTERED(IdItemPedido),



    CONSTRAINT FK_ItemPedido_Pedido
        FOREIGN KEY(IdPedido)
        REFERENCES com.Pedido(IdPedido),



    CONSTRAINT FK_ItemPedido_Produto
        FOREIGN KEY(IdProduto)
        REFERENCES cad.Produto(IdProduto),



    CONSTRAINT FK_ItemPedido_UsuarioCadastro
        FOREIGN KEY(IdUsuarioCadastro)
        REFERENCES seg.Usuario(IdUsuario),



    CONSTRAINT FK_ItemPedido_UsuarioAlteracao
        FOREIGN KEY(IdUsuarioAlteracao)
        REFERENCES seg.Usuario(IdUsuario),



    CONSTRAINT FK_ItemPedido_UsuarioExclusao
        FOREIGN KEY(IdUsuarioExclusao)
        REFERENCES seg.Usuario(IdUsuario),



    CONSTRAINT CK_ItemPedido_Quantidade
        CHECK(Quantidade > 0),



    CONSTRAINT CK_ItemPedido_PrecoVenda
        CHECK(PrecoVenda >= 0),



    CONSTRAINT CK_ItemPedido_PrecoCusto
        CHECK(PrecoCusto >= 0)

);
GO