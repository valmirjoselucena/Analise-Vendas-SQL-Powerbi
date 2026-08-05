USE ERP_Vendas_BI;
GO


CREATE INDEX IX_Cliente_Nome
ON cad.Cliente(NomeCliente);
GO


CREATE INDEX IX_Cliente_IdCidade
ON cad.Cliente(IdCidade);
GO


CREATE INDEX IX_Vendedor_Nome
ON cad.Vendedor(NomeVendedor);
GO


CREATE INDEX IX_Loja_NomeFantasia
ON cad.Loja(NomeFantasia);
GO


CREATE INDEX IX_Loja_IdCidade
ON cad.Loja(IdCidade);
GO