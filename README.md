# ERP Vendas BI

Projeto completo de Engenharia de Dados, Modelagem Relacional, Data Warehouse e Business Intelligence desenvolvido para simular um ambiente corporativo de vendas.

O projeto contempla desde a modelagem OLTP de um ERP comercial até a construção de indicadores analíticos consumidos pelo Power BI.

---

## Objetivos

Demonstrar conhecimentos práticos em:

- SQL Server
- Modelagem de Dados Relacional
- Data Warehouse (Star Schema)
- ETL com Python
- Business Intelligence
- Power BI
- Git e GitHub
- Governança e Qualidade de Dados

---

## Arquitetura da Solução

```text
ERP_Vendas_BI (OLTP)
        │
        ▼
Python ETL
        │
        ▼
Data Warehouse (DW)
        │
        ▼
Power BI
```

---

## Tecnologias Utilizadas

| Tecnologia | Finalidade |
|------------|------------|
| SQL Server | Banco transacional (OLTP) |
| Python | ETL e automações |
| Pandas | Transformação de dados |
| SQLAlchemy | Integração com banco |
| Power BI | Dashboards e Analytics |
| Git | Versionamento |
| GitHub | Repositório e documentação |

---

## Modelagem de Dados

### Schemas

```text
seg -> Segurança
cad -> Cadastros
com -> Comercial
est -> Estoque
fin -> Financeiro
```

### Principais Entidades

```text
Cliente
Produto
Categoria
Vendedor
Loja
Pedido
ItemPedido
ProdutoLoja
MovimentacaoEstoque
```

---

## Massa de Dados

Dataset fictício criado para análises de negócio.

### Volumes

```text
✅ 5 Perfis
✅ 1 Usuário Administrador
✅ 4 Cidades
✅ 2 Lojas
✅ 10 Vendedores
✅ 30 Clientes
✅ 100 Produtos
✅ Estoque por Loja
✅ Movimentações de Estoque
✅ Pedidos
✅ Itens de Pedido
```

---

## Funcionalidades Implementadas

### Comercial

- Cadastro de clientes
- Cadastro de vendedores
- Controle de pedidos
- Histórico de vendas

### Estoque

- Cadastro de produtos
- Controle de estoque
- Movimentação de estoque
- Produtos por loja

### Analytics

- Faturamento Mensal
- Top Produtos
- Top Clientes
- Performance de Vendedores
- Vendas por Cidade
- Giro de Produtos
- Dashboard Executivo
- Top Produtos por Cidade

---

## Views Analíticas

```text
vw_FaturamentoMensal
vw_TopProdutos
vw_TopClientes
vw_PerformanceVendedores
vw_VendasPorCidade
vw_GiroProdutos
vw_DashboardExecutivo
vw_TopProdutosCidade
```

---

## Estrutura do Projeto

```text
ERP_Vendas_BI
│
├── database
│   ├── tables
│   ├── seed
│   ├── views
│   ├── procedures
│   ├── functions
│   ├── triggers
│   └── indexes
│
├── python
│   ├── etl
│   └── scripts
│
├── dw
│
├── powerbi
│
├── docs
│
└── README.md
```

---

## Dashboards

### Dashboard Executivo

Indicadores:

- Faturamento Total
- Ticket Médio
- Clientes Ativos
- Pedidos
- Produtos Vendidos
- Margem Bruta

### Dashboard Comercial

Indicadores:

- Top Clientes
- Top Produtos
- Performance de Vendedores
- Vendas por Cidade

### Dashboard Estoque

Indicadores:

- Giro de Produtos
- Produtos sem Venda
- Estoque Crítico
- Cobertura de Estoque

---

## Próximas Evoluções

- [ ] Data Warehouse Dimensional
- [ ] Pipeline ETL Automatizado
- [ ] KPIs Financeiros
- [ ] Deploy em Ambiente Cloud
- [ ] Dashboard Mobile
- [ ] Testes de Qualidade de Dados

---

## Autor

**Valmir José da Silva de Lucena**

Analista de SAC Jr | Estudante de Dados e Business Intelligence

LinkedIn: https://www.linkedin.com/in/valmir-lucena/
