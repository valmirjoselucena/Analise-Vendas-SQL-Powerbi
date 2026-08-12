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



USE [ERP_Vendas_BI]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [est].[ProdutoLoja](
	[IdProdutoLoja] [int] IDENTITY(1,1) NOT NULL,
	[IdProduto] [int] NOT NULL,
	[IdLoja] [int] NOT NULL,
	[QuantidadeEstoque] [decimal](18, 4) NOT NULL,
	[EstoqueMinimo] [decimal](18, 4) NOT NULL,
	[EstoqueReservado] [decimal](18, 4) NOT NULL,
	[DataCadastro] [datetime2](7) NOT NULL,
	[IdUsuarioCadastro] [int] NOT NULL,
	[DataAlteracao] [datetime2](7) NULL,
	[IdUsuarioAlteracao] [int] NULL,
	[RegistroAtivo] [bit] NOT NULL,
 CONSTRAINT [PK_ProdutoLoja] PRIMARY KEY CLUSTERED 
(
	[IdProdutoLoja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_ProdutoLoja] UNIQUE NONCLUSTERED 
(
	[IdProduto] ASC,
	[IdLoja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [est].[ProdutoLoja] ADD  CONSTRAINT [DF_ProdutoLoja_Quantidade]  DEFAULT ((0)) FOR [QuantidadeEstoque]
GO

ALTER TABLE [est].[ProdutoLoja] ADD  CONSTRAINT [DF_ProdutoLoja_Minimo]  DEFAULT ((0)) FOR [EstoqueMinimo]
GO

ALTER TABLE [est].[ProdutoLoja] ADD  CONSTRAINT [DF_ProdutoLoja_Reservado]  DEFAULT ((0)) FOR [EstoqueReservado]
GO

ALTER TABLE [est].[ProdutoLoja] ADD  DEFAULT (getdate()) FOR [DataCadastro]
GO

ALTER TABLE [est].[ProdutoLoja] ADD  DEFAULT ((1)) FOR [RegistroAtivo]
GO

ALTER TABLE [est].[ProdutoLoja]  WITH CHECK ADD  CONSTRAINT [CK_ProdutoLoja_Estoque] CHECK  (([QuantidadeEstoque]>=(0)))
GO

ALTER TABLE [est].[ProdutoLoja] CHECK CONSTRAINT [CK_ProdutoLoja_Estoque]
GO




USE [ERP_Vendas_BI]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [est].[TipoMovimentacao](
	[IdTipoMovimentacao] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](30) NOT NULL,
	[Descricao] [varchar](100) NOT NULL,
	[TipoOperacao] [char](1) NOT NULL,
	[DataCadastro] [datetime2](7) NOT NULL,
	[IdUsuarioCadastro] [int] NOT NULL,
	[DataAlteracao] [datetime2](7) NULL,
	[IdUsuarioAlteracao] [int] NULL,
	[RegistroAtivo] [bit] NOT NULL,
 CONSTRAINT [PK_TipoMovimentacao] PRIMARY KEY CLUSTERED 
(
	[IdTipoMovimentacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_TipoMovimentacao_Codigo] UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [est].[TipoMovimentacao] ADD  CONSTRAINT [DF_TipoMovimentacao_DataCadastro]  DEFAULT (getdate()) FOR [DataCadastro]
GO

ALTER TABLE [est].[TipoMovimentacao] ADD  CONSTRAINT [DF_TipoMovimentacao_RegistroAtivo]  DEFAULT ((1)) FOR [RegistroAtivo]
GO

ALTER TABLE [est].[TipoMovimentacao]  WITH CHECK ADD  CONSTRAINT [CK_TipoMovimentacao_TipoOperacao] CHECK  (([TipoOperacao]='S' OR [TipoOperacao]='E'))
GO

ALTER TABLE [est].[TipoMovimentacao] CHECK CONSTRAINT [CK_TipoMovimentacao_TipoOperacao]
GO


