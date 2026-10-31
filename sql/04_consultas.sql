-- Consulta gerencial
SELECT s.NOME AS sala,
       DATE_FORMAT(m.DATA_PAGAMENTO, '%Y-%m') AS mes,
       COUNT(DISTINCT r.ID_RESERVA) AS reservas,
       SUM(m.VALOR) AS faturamento
FROM MOVIMENTACOES_FINANCEIRAS m
JOIN RESERVAS r ON r.ID_RESERVA = m.ID_RESERVA
JOIN SALAS s    ON s.ID_SALA = r.ID_SALA
WHERE m.TIPO_MOVIMENTACAO = 'RECEITA' AND m.STATUS = 'PAGA'
GROUP BY s.ID_SALA, s.NOME, mes
ORDER BY mes, faturamento DESC;

-- Restrição
--  teste invalido
UPDATE RESERVAS SET STATUS = 'CANCELADA' WHERE ID_RESERVA = 4;

-- Teste valido
UPDATE RESERVAS
SET STATUS='CANCELADA', DATA_CANCELAMENTO=NOW(), MOTIVO_CANCELAMENTO='Teste'
WHERE ID_RESERVA = 4;

-- Verificar 
SELECT id_reserva, status,motivo_cancelamento from reservas WHERE id_reserva = 4;


-- Relacionamento importante
SELECT r.ID_RESERVA                              AS reserva,
       COALESCE(uc.NOME, '(cliente avulso)')      AS cliente,
       up.NOME                                    AS proprietario,
       s.NOME                                     AS sala,
       r.VALOR_TOTAL                              AS valor_reserva,
       COALESCE(mr.STATUS, 'PENDENTE')         AS pagamento_reserva,
       om.ID_ORDEM_MANUTENCAO                     AS ordem_manut,
       om.DESCRICAO_PROBLEMA                      AS problema,
       om.STATUS                                  AS status_manut,
       mm.VALOR                                   AS custo_manut,
       CASE WHEN om.ID_ORDEM_MANUTENCAO IS NULL THEN NULL
            WHEN mm.ID_MOVIMENTACAO_FINANCEIRA IS NULL THEN 'SEM CUSTO REGISTRADO'
            ELSE mm.STATUS END                    AS pagamento_manut
FROM RESERVAS r
JOIN CLIENTES c            ON c.ID_CLIENTE = r.ID_CLIENTE
LEFT JOIN USUARIOS uc      ON uc.ID_USUARIO = c.ID_USUARIO
JOIN PROPRIETARIOS p       ON p.ID_PROPRIETARIO = r.ID_PROPRIETARIO
JOIN USUARIOS up           ON up.ID_USUARIO = p.ID_USUARIO
JOIN SALAS s               ON s.ID_SALA = r.ID_SALA
LEFT JOIN MOVIMENTACOES_FINANCEIRAS mr
       ON mr.ID_RESERVA = r.ID_RESERVA AND mr.TIPO_MOVIMENTACAO = 'RECEITA'
LEFT JOIN ORDENS_MANUTENCAO om ON om.ID_SALA = r.ID_SALA
LEFT JOIN MOVIMENTACOES_FINANCEIRAS mm
       ON mm.ID_ORDEM_MANUTENCAO = om.ID_ORDEM_MANUTENCAO AND mm.TIPO_MOVIMENTACAO = 'DESPESA'
WHERE r.ID_RESERVA IN (2, 4)
ORDER BY r.ID_RESERVA;