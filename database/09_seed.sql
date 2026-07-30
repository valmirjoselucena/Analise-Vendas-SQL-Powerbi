USE ERP_Vendas_BI;
GO

INSERT INTO seg.Perfil
(
    NomePerfil,
    Descricao
)
VALUES
('Administrador','Acesso total ao sistema'),
('Gerente','Gerenciamento da operação'),
('Analista','Operações analíticas'),
('Vendedor','Equipe comercial'),
('Estoquista','Controle de estoque');
GO