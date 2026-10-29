
USE `sistema_reservas`;
SET NAMES utf8mb4;

-- USUARIOS (STATUS: ATIVO, INATIVO, BLOQUEADO)
INSERT INTO `USUARIOS` (`ID_USUARIO`, `NOME`, `STATUS`, `DATA_INATIVACAO`) VALUES
  (1, 'Ana Souza', 'ATIVO', NULL),
  (2, 'Bruno Lima', 'ATIVO', NULL),
  (3, 'Carla Mendes', 'ATIVO', NULL),
  (4, 'Diego Alves', 'ATIVO', NULL),
  (5, 'Elisa Rocha', 'ATIVO', NULL),
  (6, 'Fábio Nunes', 'ATIVO', NULL),
  (7, 'Gabriela Torres', 'ATIVO', NULL),
  (8, 'Henrique Costa', 'ATIVO', NULL),
  (9, 'Isabela Martins', 'INATIVO', '2026-06-30 18:00:00'),
  (10, 'João Pereira', 'BLOQUEADO', NULL),
  (11, 'Karina Lopes', 'INATIVO', '2024-12-31 17:00:00'),
  (12, 'Lucas Ferreira', 'ATIVO', NULL),
  (13, 'Marina Dias', 'ATIVO', NULL);

-- TELEFONES_USUARIOS (PK gerada por trigger; TIPO_TELEFONE pode ser NULL)
INSERT INTO `TELEFONES_USUARIOS` (`ID_USUARIO`, `NUMERO_TELEFONE`, `TIPO_TELEFONE`, `PRINCIPAL`, `STATUS`) VALUES
  (1, '11987654321', 'CELULAR', TRUE, 'ATIVO'),
  (1, '1133334444', 'RESIDENCIAL', FALSE, 'ATIVO'),
  (2, '21987654321', 'WHATSAPP', TRUE, 'ATIVO'),
  (3, '31999990000', 'CELULAR', TRUE, 'ATIVO'),
  (4, '11988887777', 'CELULAR', TRUE, 'ATIVO'),
  (5, '11977776666', 'CELULAR', TRUE, 'ATIVO'),
  (6, '11966665555', 'COMERCIAL', TRUE, 'ATIVO'),
  (7, '31955554444', 'CELULAR', TRUE, 'ATIVO'),
  (8, '11944443333', 'CELULAR', TRUE, 'ATIVO'),
  (9, '11933332222', 'CELULAR', TRUE, 'INATIVO'),
  (12, '11922221111', 'CELULAR', TRUE, 'ATIVO'),
  (13, '11911110000', NULL, TRUE, 'ATIVO');

-- EMAILS_USUARIOS (e-mail único no sistema)
INSERT INTO `EMAILS_USUARIOS` (`ID_USUARIO`, `ENDERECO_EMAIL`, `PRINCIPAL`, `STATUS`) VALUES
  (1, 'ana.souza@exemplo.com.br', TRUE, 'ATIVO'),
  (1, 'ana.souza.trabalho@exemplo.com.br', FALSE, 'ATIVO'),
  (2, 'bruno.lima@exemplo.com.br', TRUE, 'ATIVO'),
  (3, 'carla.mendes@exemplo.com.br', TRUE, 'ATIVO'),
  (4, 'diego.alves@exemplo.com.br', TRUE, 'ATIVO'),
  (5, 'elisa.rocha@exemplo.com.br', TRUE, 'ATIVO'),
  (6, 'fabio.nunes@exemplo.com.br', TRUE, 'ATIVO'),
  (7, 'gabriela.torres@exemplo.com.br', TRUE, 'ATIVO'),
  (8, 'henrique.costa@exemplo.com.br', TRUE, 'ATIVO'),
  (9, 'isabela.martins@exemplo.com.br', TRUE, 'INATIVO'),
  (10, 'joao.pereira@exemplo.com.br', TRUE, 'ATIVO'),
  (11, 'karina.lopes@exemplo.com.br', TRUE, 'INATIVO'),
  (12, 'lucas.ferreira@exemplo.com.br', TRUE, 'ATIVO'),
  (13, 'marina.dias@exemplo.com.br', TRUE, 'ATIVO');

INSERT INTO `PERFIS` (`ID_PERFIL`, `NOME`, `DESCRICAO`, `STATUS`) VALUES
  (1, 'Administrador', 'Acesso total ao sistema', 'ATIVO'),
  (2, 'Gerente', 'Gerencia reservas, estoque e financeiro', 'ATIVO'),
  (3, 'Atendente', 'Atende clientes e opera reservas, check-in e check-out', 'ATIVO'),
  (4, 'Cliente', 'Cliente que realiza reservas', 'ATIVO'),
  (5, 'Proprietário', 'Dono de imóveis; acompanha reservas e repasses', 'ATIVO');

-- PERMISSOES (RECURSO + ACAO únicos; ACAO: CONSULTAR, CRIAR, EDITAR, EXCLUIR, APROVAR)
INSERT INTO `PERMISSOES` (`ID_PERMISSAO`, `NOME`, `DESCRICAO`, `RECURSO`, `ACAO`, `STATUS`) VALUES
  (1, 'Consultar reservas', 'Permite consultar reservas', 'RESERVAS', 'CONSULTAR', 'ATIVO'),
  (2, 'Criar reservas', 'Permite criar reservas', 'RESERVAS', 'CRIAR', 'ATIVO'),
  (3, 'Editar reservas', 'Permite editar reservas', 'RESERVAS', 'EDITAR', 'ATIVO'),
  (4, 'Excluir reservas', 'Permite excluir reservas', 'RESERVAS', 'EXCLUIR', 'ATIVO'),
  (5, 'Aprovar reservas', 'Permite aprovar reservas', 'RESERVAS', 'APROVAR', 'ATIVO'),
  (6, 'Consultar salas', 'Permite consultar salas', 'SALAS', 'CONSULTAR', 'ATIVO'),
  (7, 'Editar salas', 'Permite editar salas', 'SALAS', 'EDITAR', 'ATIVO'),
  (8, 'Consultar estoque', 'Permite consultar estoque', 'ESTOQUE', 'CONSULTAR', 'ATIVO'),
  (9, 'Editar estoque', 'Permite editar estoque', 'ESTOQUE', 'EDITAR', 'ATIVO'),
  (10, 'Consultar financeiro', 'Permite consultar financeiro', 'FINANCEIRO', 'CONSULTAR', 'ATIVO'),
  (11, 'Aprovar financeiro', 'Permite aprovar financeiro', 'FINANCEIRO', 'APROVAR', 'ATIVO'),
  (12, 'Editar usuários', 'Permite editar usuários', 'USUARIOS', 'EDITAR', 'INATIVO');

INSERT INTO `PERFIS_USUARIOS` (`ID_USUARIO`, `ID_PERFIL`, `STATUS`) VALUES
  (8, 1, 'ATIVO'),
  (8, 2, 'ATIVO'),
  (4, 3, 'ATIVO'),
  (5, 3, 'ATIVO'),
  (12, 3, 'ATIVO'),
  (13, 3, 'ATIVO'),
  (1, 4, 'ATIVO'),
  (2, 4, 'ATIVO'),
  (3, 4, 'ATIVO'),
  (9, 4, 'INATIVO'),
  (10, 4, 'ATIVO'),
  (6, 5, 'ATIVO'),
  (7, 5, 'ATIVO');

-- PERMISSOES_PERFIS (PERMITIDO = FALSE nega explicitamente a permissão)
INSERT INTO `PERMISSOES_PERFIS` (`ID_PERFIL`, `ID_PERMISSAO`, `PERMITIDO`) VALUES
  (1, 1, TRUE),
  (1, 2, TRUE),
  (1, 3, TRUE),
  (1, 4, TRUE),
  (1, 5, TRUE),
  (1, 6, TRUE),
  (1, 7, TRUE),
  (1, 8, TRUE),
  (1, 9, TRUE),
  (1, 10, TRUE),
  (1, 11, TRUE),
  (1, 12, TRUE),
  (2, 1, TRUE),
  (2, 2, TRUE),
  (2, 3, TRUE),
  (2, 4, FALSE),
  (2, 5, TRUE),
  (2, 6, TRUE),
  (2, 7, TRUE),
  (2, 8, TRUE),
  (2, 9, TRUE),
  (2, 10, TRUE),
  (3, 1, TRUE),
  (3, 2, TRUE),
  (3, 3, TRUE),
  (3, 6, TRUE),
  (4, 1, TRUE),
  (4, 2, TRUE),
  (4, 6, TRUE),
  (4, 3, FALSE),
  (5, 1, TRUE),
  (5, 6, TRUE),
  (5, 10, TRUE);

-- CLIENTES (ID_USUARIO pode ser NULL; UNIQUE aceita vários NULL)
INSERT INTO `CLIENTES` (`ID_CLIENTE`, `ID_USUARIO`, `STATUS`, `OBSERVACOES`) VALUES
  (1, 1, 'ATIVO', 'Cliente frequente, prefere salas de reunião'),
  (2, 2, 'ATIVO', NULL),
  (3, 3, 'ATIVO', NULL),
  (4, NULL, 'ATIVO', 'Cliente avulso, atendido no balcão (sem usuário)'),
  (5, 9, 'INATIVO', 'Conta encerrada a pedido do cliente'),
  (6, 10, 'BLOQUEADO', 'Bloqueado por inadimplência'),
  (7, NULL, 'ATIVO', 'Segundo cliente avulso (vários NULL são permitidos no UNIQUE)');

-- FUNCIONARIOS (DATA_DEMISSAO >= DATA_ADMISSAO)
INSERT INTO `FUNCIONARIOS` (`ID_FUNCIONARIO`, `ID_USUARIO`, `CARGO`, `DATA_ADMISSAO`, `DATA_DEMISSAO`, `STATUS`) VALUES
  (1, 4, 'Recepcionista', '2022-03-01', NULL, 'ATIVO'),
  (2, 5, 'Auxiliar de Limpeza', '2023-06-15', NULL, 'ATIVO'),
  (3, 8, 'Gerente', '2020-01-10', NULL, 'ATIVO'),
  (4, 11, 'Auxiliar de Limpeza', '2019-05-01', '2024-12-31', 'DESLIGADO'),
  (5, 12, 'Técnico de Manutenção', '2024-02-05', NULL, 'ATIVO'),
  (6, 13, 'Recepcionista', '2025-08-18', NULL, 'AFASTADO');

-- PROPRIETARIOS (PERCENTUAL_REPASSE entre 0 e 100)
INSERT INTO `PROPRIETARIOS` (`ID_PROPRIETARIO`, `ID_USUARIO`, `PERCENTUAL_REPASSE`, `STATUS`) VALUES
  (1, 6, 85.0, 'ATIVO'),
  (2, 7, 80.0, 'ATIVO');

-- DOCUMENTOS_PESSOAS (TIPO + NÚMERO únicos; validade >= emissão; números fictícios)
INSERT INTO `DOCUMENTOS_PESSOAS` (`ID_DOCUMENTO`, `ID_USUARIO`, `TIPO_DOCUMENTO`, `NUMERO_DOCUMENTO`, `ORGAO_EMISSOR`, `UF_EMISSAO`, `DATA_EMISSAO`, `DATA_VALIDADE`, `PRINCIPAL`, `STATUS`) VALUES
  (1, 1, 'CPF', '10000000001', 'SSP', 'SP', '2010-05-10', NULL, TRUE, 'ATIVO'),
  (2, 1, 'RG', '111222333', 'SSP', 'SP', '2008-03-12', NULL, FALSE, 'ATIVO'),
  (3, 2, 'CPF', '10000000002', 'SSP', 'RJ', '2012-07-20', NULL, TRUE, 'ATIVO'),
  (4, 3, 'CPF', '10000000003', 'SSP', 'MG', '2011-01-15', NULL, TRUE, 'ATIVO'),
  (5, 4, 'CPF', '10000000004', 'SSP', 'SP', '2009-09-09', NULL, TRUE, 'ATIVO'),
  (6, 4, 'CNH', '55500011122', 'DETRAN', 'SP', '2022-02-02', '2032-02-02', FALSE, 'ATIVO'),
  (7, 5, 'CPF', '10000000005', 'SSP', 'SP', '2013-04-04', NULL, TRUE, 'ATIVO'),
  (8, 5, 'CNH', '55500011133', 'DETRAN', 'SP', '2018-01-01', '2023-01-01', FALSE, 'VENCIDO'),
  (9, 6, 'CPF', '10000000006', 'SSP', 'SP', '2010-10-10', NULL, TRUE, 'ATIVO'),
  (10, 6, 'PASSAPORTE', 'FZ123456', 'PF', 'SP', '2021-06-01', '2031-06-01', FALSE, 'ATIVO'),
  (11, 7, 'CPF', '10000000007', 'SSP', 'MG', '2014-11-11', NULL, TRUE, 'ATIVO'),
  (12, 8, 'CPF', '10000000008', 'SSP', 'SP', '2008-08-08', NULL, TRUE, 'ATIVO'),
  (13, 12, 'CPF', '10000000012', 'SSP', 'SP', '2015-05-05', NULL, TRUE, 'ATIVO'),
  (14, 13, 'OUTRO', 'CRC-000123', 'CRC', 'SP', '2020-12-01', NULL, TRUE, 'ATIVO');

-- ENDERECOS_USUARIOS (CEP com 8 dígitos; PAIS usa o default Brasil)
INSERT INTO `ENDERECOS_USUARIOS` (`ID_ENDERECO_USUARIO`, `ID_USUARIO`, `TIPO_ENDERECO`, `CEP`, `LOGRADOURO`, `NUMERO`, `COMPLEMENTO`, `BAIRRO`, `CIDADE`, `UF`, `PRINCIPAL`) VALUES
  (1, 1, 'RESIDENCIAL', '01310100', 'Avenida Paulista', '1000', 'Apto 51', 'Bela Vista', 'São Paulo', 'SP', TRUE),
  (2, 2, 'RESIDENCIAL', '22041001', 'Rua Barata Ribeiro', '200', NULL, 'Copacabana', 'Rio de Janeiro', 'RJ', TRUE),
  (3, 3, 'RESIDENCIAL', '30130010', 'Avenida Afonso Pena', '1500', 'Sala 2', 'Centro', 'Belo Horizonte', 'MG', TRUE),
  (4, 6, 'RESIDENCIAL', '05422010', 'Rua dos Pinheiros', '800', NULL, 'Pinheiros', 'São Paulo', 'SP', TRUE),
  (5, 6, 'COMERCIAL', '04538133', 'Avenida Brigadeiro Faria Lima', '3477', 'Conj. 12', 'Itaim Bibi', 'São Paulo', 'SP', FALSE),
  (6, 7, 'RESIDENCIAL', '30140071', 'Rua da Bahia', '1148', 'Apto 302', 'Lourdes', 'Belo Horizonte', 'MG', TRUE),
  (7, 1, 'COBRANCA', '01310200', 'Rua Haddock Lobo', '300', NULL, 'Cerqueira César', 'São Paulo', 'SP', FALSE);

INSERT INTO `IMOVEIS` (`ID_IMOVEL`, `ID_PROPRIETARIO`, `NOME`, `DESCRICAO`, `CEP`, `LOGRADOURO`, `NUMERO`, `COMPLEMENTO`, `BAIRRO`, `CIDADE`, `UF`, `STATUS`) VALUES
  (1, 1, 'Edifício Central Corporate', 'Prédio comercial com 3 salas e auditório', '01310100', 'Avenida Paulista', '2000', NULL, 'Bela Vista', 'São Paulo', 'SP', 'ATIVO'),
  (2, 1, 'Casa Criativa Vila Madalena', 'Casa adaptada para estúdio e salas criativas', '05435000', 'Rua Harmonia', '450', NULL, 'Vila Madalena', 'São Paulo', 'SP', 'ATIVO'),
  (3, 2, 'Espaço Cowork Savassi', NULL, '30112000', 'Rua Pernambuco', '1000', '2º andar', 'Savassi', 'Belo Horizonte', 'MG', 'ATIVO');

INSERT INTO `TIPOS_SALA` (`ID_TIPO_SALA`, `NOME`, `DESCRICAO`, `STATUS`) VALUES
  (1, 'Sala de Reunião', 'Reuniões e entrevistas', 'ATIVO'),
  (2, 'Auditório', 'Palestras e eventos', 'ATIVO'),
  (3, 'Estúdio', 'Gravações e ensaios', 'ATIVO'),
  (4, 'Sala de Treinamento', 'Cursos e workshops', 'ATIVO');

-- SALAS (CAPACIDADE > 0; VALOR_HORA >= 0; nome único por imóvel)
INSERT INTO `SALAS` (`ID_SALA`, `ID_IMOVEL`, `ID_TIPO_SALA`, `NOME`, `CAPACIDADE`, `VALOR_HORA`, `STATUS`) VALUES
  (1, 1, 1, 'Sala Aurora', 8, 120.0, 'ATIVO'),
  (2, 1, 4, 'Sala Horizonte', 20, 200.0, 'ATIVO'),
  (3, 1, 2, 'Auditório Principal', 80, 450.0, 'ATIVO'),
  (4, 2, 3, 'Estúdio Vila', 6, 180.0, 'EM_MANUTENCAO'),
  (5, 2, 1, 'Sala Jardim', 10, 130.0, 'ATIVO'),
  (6, 3, 1, 'Sala Savassi 1', 6, 100.0, 'ATIVO'),
  (7, 3, 4, 'Sala Savassi Treinamento', 16, 160.0, 'INATIVO');

INSERT INTO `EQUIPAMENTOS` (`ID_EQUIPAMENTO`, `NOME`, `DESCRICAO`, `CATEGORIA`, `STATUS`) VALUES
  (1, 'Projetor Full HD', 'Projetor com HDMI', 'Audiovisual', 'ATIVO'),
  (2, 'TV 55 polegadas', NULL, 'Audiovisual', 'ATIVO'),
  (3, 'Quadro branco', 'Quadro magnético 2x1 m', 'Mobiliário', 'ATIVO'),
  (4, 'Ar-condicionado Split', NULL, 'Climatização', 'EM_MANUTENCAO'),
  (5, 'Sistema de som', 'Caixas e microfone sem fio', 'Audiovisual', 'ATIVO'),
  (6, 'Câmera de vídeo', NULL, NULL, 'INATIVO');

-- EQUIPAMENTOS_SALAS (PK composta)
INSERT INTO `EQUIPAMENTOS_SALAS` (`ID_SALA`, `ID_EQUIPAMENTO`, `QUANTIDADE`, `DATA_INSTALACAO`, `STATUS`, `OBSERVACOES`) VALUES
  (1, 2, 1, '2024-03-10', 'ATIVO', NULL),
  (1, 3, 1, '2024-03-10', 'ATIVO', NULL),
  (2, 1, 1, '2024-05-02', 'ATIVO', 'Cabo HDMI trocado em out/2026'),
  (2, 3, 2, '2024-05-02', 'ATIVO', NULL),
  (3, 1, 2, '2023-11-20', 'ATIVO', NULL),
  (3, 5, 1, '2023-11-20', 'ATIVO', NULL),
  (4, 4, 1, '2025-01-15', 'EM_MANUTENCAO', 'Não está gelando'),
  (4, 5, 1, '2025-01-15', 'ATIVO', NULL),
  (5, 2, 1, '2025-02-01', 'ATIVO', NULL),
  (6, 3, 1, '2025-04-07', 'ATIVO', NULL);

-- REGRAS_HORARIO_FUNCIONAMENTO (DIA_SEMANA 1=segunda..7=domingo; fechado => horários NULL; aberto => fechamento > abertura)
INSERT INTO `REGRAS_HORARIO_FUNCIONAMENTO` (`ID_REGRA_HORARIO`, `ID_SALA`, `DIA_SEMANA`, `HORARIO_ABERTURA`, `HORARIO_FECHAMENTO`, `ESTA_FECHADO`, `DATA_INICIO_VIGENCIA`, `DATA_FIM_VIGENCIA`, `STATUS`) VALUES
  (1, 1, 1, '08:00:00', '18:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (2, 1, 2, '08:00:00', '18:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (3, 1, 3, '08:00:00', '18:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (4, 1, 4, '08:00:00', '18:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (5, 1, 5, '08:00:00', '18:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (6, 1, 6, '09:00:00', '13:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (7, 1, 7, NULL, NULL, TRUE, '2026-01-01', NULL, 'ATIVO'),
  (8, 2, 1, '08:00:00', '18:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (9, 2, 2, '08:00:00', '18:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (10, 2, 3, '08:00:00', '18:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (11, 2, 4, '08:00:00', '18:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (12, 2, 5, '08:00:00', '18:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (13, 2, 6, '09:00:00', '13:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (14, 2, 7, NULL, NULL, TRUE, '2026-01-01', NULL, 'ATIVO'),
  (15, 3, 1, '08:00:00', '18:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (16, 3, 2, '08:00:00', '18:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (17, 3, 3, '08:00:00', '18:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (18, 3, 4, '08:00:00', '18:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (19, 3, 5, '08:00:00', '18:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (20, 3, 6, '09:00:00', '13:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (21, 3, 7, NULL, NULL, TRUE, '2026-01-01', NULL, 'ATIVO'),
  (22, 5, 1, '08:00:00', '18:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (23, 5, 2, '08:00:00', '18:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (24, 5, 3, '08:00:00', '18:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (25, 5, 4, '08:00:00', '18:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (26, 5, 5, '08:00:00', '18:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (27, 5, 6, '09:00:00', '13:00:00', FALSE, '2026-01-01', NULL, 'ATIVO'),
  (28, 5, 7, NULL, NULL, TRUE, '2026-01-01', NULL, 'ATIVO'),
  (29, 1, 6, '08:00:00', '20:00:00', FALSE, '2026-12-01', '2026-12-31', 'ATIVO'),
  (30, 6, 1, '07:00:00', '22:00:00', FALSE, '2026-01-01', NULL, 'ATIVO');

INSERT INTO `REGRAS_GERAIS_CALENDARIO` (`ID_REGRA_CALENDARIO`, `ID_IMOVEL`, `NOME`, `DESCRICAO`, `TIPO_REGRA`, `DATA_INICIO`, `DATA_FIM`, `RECORRENCIA`, `STATUS`) VALUES
  (1, 1, 'Natal', 'Feriado: imóvel fechado', 'FERIADO', '2026-12-25', '2026-12-25', 'ANUAL', 'ATIVO'),
  (2, 1, 'Ano Novo', 'Feriado: imóvel fechado', 'FERIADO', '2027-01-01', '2027-01-01', 'ANUAL', 'ATIVO'),
  (3, 2, 'Abertura estendida de dezembro', 'Funcionamento até 20h', 'EXCECAO', '2026-12-01', '2026-12-31', NULL, 'ATIVO'),
  (4, 3, 'Reforma do hall', 'Imóvel indisponível durante a obra', 'INDISPONIBILIDADE', '2026-11-16', '2026-11-20', NULL, 'ATIVO');

-- BLOQUEIOS_MANUAIS_SALAS (fim > início)
INSERT INTO `BLOQUEIOS_MANUAIS_SALAS` (`ID_BLOQUEIO`, `ID_SALA`, `ID_USUARIO`, `DATA_HORA_INICIO`, `DATA_HORA_FIM`, `MOTIVO`, `STATUS`) VALUES
  (1, 4, 8, '2026-11-02 08:00:00', '2026-11-06 18:00:00', 'Troca do ar-condicionado', 'ATIVO'),
  (2, 3, 8, '2026-09-14 08:00:00', '2026-09-14 18:00:00', 'Limpeza profunda do auditório', 'ENCERRADO'),
  (3, 6, 4, '2026-11-25 08:00:00', '2026-11-25 12:00:00', 'Visita técnica (cancelada)', 'CANCELADO');

-- HORARIOS_FUNCIONAMENTO_IMOVEIS
INSERT INTO `HORARIOS_FUNCIONAMENTO_IMOVEIS` (`ID_HORARIO_IMOVEL`, `ID_IMOVEL`, `DIA_SEMANA`, `HORARIO_ABERTURA`, `HORARIO_FECHAMENTO`, `ESTA_FECHADO`) VALUES
  (1, 1, 1, '07:30:00', '19:00:00', FALSE),
  (2, 1, 2, '07:30:00', '19:00:00', FALSE),
  (3, 1, 3, '07:30:00', '19:00:00', FALSE),
  (4, 1, 4, '07:30:00', '19:00:00', FALSE),
  (5, 1, 5, '07:30:00', '19:00:00', FALSE),
  (6, 1, 6, '09:00:00', '14:00:00', FALSE),
  (7, 1, 7, NULL, NULL, TRUE),
  (8, 2, 1, '07:30:00', '19:00:00', FALSE),
  (9, 2, 2, '07:30:00', '19:00:00', FALSE),
  (10, 2, 3, '07:30:00', '19:00:00', FALSE),
  (11, 2, 4, '07:30:00', '19:00:00', FALSE),
  (12, 2, 5, '07:30:00', '19:00:00', FALSE),
  (13, 2, 6, '09:00:00', '14:00:00', FALSE),
  (14, 2, 7, NULL, NULL, TRUE),
  (15, 3, 1, '07:30:00', '19:00:00', FALSE),
  (16, 3, 2, '07:30:00', '19:00:00', FALSE),
  (17, 3, 3, '07:30:00', '19:00:00', FALSE),
  (18, 3, 4, '07:30:00', '19:00:00', FALSE),
  (19, 3, 5, '07:30:00', '19:00:00', FALSE),
  (20, 3, 6, NULL, NULL, TRUE),
  (21, 3, 7, NULL, NULL, TRUE);

-- RESERVAS (CANCELADA exige DATA_CANCELAMENTO e MOTIVO_CANCELAMENTO; imóvel/proprietário coerentes com a sala)
INSERT INTO `RESERVAS` (`ID_RESERVA`, `ID_CLIENTE`, `ID_SALA`, `ID_IMOVEL`, `ID_PROPRIETARIO`, `DATA_HORA_INICIO`, `DATA_HORA_FIM`, `DATA_RESERVA`, `VALOR_TOTAL`, `STATUS`, `OBSERVACOES`, `DATA_CANCELAMENTO`, `MOTIVO_CANCELAMENTO`) VALUES
  (1, 1, 1, 1, 1, '2026-10-13 09:00:00', '2026-10-13 12:00:00', '2026-10-05 14:00:00', 360.0, 'CONCLUIDA', NULL, NULL, NULL),
  (2, 2, 2, 1, 1, '2026-10-20 14:00:00', '2026-10-20 18:00:00', '2026-10-10 09:30:00', 800.0, 'CONCLUIDA', NULL, NULL, NULL),
  (3, 3, 3, 1, 1, '2026-10-27 08:00:00', '2026-10-27 12:00:00', '2026-10-15 16:00:00', 1800.0, 'EM_ANDAMENTO', 'Evento corporativo', NULL, NULL),
  (4, 1, 5, 2, 1, '2026-11-05 10:00:00', '2026-11-05 13:00:00', '2026-10-22 11:00:00', 390.0, 'CONFIRMADA', NULL, NULL, NULL),
  (5, 2, 6, 3, 2, '2026-11-10 09:00:00', '2026-11-10 11:00:00', '2026-10-26 08:15:00', 200.0, 'PENDENTE', 'Aguardando pagamento', NULL, NULL),
  (6, 3, 1, 1, 1, '2026-11-12 15:00:00', '2026-11-12 17:00:00', '2026-10-18 10:00:00', 240.0, 'CANCELADA', NULL, '2026-10-24 10:00:00', 'Cliente desistiu do evento'),
  (7, 1, 2, 1, 1, '2026-11-20 08:00:00', '2026-11-20 12:00:00', '2026-10-23 17:45:00', 800.0, 'CONFIRMADA', NULL, NULL, NULL);

-- CHECKIN (um por reserva)
INSERT INTO `CHECKIN` (`ID_CHECKIN`, `ID_RESERVA`, `ID_FUNCIONARIO`, `DATA_HORA_CHECKIN`, `OBSERVACOES`, `STATUS`) VALUES
  (1, 1, 1, '2026-10-13 08:55:00', 'Sala em ordem', 'REALIZADO'),
  (2, 2, 1, '2026-10-20 13:50:00', NULL, 'REALIZADO'),
  (3, 3, 2, '2026-10-27 07:55:00', 'Auditório preparado', 'REALIZADO');

-- CHECKOUT (um por reserva)
INSERT INTO `CHECKOUT` (`ID_CHECKOUT`, `ID_RESERVA`, `ID_FUNCIONARIO`, `DATA_HORA_CHECKOUT`, `OBSERVACOES`, `DANOS_IDENTIFICADOS`, `STATUS`) VALUES
  (1, 1, 1, '2026-10-13 12:05:00', NULL, NULL, 'REALIZADO'),
  (2, 2, 2, '2026-10-20 18:10:00', 'Cliente avisado', 'Cabo do projetor danificado', 'COM_PENDENCIA');

INSERT INTO `CATEGORIAS_PRODUTOS` (`ID_CATEGORIA`, `NOME`, `DESCRICAO`, `GESTOR`) VALUES
  (1, 'Limpeza', 'Produtos de limpeza e higiene', 'Elisa Rocha'),
  (2, 'Descartáveis', 'Copos, guardanapos', 'Henrique Costa'),
  (3, 'Manutenção', 'Material elétrico e reparos', 'Lucas Ferreira'),
  (4, 'Escritório', NULL, NULL);

INSERT INTO `PRODUTOS` (`ID_PRODUTO`, `ID_CATEGORIA`, `NOME`, `UNIDADE_MEDIDA`, `ESTOQUE_MINIMO`, `CUSTO_UNITARIO`) VALUES
  (1, 1, 'Detergente neutro 5L', 'LITRO', 5.0, 18.9),
  (2, 1, 'Pano de microfibra', 'UNIDADE', 20.0, 4.5),
  (3, 1, 'Álcool 70% 1L', 'LITRO', 10.0, 9.9),
  (4, 2, 'Copo descartável 200 ml (caixa)', 'CAIXA', 10.0, 12.0),
  (5, 3, 'Lâmpada LED 12W', 'UNIDADE', 10.0, 14.5),
  (6, 3, 'Cabo HDMI 2 m', 'UNIDADE', 3.0, 28.0),
  (7, 4, 'Papel A4 (resma)', 'RESMA', 5.0, 24.9),
  (8, 1, 'Desinfetante 2L', 'LITRO', 8.0, 6.5);

-- ORDENS_MANUTENCAO (conclusão >= início)
INSERT INTO `ORDENS_MANUTENCAO` (`ID_ORDEM_MANUTENCAO`, `ID_SALA`, `ID_FUNCIONARIO`, `DESCRICAO_PROBLEMA`, `DATA_ABERTURA`, `DATA_INICIO`, `DATA_CONCLUSAO`, `PRIORIDADE`, `STATUS`, `OBSERVACOES`) VALUES
  (1, 4, 5, 'Ar-condicionado não gela', '2026-10-20 09:00:00', '2026-10-22 08:00:00', NULL, 'ALTA', 'EM_ANDAMENTO', 'Aguardando peça'),
  (2, 2, NULL, 'Cabo do projetor danificado (apontado no check-out)', '2026-10-20 18:30:00', NULL, NULL, 'MEDIA', 'ABERTA', NULL),
  (3, 5, 5, 'Troca de lâmpadas queimadas', '2026-10-01 10:00:00', '2026-10-02 09:00:00', '2026-10-02 11:00:00', 'BAIXA', 'CONCLUIDA', NULL);

INSERT INTO `ORDENS_LIMPEZA` (`ID_ORDEM_LIMPEZA`, `ID_SALA`, `ID_FUNCIONARIO`, `ID_RESERVA`, `DATA_AGENDADA`, `DATA_INICIO`, `DATA_CONCLUSAO`, `STATUS`, `OBSERVACOES`) VALUES
  (1, 1, 2, 1, '2026-10-13 12:30:00', '2026-10-13 12:35:00', '2026-10-13 13:10:00', 'CONCLUIDA', NULL),
  (2, 2, 2, 2, '2026-10-20 18:30:00', '2026-10-20 18:35:00', '2026-10-20 19:20:00', 'CONCLUIDA', NULL),
  (3, 3, 2, 3, '2026-10-27 12:30:00', NULL, NULL, 'PENDENTE', NULL),
  (4, 6, 2, NULL, '2026-11-03 07:00:00', NULL, NULL, 'PENDENTE', 'Limpeza de rotina, sem reserva'),
  (5, 1, 2, 6, '2026-11-12 17:30:00', NULL, NULL, 'CANCELADA', 'Reserva cancelada');

-- USO_MATERIAIS_LIMPEZA (quantidade > 0)
INSERT INTO `USO_MATERIAIS_LIMPEZA` (`ID_USO_MATERIAL`, `ID_ORDEM_LIMPEZA`, `ID_PRODUTO`, `QUANTIDADE_UTILIZADA`, `DATA_UTILIZACAO`) VALUES
  (1, 1, 1, 0.25, '2026-10-13 12:40:00'),
  (2, 1, 2, 2.0, '2026-10-13 12:40:00'),
  (3, 2, 1, 0.3, '2026-10-20 18:40:00'),
  (4, 2, 3, 0.5, '2026-10-20 18:40:00'),
  (5, 2, 2, 3.0, '2026-10-20 18:40:00');

INSERT INTO `EVIDENCIAS_VISTORIA_MANUTENCAO` (`ID_EVIDENCIA`, `ID_CHECKIN`, `ID_CHECKOUT`, `ID_ORDEM_MANUTENCAO`, `ID_ORDEM_LIMPEZA`, `ID_USUARIO`, `TIPO_EVIDENCIA`, `DESCRICAO`, `CAMINHO_ARQUIVO`) VALUES
  (1, 1, NULL, NULL, NULL, 4, 'FOTO', 'Sala em ordem antes do uso', '/evidencias/checkin/1/foto1.jpg'),
  (2, NULL, 2, NULL, NULL, 5, 'FOTO', 'Cabo do projetor danificado', '/evidencias/checkout/2/foto1.jpg'),
  (3, NULL, NULL, 1, NULL, 12, 'VIDEO', 'Teste do ar-condicionado', '/evidencias/manutencao/1/teste.mp4'),
  (4, NULL, NULL, NULL, 1, 5, 'FOTO', 'Sala limpa após a reserva', '/evidencias/limpeza/1/foto1.jpg'),
  (5, NULL, NULL, 3, NULL, 12, 'DOCUMENTO', 'Nota fiscal das lâmpadas', '/evidencias/manutencao/3/nf.pdf');

INSERT INTO `MOVIMENTACOES_ESTOQUE` (`ID_MOVIMENTACAO_ESTOQUE`, `ID_PRODUTO`, `ID_USUARIO`, `TIPO_MOVIMENTACAO`, `QUANTIDADE`, `DATA_MOVIMENTACAO`, `MOTIVO`, `CUSTO_UNITARIO`) VALUES
  (1, 1, 8, 'ENTRADA', 20.0, '2026-10-07 14:30:00', 'Recebimento do pedido de compra 1', 17.5),
  (2, 2, 8, 'ENTRADA', 100.0, '2026-10-07 14:30:00', 'Recebimento do pedido de compra 1', 3.9),
  (3, 3, 8, 'ENTRADA', 30.0, '2026-10-07 14:30:00', 'Recebimento do pedido de compra 1', 8.9),
  (4, 1, 5, 'SAIDA', 0.25, '2026-10-13 12:40:00', 'Uso na limpeza da sala 1', NULL),
  (5, 2, 5, 'SAIDA', 2.0, '2026-10-13 12:40:00', 'Uso na limpeza da sala 1', NULL),
  (6, 3, 8, 'AJUSTE', 1.0, '2026-10-21 09:00:00', 'Ajuste de inventário', NULL);

-- FORNECEDORES (DOCUMENTO_FISCAL único; dados fictícios)
INSERT INTO `FORNECEDORES` (`ID_FORNECEDOR`, `RAZAO_SOCIAL`, `NOME_FANTASIA`, `TIPO_PESSOA`, `DOCUMENTO_FISCAL`, `STATUS`) VALUES
  (1, 'Limpa Tudo Distribuidora Ltda', 'Limpa Tudo', 'JURIDICA', '11222333000181', 'ATIVO'),
  (2, 'Papelaria Central Eireli', 'Papelaria Central', 'JURIDICA', '45997418000153', 'ATIVO'),
  (3, 'Eletro Luz Materiais Elétricos Ltda', 'Eletro Luz', 'JURIDICA', '60701190000104', 'ATIVO'),
  (4, 'Marcos Antônio Souza', NULL, 'FISICA', '52998224725', 'INATIVO');

-- TELEFONES_FORNECEDORES (PK gerada por trigger)
INSERT INTO `TELEFONES_FORNECEDORES` (`ID_FORNECEDOR`, `NUMERO_TELEFONE`, `TIPO_TELEFONE`, `PRINCIPAL`, `STATUS`) VALUES
  (1, '1140041001', 'COMERCIAL', TRUE, 'ATIVO'),
  (1, '11987650001', 'WHATSAPP', FALSE, 'ATIVO'),
  (2, '1130303030', 'COMERCIAL', TRUE, 'ATIVO'),
  (3, '1150505050', 'COMERCIAL', TRUE, 'ATIVO'),
  (4, '11912341234', 'CELULAR', TRUE, 'INATIVO');

INSERT INTO `EMAILS_FORNECEDORES` (`ID_EMAIL_FORNECEDOR`, `ID_FORNECEDOR`, `ENDERECO_EMAIL`, `PRINCIPAL`, `STATUS`) VALUES
  (1, 1, 'vendas@limpatudo.example.com', TRUE, 'ATIVO'),
  (2, 1, 'financeiro@limpatudo.example.com', FALSE, 'ATIVO'),
  (3, 2, 'contato@papelariacentral.example.com', TRUE, 'ATIVO'),
  (4, 3, 'vendas@eletroluz.example.com', TRUE, 'ATIVO'),
  (5, 4, 'marcos.souza@exemplo.com.br', TRUE, 'INATIVO');

INSERT INTO `ENDERECOS_FORNECEDORES` (`ID_ENDERECO_FORNECEDOR`, `ID_FORNECEDOR`, `TIPO_ENDERECO`, `CEP`, `LOGRADOURO`, `NUMERO`, `COMPLEMENTO`, `BAIRRO`, `CIDADE`, `UF`, `PRINCIPAL`, `STATUS`) VALUES
  (1, 1, 'COMERCIAL', '03047000', 'Rua do Gasômetro', '120', NULL, 'Brás', 'São Paulo', 'SP', TRUE, 'ATIVO'),
  (2, 2, 'COMERCIAL', '01046010', 'Rua Santa Ifigênia', '45', 'Loja 2', 'Santa Ifigênia', 'São Paulo', 'SP', TRUE, 'ATIVO'),
  (3, 3, 'COMERCIAL', '01227000', 'Rua Vitória', '300', NULL, 'Santa Ifigênia', 'São Paulo', 'SP', TRUE, 'ATIVO'),
  (4, 3, 'COBRANCA', '01227001', 'Rua Aurora', '99', 'Sala 4', 'Santa Ifigênia', 'São Paulo', 'SP', FALSE, 'ATIVO'),
  (5, 4, 'RESIDENCIAL', '04101000', 'Rua Vergueiro', '1500', NULL, 'Vila Mariana', 'São Paulo', 'SP', TRUE, 'INATIVO');

-- PRODUTOS_FORNECEDORES (produto+fornecedor únicos; um fornecedor principal por produto)
INSERT INTO `PRODUTOS_FORNECEDORES` (`ID_PRODUTO_FORNECEDOR`, `ID_PRODUTO`, `ID_FORNECEDOR`, `CODIGO_PRODUTO_FORNECEDOR`, `PRECO_COMPRA`, `PRAZO_ENTREGA`, `QUANTIDADE_MINIMA_PEDIDO`, `PRODUTO_PRINCIPAL`) VALUES
  (1, 1, 1, 'LT-DET-5L', 17.5, 3, 2.0, TRUE),
  (2, 2, 1, 'LT-PANO-01', 3.9, 3, 10.0, TRUE),
  (3, 3, 1, 'LT-ALC-70', 8.9, 3, 6.0, TRUE),
  (4, 4, 2, 'PC-COPO-200', 10.8, 5, 5.0, TRUE),
  (5, 7, 2, 'PC-A4-500', 22.5, 5, 5.0, TRUE),
  (6, 5, 3, 'EL-LED-12W', 12.9, 7, 10.0, TRUE),
  (7, 6, 3, 'EL-HDMI-2M', 25.0, 7, 1.0, TRUE),
  (8, 1, 2, 'PC-DET-5L', 19.2, 6, 1.0, FALSE),
  (9, 8, 1, NULL, 5.8, NULL, 1.0, TRUE);

-- PEDIDOS_COMPRA (entrega prevista >= data do pedido)
INSERT INTO `PEDIDOS_COMPRA` (`ID_PEDIDO_COMPRA`, `ID_FORNECEDOR`, `ID_USUARIO`, `DATA_PEDIDO`, `DATA_PREVISTA_ENTREGA`, `STATUS`) VALUES
  (1, 1, 8, '2026-10-02 10:00:00', '2026-10-07', 'RECEBIDO'),
  (2, 3, 8, '2026-10-20 15:00:00', '2026-10-30', 'RECEBIDO_PARCIAL'),
  (3, 2, 8, '2026-10-25 09:00:00', '2026-11-05', 'SOLICITADO'),
  (4, 1, 8, '2026-10-26 11:00:00', NULL, 'RASCUNHO');

-- ITENS_PEDIDO_COMPRA (pedido+produto únicos; quantidade > 0)
INSERT INTO `ITENS_PEDIDO_COMPRA` (`ID_ITEM_PEDIDO`, `ID_PEDIDO_COMPRA`, `ID_PRODUTO`, `QUANTIDADE`, `PRECO_UNITARIO`) VALUES
  (1, 1, 1, 20.0, 17.5),
  (2, 1, 2, 100.0, 3.9),
  (3, 1, 3, 30.0, 8.9),
  (4, 2, 5, 20.0, 12.9),
  (5, 2, 6, 5.0, 25.0),
  (6, 3, 4, 10.0, 10.8),
  (7, 3, 7, 10.0, 22.5),
  (8, 4, 1, 10.0, 17.5);

INSERT INTO `RECEBIMENTOS_COMPRA` (`ID_RECEBIMENTO`, `ID_PEDIDO_COMPRA`, `ID_USUARIO`, `DATA_RECEBIMENTO`, `NUMERO_DOCUMENTO_RECEBIMENTO`, `STATUS`) VALUES
  (1, 1, 4, '2026-10-07 14:00:00', 'NF-000123', 'COMPLETO'),
  (2, 2, 4, '2026-10-26 16:00:00', 'NF-004567', 'PARCIAL');

-- ITENS_RECEBIMENTO (produto igual ao do item do pedido)
INSERT INTO `ITENS_RECEBIMENTO` (`ID_ITEM_RECEBIMENTO`, `ID_RECEBIMENTO`, `ID_ITEM_PEDIDO`, `ID_PRODUTO`, `QUANTIDADE_RECEBIDA`, `PRECO_UNITARIO_RECEBIDO`, `DATA_VALIDADE`, `LOTE`) VALUES
  (1, 1, 1, 1, 20.0, 17.5, '2028-10-01', 'L2026-10A'),
  (2, 1, 2, 2, 100.0, 3.9, NULL, NULL),
  (3, 1, 3, 3, 30.0, 8.9, '2028-06-01', 'L2026-09B'),
  (4, 2, 4, 5, 12.0, 12.9, NULL, 'L-LED-77'),
  (5, 2, 5, 6, 5.0, 25.0, NULL, NULL);

INSERT INTO `CONTAS_FINANCEIRAS` (`ID_CONTA_FINANCEIRA`, `NOME`, `TIPO_CONTA`, `INSTITUICAO`, `SALDO_INICIAL`) VALUES
  (1, 'Caixa Geral', 'CAIXA', NULL, 1000.0),
  (2, 'Conta Corrente Operacional', 'CORRENTE', 'Banco Exemplo', 5000.0),
  (3, 'Reserva de Emergência', 'POUPANCA', 'Banco Exemplo', 0.0);

-- MOVIMENTACOES_FINANCEIRAS (ESTORNO aponta para a movimentação original)
INSERT INTO `MOVIMENTACOES_FINANCEIRAS` (`ID_MOVIMENTACAO_FINANCEIRA`, `ID_CONTA_FINANCEIRA`, `ID_RESERVA`, `ID_PEDIDO_COMPRA`, `ID_ORDEM_MANUTENCAO`, `ID_PROPRIETARIO`, `ID_MOVIMENTACAO_ORIGINAL`, `TIPO_MOVIMENTACAO`, `DESCRICAO`, `VALOR`, `DATA_MOVIMENTACAO`, `DATA_VENCIMENTO`, `DATA_PAGAMENTO`, `STATUS`) VALUES
  (1, 2, 1, NULL, NULL, NULL, NULL, 'RECEITA', 'Pagamento da reserva 1', 360.0, '2026-10-13 12:10:00', '2026-10-13', '2026-10-13 12:10:00', 'PAGA'),
  (2, 2, 2, NULL, NULL, NULL, NULL, 'RECEITA', 'Pagamento da reserva 2', 800.0, '2026-10-20 18:15:00', '2026-10-20', '2026-10-20 18:15:00', 'PAGA'),
  (3, 2, 6, NULL, NULL, NULL, NULL, 'RECEITA', 'Pagamento da reserva 6', 240.0, '2026-10-18 10:05:00', '2026-10-18', '2026-10-18 10:05:00', 'ESTORNADA'),
  (4, 2, 6, NULL, NULL, NULL, 3, 'ESTORNO', 'Estorno da reserva 6 cancelada', 240.0, '2026-10-24 10:30:00', '2026-10-24', '2026-10-24 10:30:00', 'PAGA'),
  (5, 2, NULL, 1, NULL, NULL, NULL, 'DESPESA', 'Compra de produtos de limpeza (pedido 1)', 1007.0, '2026-10-07 14:30:00', '2026-10-09', '2026-10-08 09:00:00', 'PAGA'),
  (6, 2, NULL, 2, NULL, NULL, NULL, 'DESPESA', 'Compra de material elétrico (pedido 2, parcial)', 279.8, '2026-10-26 16:30:00', '2026-11-10', NULL, 'PENDENTE'),
  (7, 2, NULL, NULL, 3, NULL, NULL, 'DESPESA', 'Troca de lâmpadas (ordem de manutenção 3)', 80.0, '2026-10-02 11:30:00', '2026-10-05', '2026-10-05 10:00:00', 'PAGA'),
  (8, 2, NULL, NULL, NULL, 1, NULL, 'REPASSE', 'Repasse de outubro/2026 ao proprietário 1', 986.0, '2026-10-26 17:00:00', '2026-11-05', NULL, 'PREVISTA');

INSERT INTO `CONTAS_BANCARIAS_PROPRIETARIOS` (`ID_CONTA_BANCARIA`, `ID_PROPRIETARIO`, `BANCO`, `AGENCIA`, `NUMERO_CONTA`, `DIGITO_CONTA`, `TIPO_CONTA`, `CHAVE_PIX`, `TITULAR`, `DOCUMENTO_TITULAR`, `PRINCIPAL`) VALUES
  (1, 1, 'Banco Exemplo', '0001', '12345', '6', 'CORRENTE', 'fabio.nunes@exemplo.com.br', 'Fábio Nunes', '10000000006', TRUE),
  (2, 1, 'Banco Teste S.A.', '0002', '98765', '1', 'POUPANCA', NULL, 'Fábio Nunes', '10000000006', FALSE),
  (3, 2, 'Banco Exemplo', '0001', '54321', '0', 'CORRENTE', '+5531955554444', 'Gabriela Torres', '10000000007', TRUE);

-- REGRAS_CANCELAMENTO (percentuais entre 0 e 100; fim de vigência >= início)
INSERT INTO `REGRAS_CANCELAMENTO` (`ID_REGRA_CANCELAMENTO`, `ID_IMOVEL`, `ID_TIPO_SALA`, `NOME`, `PRAZO_LIMITE_HORAS`, `PERCENTUAL_REEMBOLSO`, `MULTA_PERCENTUAL`, `DATA_INICIO_VIGENCIA`, `DATA_FIM_VIGENCIA`) VALUES
  (1, 1, NULL, 'Edifício Central: reembolso total com 48 h', 48, 100.0, 0.0, '2026-01-01', NULL),
  (2, NULL, 3, 'Estúdios: reembolso parcial com 72 h', 72, 50.0, 10.0, '2026-01-01', NULL),
  (3, 2, 1, 'Casa Criativa (reunião): 24 h', 24, 50.0, 20.0, '2026-01-01', '2026-12-31');

INSERT INTO `TAXAS` (`ID_TAXA`, `NOME`, `DESCRICAO`, `TIPO_TAXA`, `VALOR`, `PERCENTUAL`, `DATA_INICIO_VIGENCIA`, `DATA_FIM_VIGENCIA`) VALUES
  (1, 'Taxa de limpeza', 'Valor fixo por reserva', 'FIXA', 50.0, NULL, '2026-01-01', NULL),
  (2, 'Taxa de serviço', 'Percentual sobre o valor da reserva', 'PERCENTUAL', NULL, 5.0, '2026-01-01', NULL),
  (3, 'Cancelamento tardio', NULL, 'PERCENTUAL', NULL, 10.0, '2026-01-01', '2026-12-31');

