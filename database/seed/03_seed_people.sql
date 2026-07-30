USE ERP_Vendas_BI;
GO


-- =============================================
-- SEED CLIENTES
-- =============================================


IF NOT EXISTS
(
    SELECT 1
    FROM cad.Cliente
    WHERE CPF = '12345678901'
)
BEGIN

INSERT INTO cad.Cliente
(
    NomeCliente,
    CPF,
    DataNascimento,
    Telefone,
    Email,
    Logradouro,
    Numero,
    Complemento,
    Bairro,
    CEP,
    IdCidade,
    PermiteCredito,
    LimiteCredito,
    DataCadastro,
    IdUsuarioCadastro,
    RegistroAtivo
)
SELECT
    'João da Silva',
    '12345678901',
    '1990-05-10',
    '62999991111',
    'joao.silva@email.com',
    'Rua das Flores',
    '100',
    NULL,
    'Centro',
    '74000000',
    IdCidade,
    1,
    5000.00,
    GETDATE(),
    1,
    1
FROM cad.Cidade
WHERE NomeCidade = 'Goiânia';

END;
GO



IF NOT EXISTS
(
    SELECT 1
    FROM cad.Cliente
    WHERE CPF = '98765432100'
)
BEGIN

INSERT INTO cad.Cliente
(
    NomeCliente,
    CPF,
    DataNascimento,
    Telefone,
    Email,
    Logradouro,
    Numero,
    Complemento,
    Bairro,
    CEP,
    IdCidade,
    PermiteCredito,
    LimiteCredito,
    DataCadastro,
    IdUsuarioCadastro,
    RegistroAtivo
)
SELECT
    'Maria Oliveira',
    '98765432100',
    '1985-08-20',
    '62988882222',
    NULL,
    'Avenida Central',
    '250',
    'Apartamento 301',
    'Setor Bueno',
    '74200000',
    IdCidade,
    0,
    0,
    GETDATE(),
    1,
    1
FROM cad.Cidade
WHERE NomeCidade = 'Aparecida de Goiânia';

END;
GO