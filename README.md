# SpaceAdmin — Modelagem de Banco de Dados de um ERP de Agendamento de Salas

Trabalho acadêmico da disciplina de **Modelagem de Banco de Dados** (Engenharia de Software — UNICID, Campus Tatuapé, 2026).

O projeto modela o banco de dados de um ERP para **locação e agendamento de salas**, cobrindo desde o cadastro de usuários, imóveis e salas até reservas, check-in/check-out, limpeza, manutenção, estoque, compras e financeiro.

## Conteúdo do repositório

```
.
├── README.md
├── docs/
│   ├── Entrega_2_SpaceAdmin.docx   # Documento completo da entrega
│   └── diagramas/
│       ├── DER.png                 # Diagrama Entidade-Relacionamento
│       └── fluxogramas.jpg         # Fluxogramas dos principais processos
└── sql/
    ├── 01_criar_banco.sql          # Criação do banco, tabelas, chaves, CHECKs e triggers
    ├── 02_dados_ficticios.sql      # Massa de dados fictícios
    └── 03_testes_regras_invalidas.sql  # Testes que DEVEM falhar (validam as regras)
```

## O que o documento (`docs/Entrega_2_SpaceAdmin.docx`) apresenta

1. Revisão da primeira entrega (problemas identificados e como foram resolvidos)
2. Modelo lógico relacional
3. Normalização (1FN, 2FN, 3FN), dependências funcionais e justificativas das decomposições
4. Dicionário de dados atualizado
5. Requisitos funcionais (RF01–RF13)
6. Requisitos não funcionais (RNF01–RNF10)
7. Regras de negócio (RN01–RN12) e restrições/políticas organizacionais
8. Fluxogramas dos principais processos
9. Entidades, atributos e relacionamentos
10. Diagrama Entidade-Relacionamento (DER)
11. Justificativas técnicas das decisões de modelagem

## Diagrama Entidade-Relacionamento

![DER](docs/diagramas/DER.png)

## Principais decisões de modelagem

- **Chave própria em `USUARIOS`** (`ID_USUARIO`) em vez de CPF, permitindo clientes sem login e proprietários pessoa física ou jurídica.
- **Sem redundância em `RESERVAS`:** imóvel e proprietário são obtidos a partir da sala.
- **Recebimentos parciais de compra** com as tabelas `RECEBIMENTOS_COMPRA` e `ITENS_RECEBIMENTO`.
- **Movimentações financeiras rastreáveis** (reserva, pedido de compra, manutenção, proprietário e estorno).
- **Atributos multivalorados** separados em tabelas próprias (telefones, e-mails, documentos, endereços, contas bancárias).

## Como executar

**Requisitos:** MySQL 8.0.16 ou superior (necessário para as restrições `CHECK`).

```bash
# 1) Criar o banco, tabelas, restrições e triggers
mysql -u root -p < sql/01_criar_banco.sql

# 2) Popular com dados fictícios
mysql -u root -p < sql/02_dados_ficticios.sql

# 3) (Opcional) Rodar os testes de regras inválidas
#    Cada instrução deve falhar; use --force para continuar após cada erro
mysql -u root -p --force < sql/03_testes_regras_invalidas.sql
```

Também é possível abrir os scripts no MySQL Workbench ou DBeaver e executá-los na ordem numérica.

> **Sobre os testes:** o arquivo `03_testes_regras_invalidas.sql` contém tentativas de inserção/alteração propositalmente inválidas. Se alguma instrução for executada com sucesso, significa que a regra correspondente não está protegendo o banco.

## Tecnologias

- MySQL (SGBD)
- SQL (DDL, DML, `CHECK`, `UNIQUE`, `FOREIGN KEY`, triggers)

## Autores

- Alecsandro Sabino da Silva	
-Felipe Alves de Souza
-Gustavo José da Silva	
-Joao Victor Aversoni Branco Morais
-Jonathan Nilmar Mamani Chino	
-Kauê Duarte Simões
-Nicolas Resende da Silva	
-Pablo Ferreira de Lira
-Pedro Ricardo Lopes Bernardo	
-Victor Araújo Biffe
-Vinicius Gonçalves de Magalhães 	


## Aviso

Projeto acadêmico, sem fins comerciais. Todos os dados em `02_dados_ficticios.sql` são fictícios.
