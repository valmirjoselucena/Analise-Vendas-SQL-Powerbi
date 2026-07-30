-- =============================================
-- SEED CIDADES
-- =============================================

INSERT INTO cad.Cidade
(
    IdEstado,
    NomeCidade,
    IdUsuarioCadastro,
    RegistroAtivo
)
SELECT
    IdEstado,
    'Goiânia',
    1,
    1
FROM cad.Estado
WHERE UF = 'GO';


INSERT INTO cad.Cidade
(
    IdEstado,
    NomeCidade,
    IdUsuarioCadastro,
    RegistroAtivo
)
SELECT
    IdEstado,
    'Aparecida de Goiânia',
    1,
    1
FROM cad.Estado
WHERE UF = 'GO';


INSERT INTO cad.Cidade
(
    IdEstado,
    NomeCidade,
    IdUsuarioCadastro,
    RegistroAtivo
)
SELECT
    IdEstado,
    'Rio de Janeiro',
    1,
    1
FROM cad.Estado
WHERE UF = 'RJ';


INSERT INTO cad.Cidade
(
    IdEstado,
    NomeCidade,
    IdUsuarioCadastro,
    RegistroAtivo
)
SELECT
    IdEstado,
    'São Paulo',
    1,
    1
FROM cad.Estado
WHERE UF = 'SP';

GO




-- =============================================
-- SEED LOJAS
-- =============================================

INSERT INTO cad.Loja
(
    RazaoSocial,
    NomeFantasia,
    CNPJ,
    InscricaoEstadual,
    Telefone,
    Email,
    Logradouro,
    Numero,
    Complemento,
    Bairro,
    CEP,
    IdCidade,
    DataCadastro,
    IdUsuarioCadastro,
    RegistroAtivo
)
SELECT
    'ERP Vendas Comercio LTDA',
    'Loja Matriz',
    '12345678000190',
    '123456789',
    '6233334444',
    'matriz@erpvendas.com.br',
    'Avenida Goiás',
    '1000',
    NULL,
    'Centro',
    '74000000',
    C.IdCidade,
    GETDATE(),
    1,
    1
FROM cad.Cidade C
WHERE C.NomeCidade = 'Goiânia';
GO


INSERT INTO cad.Loja
(
    RazaoSocial,
    NomeFantasia,
    CNPJ,
    InscricaoEstadual,
    Telefone,
    Email,
    Logradouro,
    Numero,
    Complemento,
    Bairro,
    CEP,
    IdCidade,
    DataCadastro,
    IdUsuarioCadastro,
    RegistroAtivo
)
SELECT
    'ERP Vendas Comercio LTDA',
    'Filial Shopping',
    '98765432000110',
    '987654321',
    '6235556666',
    'filial@erpvendas.com.br',
    'Avenida Rio Verde',
    '500',
    'Shopping',
    'Vila São Tomaz',
    '74900000',
    C.IdCidade,
    GETDATE(),
    1,
    1
FROM cad.Cidade C
WHERE C.NomeCidade = 'Aparecida de Goiânia';
GO