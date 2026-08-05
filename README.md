# ERP Vendas BI

Projeto de Banco de Dados e Business Intelligence desenvolvido para simular um ambiente comercial completo, contemplando modelagem relacional, geração de dados fictícios, construção de views analíticas e criação de dashboards no Power BI.

O objetivo é demonstrar conhecimentos em SQL Server, modelagem de dados, análise de indicadores de negócio e visualização de dados.

---

## Objetivos

Demonstrar conhecimentos práticos em:

- SQL Server
- Modelagem Relacional
- Normalização de Dados
- Integridade Referencial
- Views Analíticas
- Business Intelligence
- Power BI
- Git e GitHub

---

## Arquitetura da Solução

```text
SQL Server
    │
    ▼
Views Analíticas
    │
    ▼
Power BI
```

---

## Tecnologias Utilizadas

| Tecnologia | Finalidade |
|------------|------------|
| SQL Server | Banco de Dados Relacional |
| T-SQL | Scripts, Views e Seeds |
| Power BI | Dashboards e Visualização de Dados |
| Git | Controle de Versão |
| GitHub | Hospedagem e Documentação |

---

## Estrutura do Projeto

```text
ERP_Vendas_BI
│
├── database
│   ├── Tables
│   ├── indexes
│   ├── seed
│   ├── Views
│   └── 01_create_database.sql
│
├── docs
│   ├── DER.png
│   └── modelo-negocio.md
│
├── powerbi
│   └── Dashboard ERP_Vendas_BI.pbix
│
├── LICENSE
└── README.md
```

---

## Modelo de Dados

O banco foi estruturado utilizando múltiplos schemas para separação das responsabilidades:

```text
seg → Segurança
cad → Cadastros
com → Comercial
est → Estoque
```

### Principais Entidades

```text
Cliente
Cidade
Estado
Loja
Vendedor
Categoria
Produto
Pedido
ItemPedido
ProdutoLoja
MovimentacaoEstoque
TipoMovimentacao
```

### DER

O diagrama entidade-relacionamento pode ser encontrado em:

```text
docs/DER.png
```

---

## Massa de Dados

Dataset fictício desenvolvido para permitir análises comerciais e operacionais.

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

### Cadastros

- Clientes
- Vendedores
- Produtos
- Categorias
- Lojas
- Cidades
- Estados

### Comercial

- Controle de Pedidos
- Itens de Pedido
- Histórico de Vendas

### Estoque

- Controle de Estoque por Loja
- Movimentações de Estoque
- Tipos de Movimentação

---

## Views Analíticas

O projeto possui uma camada analítica criada através de views SQL para consumo direto no Power BI.

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

## Dashboard Comercial

Dashboard desenvolvido no Power BI utilizando as views analíticas do projeto.

### Indicadores

- Faturamento Total
- Quantidade de Vendas
- Média de Vendas
- Top Produtos
- Vendas por Categoria
- Faturamento por Filial
- Evolução Mensal do Faturamento

Arquivo:

```text
powerbi/Dashboard ERP_Vendas_BI.pbix
```

---

## Documentação

```text
docs/
├── DER.png
└── modelo-negocio.md
```

---

## Autor

**Valmir José da Silva de Lucena**

Analista de SAC Jr | Estudante de Dados e Business Intelligence

LinkedIn:
https://www.linkedin.com/in/valmir-lucena/