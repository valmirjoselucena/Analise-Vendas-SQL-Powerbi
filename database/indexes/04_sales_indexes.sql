USE ERP_Vendas_BI;
GO


CREATE INDEX IX_Pedido_Cliente
ON com.Pedido(IdCliente);
GO


CREATE INDEX IX_Pedido_Data
ON com.Pedido(DataPedido);
GO


CREATE INDEX IX_Pedido_Vendedor
ON com.Pedido(IdVendedor);
GO


CREATE INDEX IX_ItemPedido_Pedido
ON com.ItemPedido(IdPedido);
GO


CREATE INDEX IX_ItemPedido_Produto
ON com.ItemPedido(IdProduto);
GO