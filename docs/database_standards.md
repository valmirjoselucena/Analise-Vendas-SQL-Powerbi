# Padrões de Banco de Dados

## Convenções

- Todas as tabelas utilizam nomenclatura no singular.
- Todas as Primary Keys utilizam o padrão `IdNomeTabela`.
- Todas as Foreign Keys possuem o mesmo nome da chave referenciada.
- Todas as constraints possuem nomes explícitos.
- Exclusões lógicas serão realizadas através da coluna `RegistroAtivo`.
- Todas as datas utilizam `DATETIME2`.
- Valores monetários utilizarão `DECIMAL(18,2)`.
- Quantidades utilizarão `DECIMAL(18,4)`.