USE ERP_Vendas_BI;
GO


-- =============================================
-- SEED PERFIS
-- =============================================

INSERT INTO seg.Perfil
(
    NomePerfil,
    Descricao,
    DataCadastro,
    RegistroAtivo
)
VALUES
(
    'Administrador',
    'Usuário com acesso completo ao sistema',
    GETDATE(),
    1
);
GO



-- =============================================
-- SEED USUARIO ADMINISTRADOR
-- =============================================

INSERT INTO seg.Usuario
(
    IdPerfil,
    NomeUsuario,
    Login,
    Email,
    SenhaHash,
    DataCadastro,
    RegistroAtivo
)
VALUES
(
    1,
    'Administrador',
    'admin',
    'admin@erpvendas.com.br',
    'HASH_TEMP',
    GETDATE(),
    1
);
GO