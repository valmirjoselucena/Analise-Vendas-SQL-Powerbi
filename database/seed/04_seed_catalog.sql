USE ERP_Vendas_BI;
GO


-- =============================================
-- SEED CATEGORIAS
-- =============================================


IF NOT EXISTS
(
    SELECT 1
    FROM cad.Categoria
    WHERE NomeCategoria = 'Informática'
)
BEGIN

INSERT INTO cad.Categoria
(
    NomeCategoria,
    Descricao,
    DataCadastro,
    IdUsuarioCadastro,
    RegistroAtivo
)
VALUES
(
    'Informática',
    'Produtos de informática e tecnologia',
    GETDATE(),
    1,
    1
);

END;
GO


IF NOT EXISTS
(
    SELECT 1
    FROM cad.Categoria
    WHERE NomeCategoria = 'Eletrônicos'
)
BEGIN

INSERT INTO cad.Categoria
(
    NomeCategoria,
    Descricao,
    DataCadastro,
    IdUsuarioCadastro,
    RegistroAtivo
)
VALUES
(
    'Eletrônicos',
    'Equipamentos eletrônicos diversos',
    GETDATE(),
    1,
    1
);

END;
GO


IF NOT EXISTS
(
    SELECT 1
    FROM cad.Categoria
    WHERE NomeCategoria = 'Acessórios'
)
BEGIN

INSERT INTO cad.Categoria
(
    NomeCategoria,
    Descricao,
    DataCadastro,
    IdUsuarioCadastro,
    RegistroAtivo
)
VALUES
(
    'Acessórios',
    'Periféricos e acessórios',
    GETDATE(),
    1,
    1
);

END;
GO




-- =============================================
-- SEED PRODUTOS
-- =============================================


IF NOT EXISTS
(
    SELECT 1
    FROM cad.Produto
    WHERE CodigoProduto = 'INF001'
)
BEGIN

INSERT INTO cad.Produto
(
    IdCategoria,
    CodigoProduto,
    CodigoBarras,
    NomeProduto,
    Descricao,
    UnidadeMedida,
    Peso,
    PrecoCustoAtual,
    PrecoVendaAtual,
    EstoqueAtual,
    EstoqueMinimo,
    DataCadastro,
    IdUsuarioCadastro,
    RegistroAtivo
)
SELECT
    IdCategoria,
    'INF001',
    '7890000000011',
    'Notebook Dell Inspiron',
    'Notebook para uso corporativo',
    'UN',
    1.80,
    2800.00,
    3500.00,
    15,
    5,
    GETDATE(),
    1,
    1
FROM cad.Categoria
WHERE NomeCategoria = 'Informática';

END;
GO

IF NOT EXISTS
(
    SELECT 1
    FROM cad.Produto
    WHERE CodigoProduto = 'ACE001'
)
BEGIN

INSERT INTO cad.Produto
(
    IdCategoria,
    CodigoProduto,
    CodigoBarras,
    NomeProduto,
    Descricao,
    UnidadeMedida,
    Peso,
    PrecoCustoAtual,
    PrecoVendaAtual,
    EstoqueAtual,
    EstoqueMinimo,
    DataCadastro,
    IdUsuarioCadastro,
    RegistroAtivo
)
SELECT
    IdCategoria,
    'ACE001',
    '7890000000028',
    'Mouse Logitech USB',
    'Mouse óptico USB',
    'UN',
    0.10,
    80.00,
    150.00,
    80,
    20,
    GETDATE(),
    1,
    1
FROM cad.Categoria
WHERE NomeCategoria = 'Acessórios';

END;
GO

IF NOT EXISTS
(
    SELECT 1
    FROM cad.Produto
    WHERE CodigoProduto = 'ELE001'
)
BEGIN

INSERT INTO cad.Produto
(
    IdCategoria,
    CodigoProduto,
    CodigoBarras,
    NomeProduto,
    Descricao,
    UnidadeMedida,
    Peso,
    PrecoCustoAtual,
    PrecoVendaAtual,
    EstoqueAtual,
    EstoqueMinimo,
    DataCadastro,
    IdUsuarioCadastro,
    RegistroAtivo
)
SELECT
    IdCategoria,
    'ELE001',
    '7890000000035',
    'Monitor LG 24 Polegadas',
    'Monitor Full HD',
    'UN',
    3.20,
    700.00,
    1100.00,
    25,
    5,
    GETDATE(),
    1,
    1
FROM cad.Categoria
WHERE NomeCategoria = 'Eletrônicos';

END;
GO