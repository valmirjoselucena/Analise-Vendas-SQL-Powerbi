# 📊 ERP Vendas BI

Projeto de Business Intelligence desenvolvido para simular um ambiente corporativo de vendas, contemplando modelagem relacional em SQL Server, carga de dados fictícios e construção de dashboards analíticos no Power BI.

O projeto foi criado com o objetivo de demonstrar conhecimentos em modelagem de banco de dados, consultas SQL, gestão de dados comerciais e desenvolvimento de indicadores para apoio à tomada de decisão.

---

## Dashboard Comercial

<img width="1577" alt="Dashboard Comercial" src="https://github.com/user-attachments/assets/958e4209-e34e-409f-8755-e51fba286855" />

---

## Objetivos

- Desenvolver uma base de dados comercial estruturada.
- Aplicar conceitos de modelagem relacional.
- Simular operações de vendas e estoque.
- Construir indicadores estratégicos.
- Desenvolver dashboards executivos no Power BI.
- Aplicar boas práticas de versionamento com Git e GitHub.

---

## Tecnologias Utilizadas

- SQL Server
- T-SQL
- Power BI
- Git
- GitHub

---

## Arquitetura da Solução

```text
Banco de Dados SQL Server
            │
            ▼
 Tratamento e Modelagem
            │
            ▼
         Power BI
            │
            ▼
 Dashboard Comercial
```

---

## Estrutura do Projeto

```text
ERP_Vendas_BI
│
├── database
│   ├── Tables
│   ├── indexes
│   ├── seed
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

O banco foi organizado por domínios de negócio utilizando schemas para separação de responsabilidades.

### Schemas

```text
seg → Segurança
cad → Cadastros
com → Comercial
est → Estoque
```

### Entidades Principais

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

---

## Diagrama Entidade Relacionamento

O modelo relacional completo está disponível em:

```text
docs/DER.png
```

---

## Massa de Dados

O projeto possui dados fictícios para permitir análises comerciais e operacionais.

### Dados disponíveis

- 5 Perfis de Segurança
- 1 Usuário Administrador
- 27 Estados
- Cidades
- 2 Lojas
- 10 Vendedores
- 30 Clientes
- 100 Produtos
- Estoque por Loja
- Movimentações de Estoque
- Pedidos
- Itens de Pedido

---

## Funcionalidades

### Cadastros

- Clientes
- Produtos
- Categorias
- Cidades
- Estados
- Lojas
- Vendedores

### Comercial

- Gestão de Pedidos
- Itens de Pedido
- Histórico de Vendas

### Estoque

- Controle de Estoque por Loja
- Entrada e Saída de Produtos
- Tipos de Movimentação
- Movimentação de Inventário

---

## Dashboard Power BI

O dashboard foi desenvolvido para acompanhar os principais indicadores de desempenho comercial.

### Indicadores

- Faturamento Total
- Quantidade de Pedidos
- Ticket Médio
- Produtos Mais Vendidos
- Vendas por Categoria
- Faturamento por Loja
- Evolução do Faturamento
- Participação por Produto

---

## Conhecimentos Aplicados

### Banco de Dados

- Modelagem Relacional
- Chaves Primárias e Estrangeiras
- Integridade Referencial
- Scripts DDL e DML
- Organização por Schemas

### Business Intelligence

- Construção de KPIs
- Storytelling com Dados
- Visualização de Dados
- Dashboards Gerenciais

### Desenvolvimento

- Git
- GitHub
- Versionamento de Código
- Estruturação de Projetos

---

## Como Executar

### Criar o Banco

Execute:

```text
database/01_create_database.sql
```

### Criar Estrutura

Execute os scripts da pasta:

```text
database/Tables
```

### Popular os Dados

Execute os scripts da pasta:

```text
database/seed
```

### Abrir o Dashboard

Abra o arquivo:

```text
powerbi/Dashboard ERP_Vendas_BI.pbix
```

e atualize a conexão de dados.

---

## Autor

**Valmir José da Silva de Lucena**

Analista de SAC | Estudos em Dados, SQL e Business Intelligence

🔗 LinkedIn  
https://www.linkedin.com/in/valmir-lucena/

🔗 GitHub  
https://github.com/valmirjoselucena