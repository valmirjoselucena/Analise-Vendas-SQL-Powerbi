/*
=========================================================
Projeto: Sistema de Gestão Comercial + Business Intelligence
Autor: Valmir José da Silva de Lucena
Data: 30/07/2026

Descrição:
Script responsável pela criação das tabelas do banco
transacional (OLTP).

Banco:
SQL Server

=========================================================
*/

USE ERP_Vendas_BI;
GO

/*==============================================================================
TABELA: Perfil
MÓDULO: Segurança
==============================================================================*/

CREATE TABLE seg.Perfil
(
    IdPerfil INT IDENTITY(1,1) NOT NULL,

    NomePerfil VARCHAR(100) NOT NULL,

    Descricao VARCHAR(300) NULL,

    DataCadastro DATETIME2 NOT NULL
        CONSTRAINT DF_Perfil_DataCadastro
        DEFAULT(GETDATE()),

    RegistroAtivo BIT NOT NULL
        CONSTRAINT DF_Perfil_RegistroAtivo
        DEFAULT(1),

    CONSTRAINT PK_Perfil
        PRIMARY KEY CLUSTERED(IdPerfil),

    CONSTRAINT UQ_Perfil_Nome
        UNIQUE(NomePerfil)
);
GO

/*==============================================================================
TABELA: Usuario
MÓDULO: Segurança
==============================================================================*/

CREATE TABLE seg.Usuario
(
    IdUsuario INT IDENTITY(1,1) NOT NULL,

    IdPerfil INT NOT NULL,

    NomeUsuario VARCHAR(150) NOT NULL,

    Login VARCHAR(80) NOT NULL,

    Email VARCHAR(150) NOT NULL,

    SenhaHash VARCHAR(255) NOT NULL,

    UltimoLogin DATETIME2 NULL,

    DataCadastro DATETIME2 NOT NULL
        CONSTRAINT DF_Usuario_DataCadastro
        DEFAULT(GETDATE()),

    RegistroAtivo BIT NOT NULL
        CONSTRAINT DF_Usuario_RegistroAtivo
        DEFAULT(1),

    CONSTRAINT PK_Usuario
        PRIMARY KEY CLUSTERED(IdUsuario),

    CONSTRAINT FK_Usuario_Perfil
        FOREIGN KEY(IdPerfil)
        REFERENCES seg.Perfil(IdPerfil),

    CONSTRAINT UQ_Usuario_Login
        UNIQUE(Login),

    CONSTRAINT UQ_Usuario_Email
        UNIQUE(Email)
);
GO