/*==============================================================================
 Projeto.......: ERP Vendas BI
 Autor.........: Valmir José da Silva de Lucena
 Banco.........: SQL Server
 Versão........: 1.0.0

 Descrição:
 Script responsável por criar o banco de dados e toda a estrutura inicial.
==============================================================================*/

USE master;
GO

IF DB_ID('ERP_Vendas_BI') IS NOT NULL
BEGIN
    ALTER DATABASE ERP_Vendas_BI
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;

    DROP DATABASE ERP_Vendas_BI;
END
GO

CREATE DATABASE ERP_Vendas_BI;
GO

USE ERP_Vendas_BI;
GO

/*==============================================================================
SCHEMAS
==============================================================================*/

CREATE SCHEMA seg;
GO

CREATE SCHEMA cad;
GO

CREATE SCHEMA est;
GO

CREATE SCHEMA com;
GO

CREATE SCHEMA fin;
GO