--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10
-- Dumped by pg_dump version 16.2

-- Started on 2024-05-31 16:14:36

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 16 (class 2615 OID 440719)
-- Name: unidade_modelo; Type: SCHEMA; Schema: -; Owner: ceres
--

CREATE SCHEMA unidade_modelo;


ALTER SCHEMA unidade_modelo OWNER TO ceres;

--
-- TOC entry 6216 (class 1247 OID 441409)
-- Name: angulo_haste_sensor_volume; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.angulo_haste_sensor_volume AS ENUM (
    'angulo_30',
    'angulo_45'
);


ALTER TYPE unidade_modelo.angulo_haste_sensor_volume OWNER TO ceres;

--
-- TOC entry 6219 (class 1247 OID 441414)
-- Name: aquecedor_tipo; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.aquecedor_tipo AS ENUM (
    'lenha',
    'glp'
);


ALTER TYPE unidade_modelo.aquecedor_tipo OWNER TO ceres;

--
-- TOC entry 6223 (class 1247 OID 441420)
-- Name: aquecimento_ar; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.aquecimento_ar AS ENUM (
    'aquecimento_ar_1',
    'aquecimento_ar_2',
    'aquecimento_ar_3'
);


ALTER TYPE unidade_modelo.aquecimento_ar OWNER TO ceres;

--
-- TOC entry 6247 (class 1247 OID 441428)
-- Name: area_secador; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.area_secador AS ENUM (
    'nenhum',
    'carga_produto',
    'descarga_produto',
    'entrada_ar',
    'saida_ar',
    'massa_grao',
    'fornalha',
    'condicao_externa',
    'recirculacao'
);


ALTER TYPE unidade_modelo.area_secador OWNER TO ceres;

--
-- TOC entry 6250 (class 1247 OID 441448)
-- Name: armazenagem_evento_origem; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.armazenagem_evento_origem AS ENUM (
    'termometria_padrao',
    'control_mudanca_rele',
    'control_mudanca_status',
    'control_mudanca_chave',
    'falha_comando_status',
    'falha_comando_control',
    'falha_comando_rele',
    'inicio_chuva',
    'fim_chuva',
    'mudanca_estoque',
    'registro_amostragem',
    'mudanca_programa_aeracao',
    'controle_manual_automatico',
    'registro_acionamento_manual',
    'registro_acionamento_automatico',
    'auditoria_aeracao'
);


ALTER TYPE unidade_modelo.armazenagem_evento_origem OWNER TO ceres;

--
-- TOC entry 6253 (class 1247 OID 441482)
-- Name: armazenagem_evento_status; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.armazenagem_evento_status AS ENUM (
    'aguardando',
    'processando',
    'processado',
    'falhado'
);


ALTER TYPE unidade_modelo.armazenagem_evento_status OWNER TO ceres;

--
-- TOC entry 6256 (class 1247 OID 441492)
-- Name: base_armazem; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.base_armazem AS ENUM (
    'plana',
    'em_V',
    'semi_V',
    'em_W'
);


ALTER TYPE unidade_modelo.base_armazem OWNER TO ceres;

--
-- TOC entry 6259 (class 1247 OID 441502)
-- Name: base_silo; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.base_silo AS ENUM (
    'plana',
    'em_v',
    'semi_v'
);


ALTER TYPE unidade_modelo.base_silo OWNER TO ceres;

--
-- TOC entry 6262 (class 1247 OID 441510)
-- Name: caminho_sincronizacao; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.caminho_sincronizacao AS ENUM (
    'leitura',
    'notificacao'
);


ALTER TYPE unidade_modelo.caminho_sincronizacao OWNER TO ceres;

--
-- TOC entry 6265 (class 1247 OID 441516)
-- Name: categoria_controle_servico; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.categoria_controle_servico AS ENUM (
    'coletor',
    'sync_local_nuvem',
    'sync_coletor_ceres'
);


ALTER TYPE unidade_modelo.categoria_controle_servico OWNER TO ceres;

--
-- TOC entry 6268 (class 1247 OID 441524)
-- Name: categoria_obra; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.categoria_obra AS ENUM (
    'estrutura_nova',
    'estrutura_existente'
);


ALTER TYPE unidade_modelo.categoria_obra OWNER TO ceres;

--
-- TOC entry 6271 (class 1247 OID 441530)
-- Name: categoria_parametro_dryer; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.categoria_parametro_dryer AS ENUM (
    'velocidade_descarga',
    'alimentador',
    'bloqueio_descarga',
    'transportador',
    'modo_operacao'
);


ALTER TYPE unidade_modelo.categoria_parametro_dryer OWNER TO ceres;

--
-- TOC entry 6274 (class 1247 OID 441542)
-- Name: categoria_parametro_hd; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.categoria_parametro_hd AS ENUM (
    'velocidade_descarga',
    'eficiencia_secador',
    'modo_operacao',
    'alarme_temperatura_max_fornalha',
    'alarme_temperatura_min_fornalha',
    'alarme_temperatura_max_entrada',
    'alarme_temperatura_min_entrada',
    'alarme_temperatura_max_massa_grao',
    'alarme_temperatura_min_massa_grao',
    'alarme_temperatura_max_saida',
    'alarme_temperatura_min_saida',
    'alarme_carga_maxima',
    'posicao_mesa_descarga',
    'posicao_porta_fornalha',
    'bloqueio_exaustor',
    'bloqueio_carga',
    'abertura_veneziana',
    'fechamento_veneziana',
    'alimentador_fornalha',
    'descarga_mecanica',
    'acionamento_sirene',
    'consumo_combustivel',
    'secador_rodizio',
    'medidor_fluxo_entrada',
    'medidor_fluxo_saida'
);


ALTER TYPE unidade_modelo.categoria_parametro_hd OWNER TO ceres;

--
-- TOC entry 6299 (class 1247 OID 441594)
-- Name: categoria_sensor_alerta; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.categoria_sensor_alerta AS ENUM (
    'pressao',
    'temperatura_termopar',
    'temperatura_digital',
    'umidade_relativa',
    'temperatura_grao',
    'umidade_grao'
);


ALTER TYPE unidade_modelo.categoria_sensor_alerta OWNER TO ceres;

--
-- TOC entry 6302 (class 1247 OID 441608)
-- Name: categoria_sensor_dryer; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.categoria_sensor_dryer AS ENUM (
    'temperatura_digital',
    'umidade_relativa',
    'pressao',
    'temperatura_grao',
    'umidade_grao',
    'nivel_minimo',
    'nivel_maximo'
);


ALTER TYPE unidade_modelo.categoria_sensor_dryer OWNER TO ceres;

--
-- TOC entry 6305 (class 1247 OID 441624)
-- Name: categoria_sensor_hd; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.categoria_sensor_hd AS ENUM (
    'pressao',
    'temperatura_termopar',
    'temperatura_digital',
    'umidade_relativa',
    'temperatura_grao',
    'umidade_grao',
    'nivel_minimo',
    'nivel_maximo'
);


ALTER TYPE unidade_modelo.categoria_sensor_hd OWNER TO ceres;

--
-- TOC entry 6308 (class 1247 OID 441642)
-- Name: categoria_sensor_wms; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.categoria_sensor_wms AS ENUM (
    'temperatura_digital'
);


ALTER TYPE unidade_modelo.categoria_sensor_wms OWNER TO ceres;

--
-- TOC entry 6311 (class 1247 OID 441646)
-- Name: categoria_unidade; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.categoria_unidade AS ENUM (
    'cerealista',
    'cooperativa',
    'fazenda',
    'industria',
    'instituicao',
    'trade'
);


ALTER TYPE unidade_modelo.categoria_unidade OWNER TO ceres;

--
-- TOC entry 6314 (class 1247 OID 441660)
-- Name: categoria_usuario; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.categoria_usuario AS ENUM (
    'procer',
    'cliente'
);


ALTER TYPE unidade_modelo.categoria_usuario OWNER TO ceres;

--
-- TOC entry 6317 (class 1247 OID 441666)
-- Name: comando; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.comando AS ENUM (
    'ligar',
    'desligar'
);


ALTER TYPE unidade_modelo.comando OWNER TO ceres;

--
-- TOC entry 6320 (class 1247 OID 441672)
-- Name: equipamento_categoria; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.equipamento_categoria AS ENUM (
    'termometria',
    'estacao_meteorologica',
    'automacao',
    'leitura_auxiliar',
    'secador',
    'aeracao'
);


ALTER TYPE unidade_modelo.equipamento_categoria OWNER TO ceres;

--
-- TOC entry 6323 (class 1247 OID 441686)
-- Name: equipamento_modelo; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.equipamento_modelo AS ENUM (
    'ehd20',
    'wms',
    'par12',
    'dryer',
    'control',
    'modbus_master',
    'modbus_slave',
    'fluxo_graos',
    'display',
    'secador_hiperdrop',
    'estacao_meteorologica_remota',
    'estacao_meteorologica_proxima',
    'relay16',
    'amw16',
    'integracao_tcpip',
    'tdw20',
    'dig16',
    'garner',
    'par10',
    'guardian',
    'hub',
    'mep10'
);


ALTER TYPE unidade_modelo.equipamento_modelo OWNER TO ceres;

--
-- TOC entry 6326 (class 1247 OID 441732)
-- Name: estacao_meteorologica_tipo; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.estacao_meteorologica_tipo AS ENUM (
    'local',
    'remota',
    'proxima'
);


ALTER TYPE unidade_modelo.estacao_meteorologica_tipo OWNER TO ceres;

--
-- TOC entry 6329 (class 1247 OID 441740)
-- Name: estagio_comando; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.estagio_comando AS ENUM (
    'pendente',
    'executando',
    'concluido'
);


ALTER TYPE unidade_modelo.estagio_comando OWNER TO ceres;

--
-- TOC entry 6353 (class 1247 OID 441748)
-- Name: estrutura_amostragem_descarga_posicao; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.estrutura_amostragem_descarga_posicao AS ENUM (
    'esquerda',
    'central',
    'direita'
);


ALTER TYPE unidade_modelo.estrutura_amostragem_descarga_posicao OWNER TO ceres;

--
-- TOC entry 6356 (class 1247 OID 441756)
-- Name: estrutura_amostragem_local_coleta; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.estrutura_amostragem_local_coleta AS ENUM (
    'pendulo',
    'descarga'
);


ALTER TYPE unidade_modelo.estrutura_amostragem_local_coleta OWNER TO ceres;

--
-- TOC entry 6359 (class 1247 OID 441762)
-- Name: estrutura_categoria; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.estrutura_categoria AS ENUM (
    'silo',
    'armazem'
);


ALTER TYPE unidade_modelo.estrutura_categoria OWNER TO ceres;

--
-- TOC entry 6362 (class 1247 OID 441768)
-- Name: estrutura_secador; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.estrutura_secador AS ENUM (
    'cavalete',
    'coluna',
    'dutos_variaveis'
);


ALTER TYPE unidade_modelo.estrutura_secador OWNER TO ceres;

--
-- TOC entry 6365 (class 1247 OID 441776)
-- Name: estrutura_tipo; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.estrutura_tipo AS ENUM (
    'silo',
    'silo_pulmao',
    'armazem',
    'estacao_meteorologica'
);


ALTER TYPE unidade_modelo.estrutura_tipo OWNER TO ceres;

--
-- TOC entry 6368 (class 1247 OID 441786)
-- Name: expressao_logica; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.expressao_logica AS ENUM (
    'igual',
    'diferente',
    'maior',
    'menor',
    'maior ou igual',
    'menor ou igual'
);


ALTER TYPE unidade_modelo.expressao_logica OWNER TO ceres;

--
-- TOC entry 6371 (class 1247 OID 441800)
-- Name: formato_telhado_armazem; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.formato_telhado_armazem AS ENUM (
    'em_A',
    'em_U'
);


ALTER TYPE unidade_modelo.formato_telhado_armazem OWNER TO ceres;

--
-- TOC entry 6374 (class 1247 OID 441806)
-- Name: funcao_silo; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.funcao_silo AS ENUM (
    'armazenagem',
    'pulmao',
    'secagem',
    'armazenagem_secagem'
);


ALTER TYPE unidade_modelo.funcao_silo OWNER TO ceres;

--
-- TOC entry 6377 (class 1247 OID 441816)
-- Name: funcionalidade_modulo; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.funcionalidade_modulo AS ENUM (
    'armazenagem',
    'secador',
    'gestao_unidade'
);


ALTER TYPE unidade_modelo.funcionalidade_modulo OWNER TO ceres;

--
-- TOC entry 6380 (class 1247 OID 441824)
-- Name: idioma; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.idioma AS ENUM (
    'pt',
    'es',
    'en'
);


ALTER TYPE unidade_modelo.idioma OWNER TO ceres;

--
-- TOC entry 6383 (class 1247 OID 441832)
-- Name: material; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.material AS ENUM (
    'madeira',
    'concreto',
    'metalico'
);


ALTER TYPE unidade_modelo.material OWNER TO ceres;

--
-- TOC entry 6407 (class 1247 OID 441840)
-- Name: metodo_secagem; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.metodo_secagem AS ENUM (
    'continuo',
    'intermitente'
);


ALTER TYPE unidade_modelo.metodo_secagem OWNER TO ceres;

--
-- TOC entry 6410 (class 1247 OID 441846)
-- Name: modelo_mosquetao; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.modelo_mosquetao AS ENUM (
    'sem_trava',
    'com_trava',
    'por_pino'
);


ALTER TYPE unidade_modelo.modelo_mosquetao OWNER TO ceres;

--
-- TOC entry 6413 (class 1247 OID 441854)
-- Name: modelo_painel_secador; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.modelo_painel_secador AS ENUM (
    'wms',
    'dryer',
    'hiperdrop'
);


ALTER TYPE unidade_modelo.modelo_painel_secador OWNER TO ceres;

--
-- TOC entry 6416 (class 1247 OID 441862)
-- Name: modelo_sensor_volume; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.modelo_sensor_volume AS ENUM (
    'sensor_volume_1d',
    'sensor_volume_2d'
);


ALTER TYPE unidade_modelo.modelo_sensor_volume OWNER TO ceres;

--
-- TOC entry 6419 (class 1247 OID 441868)
-- Name: modo_operacao; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.modo_operacao AS ENUM (
    'desligado',
    'carga',
    'descarga_nivel',
    'descarga_sem_nivel'
);


ALTER TYPE unidade_modelo.modo_operacao OWNER TO ceres;

--
-- TOC entry 6422 (class 1247 OID 441878)
-- Name: nome_campo_leitura_dryer; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.nome_campo_leitura_dryer AS ENUM (
    'temperatura_digital',
    'umidade_relativa',
    'pressao',
    'entradas_digitais',
    'temperatura_grao',
    'umidade_grao',
    'modo_operacao',
    'velocidade_descarga'
);


ALTER TYPE unidade_modelo.nome_campo_leitura_dryer OWNER TO ceres;

--
-- TOC entry 6425 (class 1247 OID 441896)
-- Name: nome_campo_leitura_hd; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.nome_campo_leitura_hd AS ENUM (
    'pressao',
    'temperatura_termopar',
    'temperatura_digital',
    'umidade_relativa',
    'sinal_entrada',
    'sinal_saida',
    'sinal_alarme',
    'umidade_saida_grao',
    'temperatura_saida_grao',
    'umidade_entrada_grao',
    'temperatura_entrada_grao',
    'status_operacao',
    'produto_tipo',
    'modo_operacao',
    'tempo_secagem',
    'consumo_combustivel',
    'eficiencia',
    'valor_descarga',
    'tempo_aberto',
    'tempo_fechado',
    'tempo_aberto_mesa',
    'tempo_fechado_mesa',
    'tempo_aberto_veneziana',
    'tempo_fechado_veneziana',
    'tempo_aberto_alimentador',
    'tempo_fechado_alimentador',
    'tempo_minimo_alimentador_ligado',
    'temperatura_controle_veneziana',
    'temperatura_bloqueio_exaustor_massa',
    'temperatura_bloqueio_exaustor_saida',
    'temperatura_maxima_fornalha',
    'temperatura_minima_fornalha',
    'temperatura_maxima_entrada',
    'temperatura_minima_entrada',
    'temperatura_maxima_massa',
    'temperatura_minima_massa',
    'temperatura_maxima_saida',
    'temperatura_minima_saida',
    'idioma',
    'minuteiro_limpeza',
    'intervalo_limpeza',
    'velocidade_descarga',
    'secador_em_rodizio',
    'umidade_controle',
    'fluxo_entrada_grao',
    'fluxo_saida_grao'
);


ALTER TYPE unidade_modelo.nome_campo_leitura_hd OWNER TO ceres;

--
-- TOC entry 6428 (class 1247 OID 441990)
-- Name: nuvem_local; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.nuvem_local AS ENUM (
    'local',
    'nuvem'
);


ALTER TYPE unidade_modelo.nuvem_local OWNER TO ceres;

--
-- TOC entry 6431 (class 1247 OID 441996)
-- Name: objetivo_programa; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.objetivo_programa AS ENUM (
    'secagem',
    'resfriamento',
    'conservacao',
    'resfriamento_e_conservacao',
    'corretiva'
);


ALTER TYPE unidade_modelo.objetivo_programa OWNER TO ceres;

--
-- TOC entry 6434 (class 1247 OID 442008)
-- Name: operacao_sincronizacao; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.operacao_sincronizacao AS ENUM (
    'insert',
    'update',
    'delete'
);


ALTER TYPE unidade_modelo.operacao_sincronizacao OWNER TO ceres;

--
-- TOC entry 6438 (class 1247 OID 442016)
-- Name: origem_venda; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.origem_venda AS ENUM (
    'procer',
    'fabricante'
);


ALTER TYPE unidade_modelo.origem_venda OWNER TO ceres;

--
-- TOC entry 6462 (class 1247 OID 442022)
-- Name: partida_tipo; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.partida_tipo AS ENUM (
    'soft_start',
    'compensadora',
    'direta',
    'estrela_triangulo',
    'inversor_frequencia'
);


ALTER TYPE unidade_modelo.partida_tipo OWNER TO ceres;

--
-- TOC entry 6465 (class 1247 OID 442034)
-- Name: pendulo_modelo; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.pendulo_modelo AS ENUM (
    'digital',
    'termopar'
);


ALTER TYPE unidade_modelo.pendulo_modelo OWNER TO ceres;

--
-- TOC entry 6468 (class 1247 OID 442040)
-- Name: pendulo_protecao; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.pendulo_protecao AS ENUM (
    '3_vias',
    '4_vias',
    'placa',
    'pce'
);


ALTER TYPE unidade_modelo.pendulo_protecao OWNER TO ceres;

--
-- TOC entry 6471 (class 1247 OID 442050)
-- Name: perfil_cliente; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.perfil_cliente AS ENUM (
    'basico',
    'especial',
    'premium'
);


ALTER TYPE unidade_modelo.perfil_cliente OWNER TO ceres;

--
-- TOC entry 6474 (class 1247 OID 442058)
-- Name: perfil_funcionalidade_acao; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.perfil_funcionalidade_acao AS ENUM (
    'administrar',
    'consultar',
    'nao_acessar'
);


ALTER TYPE unidade_modelo.perfil_funcionalidade_acao OWNER TO ceres;

--
-- TOC entry 6477 (class 1247 OID 442066)
-- Name: pluviometro_modelo; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.pluviometro_modelo AS ENUM (
    'davis'
);


ALTER TYPE unidade_modelo.pluviometro_modelo OWNER TO ceres;

--
-- TOC entry 6480 (class 1247 OID 442070)
-- Name: prioridade_acionamento; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.prioridade_acionamento AS ENUM (
    'temperatura',
    'umidade',
    'estrutura'
);


ALTER TYPE unidade_modelo.prioridade_acionamento OWNER TO ceres;

--
-- TOC entry 6483 (class 1247 OID 442078)
-- Name: produto_interno; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.produto_interno AS ENUM (
    'aeracao_automatica',
    'automacao_unidade',
    'estacao_meteorologica',
    'gestao_unidade',
    'gerenciamento_secador',
    'monitoramento_secador',
    'termometria',
    'sensor_co2',
    'sensor_plenum',
    'sensor_umidade',
    'sensor_volume',
    'white_label_bronze',
    'white_label_gold',
    'white_label_silver'
);


ALTER TYPE unidade_modelo.produto_interno OWNER TO ceres;

--
-- TOC entry 6486 (class 1247 OID 442108)
-- Name: respiro_modelo; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.respiro_modelo AS ENUM (
    'pescoco_ganso',
    'pontiagudo',
    'exaustor',
    'exaustor_estatico',
    'exaustor_dinamico'
);


ALTER TYPE unidade_modelo.respiro_modelo OWNER TO ceres;

--
-- TOC entry 6489 (class 1247 OID 442120)
-- Name: secagem_evento_origem; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.secagem_evento_origem AS ENUM (
    'historico_padrao',
    'mudanca_controle',
    'mudanca_modo_operacao',
    'registro_alerta',
    'registro_limpeza'
);


ALTER TYPE unidade_modelo.secagem_evento_origem OWNER TO ceres;

--
-- TOC entry 6514 (class 1247 OID 442132)
-- Name: secagem_evento_status; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.secagem_evento_status AS ENUM (
    'aguardando',
    'processando',
    'processado',
    'falhado'
);


ALTER TYPE unidade_modelo.secagem_evento_status OWNER TO ceres;

--
-- TOC entry 6517 (class 1247 OID 442142)
-- Name: sensor_modelo; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.sensor_modelo AS ENUM (
    'sensor_3_vias_hih4602',
    'sensor_4_vias_sht31'
);


ALTER TYPE unidade_modelo.sensor_modelo OWNER TO ceres;

--
-- TOC entry 6520 (class 1247 OID 442148)
-- Name: status_chave; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.status_chave AS ENUM (
    'automatico',
    'manual',
    'sem_comunicacao'
);


ALTER TYPE unidade_modelo.status_chave OWNER TO ceres;

--
-- TOC entry 6523 (class 1247 OID 442156)
-- Name: status_comando_secador_dryer; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.status_comando_secador_dryer AS ENUM (
    'pendente',
    'executado',
    'falha'
);


ALTER TYPE unidade_modelo.status_comando_secador_dryer OWNER TO ceres;

--
-- TOC entry 6526 (class 1247 OID 442164)
-- Name: status_comando_secador_hd; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.status_comando_secador_hd AS ENUM (
    'inalterado',
    'pendente',
    'executado',
    'falha',
    'expirado'
);


ALTER TYPE unidade_modelo.status_comando_secador_hd OWNER TO ceres;

--
-- TOC entry 6529 (class 1247 OID 442176)
-- Name: status_envio_mensagem; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.status_envio_mensagem AS ENUM (
    'nao_se_aplica',
    'pendente',
    'enviada',
    'entregue',
    'nao_entregue',
    'lida',
    'falha',
    'falha_api',
    'erro_interno'
);


ALTER TYPE unidade_modelo.status_envio_mensagem OWNER TO ceres;

--
-- TOC entry 6532 (class 1247 OID 442196)
-- Name: status_motor; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.status_motor AS ENUM (
    'ligado',
    'desligado',
    'sem_comunicacao'
);


ALTER TYPE unidade_modelo.status_motor OWNER TO ceres;

--
-- TOC entry 6535 (class 1247 OID 442204)
-- Name: status_operacao; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.status_operacao AS ENUM (
    'desligado',
    'ligado',
    'defeito_alarme',
    'manutencao'
);


ALTER TYPE unidade_modelo.status_operacao OWNER TO ceres;

--
-- TOC entry 6538 (class 1247 OID 442214)
-- Name: status_pilha_comando; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.status_pilha_comando AS ENUM (
    'incluido',
    'iniciado_fluxo_automacao',
    'aguardando_retorno_control',
    'aguardando_mep',
    'concluido'
);


ALTER TYPE unidade_modelo.status_pilha_comando OWNER TO ceres;

--
-- TOC entry 6541 (class 1247 OID 442226)
-- Name: status_rele; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.status_rele AS ENUM (
    'ligado',
    'desligado',
    'sem_comunicacao'
);


ALTER TYPE unidade_modelo.status_rele OWNER TO ceres;

--
-- TOC entry 6544 (class 1247 OID 442234)
-- Name: tecnologia_sensor_volume; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.tecnologia_sensor_volume AS ENUM (
    'laser'
);


ALTER TYPE unidade_modelo.tecnologia_sensor_volume OWNER TO ceres;

--
-- TOC entry 6568 (class 1247 OID 442238)
-- Name: tipo_espalhador; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.tipo_espalhador AS ENUM (
    'chines',
    'gravitacional',
    'motorizado'
);


ALTER TYPE unidade_modelo.tipo_espalhador OWNER TO ceres;

--
-- TOC entry 6571 (class 1247 OID 442246)
-- Name: tipo_integracao_estacao; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.tipo_integracao_estacao AS ENUM (
    'accuweather',
    'weatherlink'
);


ALTER TYPE unidade_modelo.tipo_integracao_estacao OWNER TO ceres;

--
-- TOC entry 6574 (class 1247 OID 442252)
-- Name: tipo_ligacao; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.tipo_ligacao AS ENUM (
    'estrela',
    'triangulo'
);


ALTER TYPE unidade_modelo.tipo_ligacao OWNER TO ceres;

--
-- TOC entry 6577 (class 1247 OID 442258)
-- Name: tipo_pessoa; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.tipo_pessoa AS ENUM (
    'fisica',
    'juridica',
    'estrangeiro'
);


ALTER TYPE unidade_modelo.tipo_pessoa OWNER TO ceres;

--
-- TOC entry 6580 (class 1247 OID 442266)
-- Name: unidade_medida_estoque; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.unidade_medida_estoque AS ENUM (
    'tonelada',
    'quilograma',
    'saca'
);


ALTER TYPE unidade_modelo.unidade_medida_estoque OWNER TO ceres;

--
-- TOC entry 6583 (class 1247 OID 442274)
-- Name: unidade_origem_dados; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.unidade_origem_dados AS ENUM (
    'coletor_ceres',
    'coletor_legado',
    'coletor_sync'
);


ALTER TYPE unidade_modelo.unidade_origem_dados OWNER TO ceres;

--
-- TOC entry 6586 (class 1247 OID 442282)
-- Name: variavel_aquecimento_fonte; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.variavel_aquecimento_fonte AS ENUM (
    'sensor_plenum',
    'media_sensor_plenum',
    'media_aeradores',
    'variavel_aquecimento_padrao'
);


ALTER TYPE unidade_modelo.variavel_aquecimento_fonte OWNER TO ceres;

--
-- TOC entry 6589 (class 1247 OID 442292)
-- Name: versao_sensor_ur; Type: TYPE; Schema: unidade_modelo; Owner: ceres
--

CREATE TYPE unidade_modelo.versao_sensor_ur AS ENUM (
    'fita',
    'case',
    'case_filtro'
);


ALTER TYPE unidade_modelo.versao_sensor_ur OWNER TO ceres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 1406 (class 1259 OID 442299)
-- Name: aeracao_aerador_historico; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.aeracao_aerador_historico (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    estrutura_armazenagem_id uuid NOT NULL,
    aerador_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    status_chave unidade_modelo.status_chave,
    status_rele unidade_modelo.status_rele,
    status_motor unidade_modelo.status_motor,
    aeracao_automatica boolean,
    tempo_decorrido bigint
);


ALTER TABLE unidade_modelo.aeracao_aerador_historico OWNER TO ceres;

--
-- TOC entry 1407 (class 1259 OID 442303)
-- Name: aeracao_estrutura_divisao_historico; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.aeracao_estrutura_divisao_historico (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    estrutura_armazenagem_divisao_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    status_chave unidade_modelo.status_chave,
    status_rele unidade_modelo.status_rele,
    status_motor unidade_modelo.status_motor,
    aeracao_automatica boolean,
    tempo_decorrido bigint
);


ALTER TABLE unidade_modelo.aeracao_estrutura_divisao_historico OWNER TO ceres;

--
-- TOC entry 1408 (class 1259 OID 442307)
-- Name: aeracao_estrutura_historico; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.aeracao_estrutura_historico (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    estrutura_armazenagem_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    status_chave unidade_modelo.status_chave,
    status_rele unidade_modelo.status_rele,
    status_motor unidade_modelo.status_motor,
    aeracao_automatica boolean,
    tempo_decorrido bigint
);


ALTER TABLE unidade_modelo.aeracao_estrutura_historico OWNER TO ceres;

--
-- TOC entry 1409 (class 1259 OID 442311)
-- Name: aerador; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.aerador (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    estrutura_armazenagem_id uuid NOT NULL,
    codigo smallint NOT NULL
);


ALTER TABLE unidade_modelo.aerador OWNER TO ceres;

--
-- TOC entry 1410 (class 1259 OID 442316)
-- Name: aerador_configuracao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.aerador_configuracao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    aerador_id uuid NOT NULL,
    rele_habilitado boolean DEFAULT false NOT NULL,
    rele_equipamento_id uuid,
    rele_indice smallint,
    chave_habilitado boolean DEFAULT false NOT NULL,
    chave_equipamento_id uuid,
    chave_indice smallint,
    status_habilitado boolean DEFAULT false NOT NULL,
    status_equipamento_id uuid,
    status_indice smallint
);


ALTER TABLE unidade_modelo.aerador_configuracao OWNER TO ceres;

--
-- TOC entry 1411 (class 1259 OID 442323)
-- Name: aerador_leitura_chave; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.aerador_leitura_chave (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    aerador_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    valor boolean
);


ALTER TABLE unidade_modelo.aerador_leitura_chave OWNER TO ceres;

--
-- TOC entry 1412 (class 1259 OID 442327)
-- Name: aerador_leitura_mep; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.aerador_leitura_mep (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    aerador_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    valor boolean
);


ALTER TABLE unidade_modelo.aerador_leitura_mep OWNER TO ceres;

--
-- TOC entry 1413 (class 1259 OID 442331)
-- Name: aerador_leitura_rele; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.aerador_leitura_rele (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    aerador_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    valor boolean
);


ALTER TABLE unidade_modelo.aerador_leitura_rele OWNER TO ceres;

--
-- TOC entry 1414 (class 1259 OID 442335)
-- Name: aerador_leitura_status; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.aerador_leitura_status (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    aerador_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    valor boolean
);


ALTER TABLE unidade_modelo.aerador_leitura_status OWNER TO ceres;

--
-- TOC entry 1415 (class 1259 OID 442339)
-- Name: aerador_motor; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.aerador_motor (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    aerador_id uuid NOT NULL,
    fabricante character varying(255),
    potencia_eletrica numeric(15,2),
    rendimento integer,
    corrente_nominal numeric(15,2),
    tempo_acionamento smallint DEFAULT 60 NOT NULL,
    partida_tipo unidade_modelo.partida_tipo
);


ALTER TABLE unidade_modelo.aerador_motor OWNER TO ceres;

--
-- TOC entry 14131 (class 0 OID 0)
-- Dependencies: 1415
-- Name: COLUMN aerador_motor.tempo_acionamento; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.aerador_motor.tempo_acionamento IS 'Em segundos';


--
-- TOC entry 1416 (class 1259 OID 442344)
-- Name: aerador_propriedade; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.aerador_propriedade (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    aerador_id uuid NOT NULL,
    movel boolean DEFAULT false NOT NULL,
    fabricante character varying(255),
    aquecedor_tipo unidade_modelo.aquecedor_tipo,
    exaustor boolean DEFAULT true NOT NULL,
    abrigo_protecao boolean DEFAULT true NOT NULL,
    sensor_plenum boolean DEFAULT false NOT NULL
);


ALTER TABLE unidade_modelo.aerador_propriedade OWNER TO ceres;

--
-- TOC entry 1417 (class 1259 OID 442352)
-- Name: aquecimento_ar_historico; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.aquecimento_ar_historico (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    estrutura_armazenagem_divisao_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    usuario_id uuid NOT NULL,
    aquecimento_ar unidade_modelo.aquecimento_ar NOT NULL,
    aquecimento_ar_valor numeric(3,1) NOT NULL
);


ALTER TABLE unidade_modelo.aquecimento_ar_historico OWNER TO ceres;

--
-- TOC entry 1418 (class 1259 OID 442356)
-- Name: armazem; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.armazem (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    estrutura_armazenagem_id uuid NOT NULL,
    formato_telhado unidade_modelo.formato_telhado_armazem DEFAULT 'em_A'::unidade_modelo.formato_telhado_armazem NOT NULL,
    base unidade_modelo.base_armazem DEFAULT 'plana'::unidade_modelo.base_armazem NOT NULL,
    teto_altura numeric(15,2),
    teto_angulo numeric(15,2),
    comprimento_base numeric(15,2),
    largura_base numeric(15,2),
    altura_total numeric(15,2),
    altura_pe_direito numeric(15,2),
    altura_telhado numeric(15,2),
    angulo_telhado numeric(15,2),
    angulo_base_inferior numeric(15,2),
    altura_base_inferior numeric(15,2),
    comprimento_base_inferior numeric(15,2),
    largura_base_inferior numeric(15,2),
    quantidade_celulas smallint
);


ALTER TABLE unidade_modelo.armazem OWNER TO ceres;

--
-- TOC entry 1419 (class 1259 OID 442363)
-- Name: armazem_aerador_visualizacao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.armazem_aerador_visualizacao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    armazem_id uuid NOT NULL,
    aerador_id uuid NOT NULL,
    posicao_x numeric(15,5) NOT NULL,
    posicao_y numeric(15,5) NOT NULL
);


ALTER TABLE unidade_modelo.armazem_aerador_visualizacao OWNER TO ceres;

--
-- TOC entry 1420 (class 1259 OID 442367)
-- Name: armazem_equipamento_visualizacao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.armazem_equipamento_visualizacao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    armazem_id uuid NOT NULL,
    equipamento_id uuid NOT NULL,
    posicao_x numeric(15,5) NOT NULL,
    posicao_y numeric(15,5) NOT NULL
);


ALTER TABLE unidade_modelo.armazem_equipamento_visualizacao OWNER TO ceres;

--
-- TOC entry 1421 (class 1259 OID 442371)
-- Name: armazem_passarela_visualizacao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.armazem_passarela_visualizacao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    armazem_id uuid NOT NULL,
    posicao_y numeric(15,5) NOT NULL
);


ALTER TABLE unidade_modelo.armazem_passarela_visualizacao OWNER TO ceres;

--
-- TOC entry 1422 (class 1259 OID 442375)
-- Name: armazem_pendulo_visualizacao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.armazem_pendulo_visualizacao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    pendulo_id uuid NOT NULL,
    armazem_id uuid NOT NULL,
    arco smallint NOT NULL,
    linha smallint NOT NULL,
    posicao_x numeric(15,5) NOT NULL,
    posicao_y numeric(15,5) NOT NULL
);


ALTER TABLE unidade_modelo.armazem_pendulo_visualizacao OWNER TO ceres;

--
-- TOC entry 1423 (class 1259 OID 442379)
-- Name: armazem_porta_visualizacao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.armazem_porta_visualizacao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    armazem_id uuid NOT NULL,
    posicao_x numeric(15,5) NOT NULL,
    posicao_y numeric(15,5) NOT NULL
);


ALTER TABLE unidade_modelo.armazem_porta_visualizacao OWNER TO ceres;

--
-- TOC entry 1424 (class 1259 OID 442383)
-- Name: armazenagem_evento; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.armazenagem_evento (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    instante timestamp without time zone NOT NULL,
    estrutura_armazenagem_id uuid NOT NULL,
    evento_origem unidade_modelo.armazenagem_evento_origem NOT NULL,
    variavel_aquecimento_aerador json,
    estrutura json,
    estrutura_divisao json,
    pendulos json,
    estatisticas json,
    estoque json,
    amostragem json,
    equipamentos json,
    monitoramento_servicos json,
    estacao_meteorologica json,
    aeradores json,
    aeracao json,
    volumetria json,
    co2 json,
    plenum json,
    usuario json,
    status unidade_modelo.armazenagem_evento_status NOT NULL,
    origem unidade_modelo.nuvem_local NOT NULL
);


ALTER TABLE unidade_modelo.armazenagem_evento OWNER TO ceres;

--
-- TOC entry 1425 (class 1259 OID 442389)
-- Name: armazenagem_ultimo_evento; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.armazenagem_ultimo_evento (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    instante timestamp without time zone NOT NULL,
    estrutura_armazenagem_id uuid NOT NULL,
    evento_origem unidade_modelo.armazenagem_evento_origem NOT NULL,
    variavel_aquecimento_aerador json,
    estrutura json,
    estrutura_divisao json,
    pendulos json,
    estatisticas json,
    estoque json,
    amostragem json,
    equipamentos json,
    monitoramento_servicos json,
    estacao_meteorologica json,
    aeradores json,
    aeracao json,
    volumetria json,
    co2 json,
    plenum json,
    usuario json,
    status unidade_modelo.armazenagem_evento_status NOT NULL
);


ALTER TABLE unidade_modelo.armazenagem_ultimo_evento OWNER TO ceres;

--
-- TOC entry 1426 (class 1259 OID 442395)
-- Name: cidade; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.cidade (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    uf_id uuid NOT NULL,
    mesorregiao_id uuid,
    nome character varying(100) NOT NULL,
    codigo_geografico character varying(10) NOT NULL
);


ALTER TABLE unidade_modelo.cidade OWNER TO ceres;

--
-- TOC entry 1427 (class 1259 OID 442399)
-- Name: cliente; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.cliente (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    nome character varying(255) NOT NULL,
    cidade_id uuid NOT NULL,
    numero_identificacao character varying(25) NOT NULL,
    tipo_pessoa unidade_modelo.tipo_pessoa NOT NULL,
    perfil unidade_modelo.perfil_cliente NOT NULL,
    razao_social character varying(255),
    telefone character varying(25),
    codigo_postal character varying(25),
    bairro character varying(100),
    endereco character varying(255),
    numero character varying(20),
    complemento character varying(100),
    notas text
);


ALTER TABLE unidade_modelo.cliente OWNER TO ceres;

--
-- TOC entry 1428 (class 1259 OID 442406)
-- Name: comunicacao_coletor; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.comunicacao_coletor (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    instante timestamp without time zone NOT NULL,
    status boolean DEFAULT false NOT NULL
);


ALTER TABLE unidade_modelo.comunicacao_coletor OWNER TO ceres;

--
-- TOC entry 1429 (class 1259 OID 442411)
-- Name: comunicacao_local_com_nuvem; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.comunicacao_local_com_nuvem (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    instante timestamp without time zone NOT NULL,
    status boolean DEFAULT false NOT NULL
);


ALTER TABLE unidade_modelo.comunicacao_local_com_nuvem OWNER TO ceres;

--
-- TOC entry 1430 (class 1259 OID 442416)
-- Name: comunicacao_nuvem_com_local; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.comunicacao_nuvem_com_local (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    instante timestamp without time zone NOT NULL,
    status boolean DEFAULT false NOT NULL
);


ALTER TABLE unidade_modelo.comunicacao_nuvem_com_local OWNER TO ceres;

--
-- TOC entry 1431 (class 1259 OID 442421)
-- Name: comunicacao_sincronizador_coletor; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.comunicacao_sincronizador_coletor (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    instante timestamp without time zone NOT NULL,
    status boolean DEFAULT false NOT NULL
);


ALTER TABLE unidade_modelo.comunicacao_sincronizador_coletor OWNER TO ceres;

--
-- TOC entry 1432 (class 1259 OID 442426)
-- Name: control_comando; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.control_comando (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    equipamento_id uuid NOT NULL,
    pilha_comando_aeracao_id uuid,
    instante timestamp without time zone NOT NULL,
    estagio_comando unidade_modelo.estagio_comando DEFAULT 'pendente'::unidade_modelo.estagio_comando NOT NULL,
    comando smallint[] NOT NULL
);


ALTER TABLE unidade_modelo.control_comando OWNER TO ceres;

--
-- TOC entry 1433 (class 1259 OID 442433)
-- Name: controle_aeracao_automatica_historico; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.controle_aeracao_automatica_historico (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    estrutura_armazenagem_divisao_id uuid NOT NULL,
    usuario_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    controle_aeracao_automatica boolean DEFAULT false NOT NULL
);


ALTER TABLE unidade_modelo.controle_aeracao_automatica_historico OWNER TO ceres;

--
-- TOC entry 1434 (class 1259 OID 442438)
-- Name: controle_servico; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.controle_servico (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    usuario_id uuid NOT NULL,
    status boolean NOT NULL,
    categoria unidade_modelo.categoria_controle_servico NOT NULL
);


ALTER TABLE unidade_modelo.controle_servico OWNER TO ceres;

--
-- TOC entry 1435 (class 1259 OID 442442)
-- Name: controle_servico_historico; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.controle_servico_historico (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    instante timestamp without time zone NOT NULL,
    usuario_id uuid NOT NULL,
    status boolean NOT NULL,
    categoria unidade_modelo.categoria_controle_servico NOT NULL
);


ALTER TABLE unidade_modelo.controle_servico_historico OWNER TO ceres;

--
-- TOC entry 1436 (class 1259 OID 442446)
-- Name: controle_sincronizacao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.controle_sincronizacao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    unidade_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    nome_tabela character varying(255) NOT NULL,
    id_registro uuid NOT NULL,
    nome_dominio character varying(255) NOT NULL,
    controle_sincronizacao_ref uuid,
    sincronizado boolean DEFAULT false NOT NULL,
    operacao unidade_modelo.operacao_sincronizacao NOT NULL,
    caminho unidade_modelo.caminho_sincronizacao DEFAULT 'leitura'::unidade_modelo.caminho_sincronizacao NOT NULL
);


ALTER TABLE unidade_modelo.controle_sincronizacao OWNER TO ceres;

--
-- TOC entry 1437 (class 1259 OID 442454)
-- Name: cs_atendimento; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.cs_atendimento (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    usuario_id uuid NOT NULL,
    instante_checkin timestamp without time zone NOT NULL,
    instante_checkout timestamp without time zone,
    contato_telefone boolean,
    contato_whatsapp boolean,
    contato_email boolean,
    contato_chamado boolean,
    notas_chamado text,
    notas text
);


ALTER TABLE unidade_modelo.cs_atendimento OWNER TO ceres;

--
-- TOC entry 1438 (class 1259 OID 442460)
-- Name: equipamento; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.equipamento (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    coletor_equipamento_ref uuid,
    modelo unidade_modelo.equipamento_modelo NOT NULL,
    categoria unidade_modelo.equipamento_categoria NOT NULL,
    nome character varying(255) NOT NULL,
    intervalo_historico smallint DEFAULT 120 NOT NULL,
    tempo_retencao_dados smallint DEFAULT 15 NOT NULL,
    tempo_validacao_comunicacao smallint DEFAULT 15 NOT NULL,
    versao character varying(50),
    codigo smallint NOT NULL
);


ALTER TABLE unidade_modelo.equipamento OWNER TO ceres;

--
-- TOC entry 14132 (class 0 OID 0)
-- Dependencies: 1438
-- Name: COLUMN equipamento.coletor_equipamento_ref; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.equipamento.coletor_equipamento_ref IS 'ID da tabela do equipamento no schema coletor';


--
-- TOC entry 14133 (class 0 OID 0)
-- Dependencies: 1438
-- Name: COLUMN equipamento.intervalo_historico; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.equipamento.intervalo_historico IS 'Em minutos';


--
-- TOC entry 14134 (class 0 OID 0)
-- Dependencies: 1438
-- Name: COLUMN equipamento.tempo_retencao_dados; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.equipamento.tempo_retencao_dados IS 'Em minutos';


--
-- TOC entry 14135 (class 0 OID 0)
-- Dependencies: 1438
-- Name: COLUMN equipamento.tempo_validacao_comunicacao; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.equipamento.tempo_validacao_comunicacao IS 'Em minutos';


--
-- TOC entry 1439 (class 1259 OID 442468)
-- Name: equipamento_comunicacao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.equipamento_comunicacao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    equipamento_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    status boolean DEFAULT false NOT NULL
);


ALTER TABLE unidade_modelo.equipamento_comunicacao OWNER TO ceres;

--
-- TOC entry 1440 (class 1259 OID 442473)
-- Name: estacao_meteorologica_local; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.estacao_meteorologica_local (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    nome character varying(255) NOT NULL,
    equipamento_id uuid NOT NULL,
    codigo smallint NOT NULL
);


ALTER TABLE unidade_modelo.estacao_meteorologica_local OWNER TO ceres;

--
-- TOC entry 1441 (class 1259 OID 442478)
-- Name: estacao_meteorologica_local_config; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.estacao_meteorologica_local_config (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    estacao_meteorologica_id uuid NOT NULL,
    chuva_por_pulso smallint DEFAULT 2 NOT NULL,
    tempo_sem_chuva smallint DEFAULT 60 NOT NULL,
    pluviometro_habilitado boolean DEFAULT false NOT NULL,
    pluviometro_modelo unidade_modelo.pluviometro_modelo,
    sensor_temperatura_habilitado boolean DEFAULT false NOT NULL,
    sensor_temperatura_canal smallint,
    sensor_temperatura_modelo unidade_modelo.sensor_modelo,
    sensor_umidade_habilitado boolean DEFAULT false NOT NULL,
    sensor_umidade_canal smallint,
    sensor_umidade_modelo unidade_modelo.sensor_modelo,
    direcao_vento_habilitado boolean DEFAULT false NOT NULL,
    velocidade_vento_habilitado boolean DEFAULT false NOT NULL,
    bateria_habilitado boolean DEFAULT false NOT NULL
);


ALTER TABLE unidade_modelo.estacao_meteorologica_local_config OWNER TO ceres;

--
-- TOC entry 14136 (class 0 OID 0)
-- Dependencies: 1441
-- Name: COLUMN estacao_meteorologica_local_config.chuva_por_pulso; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.estacao_meteorologica_local_config.chuva_por_pulso IS 'mm * 10 (ex: 0.2mm)';


--
-- TOC entry 14137 (class 0 OID 0)
-- Dependencies: 1441
-- Name: COLUMN estacao_meteorologica_local_config.tempo_sem_chuva; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.estacao_meteorologica_local_config.tempo_sem_chuva IS 'Minutos';


--
-- TOC entry 1442 (class 1259 OID 442490)
-- Name: estacao_meteorologica_local_leitura; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.estacao_meteorologica_local_leitura (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    estacao_meteorologica_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    temperatura smallint,
    umidade smallint,
    chuva smallint,
    chovendo boolean,
    velocidade_vento smallint,
    direcao_vento smallint,
    bateria integer
);


ALTER TABLE unidade_modelo.estacao_meteorologica_local_leitura OWNER TO ceres;

--
-- TOC entry 1443 (class 1259 OID 442494)
-- Name: estacao_meteorologica_local_ultima_leitura; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.estacao_meteorologica_local_ultima_leitura (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    estacao_meteorologica_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    temperatura smallint,
    umidade smallint,
    chuva smallint,
    chovendo boolean,
    velocidade_vento smallint,
    direcao_vento smallint,
    bateria integer
);


ALTER TABLE unidade_modelo.estacao_meteorologica_local_ultima_leitura OWNER TO ceres;

--
-- TOC entry 1444 (class 1259 OID 442498)
-- Name: estacao_meteorologica_ordem_consulta; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.estacao_meteorologica_ordem_consulta (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    nome character varying(255) NOT NULL,
    ordem_padrao boolean DEFAULT true NOT NULL
);


ALTER TABLE unidade_modelo.estacao_meteorologica_ordem_consulta OWNER TO ceres;

--
-- TOC entry 1445 (class 1259 OID 442504)
-- Name: estacao_meteorologica_ordem_consulta_estacao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.estacao_meteorologica_ordem_consulta_estacao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    ordem_consulta_id uuid NOT NULL,
    estacao_meteorologica_ref uuid NOT NULL,
    estacao_tipo unidade_modelo.estacao_meteorologica_tipo NOT NULL,
    ordem smallint NOT NULL
);


ALTER TABLE unidade_modelo.estacao_meteorologica_ordem_consulta_estacao OWNER TO ceres;

--
-- TOC entry 14138 (class 0 OID 0)
-- Dependencies: 1445
-- Name: COLUMN estacao_meteorologica_ordem_consulta_estacao.estacao_meteorologica_ref; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.estacao_meteorologica_ordem_consulta_estacao.estacao_meteorologica_ref IS 'Id da estação meteorológica';


--
-- TOC entry 1446 (class 1259 OID 442508)
-- Name: estacao_meteorologica_proxima; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.estacao_meteorologica_proxima (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    nome character varying(255) NOT NULL,
    equipamento_id uuid NOT NULL,
    uuid_unidade_api uuid NOT NULL,
    estacao_meteorologica_ref uuid NOT NULL,
    codigo smallint NOT NULL
);


ALTER TABLE unidade_modelo.estacao_meteorologica_proxima OWNER TO ceres;

--
-- TOC entry 14139 (class 0 OID 0)
-- Dependencies: 1446
-- Name: COLUMN estacao_meteorologica_proxima.uuid_unidade_api; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.estacao_meteorologica_proxima.uuid_unidade_api IS 'ID da unidade proxima';


--
-- TOC entry 14140 (class 0 OID 0)
-- Dependencies: 1446
-- Name: COLUMN estacao_meteorologica_proxima.estacao_meteorologica_ref; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.estacao_meteorologica_proxima.estacao_meteorologica_ref IS 'Id da estação local da unidade proxima';


--
-- TOC entry 1447 (class 1259 OID 442513)
-- Name: estacao_meteorologica_proxima_leitura; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.estacao_meteorologica_proxima_leitura (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    estacao_meteorologica_proxima_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    temperatura smallint,
    umidade smallint,
    chuva smallint,
    chovendo boolean,
    velocidade_vento smallint,
    direcao_vento smallint,
    bateria integer
);


ALTER TABLE unidade_modelo.estacao_meteorologica_proxima_leitura OWNER TO ceres;

--
-- TOC entry 1448 (class 1259 OID 442517)
-- Name: estacao_meteorologica_remota; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.estacao_meteorologica_remota (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    nome character varying(255) NOT NULL,
    equipamento_id uuid NOT NULL,
    cidade_id uuid,
    tipo_integracao unidade_modelo.tipo_integracao_estacao DEFAULT 'accuweather'::unidade_modelo.tipo_integracao_estacao,
    tempo_espera integer NOT NULL,
    chave_api character varying(100),
    segredo_api character varying(100),
    codigo_equipamento character varying(20),
    codigo smallint NOT NULL
);


ALTER TABLE unidade_modelo.estacao_meteorologica_remota OWNER TO ceres;

--
-- TOC entry 1449 (class 1259 OID 442523)
-- Name: estacao_meteorologica_remota_leitura; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.estacao_meteorologica_remota_leitura (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    estacao_meteorologica_remota_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    temperatura smallint,
    umidade smallint,
    chuva smallint,
    chovendo boolean
);


ALTER TABLE unidade_modelo.estacao_meteorologica_remota_leitura OWNER TO ceres;

--
-- TOC entry 1450 (class 1259 OID 442527)
-- Name: estoque_historico; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.estoque_historico (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    estrutura_armazenagem_divisao_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    usuario_id uuid NOT NULL,
    produto_id uuid,
    estoque_estimado numeric(15,2),
    estoque_informado numeric(15,2),
    estoque_capacidade numeric(15,2)
);


ALTER TABLE unidade_modelo.estoque_historico OWNER TO ceres;

--
-- TOC entry 14141 (class 0 OID 0)
-- Dependencies: 1450
-- Name: COLUMN estoque_historico.estoque_estimado; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.estoque_historico.estoque_estimado IS 'Estimado em quilogramas (kg)';


--
-- TOC entry 14142 (class 0 OID 0)
-- Dependencies: 1450
-- Name: COLUMN estoque_historico.estoque_informado; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.estoque_historico.estoque_informado IS 'Informado em quilogramas (kg)';


--
-- TOC entry 14143 (class 0 OID 0)
-- Dependencies: 1450
-- Name: COLUMN estoque_historico.estoque_capacidade; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.estoque_historico.estoque_capacidade IS 'Capacidade em quilogramas (kg)';


--
-- TOC entry 1451 (class 1259 OID 442531)
-- Name: estrutura_amostragem; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.estrutura_amostragem (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    estrutura_armazenagem_id uuid NOT NULL,
    estrutura_armazenagem_divisao_id uuid NOT NULL,
    usuario_id uuid NOT NULL,
    produto_id uuid NOT NULL,
    instante_inclusao timestamp without time zone NOT NULL,
    data_amostra timestamp without time zone NOT NULL,
    umidade_controle numeric(15,1) NOT NULL,
    impureza_controle numeric(15,1),
    avariados_controle numeric(15,1),
    notas text
);


ALTER TABLE unidade_modelo.estrutura_amostragem OWNER TO ceres;

--
-- TOC entry 1452 (class 1259 OID 442538)
-- Name: estrutura_amostragem_leitura; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.estrutura_amostragem_leitura (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    estrutura_amostragem_id uuid NOT NULL,
    local_coleta unidade_modelo.estrutura_amostragem_local_coleta DEFAULT 'pendulo'::unidade_modelo.estrutura_amostragem_local_coleta NOT NULL,
    descarga_posicao unidade_modelo.estrutura_amostragem_descarga_posicao,
    pendulo_id uuid,
    umidade numeric(15,1) NOT NULL,
    impureza numeric(15,1),
    avariados numeric(15,1)
);


ALTER TABLE unidade_modelo.estrutura_amostragem_leitura OWNER TO ceres;

--
-- TOC entry 1453 (class 1259 OID 442543)
-- Name: estrutura_armazenagem; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.estrutura_armazenagem (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    categoria unidade_modelo.estrutura_categoria NOT NULL,
    codigo smallint NOT NULL,
    nome character varying(255) NOT NULL,
    volume numeric(15,2),
    sensor_umidade_instalado boolean DEFAULT false NOT NULL,
    estacao_meteorologica_ordem_consulta_id uuid
);


ALTER TABLE unidade_modelo.estrutura_armazenagem OWNER TO ceres;

--
-- TOC entry 1454 (class 1259 OID 442549)
-- Name: estrutura_armazenagem_divisao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.estrutura_armazenagem_divisao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    estrutura_armazenagem_id uuid NOT NULL,
    nome character varying(255) NOT NULL,
    programa_aeracao_id uuid,
    produto_id uuid,
    aquecimento_ar unidade_modelo.aquecimento_ar DEFAULT 'aquecimento_ar_2'::unidade_modelo.aquecimento_ar NOT NULL,
    controle_aeracao_automatica boolean DEFAULT false NOT NULL,
    comprimento_base numeric(15,2),
    largura_base numeric(15,2),
    volume numeric(15,2),
    sensor_umidade_instalado boolean DEFAULT false NOT NULL,
    codigo smallint NOT NULL
);


ALTER TABLE unidade_modelo.estrutura_armazenagem_divisao OWNER TO ceres;

--
-- TOC entry 1455 (class 1259 OID 442557)
-- Name: estrutura_armazenagem_divisao_aerador; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.estrutura_armazenagem_divisao_aerador (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    estrutura_armazenagem_divisao_id uuid NOT NULL,
    aerador_id uuid NOT NULL
);


ALTER TABLE unidade_modelo.estrutura_armazenagem_divisao_aerador OWNER TO ceres;

--
-- TOC entry 1456 (class 1259 OID 442562)
-- Name: estrutura_armazenagem_divisao_pendulo; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.estrutura_armazenagem_divisao_pendulo (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    estrutura_armazenagem_divisao_id uuid NOT NULL,
    pendulo_id uuid NOT NULL
);


ALTER TABLE unidade_modelo.estrutura_armazenagem_divisao_pendulo OWNER TO ceres;

--
-- TOC entry 1457 (class 1259 OID 442567)
-- Name: estrutura_armazenagem_propriedade; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.estrutura_armazenagem_propriedade (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    estrutura_armazenagem_id uuid NOT NULL,
    fabricante_id smallint,
    fabricante_vendedor_id smallint,
    data_venda date,
    origem_venda unidade_modelo.origem_venda,
    espalhador_tipo unidade_modelo.tipo_espalhador,
    modelo character varying(255),
    espalhador_altura numeric(15,2),
    ventilacao_compartilhada boolean DEFAULT false NOT NULL,
    notas text,
    material unidade_modelo.material,
    categoria_obra unidade_modelo.categoria_obra
);


ALTER TABLE unidade_modelo.estrutura_armazenagem_propriedade OWNER TO ceres;

--
-- TOC entry 1458 (class 1259 OID 442574)
-- Name: estrutura_armazenagem_respiro; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.estrutura_armazenagem_respiro (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    estrutura_armazenagem_id uuid NOT NULL,
    modelo unidade_modelo.respiro_modelo NOT NULL,
    quantidade smallint NOT NULL
);


ALTER TABLE unidade_modelo.estrutura_armazenagem_respiro OWNER TO ceres;

--
-- TOC entry 1459 (class 1259 OID 442579)
-- Name: funcionalidade; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.funcionalidade (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    modulo unidade_modelo.funcionalidade_modulo NOT NULL,
    nome character varying(255) NOT NULL,
    caminho character varying(500) NOT NULL
);


ALTER TABLE unidade_modelo.funcionalidade OWNER TO ceres;

--
-- TOC entry 1460 (class 1259 OID 442586)
-- Name: log_comando_aeracao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.log_comando_aeracao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    estrutura_armazenagem_id uuid,
    estrutura_armazenagem_divisao_id uuid,
    instante timestamp without time zone NOT NULL,
    usuario_id uuid NOT NULL,
    instante_criacao timestamp without time zone,
    instante_validacao timestamp without time zone,
    automatico boolean NOT NULL,
    comando unidade_modelo.comando,
    status_comando unidade_modelo.status_pilha_comando,
    armazenagem_evento_id uuid,
    regra_expressao_ligar_valores text,
    regra_expressao_manter_ligado_valores text,
    categoria_log_aeracao_id smallint NOT NULL,
    excecao_sistema text,
    origem unidade_modelo.nuvem_local NOT NULL
);


ALTER TABLE unidade_modelo.log_comando_aeracao OWNER TO ceres;

--
-- TOC entry 1461 (class 1259 OID 442592)
-- Name: log_programa_aeracao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.log_programa_aeracao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    programa_aeracao_id uuid,
    instante timestamp without time zone NOT NULL,
    usuario_id uuid NOT NULL,
    nome_antigo character varying(255),
    nome_novo character varying(255),
    expressao_antigo text,
    expressao_novo text,
    objetivo_programa_antigo unidade_modelo.objetivo_programa,
    objetivo_programa_novo unidade_modelo.objetivo_programa
);


ALTER TABLE unidade_modelo.log_programa_aeracao OWNER TO ceres;

--
-- TOC entry 1462 (class 1259 OID 442598)
-- Name: log_regra_aeracao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.log_regra_aeracao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    regra_aeracao_id uuid,
    usuario_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    nome_antigo character varying(255),
    nome_novo character varying(255),
    expressao_ligar_antigo text,
    expressao_ligar_novo text,
    expressao_manter_ligado_antigo text,
    expressao_manter_ligado_novo text
);


ALTER TABLE unidade_modelo.log_regra_aeracao OWNER TO ceres;

--
-- TOC entry 1463 (class 1259 OID 442604)
-- Name: mesorregiao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.mesorregiao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    uf_id uuid,
    nome character varying(100) NOT NULL
);


ALTER TABLE unidade_modelo.mesorregiao OWNER TO ceres;

--
-- TOC entry 1464 (class 1259 OID 442608)
-- Name: migrations; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE unidade_modelo.migrations OWNER TO ceres;

--
-- TOC entry 1465 (class 1259 OID 442613)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: unidade_modelo; Owner: ceres
--

CREATE SEQUENCE unidade_modelo.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE unidade_modelo.migrations_id_seq OWNER TO ceres;

--
-- TOC entry 14144 (class 0 OID 0)
-- Dependencies: 1465
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: unidade_modelo; Owner: ceres
--

ALTER SEQUENCE unidade_modelo.migrations_id_seq OWNED BY unidade_modelo.migrations.id;


--
-- TOC entry 1466 (class 1259 OID 442614)
-- Name: pais; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.pais (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    nome character varying(100) NOT NULL,
    codigo_pais character varying(3) NOT NULL,
    sigla character varying(2) NOT NULL
);


ALTER TABLE unidade_modelo.pais OWNER TO ceres;

--
-- TOC entry 1467 (class 1259 OID 442618)
-- Name: pendulo; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.pendulo (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    estrutura_armazenagem_id uuid NOT NULL,
    codigo smallint NOT NULL
);


ALTER TABLE unidade_modelo.pendulo OWNER TO ceres;

--
-- TOC entry 1468 (class 1259 OID 442623)
-- Name: pendulo_canal; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.pendulo_canal (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    pendulo_id uuid NOT NULL,
    equipamento_id uuid NOT NULL,
    canal_temperatura smallint NOT NULL,
    canal_umidade smallint,
    posicao_sensor_umidade smallint[]
);


ALTER TABLE unidade_modelo.pendulo_canal OWNER TO ceres;

--
-- TOC entry 1469 (class 1259 OID 442629)
-- Name: pendulo_leitura; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.pendulo_leitura (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    pendulo_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    temperatura smallint[],
    umidade smallint[]
);


ALTER TABLE unidade_modelo.pendulo_leitura OWNER TO ceres;

--
-- TOC entry 1470 (class 1259 OID 442635)
-- Name: pendulo_nivel_sensor; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.pendulo_nivel_sensor (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    pendulo_id uuid NOT NULL,
    estoque_historico_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    nivel_sensor smallint NOT NULL
);


ALTER TABLE unidade_modelo.pendulo_nivel_sensor OWNER TO ceres;

--
-- TOC entry 14145 (class 0 OID 0)
-- Dependencies: 1470
-- Name: TABLE pendulo_nivel_sensor; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON TABLE unidade_modelo.pendulo_nivel_sensor IS 'pendencia';


--
-- TOC entry 1471 (class 1259 OID 442639)
-- Name: pendulo_propriedade; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.pendulo_propriedade (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    pendulo_id uuid NOT NULL,
    data_instalacao timestamp without time zone,
    digital_termopar unidade_modelo.pendulo_modelo DEFAULT 'digital'::unidade_modelo.pendulo_modelo NOT NULL,
    sensor_temperatura_quantidade smallint NOT NULL,
    sensor_umidade_quantidade smallint DEFAULT 0 NOT NULL,
    sensor_temperatura_espacamento numeric(10,2),
    modelo_mosquetao unidade_modelo.modelo_mosquetao,
    comprimento numeric(15,2),
    comprimento_cabo_paralelo numeric(15,2),
    comprimento_cabo_pp numeric(15,2),
    distancia_telhado numeric(15,2),
    distancia_base numeric(15,2),
    pendulo_protecao unidade_modelo.pendulo_protecao,
    versao_sensor_ur unidade_modelo.versao_sensor_ur
);


ALTER TABLE unidade_modelo.pendulo_propriedade OWNER TO ceres;

--
-- TOC entry 14146 (class 0 OID 0)
-- Dependencies: 1471
-- Name: COLUMN pendulo_propriedade.sensor_temperatura_espacamento; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.pendulo_propriedade.sensor_temperatura_espacamento IS 'Centímetros';


--
-- TOC entry 1472 (class 1259 OID 442645)
-- Name: pendulo_troca_historico; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.pendulo_troca_historico (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    pendulo_id uuid NOT NULL,
    usuario_id uuid NOT NULL,
    data_troca timestamp without time zone NOT NULL,
    pendulo_protecao_anterior unidade_modelo.pendulo_protecao,
    pendulo_protecao unidade_modelo.pendulo_protecao,
    digital_termopar unidade_modelo.pendulo_modelo,
    tecnico_unidade character varying(100),
    rabicho_trocado boolean,
    notas text
);


ALTER TABLE unidade_modelo.pendulo_troca_historico OWNER TO ceres;

--
-- TOC entry 1473 (class 1259 OID 442652)
-- Name: pendulo_ultima_leitura; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.pendulo_ultima_leitura (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    pendulo_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    temperatura smallint[],
    umidade smallint[]
);


ALTER TABLE unidade_modelo.pendulo_ultima_leitura OWNER TO ceres;

--
-- TOC entry 1474 (class 1259 OID 442658)
-- Name: perfil; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.perfil (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    padrao boolean DEFAULT false NOT NULL,
    nome character varying(100) NOT NULL,
    notas text
);


ALTER TABLE unidade_modelo.perfil OWNER TO ceres;

--
-- TOC entry 1475 (class 1259 OID 442666)
-- Name: perfil_funcionalidade; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.perfil_funcionalidade (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    perfil_id uuid NOT NULL,
    funcionalidade_id uuid NOT NULL,
    acao unidade_modelo.perfil_funcionalidade_acao NOT NULL
);


ALTER TABLE unidade_modelo.perfil_funcionalidade OWNER TO ceres;

--
-- TOC entry 1476 (class 1259 OID 442670)
-- Name: pilha_comando_aeracao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.pilha_comando_aeracao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    estrutura_armazenagem_id uuid NOT NULL,
    estrutura_armazenagem_divisao_id uuid NOT NULL,
    usuario_id uuid NOT NULL,
    instante_criacao timestamp without time zone NOT NULL,
    instante_validacao timestamp without time zone NOT NULL,
    automatico boolean NOT NULL,
    comando unidade_modelo.comando NOT NULL,
    status_comando unidade_modelo.status_pilha_comando NOT NULL,
    armazenagem_evento_id uuid,
    regra_expressao_ligar_valores text,
    regra_expressao_manter_ligado_valores text,
    origem unidade_modelo.nuvem_local NOT NULL
);


ALTER TABLE unidade_modelo.pilha_comando_aeracao OWNER TO ceres;

--
-- TOC entry 1477 (class 1259 OID 442676)
-- Name: planta_unidade; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.planta_unidade (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    unidade_id uuid NOT NULL,
    imagem text NOT NULL
);


ALTER TABLE unidade_modelo.planta_unidade OWNER TO ceres;

--
-- TOC entry 1478 (class 1259 OID 442683)
-- Name: planta_unidade_estrutura; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.planta_unidade_estrutura (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    planta_unidade_id uuid NOT NULL,
    estrutura_armazenagem_id uuid,
    estrutura_tipo unidade_modelo.estrutura_tipo NOT NULL,
    posicao_x numeric(15,5) NOT NULL,
    posicao_y numeric(15,5) NOT NULL
);


ALTER TABLE unidade_modelo.planta_unidade_estrutura OWNER TO ceres;

--
-- TOC entry 1479 (class 1259 OID 442688)
-- Name: produto; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.produto (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    nome character varying(255) NOT NULL,
    produto_tipo_id smallint NOT NULL,
    notas text
);


ALTER TABLE unidade_modelo.produto OWNER TO ceres;

--
-- TOC entry 1480 (class 1259 OID 442695)
-- Name: programa_aeracao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.programa_aeracao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    ultima_alteracao timestamp without time zone NOT NULL,
    nome character varying(255) NOT NULL,
    expressao text NOT NULL,
    objetivo_programa unidade_modelo.objetivo_programa NOT NULL,
    notas text
);


ALTER TABLE unidade_modelo.programa_aeracao OWNER TO ceres;

--
-- TOC entry 1481 (class 1259 OID 442702)
-- Name: programa_aeracao_historico; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.programa_aeracao_historico (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    estrutura_armazenagem_divisao_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    usuario_id uuid NOT NULL,
    programa_aeracao_id uuid,
    log_programa_aeracao_id uuid
);


ALTER TABLE unidade_modelo.programa_aeracao_historico OWNER TO ceres;

--
-- TOC entry 1482 (class 1259 OID 442706)
-- Name: refresh_token; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.refresh_token (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    usuario_id uuid NOT NULL,
    token_hash character varying(255) NOT NULL
);


ALTER TABLE unidade_modelo.refresh_token OWNER TO ceres;

--
-- TOC entry 1483 (class 1259 OID 442710)
-- Name: regiao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.regiao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    pais_id uuid NOT NULL,
    nome character varying(100) NOT NULL
);


ALTER TABLE unidade_modelo.regiao OWNER TO ceres;

--
-- TOC entry 1484 (class 1259 OID 442714)
-- Name: regra_aeracao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.regra_aeracao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    ultima_alteracao timestamp without time zone NOT NULL,
    nome character varying(255) NOT NULL,
    expressao_ligar text NOT NULL,
    expressao_manter_ligado text NOT NULL,
    notas text
);


ALTER TABLE unidade_modelo.regra_aeracao OWNER TO ceres;

--
-- TOC entry 1485 (class 1259 OID 442721)
-- Name: secador; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    equipamento_id uuid NOT NULL,
    display_id uuid,
    codigo smallint NOT NULL,
    nome character varying(255) NOT NULL,
    produto_tipo_id smallint,
    estrutura unidade_modelo.estrutura_secador,
    metodo_secagem unidade_modelo.metodo_secagem,
    modelo_painel unidade_modelo.modelo_painel_secador NOT NULL,
    capacidade_nominal smallint DEFAULT 100 NOT NULL,
    intervalo_limpeza smallint DEFAULT 100 NOT NULL,
    fabricante_id smallint,
    fabricante_modelo character varying(255),
    notas text
);


ALTER TABLE unidade_modelo.secador OWNER TO ceres;

--
-- TOC entry 14147 (class 0 OID 0)
-- Dependencies: 1485
-- Name: COLUMN secador.capacidade_nominal; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador.capacidade_nominal IS 'Em toneladas por hora';


--
-- TOC entry 14148 (class 0 OID 0)
-- Dependencies: 1485
-- Name: COLUMN secador.intervalo_limpeza; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador.intervalo_limpeza IS 'Em horas';


--
-- TOC entry 1486 (class 1259 OID 442730)
-- Name: secador_alerta_configuracao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_alerta_configuracao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    secador_id uuid NOT NULL,
    nome character varying(255) NOT NULL,
    area_secador unidade_modelo.area_secador NOT NULL,
    categoria unidade_modelo.categoria_sensor_alerta NOT NULL,
    mensagem character varying(255) NOT NULL,
    intervalo_verificacao integer DEFAULT 5 NOT NULL,
    expressao_logica unidade_modelo.expressao_logica NOT NULL,
    valor_controle numeric(7,1) NOT NULL,
    notas text
);


ALTER TABLE unidade_modelo.secador_alerta_configuracao OWNER TO ceres;

--
-- TOC entry 14149 (class 0 OID 0)
-- Dependencies: 1486
-- Name: COLUMN secador_alerta_configuracao.intervalo_verificacao; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_alerta_configuracao.intervalo_verificacao IS 'Minutos';


--
-- TOC entry 1487 (class 1259 OID 442738)
-- Name: secador_alerta_destinatario; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_alerta_destinatario (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    secador_alerta_configuracao_id uuid NOT NULL,
    usuario_id uuid,
    nome character varying(255) NOT NULL,
    idioma unidade_modelo.idioma DEFAULT 'pt'::unidade_modelo.idioma NOT NULL,
    telefone character varying(25),
    mostrar_sistema boolean DEFAULT false NOT NULL,
    enviar_mensagem boolean DEFAULT false NOT NULL
);


ALTER TABLE unidade_modelo.secador_alerta_destinatario OWNER TO ceres;

--
-- TOC entry 1488 (class 1259 OID 442746)
-- Name: secador_alerta_registro; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_alerta_registro (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    secador_alerta_configuracao_id uuid NOT NULL,
    produto_tipo_id smallint,
    instante timestamp without time zone NOT NULL,
    valor_leitura numeric(7,1) NOT NULL
);


ALTER TABLE unidade_modelo.secador_alerta_registro OWNER TO ceres;

--
-- TOC entry 1489 (class 1259 OID 442750)
-- Name: secador_alerta_registro_aplicativo; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_alerta_registro_aplicativo (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    secador_alerta_registro_id uuid NOT NULL,
    secador_alerta_destinatario_id uuid NOT NULL,
    mensagem text NOT NULL
);


ALTER TABLE unidade_modelo.secador_alerta_registro_aplicativo OWNER TO ceres;

--
-- TOC entry 1490 (class 1259 OID 442756)
-- Name: secador_alerta_registro_aplicativo_status; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_alerta_registro_aplicativo_status (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    secador_alerta_registro_aplicativo uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    status_envio unidade_modelo.status_envio_mensagem NOT NULL,
    codigo_erro_envio integer
);


ALTER TABLE unidade_modelo.secador_alerta_registro_aplicativo_status OWNER TO ceres;

--
-- TOC entry 1491 (class 1259 OID 442760)
-- Name: secador_alerta_registro_sistema; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_alerta_registro_sistema (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    secador_alerta_registro_id uuid NOT NULL,
    secador_alerta_destinatario_id uuid NOT NULL,
    instante_ciente timestamp without time zone,
    mensagem text NOT NULL
);


ALTER TABLE unidade_modelo.secador_alerta_registro_sistema OWNER TO ceres;

--
-- TOC entry 1492 (class 1259 OID 442766)
-- Name: secador_comando_dryer; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_comando_dryer (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    secador_id uuid NOT NULL,
    usuario_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    origem unidade_modelo.nuvem_local NOT NULL,
    status_comando unidade_modelo.status_comando_secador_dryer,
    alarme_temperatura smallint[],
    produto_tipo smallint[],
    intervalo_limpeza smallint[]
);


ALTER TABLE unidade_modelo.secador_comando_dryer OWNER TO ceres;

--
-- TOC entry 14150 (class 0 OID 0)
-- Dependencies: 1492
-- Name: COLUMN secador_comando_dryer.intervalo_limpeza; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_comando_dryer.intervalo_limpeza IS 'Em horas';


--
-- TOC entry 1493 (class 1259 OID 442772)
-- Name: secador_comando_hd; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_comando_hd (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    secador_id uuid NOT NULL,
    usuario_id uuid NOT NULL,
    instante timestamp with time zone NOT NULL,
    origem unidade_modelo.nuvem_local NOT NULL,
    estagio_comando unidade_modelo.estagio_comando DEFAULT 'pendente'::unidade_modelo.estagio_comando NOT NULL,
    status_comando unidade_modelo.status_comando_secador_hd[],
    produto_tipo smallint[],
    velocidade_descarga smallint[],
    tempo_aberto_mesa smallint[],
    tempo_fechado_mesa smallint[],
    tempo_aberto_veneziana smallint[],
    tempo_fechado_veneziana smallint[],
    tempo_aberto_alimentador smallint[],
    tempo_fechado_alimentador smallint[],
    tempo_minimo_alimentador_ligado smallint[],
    temperatura_controle_veneziana smallint[],
    temperatura_bloqueio_exaustor_massa smallint[],
    temperatura_bloqueio_exaustor_saida smallint[],
    temperatura_maxima_fornalha smallint[],
    temperatura_minima_fornalha smallint[],
    temperatura_maxima_entrada smallint[],
    temperatura_minima_entrada smallint[],
    temperatura_maxima_massa smallint[],
    temperatura_minima_massa smallint[],
    temperatura_maxima_saida smallint[],
    temperatura_minima_saida smallint[],
    idioma smallint[],
    umidade_controle smallint[],
    intervalo_limpeza smallint[]
);


ALTER TABLE unidade_modelo.secador_comando_hd OWNER TO ceres;

--
-- TOC entry 14151 (class 0 OID 0)
-- Dependencies: 1493
-- Name: COLUMN secador_comando_hd.velocidade_descarga; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_comando_hd.velocidade_descarga IS 'Em hertz(Hz)';


--
-- TOC entry 14152 (class 0 OID 0)
-- Dependencies: 1493
-- Name: COLUMN secador_comando_hd.tempo_aberto_mesa; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_comando_hd.tempo_aberto_mesa IS 'Em ms';


--
-- TOC entry 14153 (class 0 OID 0)
-- Dependencies: 1493
-- Name: COLUMN secador_comando_hd.tempo_fechado_mesa; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_comando_hd.tempo_fechado_mesa IS 'Em ms';


--
-- TOC entry 14154 (class 0 OID 0)
-- Dependencies: 1493
-- Name: COLUMN secador_comando_hd.tempo_aberto_veneziana; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_comando_hd.tempo_aberto_veneziana IS 'Em ms';


--
-- TOC entry 14155 (class 0 OID 0)
-- Dependencies: 1493
-- Name: COLUMN secador_comando_hd.tempo_fechado_veneziana; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_comando_hd.tempo_fechado_veneziana IS 'Em ms';


--
-- TOC entry 14156 (class 0 OID 0)
-- Dependencies: 1493
-- Name: COLUMN secador_comando_hd.tempo_aberto_alimentador; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_comando_hd.tempo_aberto_alimentador IS 'Em ms';


--
-- TOC entry 14157 (class 0 OID 0)
-- Dependencies: 1493
-- Name: COLUMN secador_comando_hd.tempo_fechado_alimentador; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_comando_hd.tempo_fechado_alimentador IS 'Em ms';


--
-- TOC entry 14158 (class 0 OID 0)
-- Dependencies: 1493
-- Name: COLUMN secador_comando_hd.tempo_minimo_alimentador_ligado; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_comando_hd.tempo_minimo_alimentador_ligado IS 'Em ms';


--
-- TOC entry 14159 (class 0 OID 0)
-- Dependencies: 1493
-- Name: COLUMN secador_comando_hd.idioma; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_comando_hd.idioma IS 'PT=1 ES=2 EN=3';


--
-- TOC entry 14160 (class 0 OID 0)
-- Dependencies: 1493
-- Name: COLUMN secador_comando_hd.intervalo_limpeza; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_comando_hd.intervalo_limpeza IS 'Em horas';


--
-- TOC entry 1494 (class 1259 OID 442779)
-- Name: secador_comando_wms; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_comando_wms (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    secador_id uuid NOT NULL,
    usuario_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    origem unidade_modelo.nuvem_local NOT NULL,
    produto_tipo smallint[],
    intervalo_limpeza smallint[]
);


ALTER TABLE unidade_modelo.secador_comando_wms OWNER TO ceres;

--
-- TOC entry 14161 (class 0 OID 0)
-- Dependencies: 1494
-- Name: COLUMN secador_comando_wms.intervalo_limpeza; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_comando_wms.intervalo_limpeza IS 'Em horas';


--
-- TOC entry 1495 (class 1259 OID 442785)
-- Name: secador_leitura_dryer; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_leitura_dryer (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    secador_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    temperatura_digital smallint[],
    umidade_relativa smallint[],
    pressao smallint[],
    entradas_digitais boolean[],
    temperatura_grao smallint[],
    umidade_grao smallint[],
    modo_operacao unidade_modelo.modo_operacao,
    velocidade_descarga numeric(4,1),
    produto_tipo smallint,
    secando boolean
);


ALTER TABLE unidade_modelo.secador_leitura_dryer OWNER TO ceres;

--
-- TOC entry 1496 (class 1259 OID 442791)
-- Name: secador_leitura_hd; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_leitura_hd (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    secador_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    pressao smallint[],
    temperatura_termopar smallint[],
    temperatura_digital smallint[],
    umidade_relativa smallint[],
    sinal_entrada boolean[],
    sinal_saida boolean[],
    sinal_alarme boolean[],
    umidade_saida_grao smallint,
    temperatura_saida_grao smallint,
    umidade_entrada_grao smallint,
    temperatura_entrada_grao smallint,
    status_operacao unidade_modelo.status_operacao,
    produto_tipo smallint,
    modo_operacao unidade_modelo.modo_operacao,
    tempo_secagem smallint,
    consumo_combustivel smallint,
    eficiencia smallint,
    valor_descarga smallint,
    tempo_aberto_mesa smallint,
    tempo_fechado_mesa smallint,
    tempo_aberto_veneziana smallint,
    tempo_fechado_veneziana smallint,
    tempo_aberto_alimentador smallint,
    tempo_fechado_alimentador smallint,
    tempo_minimo_alimentador_ligado smallint,
    temperatura_controle_veneziana smallint,
    temperatura_bloqueio_exaustor_massa smallint,
    temperatura_bloqueio_exaustor_saida smallint,
    temperatura_maxima_fornalha smallint,
    temperatura_minima_fornalha smallint,
    temperatura_maxima_entrada smallint,
    temperatura_minima_entrada smallint,
    temperatura_maxima_massa smallint,
    temperatura_minima_massa smallint,
    temperatura_maxima_saida smallint,
    temperatura_minima_saida smallint,
    idioma unidade_modelo.idioma,
    minuteiro_limpeza integer,
    intervalo_limpeza smallint,
    velocidade_descarga smallint,
    secador_em_rodizio boolean,
    umidade_controle smallint,
    fluxo_entrada_grao smallint[],
    fluxo_saida_grao smallint[],
    secando boolean
);


ALTER TABLE unidade_modelo.secador_leitura_hd OWNER TO ceres;

--
-- TOC entry 14162 (class 0 OID 0)
-- Dependencies: 1496
-- Name: COLUMN secador_leitura_hd.valor_descarga; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_leitura_hd.valor_descarga IS 'Em hertz(Hz)';


--
-- TOC entry 14163 (class 0 OID 0)
-- Dependencies: 1496
-- Name: COLUMN secador_leitura_hd.tempo_aberto_mesa; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_leitura_hd.tempo_aberto_mesa IS 'Em ms';


--
-- TOC entry 14164 (class 0 OID 0)
-- Dependencies: 1496
-- Name: COLUMN secador_leitura_hd.tempo_fechado_mesa; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_leitura_hd.tempo_fechado_mesa IS 'Em ms';


--
-- TOC entry 14165 (class 0 OID 0)
-- Dependencies: 1496
-- Name: COLUMN secador_leitura_hd.tempo_aberto_veneziana; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_leitura_hd.tempo_aberto_veneziana IS 'Em ms';


--
-- TOC entry 14166 (class 0 OID 0)
-- Dependencies: 1496
-- Name: COLUMN secador_leitura_hd.tempo_fechado_veneziana; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_leitura_hd.tempo_fechado_veneziana IS 'Em ms';


--
-- TOC entry 14167 (class 0 OID 0)
-- Dependencies: 1496
-- Name: COLUMN secador_leitura_hd.tempo_aberto_alimentador; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_leitura_hd.tempo_aberto_alimentador IS 'Em ms';


--
-- TOC entry 14168 (class 0 OID 0)
-- Dependencies: 1496
-- Name: COLUMN secador_leitura_hd.tempo_fechado_alimentador; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_leitura_hd.tempo_fechado_alimentador IS 'Em ms';


--
-- TOC entry 14169 (class 0 OID 0)
-- Dependencies: 1496
-- Name: COLUMN secador_leitura_hd.tempo_minimo_alimentador_ligado; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_leitura_hd.tempo_minimo_alimentador_ligado IS 'Em ms';


--
-- TOC entry 14170 (class 0 OID 0)
-- Dependencies: 1496
-- Name: COLUMN secador_leitura_hd.minuteiro_limpeza; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_leitura_hd.minuteiro_limpeza IS 'Em minutos';


--
-- TOC entry 14171 (class 0 OID 0)
-- Dependencies: 1496
-- Name: COLUMN secador_leitura_hd.intervalo_limpeza; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_leitura_hd.intervalo_limpeza IS 'Em horas';


--
-- TOC entry 14172 (class 0 OID 0)
-- Dependencies: 1496
-- Name: COLUMN secador_leitura_hd.velocidade_descarga; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_leitura_hd.velocidade_descarga IS 'Em porcentagem(%)';


--
-- TOC entry 1497 (class 1259 OID 442797)
-- Name: secador_leitura_wms; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_leitura_wms (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    secador_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    temperatura_digital smallint[],
    produto_tipo smallint,
    secando boolean
);


ALTER TABLE unidade_modelo.secador_leitura_wms OWNER TO ceres;

--
-- TOC entry 1498 (class 1259 OID 442803)
-- Name: secador_limpeza_historico; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_limpeza_historico (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    secador_id uuid NOT NULL,
    usuario_id uuid NOT NULL,
    instante_limpeza timestamp without time zone NOT NULL,
    tempo_decorrido bigint DEFAULT 0 NOT NULL
);


ALTER TABLE unidade_modelo.secador_limpeza_historico OWNER TO ceres;

--
-- TOC entry 14173 (class 0 OID 0)
-- Dependencies: 1498
-- Name: COLUMN secador_limpeza_historico.tempo_decorrido; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_limpeza_historico.tempo_decorrido IS 'Em minutos';


--
-- TOC entry 1499 (class 1259 OID 442808)
-- Name: secador_parametro_dryer; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_parametro_dryer (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    secador_id uuid NOT NULL,
    categoria unidade_modelo.categoria_parametro_dryer NOT NULL,
    nome_campo_leitura unidade_modelo.nome_campo_leitura_dryer NOT NULL,
    nome character varying(255) NOT NULL,
    indice smallint NOT NULL
);


ALTER TABLE unidade_modelo.secador_parametro_dryer OWNER TO ceres;

--
-- TOC entry 1500 (class 1259 OID 442813)
-- Name: secador_parametro_hd; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_parametro_hd (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    secador_id uuid NOT NULL,
    categoria unidade_modelo.categoria_parametro_hd NOT NULL,
    nome_campo_leitura unidade_modelo.nome_campo_leitura_hd NOT NULL,
    nome character varying(255) NOT NULL,
    indice smallint NOT NULL
);


ALTER TABLE unidade_modelo.secador_parametro_hd OWNER TO ceres;

--
-- TOC entry 1501 (class 1259 OID 442818)
-- Name: secador_processo; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_processo (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    secador_id uuid NOT NULL,
    inicio timestamp without time zone NOT NULL,
    fim timestamp without time zone,
    intervalo_limpeza numeric(15,2),
    capacidade numeric(15,2)
);


ALTER TABLE unidade_modelo.secador_processo OWNER TO ceres;

--
-- TOC entry 1502 (class 1259 OID 442822)
-- Name: secador_produto_historico; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_produto_historico (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    secador_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    usuario_id uuid NOT NULL,
    produto_tipo_id smallint
);


ALTER TABLE unidade_modelo.secador_produto_historico OWNER TO ceres;

--
-- TOC entry 1503 (class 1259 OID 442826)
-- Name: secador_sensor_dryer; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_sensor_dryer (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    secador_id uuid NOT NULL,
    nome character varying(255) NOT NULL,
    sigla character varying(3) NOT NULL,
    area_secador unidade_modelo.area_secador NOT NULL,
    categoria unidade_modelo.categoria_sensor_dryer NOT NULL,
    nome_campo_leitura unidade_modelo.nome_campo_leitura_dryer NOT NULL,
    indice smallint NOT NULL
);


ALTER TABLE unidade_modelo.secador_sensor_dryer OWNER TO ceres;

--
-- TOC entry 1504 (class 1259 OID 442831)
-- Name: secador_sensor_hd; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_sensor_hd (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    secador_id uuid NOT NULL,
    nome character varying(255) NOT NULL,
    sigla character varying(3) NOT NULL,
    area_secador unidade_modelo.area_secador NOT NULL,
    categoria unidade_modelo.categoria_sensor_hd NOT NULL,
    nome_campo_leitura unidade_modelo.nome_campo_leitura_hd NOT NULL,
    indice smallint NOT NULL
);


ALTER TABLE unidade_modelo.secador_sensor_hd OWNER TO ceres;

--
-- TOC entry 1505 (class 1259 OID 442836)
-- Name: secador_sensor_wms; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_sensor_wms (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    secador_id uuid NOT NULL,
    nome character varying(255) NOT NULL,
    sigla character varying(3) NOT NULL,
    area_secador unidade_modelo.area_secador NOT NULL,
    categoria unidade_modelo.categoria_sensor_wms NOT NULL,
    indice smallint NOT NULL
);


ALTER TABLE unidade_modelo.secador_sensor_wms OWNER TO ceres;

--
-- TOC entry 1506 (class 1259 OID 442841)
-- Name: secador_ultima_leitura_dryer; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_ultima_leitura_dryer (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    secador_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    temperatura_digital smallint[],
    umidade_relativa smallint[],
    pressao smallint[],
    entradas_digitais boolean[],
    temperatura_grao smallint[],
    umidade_grao smallint[],
    modo_operacao unidade_modelo.modo_operacao,
    velocidade_descarga numeric(4,1),
    produto_tipo smallint,
    secando boolean
);


ALTER TABLE unidade_modelo.secador_ultima_leitura_dryer OWNER TO ceres;

--
-- TOC entry 1507 (class 1259 OID 442847)
-- Name: secador_ultima_leitura_hd; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_ultima_leitura_hd (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    secador_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    pressao smallint[],
    temperatura_termopar smallint[],
    temperatura_digital smallint[],
    umidade_relativa smallint[],
    sinal_entrada boolean[],
    sinal_saida boolean[],
    sinal_alarme boolean[],
    umidade_saida_grao smallint,
    temperatura_saida_grao smallint,
    umidade_entrada_grao smallint,
    temperatura_entrada_grao smallint,
    status_operacao unidade_modelo.status_operacao,
    produto_tipo smallint,
    modo_operacao unidade_modelo.modo_operacao,
    tempo_secagem smallint,
    consumo_combustivel smallint,
    eficiencia smallint,
    valor_descarga smallint,
    tempo_aberto_mesa smallint,
    tempo_fechado_mesa smallint,
    tempo_aberto_veneziana smallint,
    tempo_fechado_veneziana smallint,
    tempo_aberto_alimentador smallint,
    tempo_fechado_alimentador smallint,
    tempo_minimo_alimentador_ligado smallint,
    temperatura_controle_veneziana smallint,
    temperatura_bloqueio_exaustor_massa smallint,
    temperatura_bloqueio_exaustor_saida smallint,
    temperatura_maxima_fornalha smallint,
    temperatura_minima_fornalha smallint,
    temperatura_maxima_entrada smallint,
    temperatura_minima_entrada smallint,
    temperatura_maxima_massa smallint,
    temperatura_minima_massa smallint,
    temperatura_maxima_saida smallint,
    temperatura_minima_saida smallint,
    idioma unidade_modelo.idioma,
    minuteiro_limpeza integer,
    intervalo_limpeza smallint,
    velocidade_descarga smallint,
    secador_em_rodizio boolean,
    umidade_controle smallint,
    fluxo_entrada_grao smallint[],
    fluxo_saida_grao smallint[],
    secando boolean
);


ALTER TABLE unidade_modelo.secador_ultima_leitura_hd OWNER TO ceres;

--
-- TOC entry 14174 (class 0 OID 0)
-- Dependencies: 1507
-- Name: COLUMN secador_ultima_leitura_hd.valor_descarga; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_ultima_leitura_hd.valor_descarga IS 'Em hertz(Hz)';


--
-- TOC entry 14175 (class 0 OID 0)
-- Dependencies: 1507
-- Name: COLUMN secador_ultima_leitura_hd.tempo_aberto_mesa; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_ultima_leitura_hd.tempo_aberto_mesa IS 'Em ms';


--
-- TOC entry 14176 (class 0 OID 0)
-- Dependencies: 1507
-- Name: COLUMN secador_ultima_leitura_hd.tempo_fechado_mesa; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_ultima_leitura_hd.tempo_fechado_mesa IS 'Em ms';


--
-- TOC entry 14177 (class 0 OID 0)
-- Dependencies: 1507
-- Name: COLUMN secador_ultima_leitura_hd.tempo_aberto_veneziana; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_ultima_leitura_hd.tempo_aberto_veneziana IS 'Em ms';


--
-- TOC entry 14178 (class 0 OID 0)
-- Dependencies: 1507
-- Name: COLUMN secador_ultima_leitura_hd.tempo_fechado_veneziana; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_ultima_leitura_hd.tempo_fechado_veneziana IS 'Em ms';


--
-- TOC entry 14179 (class 0 OID 0)
-- Dependencies: 1507
-- Name: COLUMN secador_ultima_leitura_hd.tempo_aberto_alimentador; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_ultima_leitura_hd.tempo_aberto_alimentador IS 'Em ms';


--
-- TOC entry 14180 (class 0 OID 0)
-- Dependencies: 1507
-- Name: COLUMN secador_ultima_leitura_hd.tempo_fechado_alimentador; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_ultima_leitura_hd.tempo_fechado_alimentador IS 'Em ms';


--
-- TOC entry 14181 (class 0 OID 0)
-- Dependencies: 1507
-- Name: COLUMN secador_ultima_leitura_hd.tempo_minimo_alimentador_ligado; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_ultima_leitura_hd.tempo_minimo_alimentador_ligado IS 'Em ms';


--
-- TOC entry 14182 (class 0 OID 0)
-- Dependencies: 1507
-- Name: COLUMN secador_ultima_leitura_hd.minuteiro_limpeza; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_ultima_leitura_hd.minuteiro_limpeza IS 'Em minutos';


--
-- TOC entry 14183 (class 0 OID 0)
-- Dependencies: 1507
-- Name: COLUMN secador_ultima_leitura_hd.intervalo_limpeza; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_ultima_leitura_hd.intervalo_limpeza IS 'Em horas';


--
-- TOC entry 14184 (class 0 OID 0)
-- Dependencies: 1507
-- Name: COLUMN secador_ultima_leitura_hd.velocidade_descarga; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.secador_ultima_leitura_hd.velocidade_descarga IS 'Em porcentagem(%)';


--
-- TOC entry 1508 (class 1259 OID 442853)
-- Name: secador_ultima_leitura_wms; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_ultima_leitura_wms (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    secador_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    temperatura_digital smallint[],
    produto_tipo smallint,
    secando boolean
);


ALTER TABLE unidade_modelo.secador_ultima_leitura_wms OWNER TO ceres;

--
-- TOC entry 1509 (class 1259 OID 442859)
-- Name: secador_visao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_visao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    secador_id uuid NOT NULL,
    nome character varying(255) NOT NULL,
    imagem text NOT NULL,
    principal boolean DEFAULT true NOT NULL
);


ALTER TABLE unidade_modelo.secador_visao OWNER TO ceres;

--
-- TOC entry 1510 (class 1259 OID 442867)
-- Name: secador_visao_area; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_visao_area (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    habilitado boolean DEFAULT true NOT NULL,
    secador_visao_id uuid NOT NULL,
    area_secador unidade_modelo.area_secador NOT NULL,
    posicao_x numeric(15,5) NOT NULL,
    posicao_y numeric(15,5) NOT NULL
);


ALTER TABLE unidade_modelo.secador_visao_area OWNER TO ceres;

--
-- TOC entry 1511 (class 1259 OID 442872)
-- Name: secador_visao_sensor_dryer; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_visao_sensor_dryer (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    secador_visao_id uuid NOT NULL,
    sensor_id uuid NOT NULL,
    posicao_sigla_x numeric(15,5) NOT NULL,
    posicao_sigla_y numeric(15,5) NOT NULL,
    posicao_display_x numeric(15,5) NOT NULL,
    posicao_display_y numeric(15,5) NOT NULL
);


ALTER TABLE unidade_modelo.secador_visao_sensor_dryer OWNER TO ceres;

--
-- TOC entry 1512 (class 1259 OID 442876)
-- Name: secador_visao_sensor_hd; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_visao_sensor_hd (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    secador_visao_id uuid NOT NULL,
    sensor_id uuid NOT NULL,
    posicao_sigla_x numeric(15,5) NOT NULL,
    posicao_sigla_y numeric(15,5) NOT NULL,
    posicao_display_x numeric(15,5) NOT NULL,
    posicao_display_y numeric(15,5) NOT NULL
);


ALTER TABLE unidade_modelo.secador_visao_sensor_hd OWNER TO ceres;

--
-- TOC entry 1513 (class 1259 OID 442880)
-- Name: secador_visao_sensor_wms; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secador_visao_sensor_wms (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    secador_visao_id uuid NOT NULL,
    sensor_id uuid NOT NULL,
    posicao_sigla_x numeric(15,5) NOT NULL,
    posicao_sigla_y numeric(15,5) NOT NULL,
    posicao_display_x numeric(15,5) NOT NULL,
    posicao_display_y numeric(15,5) NOT NULL
);


ALTER TABLE unidade_modelo.secador_visao_sensor_wms OWNER TO ceres;

--
-- TOC entry 1514 (class 1259 OID 442884)
-- Name: secagem_evento; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secagem_evento (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    instante timestamp without time zone NOT NULL,
    secador_id uuid NOT NULL,
    evento_origem unidade_modelo.secagem_evento_origem NOT NULL,
    secador json,
    equipamento json,
    limpeza json,
    processo json,
    produto json,
    sensor json,
    parametro json,
    comando json,
    alerta json,
    estatistica json,
    usuario json,
    status unidade_modelo.secagem_evento_status NOT NULL
);


ALTER TABLE unidade_modelo.secagem_evento OWNER TO ceres;

--
-- TOC entry 1515 (class 1259 OID 442890)
-- Name: secagem_ultimo_evento; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.secagem_ultimo_evento (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    instante timestamp without time zone NOT NULL,
    secador_id uuid NOT NULL,
    evento_origem unidade_modelo.secagem_evento_origem NOT NULL,
    secador json,
    equipamento json,
    limpeza json,
    processo json,
    produto json,
    sensor json,
    parametro json,
    comando json,
    alerta json,
    estatistica json,
    usuario json,
    status unidade_modelo.secagem_evento_status NOT NULL
);


ALTER TABLE unidade_modelo.secagem_ultimo_evento OWNER TO ceres;

--
-- TOC entry 1516 (class 1259 OID 442896)
-- Name: sensor_co2; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.sensor_co2 (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    estrutura_armazenagem_id uuid NOT NULL,
    equipamento_id uuid NOT NULL,
    nome character varying(255) NOT NULL,
    codigo_modbus smallint NOT NULL,
    indice smallint NOT NULL
);


ALTER TABLE unidade_modelo.sensor_co2 OWNER TO ceres;

--
-- TOC entry 14185 (class 0 OID 0)
-- Dependencies: 1516
-- Name: COLUMN sensor_co2.equipamento_id; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.sensor_co2.equipamento_id IS 'ID da tabela equipamento (EHD)';


--
-- TOC entry 14186 (class 0 OID 0)
-- Dependencies: 1516
-- Name: COLUMN sensor_co2.codigo_modbus; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.sensor_co2.codigo_modbus IS '1 a 8';


--
-- TOC entry 1517 (class 1259 OID 442901)
-- Name: sensor_co2_leitura; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.sensor_co2_leitura (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    sensor_co2_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    temperatura smallint,
    umidade smallint,
    co2 smallint,
    temperatura_chapa smallint
);


ALTER TABLE unidade_modelo.sensor_co2_leitura OWNER TO ceres;

--
-- TOC entry 1518 (class 1259 OID 442905)
-- Name: sensor_co2_ultima_leitura; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.sensor_co2_ultima_leitura (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    sensor_co2_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    temperatura smallint,
    umidade smallint,
    co2 smallint,
    temperatura_chapa smallint
);


ALTER TABLE unidade_modelo.sensor_co2_ultima_leitura OWNER TO ceres;

--
-- TOC entry 1519 (class 1259 OID 442909)
-- Name: sensor_plenum; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.sensor_plenum (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    estrutura_armazenagem_id uuid NOT NULL,
    equipamento_id uuid NOT NULL,
    nome character varying(255) NOT NULL,
    indice_temperatura smallint NOT NULL,
    indice_ur smallint NOT NULL
);


ALTER TABLE unidade_modelo.sensor_plenum OWNER TO ceres;

--
-- TOC entry 14187 (class 0 OID 0)
-- Dependencies: 1519
-- Name: COLUMN sensor_plenum.equipamento_id; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.sensor_plenum.equipamento_id IS 'ID da tabela equipamento (EHD)';


--
-- TOC entry 1520 (class 1259 OID 442914)
-- Name: sensor_plenum_leitura; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.sensor_plenum_leitura (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    sensor_plenum_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    temperatura smallint,
    umidade smallint
);


ALTER TABLE unidade_modelo.sensor_plenum_leitura OWNER TO ceres;

--
-- TOC entry 1521 (class 1259 OID 442918)
-- Name: sensor_plenum_ultima_leitura; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.sensor_plenum_ultima_leitura (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    sensor_plenum_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    temperatura smallint,
    umidade smallint
);


ALTER TABLE unidade_modelo.sensor_plenum_ultima_leitura OWNER TO ceres;

--
-- TOC entry 1522 (class 1259 OID 442922)
-- Name: sensor_volume; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.sensor_volume (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    estrutura_armazenagem_id uuid NOT NULL,
    modelo unidade_modelo.modelo_sensor_volume DEFAULT 'sensor_volume_1d'::unidade_modelo.modelo_sensor_volume NOT NULL,
    equipamento_id uuid NOT NULL,
    nome character varying(255) NOT NULL,
    codigo_modbus smallint NOT NULL,
    tecnologia unidade_modelo.tecnologia_sensor_volume DEFAULT 'laser'::unidade_modelo.tecnologia_sensor_volume NOT NULL,
    angulo_haste unidade_modelo.angulo_haste_sensor_volume,
    altura_sensor smallint,
    indice smallint NOT NULL
);


ALTER TABLE unidade_modelo.sensor_volume OWNER TO ceres;

--
-- TOC entry 14188 (class 0 OID 0)
-- Dependencies: 1522
-- Name: COLUMN sensor_volume.equipamento_id; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.sensor_volume.equipamento_id IS 'ID da tabela equipamento (EHD)';


--
-- TOC entry 14189 (class 0 OID 0)
-- Dependencies: 1522
-- Name: COLUMN sensor_volume.codigo_modbus; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.sensor_volume.codigo_modbus IS '1 a 8';


--
-- TOC entry 1523 (class 1259 OID 442929)
-- Name: sensor_volume_leitura; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.sensor_volume_leitura (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    sensor_volume_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    distancia_sensor smallint,
    coordenada_x smallint[],
    coordenada_y smallint[],
    nivel integer,
    estoque integer
);


ALTER TABLE unidade_modelo.sensor_volume_leitura OWNER TO ceres;

--
-- TOC entry 14190 (class 0 OID 0)
-- Dependencies: 1523
-- Name: COLUMN sensor_volume_leitura.nivel; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.sensor_volume_leitura.nivel IS 'Em centímetros';


--
-- TOC entry 14191 (class 0 OID 0)
-- Dependencies: 1523
-- Name: COLUMN sensor_volume_leitura.estoque; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.sensor_volume_leitura.estoque IS 'Em quilogramas (Kg)';


--
-- TOC entry 1524 (class 1259 OID 442935)
-- Name: sensor_volume_ultima_leitura; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.sensor_volume_ultima_leitura (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    sensor_volume_id uuid NOT NULL,
    instante timestamp without time zone NOT NULL,
    distancia_sensor smallint,
    coordenada_x smallint[],
    coordenada_y smallint[],
    nivel integer,
    estoque integer
);


ALTER TABLE unidade_modelo.sensor_volume_ultima_leitura OWNER TO ceres;

--
-- TOC entry 14192 (class 0 OID 0)
-- Dependencies: 1524
-- Name: COLUMN sensor_volume_ultima_leitura.nivel; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.sensor_volume_ultima_leitura.nivel IS 'Em centímetros';


--
-- TOC entry 14193 (class 0 OID 0)
-- Dependencies: 1524
-- Name: COLUMN sensor_volume_ultima_leitura.estoque; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.sensor_volume_ultima_leitura.estoque IS 'Em quilogramas (Kg)';


--
-- TOC entry 1525 (class 1259 OID 442941)
-- Name: silo; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.silo (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    estrutura_armazenagem_id uuid NOT NULL,
    funcao unidade_modelo.funcao_silo DEFAULT 'armazenagem'::unidade_modelo.funcao_silo NOT NULL,
    base unidade_modelo.base_silo DEFAULT 'plana'::unidade_modelo.base_silo NOT NULL,
    altura_cone_superior numeric(15,2),
    angulo_cone_superior numeric(15,2),
    altura_cilindro numeric(15,2),
    altura_total numeric(15,2),
    diametro numeric(15,2),
    numero_chapas smallint,
    altura_chapa numeric(15,2),
    altura_cone_inferior numeric(15,2),
    angulo_cone_inferior numeric(15,2),
    altura_base numeric(15,2),
    angulo_base numeric(15,2),
    diametro_inferior numeric(15,2),
    suporte_pendulo_central boolean DEFAULT true NOT NULL,
    rosca_varredora boolean DEFAULT false NOT NULL
);


ALTER TABLE unidade_modelo.silo OWNER TO ceres;

--
-- TOC entry 1526 (class 1259 OID 442950)
-- Name: silo_anel; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.silo_anel (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    silo_id uuid NOT NULL,
    raio numeric(15,5) NOT NULL,
    suporte_quantidade integer NOT NULL
);


ALTER TABLE unidade_modelo.silo_anel OWNER TO ceres;

--
-- TOC entry 1527 (class 1259 OID 442954)
-- Name: silo_pendulo_visualizacao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.silo_pendulo_visualizacao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    pendulo_id uuid NOT NULL,
    anel_id uuid,
    posicao_x numeric(15,5) NOT NULL,
    posicao_y numeric(15,5) NOT NULL
);


ALTER TABLE unidade_modelo.silo_pendulo_visualizacao OWNER TO ceres;

--
-- TOC entry 1528 (class 1259 OID 442958)
-- Name: uf; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.uf (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    pais_id uuid NOT NULL,
    regiao_id uuid,
    nome character varying(100) NOT NULL,
    sigla character varying(2) NOT NULL
);


ALTER TABLE unidade_modelo.uf OWNER TO ceres;

--
-- TOC entry 1529 (class 1259 OID 442962)
-- Name: unidade; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.unidade (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    cliente_id uuid NOT NULL,
    nome character varying(255) NOT NULL,
    chave_licenca text,
    categoria unidade_modelo.categoria_unidade NOT NULL,
    cidade_id uuid NOT NULL,
    bairro character varying(100),
    endereco character varying(255),
    complemento character varying(100),
    numero character varying(20),
    codigo_postal character varying(25),
    latitude numeric(15,11),
    longitude numeric(15,11),
    telefone character varying(25),
    notas text
);


ALTER TABLE unidade_modelo.unidade OWNER TO ceres;

--
-- TOC entry 1530 (class 1259 OID 442969)
-- Name: unidade_parametrizacao; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.unidade_parametrizacao (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    unidade_id uuid NOT NULL,
    potencia_limite smallint,
    prioridade_acionamento unidade_modelo.prioridade_acionamento DEFAULT 'estrutura'::unidade_modelo.prioridade_acionamento NOT NULL,
    aguardar_tempo_entre_estruturas boolean DEFAULT true NOT NULL,
    tempo_espera_entre_estruturas smallint DEFAULT 2 NOT NULL,
    aguardar_tempo_histerese boolean DEFAULT true NOT NULL,
    tempo_espera_histerese smallint DEFAULT 20 NOT NULL,
    horario_pico_inicio time without time zone DEFAULT '17:00:00'::time without time zone NOT NULL,
    horario_pico_fim time without time zone DEFAULT '21:00:00'::time without time zone NOT NULL,
    intervalo_ligar_antes_horario_pico smallint DEFAULT 15 NOT NULL,
    intervalo_desligar_antes_horario_pico smallint DEFAULT 15 NOT NULL,
    unidade_estoque_padrao unidade_modelo.unidade_medida_estoque DEFAULT 'tonelada'::unidade_modelo.unidade_medida_estoque NOT NULL,
    tempo_expiracao_comando smallint DEFAULT 10 NOT NULL,
    tempo_expiracao_comando_secador smallint DEFAULT 10 NOT NULL,
    aquecimento_ar_1 numeric(3,1) DEFAULT 1 NOT NULL,
    aquecimento_ar_2 numeric(3,1) DEFAULT 2 NOT NULL,
    aquecimento_ar_3 numeric(3,1) DEFAULT 3 NOT NULL,
    instalado_local boolean DEFAULT false NOT NULL,
    instalado_nuvem boolean DEFAULT false NOT NULL,
    origem_dados unidade_modelo.unidade_origem_dados DEFAULT 'coletor_ceres'::unidade_modelo.unidade_origem_dados NOT NULL
);


ALTER TABLE unidade_modelo.unidade_parametrizacao OWNER TO ceres;

--
-- TOC entry 14194 (class 0 OID 0)
-- Dependencies: 1530
-- Name: COLUMN unidade_parametrizacao.aguardar_tempo_entre_estruturas; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.unidade_parametrizacao.aguardar_tempo_entre_estruturas IS 'Respeitar o tempo de espera entre as estruturas?';


--
-- TOC entry 14195 (class 0 OID 0)
-- Dependencies: 1530
-- Name: COLUMN unidade_parametrizacao.tempo_espera_entre_estruturas; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.unidade_parametrizacao.tempo_espera_entre_estruturas IS 'Minutos. 0 para nenhum.';


--
-- TOC entry 14196 (class 0 OID 0)
-- Dependencies: 1530
-- Name: COLUMN unidade_parametrizacao.aguardar_tempo_histerese; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.unidade_parametrizacao.aguardar_tempo_histerese IS 'Respeitar o tempo da histerese?';


--
-- TOC entry 14197 (class 0 OID 0)
-- Dependencies: 1530
-- Name: COLUMN unidade_parametrizacao.tempo_espera_histerese; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.unidade_parametrizacao.tempo_espera_histerese IS 'Minutos. 0 para nenhum.';


--
-- TOC entry 14198 (class 0 OID 0)
-- Dependencies: 1530
-- Name: COLUMN unidade_parametrizacao.intervalo_ligar_antes_horario_pico; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.unidade_parametrizacao.intervalo_ligar_antes_horario_pico IS 'Período limite para ligar antes do horario de pico. Em minutos.';


--
-- TOC entry 14199 (class 0 OID 0)
-- Dependencies: 1530
-- Name: COLUMN unidade_parametrizacao.intervalo_desligar_antes_horario_pico; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.unidade_parametrizacao.intervalo_desligar_antes_horario_pico IS 'Período para desligar antes do horario de pico. em minutos.';


--
-- TOC entry 14200 (class 0 OID 0)
-- Dependencies: 1530
-- Name: COLUMN unidade_parametrizacao.tempo_expiracao_comando; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.unidade_parametrizacao.tempo_expiracao_comando IS 'Minutos para considerar um comando válido de aeracao';


--
-- TOC entry 14201 (class 0 OID 0)
-- Dependencies: 1530
-- Name: COLUMN unidade_parametrizacao.tempo_expiracao_comando_secador; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.unidade_parametrizacao.tempo_expiracao_comando_secador IS 'Minutos para considerar um comando válido do secador';


--
-- TOC entry 14202 (class 0 OID 0)
-- Dependencies: 1530
-- Name: COLUMN unidade_parametrizacao.aquecimento_ar_1; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.unidade_parametrizacao.aquecimento_ar_1 IS 'Valores entre 0 e 99.9';


--
-- TOC entry 14203 (class 0 OID 0)
-- Dependencies: 1530
-- Name: COLUMN unidade_parametrizacao.aquecimento_ar_2; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.unidade_parametrizacao.aquecimento_ar_2 IS 'Valores entre 0 e 99.9';


--
-- TOC entry 14204 (class 0 OID 0)
-- Dependencies: 1530
-- Name: COLUMN unidade_parametrizacao.aquecimento_ar_3; Type: COMMENT; Schema: unidade_modelo; Owner: ceres
--

COMMENT ON COLUMN unidade_modelo.unidade_parametrizacao.aquecimento_ar_3 IS 'Valores entre 0 e 99.9';


--
-- TOC entry 1531 (class 1259 OID 442991)
-- Name: unidade_produto_interno; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.unidade_produto_interno (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    unidade_id uuid NOT NULL,
    produto unidade_modelo.produto_interno NOT NULL
);


ALTER TABLE unidade_modelo.unidade_produto_interno OWNER TO ceres;

--
-- TOC entry 1532 (class 1259 OID 442996)
-- Name: usuario; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.usuario (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    email character varying(150) NOT NULL,
    senha character(150) NOT NULL,
    nome character varying(100) NOT NULL,
    sobrenome character varying(100) NOT NULL,
    telefone character varying(25),
    ultima_autenticacao timestamp without time zone,
    obrigar_resetar_senha boolean DEFAULT false NOT NULL,
    foto text,
    idioma unidade_modelo.idioma DEFAULT 'pt'::unidade_modelo.idioma NOT NULL,
    categoria unidade_modelo.categoria_usuario DEFAULT 'cliente'::unidade_modelo.categoria_usuario NOT NULL
);


ALTER TABLE unidade_modelo.usuario OWNER TO ceres;

--
-- TOC entry 1533 (class 1259 OID 443006)
-- Name: usuario_perfil; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.usuario_perfil (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    perfil_id uuid NOT NULL,
    usuario_id uuid NOT NULL
);


ALTER TABLE unidade_modelo.usuario_perfil OWNER TO ceres;

--
-- TOC entry 1534 (class 1259 OID 443011)
-- Name: usuario_unidade; Type: TABLE; Schema: unidade_modelo; Owner: ceres
--

CREATE TABLE unidade_modelo.usuario_unidade (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    arquivado boolean DEFAULT false NOT NULL,
    usuario_id uuid NOT NULL,
    unidade_id uuid NOT NULL,
    permite_cadastro_usuario boolean DEFAULT false NOT NULL
);


ALTER TABLE unidade_modelo.usuario_unidade OWNER TO ceres;

--
-- TOC entry 1535 (class 1259 OID 443017)
-- Name: vw_chovendo; Type: VIEW; Schema: unidade_modelo; Owner: ceres
--

CREATE VIEW unidade_modelo.vw_chovendo AS
 SELECT emll.instante,
    emll.chovendo
   FROM unidade_modelo.estacao_meteorologica_local_leitura emll
UNION
 SELECT emrl.instante,
    emrl.chovendo
   FROM unidade_modelo.estacao_meteorologica_remota_leitura emrl
UNION
 SELECT emvl.instante,
    emvl.chovendo
   FROM unidade_modelo.estacao_meteorologica_proxima_leitura emvl
  ORDER BY 1 DESC
 LIMIT 1;


ALTER VIEW unidade_modelo.vw_chovendo OWNER TO ceres;

--
-- TOC entry 1536 (class 1259 OID 443021)
-- Name: vw_chovendo_ultima_leitura; Type: VIEW; Schema: unidade_modelo; Owner: ceres
--

CREATE VIEW unidade_modelo.vw_chovendo_ultima_leitura AS
 SELECT emll.instante,
    emll.chovendo
   FROM unidade_modelo.estacao_meteorologica_local_ultima_leitura emll
UNION
 SELECT emrl.instante,
    emrl.chovendo
   FROM unidade_modelo.estacao_meteorologica_remota_leitura emrl
UNION
 SELECT emvl.instante,
    emvl.chovendo
   FROM unidade_modelo.estacao_meteorologica_proxima_leitura emvl
  ORDER BY 1 DESC
 LIMIT 1;


ALTER VIEW unidade_modelo.vw_chovendo_ultima_leitura OWNER TO ceres;

--
-- TOC entry 1537 (class 1259 OID 443025)
-- Name: vw_sensores; Type: VIEW; Schema: unidade_modelo; Owner: ceres
--

CREATE VIEW unidade_modelo.vw_sensores AS
 SELECT plenum.id,
    'plenum'::text AS tipo_sensor,
    plenum.estrutura_armazenagem_id,
    plenum.equipamento_id,
    plenum.arquivado,
    plenum.nome,
    plenum.indice_temperatura,
    plenum.indice_ur,
    NULL::smallint AS codigo_modbus,
    NULL::unidade_modelo.modelo_sensor_volume AS modelo,
    NULL::unidade_modelo.tecnologia_sensor_volume AS tecnologia,
    NULL::unidade_modelo.angulo_haste_sensor_volume AS angulo_haste,
    NULL::smallint AS altura_sensor
   FROM unidade_modelo.sensor_plenum plenum
UNION ALL
 SELECT co2.id,
    'co2'::text AS tipo_sensor,
    co2.estrutura_armazenagem_id,
    co2.equipamento_id,
    co2.arquivado,
    co2.nome,
    NULL::smallint AS indice_temperatura,
    NULL::smallint AS indice_ur,
    co2.codigo_modbus,
    NULL::unidade_modelo.modelo_sensor_volume AS modelo,
    NULL::unidade_modelo.tecnologia_sensor_volume AS tecnologia,
    NULL::unidade_modelo.angulo_haste_sensor_volume AS angulo_haste,
    NULL::smallint AS altura_sensor
   FROM unidade_modelo.sensor_co2 co2
UNION ALL
 SELECT volume.id,
    'volume'::text AS tipo_sensor,
    volume.estrutura_armazenagem_id,
    volume.equipamento_id,
    volume.arquivado,
    volume.nome,
    NULL::smallint AS indice_temperatura,
    NULL::smallint AS indice_ur,
    volume.codigo_modbus,
    volume.modelo,
    volume.tecnologia,
    volume.angulo_haste,
    volume.altura_sensor
   FROM unidade_modelo.sensor_volume volume;


ALTER VIEW unidade_modelo.vw_sensores OWNER TO ceres;

--
-- TOC entry 13172 (class 2604 OID 443030)
-- Name: migrations id; Type: DEFAULT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.migrations ALTER COLUMN id SET DEFAULT nextval('unidade_modelo.migrations_id_seq'::regclass);


--
-- TOC entry 13997 (class 0 OID 442299)
-- Dependencies: 1406
-- Data for Name: aeracao_aerador_historico; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 13998 (class 0 OID 442303)
-- Dependencies: 1407
-- Data for Name: aeracao_estrutura_divisao_historico; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 13999 (class 0 OID 442307)
-- Dependencies: 1408
-- Data for Name: aeracao_estrutura_historico; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14000 (class 0 OID 442311)
-- Dependencies: 1409
-- Data for Name: aerador; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14001 (class 0 OID 442316)
-- Dependencies: 1410
-- Data for Name: aerador_configuracao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14002 (class 0 OID 442323)
-- Dependencies: 1411
-- Data for Name: aerador_leitura_chave; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14003 (class 0 OID 442327)
-- Dependencies: 1412
-- Data for Name: aerador_leitura_mep; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14004 (class 0 OID 442331)
-- Dependencies: 1413
-- Data for Name: aerador_leitura_rele; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14005 (class 0 OID 442335)
-- Dependencies: 1414
-- Data for Name: aerador_leitura_status; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14006 (class 0 OID 442339)
-- Dependencies: 1415
-- Data for Name: aerador_motor; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14007 (class 0 OID 442344)
-- Dependencies: 1416
-- Data for Name: aerador_propriedade; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14008 (class 0 OID 442352)
-- Dependencies: 1417
-- Data for Name: aquecimento_ar_historico; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14009 (class 0 OID 442356)
-- Dependencies: 1418
-- Data for Name: armazem; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14010 (class 0 OID 442363)
-- Dependencies: 1419
-- Data for Name: armazem_aerador_visualizacao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14011 (class 0 OID 442367)
-- Dependencies: 1420
-- Data for Name: armazem_equipamento_visualizacao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14012 (class 0 OID 442371)
-- Dependencies: 1421
-- Data for Name: armazem_passarela_visualizacao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14013 (class 0 OID 442375)
-- Dependencies: 1422
-- Data for Name: armazem_pendulo_visualizacao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14014 (class 0 OID 442379)
-- Dependencies: 1423
-- Data for Name: armazem_porta_visualizacao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14015 (class 0 OID 442383)
-- Dependencies: 1424
-- Data for Name: armazenagem_evento; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14016 (class 0 OID 442389)
-- Dependencies: 1425
-- Data for Name: armazenagem_ultimo_evento; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14017 (class 0 OID 442395)
-- Dependencies: 1426
-- Data for Name: cidade; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14018 (class 0 OID 442399)
-- Dependencies: 1427
-- Data for Name: cliente; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14019 (class 0 OID 442406)
-- Dependencies: 1428
-- Data for Name: comunicacao_coletor; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14020 (class 0 OID 442411)
-- Dependencies: 1429
-- Data for Name: comunicacao_local_com_nuvem; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14021 (class 0 OID 442416)
-- Dependencies: 1430
-- Data for Name: comunicacao_nuvem_com_local; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14022 (class 0 OID 442421)
-- Dependencies: 1431
-- Data for Name: comunicacao_sincronizador_coletor; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14023 (class 0 OID 442426)
-- Dependencies: 1432
-- Data for Name: control_comando; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14024 (class 0 OID 442433)
-- Dependencies: 1433
-- Data for Name: controle_aeracao_automatica_historico; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14025 (class 0 OID 442438)
-- Dependencies: 1434
-- Data for Name: controle_servico; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14026 (class 0 OID 442442)
-- Dependencies: 1435
-- Data for Name: controle_servico_historico; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14027 (class 0 OID 442446)
-- Dependencies: 1436
-- Data for Name: controle_sincronizacao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14028 (class 0 OID 442454)
-- Dependencies: 1437
-- Data for Name: cs_atendimento; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14029 (class 0 OID 442460)
-- Dependencies: 1438
-- Data for Name: equipamento; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14030 (class 0 OID 442468)
-- Dependencies: 1439
-- Data for Name: equipamento_comunicacao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14031 (class 0 OID 442473)
-- Dependencies: 1440
-- Data for Name: estacao_meteorologica_local; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14032 (class 0 OID 442478)
-- Dependencies: 1441
-- Data for Name: estacao_meteorologica_local_config; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14033 (class 0 OID 442490)
-- Dependencies: 1442
-- Data for Name: estacao_meteorologica_local_leitura; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14034 (class 0 OID 442494)
-- Dependencies: 1443
-- Data for Name: estacao_meteorologica_local_ultima_leitura; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14035 (class 0 OID 442498)
-- Dependencies: 1444
-- Data for Name: estacao_meteorologica_ordem_consulta; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14036 (class 0 OID 442504)
-- Dependencies: 1445
-- Data for Name: estacao_meteorologica_ordem_consulta_estacao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14037 (class 0 OID 442508)
-- Dependencies: 1446
-- Data for Name: estacao_meteorologica_proxima; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14038 (class 0 OID 442513)
-- Dependencies: 1447
-- Data for Name: estacao_meteorologica_proxima_leitura; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14039 (class 0 OID 442517)
-- Dependencies: 1448
-- Data for Name: estacao_meteorologica_remota; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14040 (class 0 OID 442523)
-- Dependencies: 1449
-- Data for Name: estacao_meteorologica_remota_leitura; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14041 (class 0 OID 442527)
-- Dependencies: 1450
-- Data for Name: estoque_historico; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14042 (class 0 OID 442531)
-- Dependencies: 1451
-- Data for Name: estrutura_amostragem; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14043 (class 0 OID 442538)
-- Dependencies: 1452
-- Data for Name: estrutura_amostragem_leitura; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14044 (class 0 OID 442543)
-- Dependencies: 1453
-- Data for Name: estrutura_armazenagem; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14045 (class 0 OID 442549)
-- Dependencies: 1454
-- Data for Name: estrutura_armazenagem_divisao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14046 (class 0 OID 442557)
-- Dependencies: 1455
-- Data for Name: estrutura_armazenagem_divisao_aerador; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14047 (class 0 OID 442562)
-- Dependencies: 1456
-- Data for Name: estrutura_armazenagem_divisao_pendulo; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14048 (class 0 OID 442567)
-- Dependencies: 1457
-- Data for Name: estrutura_armazenagem_propriedade; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14049 (class 0 OID 442574)
-- Dependencies: 1458
-- Data for Name: estrutura_armazenagem_respiro; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14050 (class 0 OID 442579)
-- Dependencies: 1459
-- Data for Name: funcionalidade; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14051 (class 0 OID 442586)
-- Dependencies: 1460
-- Data for Name: log_comando_aeracao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14052 (class 0 OID 442592)
-- Dependencies: 1461
-- Data for Name: log_programa_aeracao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14053 (class 0 OID 442598)
-- Dependencies: 1462
-- Data for Name: log_regra_aeracao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14054 (class 0 OID 442604)
-- Dependencies: 1463
-- Data for Name: mesorregiao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14055 (class 0 OID 442608)
-- Dependencies: 1464
-- Data for Name: migrations; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--

INSERT INTO unidade_modelo.migrations (id, "timestamp", name) VALUES (1, 2405017536780, 'StartUnidade2405017536780');


--
-- TOC entry 14057 (class 0 OID 442614)
-- Dependencies: 1466
-- Data for Name: pais; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14058 (class 0 OID 442618)
-- Dependencies: 1467
-- Data for Name: pendulo; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14059 (class 0 OID 442623)
-- Dependencies: 1468
-- Data for Name: pendulo_canal; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14060 (class 0 OID 442629)
-- Dependencies: 1469
-- Data for Name: pendulo_leitura; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14061 (class 0 OID 442635)
-- Dependencies: 1470
-- Data for Name: pendulo_nivel_sensor; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14062 (class 0 OID 442639)
-- Dependencies: 1471
-- Data for Name: pendulo_propriedade; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14063 (class 0 OID 442645)
-- Dependencies: 1472
-- Data for Name: pendulo_troca_historico; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14064 (class 0 OID 442652)
-- Dependencies: 1473
-- Data for Name: pendulo_ultima_leitura; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14065 (class 0 OID 442658)
-- Dependencies: 1474
-- Data for Name: perfil; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14066 (class 0 OID 442666)
-- Dependencies: 1475
-- Data for Name: perfil_funcionalidade; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14067 (class 0 OID 442670)
-- Dependencies: 1476
-- Data for Name: pilha_comando_aeracao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14068 (class 0 OID 442676)
-- Dependencies: 1477
-- Data for Name: planta_unidade; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14069 (class 0 OID 442683)
-- Dependencies: 1478
-- Data for Name: planta_unidade_estrutura; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14070 (class 0 OID 442688)
-- Dependencies: 1479
-- Data for Name: produto; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14071 (class 0 OID 442695)
-- Dependencies: 1480
-- Data for Name: programa_aeracao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14072 (class 0 OID 442702)
-- Dependencies: 1481
-- Data for Name: programa_aeracao_historico; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14073 (class 0 OID 442706)
-- Dependencies: 1482
-- Data for Name: refresh_token; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14074 (class 0 OID 442710)
-- Dependencies: 1483
-- Data for Name: regiao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14075 (class 0 OID 442714)
-- Dependencies: 1484
-- Data for Name: regra_aeracao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14076 (class 0 OID 442721)
-- Dependencies: 1485
-- Data for Name: secador; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14077 (class 0 OID 442730)
-- Dependencies: 1486
-- Data for Name: secador_alerta_configuracao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14078 (class 0 OID 442738)
-- Dependencies: 1487
-- Data for Name: secador_alerta_destinatario; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14079 (class 0 OID 442746)
-- Dependencies: 1488
-- Data for Name: secador_alerta_registro; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14080 (class 0 OID 442750)
-- Dependencies: 1489
-- Data for Name: secador_alerta_registro_aplicativo; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14081 (class 0 OID 442756)
-- Dependencies: 1490
-- Data for Name: secador_alerta_registro_aplicativo_status; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14082 (class 0 OID 442760)
-- Dependencies: 1491
-- Data for Name: secador_alerta_registro_sistema; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14083 (class 0 OID 442766)
-- Dependencies: 1492
-- Data for Name: secador_comando_dryer; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14084 (class 0 OID 442772)
-- Dependencies: 1493
-- Data for Name: secador_comando_hd; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14085 (class 0 OID 442779)
-- Dependencies: 1494
-- Data for Name: secador_comando_wms; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14086 (class 0 OID 442785)
-- Dependencies: 1495
-- Data for Name: secador_leitura_dryer; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14087 (class 0 OID 442791)
-- Dependencies: 1496
-- Data for Name: secador_leitura_hd; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14088 (class 0 OID 442797)
-- Dependencies: 1497
-- Data for Name: secador_leitura_wms; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14089 (class 0 OID 442803)
-- Dependencies: 1498
-- Data for Name: secador_limpeza_historico; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14090 (class 0 OID 442808)
-- Dependencies: 1499
-- Data for Name: secador_parametro_dryer; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14091 (class 0 OID 442813)
-- Dependencies: 1500
-- Data for Name: secador_parametro_hd; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14092 (class 0 OID 442818)
-- Dependencies: 1501
-- Data for Name: secador_processo; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14093 (class 0 OID 442822)
-- Dependencies: 1502
-- Data for Name: secador_produto_historico; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14094 (class 0 OID 442826)
-- Dependencies: 1503
-- Data for Name: secador_sensor_dryer; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14095 (class 0 OID 442831)
-- Dependencies: 1504
-- Data for Name: secador_sensor_hd; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14096 (class 0 OID 442836)
-- Dependencies: 1505
-- Data for Name: secador_sensor_wms; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14097 (class 0 OID 442841)
-- Dependencies: 1506
-- Data for Name: secador_ultima_leitura_dryer; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14098 (class 0 OID 442847)
-- Dependencies: 1507
-- Data for Name: secador_ultima_leitura_hd; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14099 (class 0 OID 442853)
-- Dependencies: 1508
-- Data for Name: secador_ultima_leitura_wms; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14100 (class 0 OID 442859)
-- Dependencies: 1509
-- Data for Name: secador_visao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14101 (class 0 OID 442867)
-- Dependencies: 1510
-- Data for Name: secador_visao_area; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14102 (class 0 OID 442872)
-- Dependencies: 1511
-- Data for Name: secador_visao_sensor_dryer; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14103 (class 0 OID 442876)
-- Dependencies: 1512
-- Data for Name: secador_visao_sensor_hd; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14104 (class 0 OID 442880)
-- Dependencies: 1513
-- Data for Name: secador_visao_sensor_wms; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14105 (class 0 OID 442884)
-- Dependencies: 1514
-- Data for Name: secagem_evento; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14106 (class 0 OID 442890)
-- Dependencies: 1515
-- Data for Name: secagem_ultimo_evento; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14107 (class 0 OID 442896)
-- Dependencies: 1516
-- Data for Name: sensor_co2; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14108 (class 0 OID 442901)
-- Dependencies: 1517
-- Data for Name: sensor_co2_leitura; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14109 (class 0 OID 442905)
-- Dependencies: 1518
-- Data for Name: sensor_co2_ultima_leitura; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14110 (class 0 OID 442909)
-- Dependencies: 1519
-- Data for Name: sensor_plenum; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14111 (class 0 OID 442914)
-- Dependencies: 1520
-- Data for Name: sensor_plenum_leitura; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14112 (class 0 OID 442918)
-- Dependencies: 1521
-- Data for Name: sensor_plenum_ultima_leitura; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14113 (class 0 OID 442922)
-- Dependencies: 1522
-- Data for Name: sensor_volume; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14114 (class 0 OID 442929)
-- Dependencies: 1523
-- Data for Name: sensor_volume_leitura; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14115 (class 0 OID 442935)
-- Dependencies: 1524
-- Data for Name: sensor_volume_ultima_leitura; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14116 (class 0 OID 442941)
-- Dependencies: 1525
-- Data for Name: silo; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14117 (class 0 OID 442950)
-- Dependencies: 1526
-- Data for Name: silo_anel; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14118 (class 0 OID 442954)
-- Dependencies: 1527
-- Data for Name: silo_pendulo_visualizacao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14119 (class 0 OID 442958)
-- Dependencies: 1528
-- Data for Name: uf; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14120 (class 0 OID 442962)
-- Dependencies: 1529
-- Data for Name: unidade; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14121 (class 0 OID 442969)
-- Dependencies: 1530
-- Data for Name: unidade_parametrizacao; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14122 (class 0 OID 442991)
-- Dependencies: 1531
-- Data for Name: unidade_produto_interno; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14123 (class 0 OID 442996)
-- Dependencies: 1532
-- Data for Name: usuario; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--

INSERT INTO unidade_modelo.usuario (id, arquivado, email, senha, nome, sobrenome, telefone, ultima_autenticacao, obrigar_resetar_senha, foto, idioma, categoria) VALUES ('9688f800-7f68-11e0-8eb2-000000000001', false, 'software@procer.com.br', '$2a$10$FaAG4mYIjnIC6Ds8sG9AR.V7QB8JjTVRHZElb6Atuxi05H88jVLtC                                                                                          ', 'Administrador', 'Procer', NULL, '2011-05-01 00:00:00', false, NULL, 'pt', 'procer');


--
-- TOC entry 14124 (class 0 OID 443006)
-- Dependencies: 1533
-- Data for Name: usuario_perfil; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14125 (class 0 OID 443011)
-- Dependencies: 1534
-- Data for Name: usuario_unidade; Type: TABLE DATA; Schema: unidade_modelo; Owner: ceres
--



--
-- TOC entry 14205 (class 0 OID 0)
-- Dependencies: 1465
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: unidade_modelo; Owner: ceres
--

SELECT pg_catalog.setval('unidade_modelo.migrations_id_seq', 1, true);


--
-- TOC entry 13459 (class 2606 OID 443032)
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- TOC entry 13310 (class 2606 OID 443034)
-- Name: aeracao_aerador_historico aeracao_aerador_historico_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aeracao_aerador_historico
    ADD CONSTRAINT aeracao_aerador_historico_pkey PRIMARY KEY (id);


--
-- TOC entry 13312 (class 2606 OID 443036)
-- Name: aeracao_estrutura_divisao_historico aeracao_estrutura_divisao_historico_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aeracao_estrutura_divisao_historico
    ADD CONSTRAINT aeracao_estrutura_divisao_historico_pkey PRIMARY KEY (id);


--
-- TOC entry 13314 (class 2606 OID 443038)
-- Name: aeracao_estrutura_historico aeracao_estrutura_historico_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aeracao_estrutura_historico
    ADD CONSTRAINT aeracao_estrutura_historico_pkey PRIMARY KEY (id);


--
-- TOC entry 13319 (class 2606 OID 443040)
-- Name: aerador_configuracao aerador_configuracao_aerador_id_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador_configuracao
    ADD CONSTRAINT aerador_configuracao_aerador_id_key UNIQUE (aerador_id);


--
-- TOC entry 13321 (class 2606 OID 443042)
-- Name: aerador_configuracao aerador_configuracao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador_configuracao
    ADD CONSTRAINT aerador_configuracao_pkey PRIMARY KEY (id);


--
-- TOC entry 13323 (class 2606 OID 443044)
-- Name: aerador_leitura_chave aerador_leitura_chave_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador_leitura_chave
    ADD CONSTRAINT aerador_leitura_chave_pkey PRIMARY KEY (id);


--
-- TOC entry 13325 (class 2606 OID 443046)
-- Name: aerador_leitura_mep aerador_leitura_mep_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador_leitura_mep
    ADD CONSTRAINT aerador_leitura_mep_pkey PRIMARY KEY (id);


--
-- TOC entry 13327 (class 2606 OID 443048)
-- Name: aerador_leitura_rele aerador_leitura_rele_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador_leitura_rele
    ADD CONSTRAINT aerador_leitura_rele_pkey PRIMARY KEY (id);


--
-- TOC entry 13329 (class 2606 OID 443050)
-- Name: aerador_leitura_status aerador_leitura_status_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador_leitura_status
    ADD CONSTRAINT aerador_leitura_status_pkey PRIMARY KEY (id);


--
-- TOC entry 13331 (class 2606 OID 443052)
-- Name: aerador_motor aerador_motor_aerador_id_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador_motor
    ADD CONSTRAINT aerador_motor_aerador_id_key UNIQUE (aerador_id);


--
-- TOC entry 13333 (class 2606 OID 443054)
-- Name: aerador_motor aerador_motor_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador_motor
    ADD CONSTRAINT aerador_motor_pkey PRIMARY KEY (id);


--
-- TOC entry 13317 (class 2606 OID 443056)
-- Name: aerador aerador_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador
    ADD CONSTRAINT aerador_pkey PRIMARY KEY (id);


--
-- TOC entry 13335 (class 2606 OID 443058)
-- Name: aerador_propriedade aerador_propriedade_aerador_id_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador_propriedade
    ADD CONSTRAINT aerador_propriedade_aerador_id_key UNIQUE (aerador_id);


--
-- TOC entry 13337 (class 2606 OID 443060)
-- Name: aerador_propriedade aerador_propriedade_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador_propriedade
    ADD CONSTRAINT aerador_propriedade_pkey PRIMARY KEY (id);


--
-- TOC entry 13339 (class 2606 OID 443062)
-- Name: aquecimento_ar_historico aquecimento_ar_historico_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aquecimento_ar_historico
    ADD CONSTRAINT aquecimento_ar_historico_pkey PRIMARY KEY (id);


--
-- TOC entry 13343 (class 2606 OID 443064)
-- Name: armazem_aerador_visualizacao armazem_aerador_visualizacao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.armazem_aerador_visualizacao
    ADD CONSTRAINT armazem_aerador_visualizacao_pkey PRIMARY KEY (id);


--
-- TOC entry 13345 (class 2606 OID 443066)
-- Name: armazem_equipamento_visualizacao armazem_equipamento_visualizacao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.armazem_equipamento_visualizacao
    ADD CONSTRAINT armazem_equipamento_visualizacao_pkey PRIMARY KEY (id);


--
-- TOC entry 13347 (class 2606 OID 443068)
-- Name: armazem_passarela_visualizacao armazem_passarela_visualizacao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.armazem_passarela_visualizacao
    ADD CONSTRAINT armazem_passarela_visualizacao_pkey PRIMARY KEY (id);


--
-- TOC entry 13350 (class 2606 OID 443070)
-- Name: armazem_pendulo_visualizacao armazem_pendulo_visualizacao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.armazem_pendulo_visualizacao
    ADD CONSTRAINT armazem_pendulo_visualizacao_pkey PRIMARY KEY (id);


--
-- TOC entry 13341 (class 2606 OID 443072)
-- Name: armazem armazem_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.armazem
    ADD CONSTRAINT armazem_pkey PRIMARY KEY (id);


--
-- TOC entry 13352 (class 2606 OID 443074)
-- Name: armazem_porta_visualizacao armazem_porta_visualizacao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.armazem_porta_visualizacao
    ADD CONSTRAINT armazem_porta_visualizacao_pkey PRIMARY KEY (id);


--
-- TOC entry 13355 (class 2606 OID 443076)
-- Name: armazenagem_evento armazenagem_evento_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.armazenagem_evento
    ADD CONSTRAINT armazenagem_evento_pkey PRIMARY KEY (id);


--
-- TOC entry 13358 (class 2606 OID 443078)
-- Name: armazenagem_ultimo_evento armazenagem_ultimo_evento_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.armazenagem_ultimo_evento
    ADD CONSTRAINT armazenagem_ultimo_evento_pkey PRIMARY KEY (id);


--
-- TOC entry 13360 (class 2606 OID 443080)
-- Name: cidade cidade_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (id);


--
-- TOC entry 13362 (class 2606 OID 443082)
-- Name: cliente cliente_nome_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.cliente
    ADD CONSTRAINT cliente_nome_key UNIQUE (nome);


--
-- TOC entry 13364 (class 2606 OID 443084)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 13366 (class 2606 OID 443086)
-- Name: comunicacao_coletor comunicacao_coletor_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.comunicacao_coletor
    ADD CONSTRAINT comunicacao_coletor_pkey PRIMARY KEY (id);


--
-- TOC entry 13368 (class 2606 OID 443088)
-- Name: comunicacao_local_com_nuvem comunicacao_local_com_nuvem_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.comunicacao_local_com_nuvem
    ADD CONSTRAINT comunicacao_local_com_nuvem_pkey PRIMARY KEY (id);


--
-- TOC entry 13370 (class 2606 OID 443090)
-- Name: comunicacao_nuvem_com_local comunicacao_nuvem_com_local_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.comunicacao_nuvem_com_local
    ADD CONSTRAINT comunicacao_nuvem_com_local_pkey PRIMARY KEY (id);


--
-- TOC entry 13372 (class 2606 OID 443092)
-- Name: comunicacao_sincronizador_coletor comunicacao_sincronizador_coletor_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.comunicacao_sincronizador_coletor
    ADD CONSTRAINT comunicacao_sincronizador_coletor_pkey PRIMARY KEY (id);


--
-- TOC entry 13375 (class 2606 OID 443094)
-- Name: control_comando control_comando_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.control_comando
    ADD CONSTRAINT control_comando_pkey PRIMARY KEY (id);


--
-- TOC entry 13377 (class 2606 OID 443096)
-- Name: controle_aeracao_automatica_historico controle_aeracao_automatica_historico_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.controle_aeracao_automatica_historico
    ADD CONSTRAINT controle_aeracao_automatica_historico_pkey PRIMARY KEY (id);


--
-- TOC entry 13381 (class 2606 OID 443098)
-- Name: controle_servico_historico controle_servico_historico_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.controle_servico_historico
    ADD CONSTRAINT controle_servico_historico_pkey PRIMARY KEY (id);


--
-- TOC entry 13379 (class 2606 OID 443100)
-- Name: controle_servico controle_servico_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.controle_servico
    ADD CONSTRAINT controle_servico_pkey PRIMARY KEY (id);


--
-- TOC entry 13383 (class 2606 OID 443102)
-- Name: controle_sincronizacao controle_sincronizacao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.controle_sincronizacao
    ADD CONSTRAINT controle_sincronizacao_pkey PRIMARY KEY (id);


--
-- TOC entry 13385 (class 2606 OID 443104)
-- Name: cs_atendimento cs_atendimento_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.cs_atendimento
    ADD CONSTRAINT cs_atendimento_pkey PRIMARY KEY (id);


--
-- TOC entry 13391 (class 2606 OID 443106)
-- Name: equipamento_comunicacao equipamento_comunicacao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.equipamento_comunicacao
    ADD CONSTRAINT equipamento_comunicacao_pkey PRIMARY KEY (id);


--
-- TOC entry 13387 (class 2606 OID 443108)
-- Name: equipamento equipamento_nome_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.equipamento
    ADD CONSTRAINT equipamento_nome_key UNIQUE (nome);


--
-- TOC entry 13389 (class 2606 OID 443110)
-- Name: equipamento equipamento_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.equipamento
    ADD CONSTRAINT equipamento_pkey PRIMARY KEY (id);


--
-- TOC entry 13397 (class 2606 OID 443112)
-- Name: estacao_meteorologica_local_config estacao_meteorologica_local_config_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_local_config
    ADD CONSTRAINT estacao_meteorologica_local_config_pkey PRIMARY KEY (id);


--
-- TOC entry 13399 (class 2606 OID 443114)
-- Name: estacao_meteorologica_local_leitura estacao_meteorologica_local_leitura_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_local_leitura
    ADD CONSTRAINT estacao_meteorologica_local_leitura_pkey PRIMARY KEY (id);


--
-- TOC entry 13393 (class 2606 OID 443116)
-- Name: estacao_meteorologica_local estacao_meteorologica_local_nome_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_local
    ADD CONSTRAINT estacao_meteorologica_local_nome_key UNIQUE (nome);


--
-- TOC entry 13395 (class 2606 OID 443118)
-- Name: estacao_meteorologica_local estacao_meteorologica_local_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_local
    ADD CONSTRAINT estacao_meteorologica_local_pkey PRIMARY KEY (id);


--
-- TOC entry 13401 (class 2606 OID 443120)
-- Name: estacao_meteorologica_local_ultima_leitura estacao_meteorologica_local_ultima_leitura_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_local_ultima_leitura
    ADD CONSTRAINT estacao_meteorologica_local_ultima_leitura_pkey PRIMARY KEY (id);


--
-- TOC entry 13407 (class 2606 OID 443122)
-- Name: estacao_meteorologica_ordem_consulta_estacao estacao_meteorologica_ordem_consulta_estacao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_ordem_consulta_estacao
    ADD CONSTRAINT estacao_meteorologica_ordem_consulta_estacao_pkey PRIMARY KEY (id);


--
-- TOC entry 13403 (class 2606 OID 443124)
-- Name: estacao_meteorologica_ordem_consulta estacao_meteorologica_ordem_consulta_nome_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_ordem_consulta
    ADD CONSTRAINT estacao_meteorologica_ordem_consulta_nome_key UNIQUE (nome);


--
-- TOC entry 13405 (class 2606 OID 443126)
-- Name: estacao_meteorologica_ordem_consulta estacao_meteorologica_ordem_consulta_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_ordem_consulta
    ADD CONSTRAINT estacao_meteorologica_ordem_consulta_pkey PRIMARY KEY (id);


--
-- TOC entry 13413 (class 2606 OID 443128)
-- Name: estacao_meteorologica_proxima_leitura estacao_meteorologica_proxima_leitura_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_proxima_leitura
    ADD CONSTRAINT estacao_meteorologica_proxima_leitura_pkey PRIMARY KEY (id);


--
-- TOC entry 13409 (class 2606 OID 443130)
-- Name: estacao_meteorologica_proxima estacao_meteorologica_proxima_nome_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_proxima
    ADD CONSTRAINT estacao_meteorologica_proxima_nome_key UNIQUE (nome);


--
-- TOC entry 13411 (class 2606 OID 443132)
-- Name: estacao_meteorologica_proxima estacao_meteorologica_proxima_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_proxima
    ADD CONSTRAINT estacao_meteorologica_proxima_pkey PRIMARY KEY (id);


--
-- TOC entry 13419 (class 2606 OID 443134)
-- Name: estacao_meteorologica_remota_leitura estacao_meteorologica_remota_leitura_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_remota_leitura
    ADD CONSTRAINT estacao_meteorologica_remota_leitura_pkey PRIMARY KEY (id);


--
-- TOC entry 13415 (class 2606 OID 443136)
-- Name: estacao_meteorologica_remota estacao_meteorologica_remota_nome_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_remota
    ADD CONSTRAINT estacao_meteorologica_remota_nome_key UNIQUE (nome);


--
-- TOC entry 13417 (class 2606 OID 443138)
-- Name: estacao_meteorologica_remota estacao_meteorologica_remota_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_remota
    ADD CONSTRAINT estacao_meteorologica_remota_pkey PRIMARY KEY (id);


--
-- TOC entry 13421 (class 2606 OID 443140)
-- Name: estoque_historico estoque_historico_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estoque_historico
    ADD CONSTRAINT estoque_historico_pkey PRIMARY KEY (id);


--
-- TOC entry 13425 (class 2606 OID 443142)
-- Name: estrutura_amostragem_leitura estrutura_amostragem_leitura_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_amostragem_leitura
    ADD CONSTRAINT estrutura_amostragem_leitura_pkey PRIMARY KEY (id);


--
-- TOC entry 13423 (class 2606 OID 443144)
-- Name: estrutura_amostragem estrutura_amostragem_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_amostragem
    ADD CONSTRAINT estrutura_amostragem_pkey PRIMARY KEY (id);


--
-- TOC entry 13432 (class 2606 OID 443146)
-- Name: estrutura_armazenagem_divisao_aerador estrutura_armazenagem_divisao_aerador_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_armazenagem_divisao_aerador
    ADD CONSTRAINT estrutura_armazenagem_divisao_aerador_pkey PRIMARY KEY (id);


--
-- TOC entry 13434 (class 2606 OID 443148)
-- Name: estrutura_armazenagem_divisao_pendulo estrutura_armazenagem_divisao_pendulo_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_armazenagem_divisao_pendulo
    ADD CONSTRAINT estrutura_armazenagem_divisao_pendulo_pkey PRIMARY KEY (id);


--
-- TOC entry 13430 (class 2606 OID 443150)
-- Name: estrutura_armazenagem_divisao estrutura_armazenagem_divisao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_armazenagem_divisao
    ADD CONSTRAINT estrutura_armazenagem_divisao_pkey PRIMARY KEY (id);


--
-- TOC entry 13427 (class 2606 OID 443152)
-- Name: estrutura_armazenagem estrutura_armazenagem_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_armazenagem
    ADD CONSTRAINT estrutura_armazenagem_pkey PRIMARY KEY (id);


--
-- TOC entry 13436 (class 2606 OID 443154)
-- Name: estrutura_armazenagem_propriedade estrutura_armazenagem_propriedade_estrutura_armazenagem_id_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_armazenagem_propriedade
    ADD CONSTRAINT estrutura_armazenagem_propriedade_estrutura_armazenagem_id_key UNIQUE (estrutura_armazenagem_id);


--
-- TOC entry 13438 (class 2606 OID 443156)
-- Name: estrutura_armazenagem_propriedade estrutura_armazenagem_propriedade_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_armazenagem_propriedade
    ADD CONSTRAINT estrutura_armazenagem_propriedade_pkey PRIMARY KEY (id);


--
-- TOC entry 13441 (class 2606 OID 443158)
-- Name: estrutura_armazenagem_respiro estrutura_armazenagem_respiro_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_armazenagem_respiro
    ADD CONSTRAINT estrutura_armazenagem_respiro_pkey PRIMARY KEY (id);


--
-- TOC entry 13443 (class 2606 OID 443160)
-- Name: funcionalidade funcionalidade_caminho_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.funcionalidade
    ADD CONSTRAINT funcionalidade_caminho_key UNIQUE (caminho);


--
-- TOC entry 13445 (class 2606 OID 443162)
-- Name: funcionalidade funcionalidade_nome_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.funcionalidade
    ADD CONSTRAINT funcionalidade_nome_key UNIQUE (nome);


--
-- TOC entry 13447 (class 2606 OID 443164)
-- Name: funcionalidade funcionalidade_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.funcionalidade
    ADD CONSTRAINT funcionalidade_pkey PRIMARY KEY (id);


--
-- TOC entry 13449 (class 2606 OID 443166)
-- Name: log_comando_aeracao log_comando_aeracao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.log_comando_aeracao
    ADD CONSTRAINT log_comando_aeracao_pkey PRIMARY KEY (id);


--
-- TOC entry 13451 (class 2606 OID 443168)
-- Name: log_programa_aeracao log_programa_aeracao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.log_programa_aeracao
    ADD CONSTRAINT log_programa_aeracao_pkey PRIMARY KEY (id);


--
-- TOC entry 13453 (class 2606 OID 443170)
-- Name: log_regra_aeracao log_regra_aeracao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.log_regra_aeracao
    ADD CONSTRAINT log_regra_aeracao_pkey PRIMARY KEY (id);


--
-- TOC entry 13455 (class 2606 OID 443172)
-- Name: mesorregiao mesorregiao_nome_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.mesorregiao
    ADD CONSTRAINT mesorregiao_nome_key UNIQUE (nome);


--
-- TOC entry 13457 (class 2606 OID 443174)
-- Name: mesorregiao mesorregiao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.mesorregiao
    ADD CONSTRAINT mesorregiao_pkey PRIMARY KEY (id);


--
-- TOC entry 13461 (class 2606 OID 443176)
-- Name: pais pais_nome_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pais
    ADD CONSTRAINT pais_nome_key UNIQUE (nome);


--
-- TOC entry 13463 (class 2606 OID 443178)
-- Name: pais pais_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (id);


--
-- TOC entry 13468 (class 2606 OID 443180)
-- Name: pendulo_canal pendulo_canal_pendulo_id_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pendulo_canal
    ADD CONSTRAINT pendulo_canal_pendulo_id_key UNIQUE (pendulo_id);


--
-- TOC entry 13470 (class 2606 OID 443182)
-- Name: pendulo_canal pendulo_canal_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pendulo_canal
    ADD CONSTRAINT pendulo_canal_pkey PRIMARY KEY (id);


--
-- TOC entry 13473 (class 2606 OID 443184)
-- Name: pendulo_leitura pendulo_leitura_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pendulo_leitura
    ADD CONSTRAINT pendulo_leitura_pkey PRIMARY KEY (id);


--
-- TOC entry 13476 (class 2606 OID 443186)
-- Name: pendulo_nivel_sensor pendulo_nivel_sensor_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pendulo_nivel_sensor
    ADD CONSTRAINT pendulo_nivel_sensor_pkey PRIMARY KEY (id);


--
-- TOC entry 13466 (class 2606 OID 443188)
-- Name: pendulo pendulo_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pendulo
    ADD CONSTRAINT pendulo_pkey PRIMARY KEY (id);


--
-- TOC entry 13478 (class 2606 OID 443190)
-- Name: pendulo_propriedade pendulo_propriedade_pendulo_id_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pendulo_propriedade
    ADD CONSTRAINT pendulo_propriedade_pendulo_id_key UNIQUE (pendulo_id);


--
-- TOC entry 13480 (class 2606 OID 443192)
-- Name: pendulo_propriedade pendulo_propriedade_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pendulo_propriedade
    ADD CONSTRAINT pendulo_propriedade_pkey PRIMARY KEY (id);


--
-- TOC entry 13482 (class 2606 OID 443194)
-- Name: pendulo_troca_historico pendulo_troca_historico_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pendulo_troca_historico
    ADD CONSTRAINT pendulo_troca_historico_pkey PRIMARY KEY (id);


--
-- TOC entry 13484 (class 2606 OID 443196)
-- Name: pendulo_ultima_leitura pendulo_ultima_leitura_pendulo_id_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pendulo_ultima_leitura
    ADD CONSTRAINT pendulo_ultima_leitura_pendulo_id_key UNIQUE (pendulo_id);


--
-- TOC entry 13486 (class 2606 OID 443198)
-- Name: pendulo_ultima_leitura pendulo_ultima_leitura_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pendulo_ultima_leitura
    ADD CONSTRAINT pendulo_ultima_leitura_pkey PRIMARY KEY (id);


--
-- TOC entry 13493 (class 2606 OID 443200)
-- Name: perfil_funcionalidade perfil_funcionalidade_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.perfil_funcionalidade
    ADD CONSTRAINT perfil_funcionalidade_pkey PRIMARY KEY (id);


--
-- TOC entry 13488 (class 2606 OID 443202)
-- Name: perfil perfil_nome_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.perfil
    ADD CONSTRAINT perfil_nome_key UNIQUE (nome);


--
-- TOC entry 13490 (class 2606 OID 443204)
-- Name: perfil perfil_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.perfil
    ADD CONSTRAINT perfil_pkey PRIMARY KEY (id);


--
-- TOC entry 13495 (class 2606 OID 443206)
-- Name: pilha_comando_aeracao pilha_comando_aeracao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pilha_comando_aeracao
    ADD CONSTRAINT pilha_comando_aeracao_pkey PRIMARY KEY (id);


--
-- TOC entry 13499 (class 2606 OID 443208)
-- Name: planta_unidade_estrutura planta_unidade_estrutura_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.planta_unidade_estrutura
    ADD CONSTRAINT planta_unidade_estrutura_pkey PRIMARY KEY (id);


--
-- TOC entry 13497 (class 2606 OID 443210)
-- Name: planta_unidade planta_unidade_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.planta_unidade
    ADD CONSTRAINT planta_unidade_pkey PRIMARY KEY (id);


--
-- TOC entry 13501 (class 2606 OID 443212)
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- TOC entry 13505 (class 2606 OID 443214)
-- Name: programa_aeracao_historico programa_aeracao_historico_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.programa_aeracao_historico
    ADD CONSTRAINT programa_aeracao_historico_pkey PRIMARY KEY (id);


--
-- TOC entry 13503 (class 2606 OID 443216)
-- Name: programa_aeracao programa_aeracao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.programa_aeracao
    ADD CONSTRAINT programa_aeracao_pkey PRIMARY KEY (id);


--
-- TOC entry 13507 (class 2606 OID 443218)
-- Name: refresh_token refresh_token_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.refresh_token
    ADD CONSTRAINT refresh_token_pkey PRIMARY KEY (id);


--
-- TOC entry 13509 (class 2606 OID 443220)
-- Name: regiao regiao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.regiao
    ADD CONSTRAINT regiao_pkey PRIMARY KEY (id);


--
-- TOC entry 13511 (class 2606 OID 443222)
-- Name: regra_aeracao regra_aeracao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.regra_aeracao
    ADD CONSTRAINT regra_aeracao_pkey PRIMARY KEY (id);


--
-- TOC entry 13519 (class 2606 OID 443224)
-- Name: secador_alerta_configuracao secador_alerta_configuracao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_alerta_configuracao
    ADD CONSTRAINT secador_alerta_configuracao_pkey PRIMARY KEY (id);


--
-- TOC entry 13521 (class 2606 OID 443226)
-- Name: secador_alerta_destinatario secador_alerta_destinatario_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_alerta_destinatario
    ADD CONSTRAINT secador_alerta_destinatario_pkey PRIMARY KEY (id);


--
-- TOC entry 13525 (class 2606 OID 443228)
-- Name: secador_alerta_registro_aplicativo secador_alerta_registro_aplicativo_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_alerta_registro_aplicativo
    ADD CONSTRAINT secador_alerta_registro_aplicativo_pkey PRIMARY KEY (id);


--
-- TOC entry 13527 (class 2606 OID 443230)
-- Name: secador_alerta_registro_aplicativo_status secador_alerta_registro_aplicativo_status_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_alerta_registro_aplicativo_status
    ADD CONSTRAINT secador_alerta_registro_aplicativo_status_pkey PRIMARY KEY (id);


--
-- TOC entry 13523 (class 2606 OID 443232)
-- Name: secador_alerta_registro secador_alerta_registro_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_alerta_registro
    ADD CONSTRAINT secador_alerta_registro_pkey PRIMARY KEY (id);


--
-- TOC entry 13529 (class 2606 OID 443234)
-- Name: secador_alerta_registro_sistema secador_alerta_registro_sistema_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_alerta_registro_sistema
    ADD CONSTRAINT secador_alerta_registro_sistema_pkey PRIMARY KEY (id);


--
-- TOC entry 13513 (class 2606 OID 443236)
-- Name: secador secador_codigo_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador
    ADD CONSTRAINT secador_codigo_key UNIQUE (codigo);


--
-- TOC entry 13531 (class 2606 OID 443238)
-- Name: secador_comando_dryer secador_comando_dryer_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_comando_dryer
    ADD CONSTRAINT secador_comando_dryer_pkey PRIMARY KEY (id);


--
-- TOC entry 13533 (class 2606 OID 443240)
-- Name: secador_comando_hd secador_comando_hd_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_comando_hd
    ADD CONSTRAINT secador_comando_hd_pkey PRIMARY KEY (id);


--
-- TOC entry 13535 (class 2606 OID 443242)
-- Name: secador_comando_wms secador_comando_wms_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_comando_wms
    ADD CONSTRAINT secador_comando_wms_pkey PRIMARY KEY (id);


--
-- TOC entry 13537 (class 2606 OID 443244)
-- Name: secador_leitura_dryer secador_leitura_dryer_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_leitura_dryer
    ADD CONSTRAINT secador_leitura_dryer_pkey PRIMARY KEY (id);


--
-- TOC entry 13539 (class 2606 OID 443246)
-- Name: secador_leitura_hd secador_leitura_hd_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_leitura_hd
    ADD CONSTRAINT secador_leitura_hd_pkey PRIMARY KEY (id);


--
-- TOC entry 13541 (class 2606 OID 443248)
-- Name: secador_leitura_wms secador_leitura_wms_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_leitura_wms
    ADD CONSTRAINT secador_leitura_wms_pkey PRIMARY KEY (id);


--
-- TOC entry 13543 (class 2606 OID 443250)
-- Name: secador_limpeza_historico secador_limpeza_historico_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_limpeza_historico
    ADD CONSTRAINT secador_limpeza_historico_pkey PRIMARY KEY (id);


--
-- TOC entry 13515 (class 2606 OID 443252)
-- Name: secador secador_nome_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador
    ADD CONSTRAINT secador_nome_key UNIQUE (nome);


--
-- TOC entry 13545 (class 2606 OID 443254)
-- Name: secador_parametro_dryer secador_parametro_dryer_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_parametro_dryer
    ADD CONSTRAINT secador_parametro_dryer_pkey PRIMARY KEY (id);


--
-- TOC entry 13547 (class 2606 OID 443256)
-- Name: secador_parametro_hd secador_parametro_hd_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_parametro_hd
    ADD CONSTRAINT secador_parametro_hd_pkey PRIMARY KEY (id);


--
-- TOC entry 13517 (class 2606 OID 443258)
-- Name: secador secador_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador
    ADD CONSTRAINT secador_pkey PRIMARY KEY (id);


--
-- TOC entry 13549 (class 2606 OID 443260)
-- Name: secador_processo secador_processo_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_processo
    ADD CONSTRAINT secador_processo_pkey PRIMARY KEY (id);


--
-- TOC entry 13551 (class 2606 OID 443262)
-- Name: secador_produto_historico secador_produto_historico_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_produto_historico
    ADD CONSTRAINT secador_produto_historico_pkey PRIMARY KEY (id);


--
-- TOC entry 13553 (class 2606 OID 443264)
-- Name: secador_sensor_dryer secador_sensor_dryer_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_sensor_dryer
    ADD CONSTRAINT secador_sensor_dryer_pkey PRIMARY KEY (id);


--
-- TOC entry 13558 (class 2606 OID 443266)
-- Name: secador_sensor_hd secador_sensor_hd_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_sensor_hd
    ADD CONSTRAINT secador_sensor_hd_pkey PRIMARY KEY (id);


--
-- TOC entry 13563 (class 2606 OID 443268)
-- Name: secador_sensor_wms secador_sensor_wms_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_sensor_wms
    ADD CONSTRAINT secador_sensor_wms_pkey PRIMARY KEY (id);


--
-- TOC entry 13568 (class 2606 OID 443270)
-- Name: secador_ultima_leitura_dryer secador_ultima_leitura_dryer_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_ultima_leitura_dryer
    ADD CONSTRAINT secador_ultima_leitura_dryer_pkey PRIMARY KEY (id);


--
-- TOC entry 13570 (class 2606 OID 443272)
-- Name: secador_ultima_leitura_hd secador_ultima_leitura_hd_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_ultima_leitura_hd
    ADD CONSTRAINT secador_ultima_leitura_hd_pkey PRIMARY KEY (id);


--
-- TOC entry 13572 (class 2606 OID 443274)
-- Name: secador_ultima_leitura_wms secador_ultima_leitura_wms_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_ultima_leitura_wms
    ADD CONSTRAINT secador_ultima_leitura_wms_pkey PRIMARY KEY (id);


--
-- TOC entry 13576 (class 2606 OID 443276)
-- Name: secador_visao_area secador_visao_area_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_visao_area
    ADD CONSTRAINT secador_visao_area_pkey PRIMARY KEY (id);


--
-- TOC entry 13574 (class 2606 OID 443278)
-- Name: secador_visao secador_visao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_visao
    ADD CONSTRAINT secador_visao_pkey PRIMARY KEY (id);


--
-- TOC entry 13578 (class 2606 OID 443280)
-- Name: secador_visao_sensor_dryer secador_visao_sensor_dryer_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_visao_sensor_dryer
    ADD CONSTRAINT secador_visao_sensor_dryer_pkey PRIMARY KEY (id);


--
-- TOC entry 13580 (class 2606 OID 443282)
-- Name: secador_visao_sensor_hd secador_visao_sensor_hd_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_visao_sensor_hd
    ADD CONSTRAINT secador_visao_sensor_hd_pkey PRIMARY KEY (id);


--
-- TOC entry 13582 (class 2606 OID 443284)
-- Name: secador_visao_sensor_wms secador_visao_sensor_wms_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_visao_sensor_wms
    ADD CONSTRAINT secador_visao_sensor_wms_pkey PRIMARY KEY (id);


--
-- TOC entry 13584 (class 2606 OID 443286)
-- Name: secagem_evento secagem_evento_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secagem_evento
    ADD CONSTRAINT secagem_evento_pkey PRIMARY KEY (id);


--
-- TOC entry 13587 (class 2606 OID 443288)
-- Name: secagem_ultimo_evento secagem_ultimo_evento_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secagem_ultimo_evento
    ADD CONSTRAINT secagem_ultimo_evento_pkey PRIMARY KEY (id);


--
-- TOC entry 13593 (class 2606 OID 443290)
-- Name: sensor_co2_leitura sensor_co2_leitura_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.sensor_co2_leitura
    ADD CONSTRAINT sensor_co2_leitura_pkey PRIMARY KEY (id);


--
-- TOC entry 13591 (class 2606 OID 443292)
-- Name: sensor_co2 sensor_co2_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.sensor_co2
    ADD CONSTRAINT sensor_co2_pkey PRIMARY KEY (id);


--
-- TOC entry 13595 (class 2606 OID 443294)
-- Name: sensor_co2_ultima_leitura sensor_co2_ultima_leitura_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.sensor_co2_ultima_leitura
    ADD CONSTRAINT sensor_co2_ultima_leitura_pkey PRIMARY KEY (id);


--
-- TOC entry 13601 (class 2606 OID 443296)
-- Name: sensor_plenum_leitura sensor_plenum_leitura_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.sensor_plenum_leitura
    ADD CONSTRAINT sensor_plenum_leitura_pkey PRIMARY KEY (id);


--
-- TOC entry 13599 (class 2606 OID 443298)
-- Name: sensor_plenum sensor_plenum_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.sensor_plenum
    ADD CONSTRAINT sensor_plenum_pkey PRIMARY KEY (id);


--
-- TOC entry 13603 (class 2606 OID 443300)
-- Name: sensor_plenum_ultima_leitura sensor_plenum_ultima_leitura_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.sensor_plenum_ultima_leitura
    ADD CONSTRAINT sensor_plenum_ultima_leitura_pkey PRIMARY KEY (id);


--
-- TOC entry 13608 (class 2606 OID 443302)
-- Name: sensor_volume_leitura sensor_volume_leitura_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.sensor_volume_leitura
    ADD CONSTRAINT sensor_volume_leitura_pkey PRIMARY KEY (id);


--
-- TOC entry 13606 (class 2606 OID 443304)
-- Name: sensor_volume sensor_volume_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.sensor_volume
    ADD CONSTRAINT sensor_volume_pkey PRIMARY KEY (id);


--
-- TOC entry 13610 (class 2606 OID 443306)
-- Name: sensor_volume_ultima_leitura sensor_volume_ultima_leitura_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.sensor_volume_ultima_leitura
    ADD CONSTRAINT sensor_volume_ultima_leitura_pkey PRIMARY KEY (id);


--
-- TOC entry 13614 (class 2606 OID 443308)
-- Name: silo_anel silo_anel_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.silo_anel
    ADD CONSTRAINT silo_anel_pkey PRIMARY KEY (id);


--
-- TOC entry 13616 (class 2606 OID 443310)
-- Name: silo_pendulo_visualizacao silo_pendulo_visualizacao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.silo_pendulo_visualizacao
    ADD CONSTRAINT silo_pendulo_visualizacao_pkey PRIMARY KEY (id);


--
-- TOC entry 13612 (class 2606 OID 443312)
-- Name: silo silo_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.silo
    ADD CONSTRAINT silo_pkey PRIMARY KEY (id);


--
-- TOC entry 13618 (class 2606 OID 443314)
-- Name: uf uf_nome_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.uf
    ADD CONSTRAINT uf_nome_key UNIQUE (nome);


--
-- TOC entry 13620 (class 2606 OID 443316)
-- Name: uf uf_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.uf
    ADD CONSTRAINT uf_pkey PRIMARY KEY (id);


--
-- TOC entry 13624 (class 2606 OID 443318)
-- Name: unidade_parametrizacao unidade_parametrizacao_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.unidade_parametrizacao
    ADD CONSTRAINT unidade_parametrizacao_pkey PRIMARY KEY (id);


--
-- TOC entry 13622 (class 2606 OID 443320)
-- Name: unidade unidade_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.unidade
    ADD CONSTRAINT unidade_pkey PRIMARY KEY (id);


--
-- TOC entry 13626 (class 2606 OID 443322)
-- Name: unidade_produto_interno unidade_produto_interno_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.unidade_produto_interno
    ADD CONSTRAINT unidade_produto_interno_pkey PRIMARY KEY (id);


--
-- TOC entry 13628 (class 2606 OID 443324)
-- Name: usuario usuario_email_key; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.usuario
    ADD CONSTRAINT usuario_email_key UNIQUE (email);


--
-- TOC entry 13633 (class 2606 OID 443326)
-- Name: usuario_perfil usuario_perfil_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.usuario_perfil
    ADD CONSTRAINT usuario_perfil_pkey PRIMARY KEY (id);


--
-- TOC entry 13630 (class 2606 OID 443328)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 13635 (class 2606 OID 443330)
-- Name: usuario_unidade usuario_unidade_pkey; Type: CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.usuario_unidade
    ADD CONSTRAINT usuario_unidade_pkey PRIMARY KEY (id);


--
-- TOC entry 13315 (class 1259 OID 443331)
-- Name: aerador_estrutura_armazenagem_id_codigo_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX aerador_estrutura_armazenagem_id_codigo_idx ON unidade_modelo.aerador USING btree (estrutura_armazenagem_id, codigo);


--
-- TOC entry 13348 (class 1259 OID 443332)
-- Name: armazem_pendulo_visualizacao_pendulo_id_arco_linha_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX armazem_pendulo_visualizacao_pendulo_id_arco_linha_idx ON unidade_modelo.armazem_pendulo_visualizacao USING btree (pendulo_id, arco, linha);


--
-- TOC entry 13353 (class 1259 OID 443333)
-- Name: armazenagem_evento_estrutura_armazenagem_id_instante_evento_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX armazenagem_evento_estrutura_armazenagem_id_instante_evento_idx ON unidade_modelo.armazenagem_evento USING btree (estrutura_armazenagem_id, instante, evento_origem);


--
-- TOC entry 13356 (class 1259 OID 443334)
-- Name: armazenagem_ultimo_evento_estrutura_armazenagem_id_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX armazenagem_ultimo_evento_estrutura_armazenagem_id_idx ON unidade_modelo.armazenagem_ultimo_evento USING btree (estrutura_armazenagem_id);


--
-- TOC entry 13373 (class 1259 OID 443335)
-- Name: control_comando_equipamento_id_pilha_comando_aeracao_id_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX control_comando_equipamento_id_pilha_comando_aeracao_id_idx ON unidade_modelo.control_comando USING btree (equipamento_id, pilha_comando_aeracao_id);


--
-- TOC entry 13428 (class 1259 OID 443336)
-- Name: estrutura_armazenagem_divisao_estrutura_armazenagem_id_codi_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX estrutura_armazenagem_divisao_estrutura_armazenagem_id_codi_idx ON unidade_modelo.estrutura_armazenagem_divisao USING btree (estrutura_armazenagem_id, codigo, arquivado);


--
-- TOC entry 13439 (class 1259 OID 443337)
-- Name: estrutura_armazenagem_respiro_estrutura_armazenagem_id_mode_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX estrutura_armazenagem_respiro_estrutura_armazenagem_id_mode_idx ON unidade_modelo.estrutura_armazenagem_respiro USING btree (estrutura_armazenagem_id, modelo);


--
-- TOC entry 13464 (class 1259 OID 443338)
-- Name: pendulo_estrutura_armazenagem_id_codigo_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX pendulo_estrutura_armazenagem_id_codigo_idx ON unidade_modelo.pendulo USING btree (estrutura_armazenagem_id, codigo);


--
-- TOC entry 13471 (class 1259 OID 443339)
-- Name: pendulo_leitura_pendulo_id_instante_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX pendulo_leitura_pendulo_id_instante_idx ON unidade_modelo.pendulo_leitura USING btree (pendulo_id, instante);


--
-- TOC entry 13474 (class 1259 OID 443340)
-- Name: pendulo_nivel_sensor_pendulo_id_instante_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE INDEX pendulo_nivel_sensor_pendulo_id_instante_idx ON unidade_modelo.pendulo_nivel_sensor USING btree (pendulo_id, instante);


--
-- TOC entry 13491 (class 1259 OID 443341)
-- Name: perfil_funcionalidade_perfil_id_funcionalidade_id_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX perfil_funcionalidade_perfil_id_funcionalidade_id_idx ON unidade_modelo.perfil_funcionalidade USING btree (perfil_id, funcionalidade_id);


--
-- TOC entry 13554 (class 1259 OID 443342)
-- Name: secador_sensor_dryer_secador_id_categoria_indice_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX secador_sensor_dryer_secador_id_categoria_indice_idx ON unidade_modelo.secador_sensor_dryer USING btree (secador_id, categoria, indice);


--
-- TOC entry 13555 (class 1259 OID 443343)
-- Name: secador_sensor_dryer_secador_id_nome_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX secador_sensor_dryer_secador_id_nome_idx ON unidade_modelo.secador_sensor_dryer USING btree (secador_id, nome);


--
-- TOC entry 13556 (class 1259 OID 443344)
-- Name: secador_sensor_dryer_secador_id_sigla_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX secador_sensor_dryer_secador_id_sigla_idx ON unidade_modelo.secador_sensor_dryer USING btree (secador_id, sigla);


--
-- TOC entry 13559 (class 1259 OID 443345)
-- Name: secador_sensor_hd_secador_id_categoria_indice_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX secador_sensor_hd_secador_id_categoria_indice_idx ON unidade_modelo.secador_sensor_hd USING btree (secador_id, categoria, indice);


--
-- TOC entry 13560 (class 1259 OID 443346)
-- Name: secador_sensor_hd_secador_id_nome_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX secador_sensor_hd_secador_id_nome_idx ON unidade_modelo.secador_sensor_hd USING btree (secador_id, nome);


--
-- TOC entry 13561 (class 1259 OID 443347)
-- Name: secador_sensor_hd_secador_id_sigla_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX secador_sensor_hd_secador_id_sigla_idx ON unidade_modelo.secador_sensor_hd USING btree (secador_id, sigla);


--
-- TOC entry 13564 (class 1259 OID 443348)
-- Name: secador_sensor_wms_secador_id_categoria_indice_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX secador_sensor_wms_secador_id_categoria_indice_idx ON unidade_modelo.secador_sensor_wms USING btree (secador_id, categoria, indice);


--
-- TOC entry 13565 (class 1259 OID 443349)
-- Name: secador_sensor_wms_secador_id_nome_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX secador_sensor_wms_secador_id_nome_idx ON unidade_modelo.secador_sensor_wms USING btree (secador_id, nome);


--
-- TOC entry 13566 (class 1259 OID 443350)
-- Name: secador_sensor_wms_secador_id_sigla_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX secador_sensor_wms_secador_id_sigla_idx ON unidade_modelo.secador_sensor_wms USING btree (secador_id, sigla);


--
-- TOC entry 13585 (class 1259 OID 443351)
-- Name: secagem_evento_secador_id_instante_evento_origem_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX secagem_evento_secador_id_instante_evento_origem_idx ON unidade_modelo.secagem_evento USING btree (secador_id, instante, evento_origem);


--
-- TOC entry 13588 (class 1259 OID 443352)
-- Name: secagem_ultimo_evento_secador_id_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX secagem_ultimo_evento_secador_id_idx ON unidade_modelo.secagem_ultimo_evento USING btree (secador_id);


--
-- TOC entry 13589 (class 1259 OID 443353)
-- Name: sensor_co2_equipamento_id_indice_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX sensor_co2_equipamento_id_indice_idx ON unidade_modelo.sensor_co2 USING btree (equipamento_id, indice);


--
-- TOC entry 13596 (class 1259 OID 443354)
-- Name: sensor_plenum_equipamento_id_indice_temperatura_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX sensor_plenum_equipamento_id_indice_temperatura_idx ON unidade_modelo.sensor_plenum USING btree (equipamento_id, indice_temperatura);


--
-- TOC entry 13597 (class 1259 OID 443355)
-- Name: sensor_plenum_equipamento_id_indice_ur_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX sensor_plenum_equipamento_id_indice_ur_idx ON unidade_modelo.sensor_plenum USING btree (equipamento_id, indice_ur);


--
-- TOC entry 13604 (class 1259 OID 443356)
-- Name: sensor_volume_equipamento_id_indice_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX sensor_volume_equipamento_id_indice_idx ON unidade_modelo.sensor_volume USING btree (equipamento_id, indice);


--
-- TOC entry 13631 (class 1259 OID 443357)
-- Name: usuario_perfil_perfil_id_usuario_id_idx; Type: INDEX; Schema: unidade_modelo; Owner: ceres
--

CREATE UNIQUE INDEX usuario_perfil_perfil_id_usuario_id_idx ON unidade_modelo.usuario_perfil USING btree (perfil_id, usuario_id);


--
-- TOC entry 13636 (class 2606 OID 443358)
-- Name: aeracao_aerador_historico aeracao_aerador_historico_aerador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aeracao_aerador_historico
    ADD CONSTRAINT aeracao_aerador_historico_aerador_id_fkey FOREIGN KEY (aerador_id) REFERENCES unidade_modelo.aerador(id);


--
-- TOC entry 13637 (class 2606 OID 443363)
-- Name: aeracao_aerador_historico aeracao_aerador_historico_estrutura_armazenagem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aeracao_aerador_historico
    ADD CONSTRAINT aeracao_aerador_historico_estrutura_armazenagem_id_fkey FOREIGN KEY (estrutura_armazenagem_id) REFERENCES unidade_modelo.estrutura_armazenagem(id);


--
-- TOC entry 13638 (class 2606 OID 443368)
-- Name: aeracao_estrutura_divisao_historico aeracao_estrutura_divisao_his_estrutura_armazenagem_divisa_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aeracao_estrutura_divisao_historico
    ADD CONSTRAINT aeracao_estrutura_divisao_his_estrutura_armazenagem_divisa_fkey FOREIGN KEY (estrutura_armazenagem_divisao_id) REFERENCES unidade_modelo.estrutura_armazenagem_divisao(id);


--
-- TOC entry 13639 (class 2606 OID 443373)
-- Name: aeracao_estrutura_historico aeracao_estrutura_historico_estrutura_armazenagem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aeracao_estrutura_historico
    ADD CONSTRAINT aeracao_estrutura_historico_estrutura_armazenagem_id_fkey FOREIGN KEY (estrutura_armazenagem_id) REFERENCES unidade_modelo.estrutura_armazenagem(id);


--
-- TOC entry 13641 (class 2606 OID 443378)
-- Name: aerador_configuracao aerador_configuracao_aerador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador_configuracao
    ADD CONSTRAINT aerador_configuracao_aerador_id_fkey FOREIGN KEY (aerador_id) REFERENCES unidade_modelo.aerador(id);


--
-- TOC entry 13642 (class 2606 OID 443383)
-- Name: aerador_configuracao aerador_configuracao_chave_equipamento_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador_configuracao
    ADD CONSTRAINT aerador_configuracao_chave_equipamento_id_fkey FOREIGN KEY (chave_equipamento_id) REFERENCES unidade_modelo.equipamento(id);


--
-- TOC entry 13643 (class 2606 OID 443388)
-- Name: aerador_configuracao aerador_configuracao_rele_equipamento_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador_configuracao
    ADD CONSTRAINT aerador_configuracao_rele_equipamento_id_fkey FOREIGN KEY (rele_equipamento_id) REFERENCES unidade_modelo.equipamento(id);


--
-- TOC entry 13644 (class 2606 OID 443393)
-- Name: aerador_configuracao aerador_configuracao_status_equipamento_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador_configuracao
    ADD CONSTRAINT aerador_configuracao_status_equipamento_id_fkey FOREIGN KEY (status_equipamento_id) REFERENCES unidade_modelo.equipamento(id);


--
-- TOC entry 13640 (class 2606 OID 443398)
-- Name: aerador aerador_estrutura_armazenagem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador
    ADD CONSTRAINT aerador_estrutura_armazenagem_id_fkey FOREIGN KEY (estrutura_armazenagem_id) REFERENCES unidade_modelo.estrutura_armazenagem(id);


--
-- TOC entry 13645 (class 2606 OID 443403)
-- Name: aerador_leitura_chave aerador_leitura_chave_aerador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador_leitura_chave
    ADD CONSTRAINT aerador_leitura_chave_aerador_id_fkey FOREIGN KEY (aerador_id) REFERENCES unidade_modelo.aerador(id);


--
-- TOC entry 13646 (class 2606 OID 443408)
-- Name: aerador_leitura_mep aerador_leitura_mep_aerador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador_leitura_mep
    ADD CONSTRAINT aerador_leitura_mep_aerador_id_fkey FOREIGN KEY (aerador_id) REFERENCES unidade_modelo.aerador(id);


--
-- TOC entry 13647 (class 2606 OID 443413)
-- Name: aerador_leitura_rele aerador_leitura_rele_aerador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador_leitura_rele
    ADD CONSTRAINT aerador_leitura_rele_aerador_id_fkey FOREIGN KEY (aerador_id) REFERENCES unidade_modelo.aerador(id);


--
-- TOC entry 13648 (class 2606 OID 443418)
-- Name: aerador_leitura_status aerador_leitura_status_aerador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador_leitura_status
    ADD CONSTRAINT aerador_leitura_status_aerador_id_fkey FOREIGN KEY (aerador_id) REFERENCES unidade_modelo.aerador(id);


--
-- TOC entry 13649 (class 2606 OID 443423)
-- Name: aerador_motor aerador_motor_aerador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador_motor
    ADD CONSTRAINT aerador_motor_aerador_id_fkey FOREIGN KEY (aerador_id) REFERENCES unidade_modelo.aerador(id);


--
-- TOC entry 13650 (class 2606 OID 443428)
-- Name: aerador_propriedade aerador_propriedade_aerador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aerador_propriedade
    ADD CONSTRAINT aerador_propriedade_aerador_id_fkey FOREIGN KEY (aerador_id) REFERENCES unidade_modelo.aerador(id);


--
-- TOC entry 13651 (class 2606 OID 443433)
-- Name: aquecimento_ar_historico aquecimento_ar_historico_estrutura_armazenagem_divisao_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aquecimento_ar_historico
    ADD CONSTRAINT aquecimento_ar_historico_estrutura_armazenagem_divisao_id_fkey FOREIGN KEY (estrutura_armazenagem_divisao_id) REFERENCES unidade_modelo.estrutura_armazenagem_divisao(id);


--
-- TOC entry 13652 (class 2606 OID 443438)
-- Name: aquecimento_ar_historico aquecimento_ar_historico_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.aquecimento_ar_historico
    ADD CONSTRAINT aquecimento_ar_historico_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


--
-- TOC entry 13654 (class 2606 OID 443443)
-- Name: armazem_aerador_visualizacao armazem_aerador_visualizacao_aerador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.armazem_aerador_visualizacao
    ADD CONSTRAINT armazem_aerador_visualizacao_aerador_id_fkey FOREIGN KEY (aerador_id) REFERENCES unidade_modelo.aerador(id);


--
-- TOC entry 13655 (class 2606 OID 443448)
-- Name: armazem_aerador_visualizacao armazem_aerador_visualizacao_armazem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.armazem_aerador_visualizacao
    ADD CONSTRAINT armazem_aerador_visualizacao_armazem_id_fkey FOREIGN KEY (armazem_id) REFERENCES unidade_modelo.armazem(id);


--
-- TOC entry 13656 (class 2606 OID 443453)
-- Name: armazem_equipamento_visualizacao armazem_equipamento_visualizacao_armazem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.armazem_equipamento_visualizacao
    ADD CONSTRAINT armazem_equipamento_visualizacao_armazem_id_fkey FOREIGN KEY (armazem_id) REFERENCES unidade_modelo.armazem(id);


--
-- TOC entry 13657 (class 2606 OID 443458)
-- Name: armazem_equipamento_visualizacao armazem_equipamento_visualizacao_equipamento_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.armazem_equipamento_visualizacao
    ADD CONSTRAINT armazem_equipamento_visualizacao_equipamento_id_fkey FOREIGN KEY (equipamento_id) REFERENCES unidade_modelo.equipamento(id);


--
-- TOC entry 13653 (class 2606 OID 443463)
-- Name: armazem armazem_estrutura_armazenagem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.armazem
    ADD CONSTRAINT armazem_estrutura_armazenagem_id_fkey FOREIGN KEY (estrutura_armazenagem_id) REFERENCES unidade_modelo.estrutura_armazenagem(id);


--
-- TOC entry 13658 (class 2606 OID 443468)
-- Name: armazem_passarela_visualizacao armazem_passarela_visualizacao_armazem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.armazem_passarela_visualizacao
    ADD CONSTRAINT armazem_passarela_visualizacao_armazem_id_fkey FOREIGN KEY (armazem_id) REFERENCES unidade_modelo.armazem(id);


--
-- TOC entry 13659 (class 2606 OID 443473)
-- Name: armazem_pendulo_visualizacao armazem_pendulo_visualizacao_armazem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.armazem_pendulo_visualizacao
    ADD CONSTRAINT armazem_pendulo_visualizacao_armazem_id_fkey FOREIGN KEY (armazem_id) REFERENCES unidade_modelo.armazem(id);


--
-- TOC entry 13660 (class 2606 OID 443478)
-- Name: armazem_pendulo_visualizacao armazem_pendulo_visualizacao_pendulo_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.armazem_pendulo_visualizacao
    ADD CONSTRAINT armazem_pendulo_visualizacao_pendulo_id_fkey FOREIGN KEY (pendulo_id) REFERENCES unidade_modelo.pendulo(id);


--
-- TOC entry 13661 (class 2606 OID 443483)
-- Name: armazem_porta_visualizacao armazem_porta_visualizacao_armazem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.armazem_porta_visualizacao
    ADD CONSTRAINT armazem_porta_visualizacao_armazem_id_fkey FOREIGN KEY (armazem_id) REFERENCES unidade_modelo.armazem(id);


--
-- TOC entry 13662 (class 2606 OID 443488)
-- Name: armazenagem_evento armazenagem_evento_estrutura_armazenagem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.armazenagem_evento
    ADD CONSTRAINT armazenagem_evento_estrutura_armazenagem_id_fkey FOREIGN KEY (estrutura_armazenagem_id) REFERENCES unidade_modelo.estrutura_armazenagem(id);


--
-- TOC entry 13663 (class 2606 OID 443493)
-- Name: armazenagem_ultimo_evento armazenagem_ultimo_evento_estrutura_armazenagem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.armazenagem_ultimo_evento
    ADD CONSTRAINT armazenagem_ultimo_evento_estrutura_armazenagem_id_fkey FOREIGN KEY (estrutura_armazenagem_id) REFERENCES unidade_modelo.estrutura_armazenagem(id);


--
-- TOC entry 13664 (class 2606 OID 443498)
-- Name: cidade cidade_mesorregiao_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.cidade
    ADD CONSTRAINT cidade_mesorregiao_id_fkey FOREIGN KEY (mesorregiao_id) REFERENCES unidade_modelo.mesorregiao(id);


--
-- TOC entry 13665 (class 2606 OID 443503)
-- Name: cidade cidade_uf_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.cidade
    ADD CONSTRAINT cidade_uf_id_fkey FOREIGN KEY (uf_id) REFERENCES unidade_modelo.uf(id);


--
-- TOC entry 13666 (class 2606 OID 443508)
-- Name: cliente cliente_cidade_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.cliente
    ADD CONSTRAINT cliente_cidade_id_fkey FOREIGN KEY (cidade_id) REFERENCES unidade_modelo.cidade(id);


--
-- TOC entry 13667 (class 2606 OID 443513)
-- Name: control_comando control_comando_equipamento_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.control_comando
    ADD CONSTRAINT control_comando_equipamento_id_fkey FOREIGN KEY (equipamento_id) REFERENCES unidade_modelo.equipamento(id);


--
-- TOC entry 13668 (class 2606 OID 443518)
-- Name: control_comando control_comando_pilha_comando_aeracao_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.control_comando
    ADD CONSTRAINT control_comando_pilha_comando_aeracao_id_fkey FOREIGN KEY (pilha_comando_aeracao_id) REFERENCES unidade_modelo.pilha_comando_aeracao(id);


--
-- TOC entry 13669 (class 2606 OID 443523)
-- Name: controle_aeracao_automatica_historico controle_aeracao_automatica_h_estrutura_armazenagem_divisa_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.controle_aeracao_automatica_historico
    ADD CONSTRAINT controle_aeracao_automatica_h_estrutura_armazenagem_divisa_fkey FOREIGN KEY (estrutura_armazenagem_divisao_id) REFERENCES unidade_modelo.estrutura_armazenagem_divisao(id);


--
-- TOC entry 13670 (class 2606 OID 443528)
-- Name: controle_aeracao_automatica_historico controle_aeracao_automatica_historico_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.controle_aeracao_automatica_historico
    ADD CONSTRAINT controle_aeracao_automatica_historico_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


--
-- TOC entry 13672 (class 2606 OID 443533)
-- Name: controle_servico_historico controle_servico_historico_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.controle_servico_historico
    ADD CONSTRAINT controle_servico_historico_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


--
-- TOC entry 13671 (class 2606 OID 443538)
-- Name: controle_servico controle_servico_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.controle_servico
    ADD CONSTRAINT controle_servico_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


--
-- TOC entry 13673 (class 2606 OID 443543)
-- Name: controle_sincronizacao controle_sincronizacao_unidade_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.controle_sincronizacao
    ADD CONSTRAINT controle_sincronizacao_unidade_id_fkey FOREIGN KEY (unidade_id) REFERENCES unidade_modelo.unidade(id);


--
-- TOC entry 13674 (class 2606 OID 443548)
-- Name: cs_atendimento cs_atendimento_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.cs_atendimento
    ADD CONSTRAINT cs_atendimento_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


--
-- TOC entry 13675 (class 2606 OID 443553)
-- Name: equipamento_comunicacao equipamento_comunicacao_equipamento_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.equipamento_comunicacao
    ADD CONSTRAINT equipamento_comunicacao_equipamento_id_fkey FOREIGN KEY (equipamento_id) REFERENCES unidade_modelo.equipamento(id);


--
-- TOC entry 13677 (class 2606 OID 443558)
-- Name: estacao_meteorologica_local_config estacao_meteorologica_local_confi_estacao_meteorologica_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_local_config
    ADD CONSTRAINT estacao_meteorologica_local_confi_estacao_meteorologica_id_fkey FOREIGN KEY (estacao_meteorologica_id) REFERENCES unidade_modelo.estacao_meteorologica_local(id);


--
-- TOC entry 13676 (class 2606 OID 443563)
-- Name: estacao_meteorologica_local estacao_meteorologica_local_equipamento_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_local
    ADD CONSTRAINT estacao_meteorologica_local_equipamento_id_fkey FOREIGN KEY (equipamento_id) REFERENCES unidade_modelo.equipamento(id);


--
-- TOC entry 13678 (class 2606 OID 443568)
-- Name: estacao_meteorologica_local_leitura estacao_meteorologica_local_leitu_estacao_meteorologica_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_local_leitura
    ADD CONSTRAINT estacao_meteorologica_local_leitu_estacao_meteorologica_id_fkey FOREIGN KEY (estacao_meteorologica_id) REFERENCES unidade_modelo.estacao_meteorologica_local(id);


--
-- TOC entry 13679 (class 2606 OID 443573)
-- Name: estacao_meteorologica_local_ultima_leitura estacao_meteorologica_local_ultim_estacao_meteorologica_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_local_ultima_leitura
    ADD CONSTRAINT estacao_meteorologica_local_ultim_estacao_meteorologica_id_fkey FOREIGN KEY (estacao_meteorologica_id) REFERENCES unidade_modelo.estacao_meteorologica_local(id);


--
-- TOC entry 13680 (class 2606 OID 443578)
-- Name: estacao_meteorologica_ordem_consulta_estacao estacao_meteorologica_ordem_consulta_est_ordem_consulta_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_ordem_consulta_estacao
    ADD CONSTRAINT estacao_meteorologica_ordem_consulta_est_ordem_consulta_id_fkey FOREIGN KEY (ordem_consulta_id) REFERENCES unidade_modelo.estacao_meteorologica_ordem_consulta(id);


--
-- TOC entry 13681 (class 2606 OID 443583)
-- Name: estacao_meteorologica_proxima estacao_meteorologica_proxima_equipamento_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_proxima
    ADD CONSTRAINT estacao_meteorologica_proxima_equipamento_id_fkey FOREIGN KEY (equipamento_id) REFERENCES unidade_modelo.equipamento(id);


--
-- TOC entry 13682 (class 2606 OID 443588)
-- Name: estacao_meteorologica_proxima_leitura estacao_meteorologica_proxima_estacao_meteorologica_proxim_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_proxima_leitura
    ADD CONSTRAINT estacao_meteorologica_proxima_estacao_meteorologica_proxim_fkey FOREIGN KEY (estacao_meteorologica_proxima_id) REFERENCES unidade_modelo.estacao_meteorologica_proxima(id);


--
-- TOC entry 13685 (class 2606 OID 443593)
-- Name: estacao_meteorologica_remota_leitura estacao_meteorologica_remota__estacao_meteorologica_remota_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_remota_leitura
    ADD CONSTRAINT estacao_meteorologica_remota__estacao_meteorologica_remota_fkey FOREIGN KEY (estacao_meteorologica_remota_id) REFERENCES unidade_modelo.estacao_meteorologica_remota(id);


--
-- TOC entry 13683 (class 2606 OID 443598)
-- Name: estacao_meteorologica_remota estacao_meteorologica_remota_cidade_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_remota
    ADD CONSTRAINT estacao_meteorologica_remota_cidade_id_fkey FOREIGN KEY (cidade_id) REFERENCES unidade_modelo.cidade(id);


--
-- TOC entry 13684 (class 2606 OID 443603)
-- Name: estacao_meteorologica_remota estacao_meteorologica_remota_equipamento_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estacao_meteorologica_remota
    ADD CONSTRAINT estacao_meteorologica_remota_equipamento_id_fkey FOREIGN KEY (equipamento_id) REFERENCES unidade_modelo.equipamento(id);


--
-- TOC entry 13686 (class 2606 OID 443608)
-- Name: estoque_historico estoque_historico_estrutura_armazenagem_divisao_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estoque_historico
    ADD CONSTRAINT estoque_historico_estrutura_armazenagem_divisao_id_fkey FOREIGN KEY (estrutura_armazenagem_divisao_id) REFERENCES unidade_modelo.estrutura_armazenagem_divisao(id);


--
-- TOC entry 13687 (class 2606 OID 443613)
-- Name: estoque_historico estoque_historico_produto_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estoque_historico
    ADD CONSTRAINT estoque_historico_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES unidade_modelo.produto(id);


--
-- TOC entry 13688 (class 2606 OID 443618)
-- Name: estoque_historico estoque_historico_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estoque_historico
    ADD CONSTRAINT estoque_historico_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


--
-- TOC entry 13689 (class 2606 OID 443623)
-- Name: estrutura_amostragem estrutura_amostragem_estrutura_armazenagem_divisao_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_amostragem
    ADD CONSTRAINT estrutura_amostragem_estrutura_armazenagem_divisao_id_fkey FOREIGN KEY (estrutura_armazenagem_divisao_id) REFERENCES unidade_modelo.estrutura_armazenagem_divisao(id);


--
-- TOC entry 13690 (class 2606 OID 443628)
-- Name: estrutura_amostragem estrutura_amostragem_estrutura_armazenagem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_amostragem
    ADD CONSTRAINT estrutura_amostragem_estrutura_armazenagem_id_fkey FOREIGN KEY (estrutura_armazenagem_id) REFERENCES unidade_modelo.estrutura_armazenagem(id);


--
-- TOC entry 13693 (class 2606 OID 443633)
-- Name: estrutura_amostragem_leitura estrutura_amostragem_leitura_estrutura_amostragem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_amostragem_leitura
    ADD CONSTRAINT estrutura_amostragem_leitura_estrutura_amostragem_id_fkey FOREIGN KEY (estrutura_amostragem_id) REFERENCES unidade_modelo.estrutura_amostragem(id);


--
-- TOC entry 13694 (class 2606 OID 443638)
-- Name: estrutura_amostragem_leitura estrutura_amostragem_leitura_pendulo_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_amostragem_leitura
    ADD CONSTRAINT estrutura_amostragem_leitura_pendulo_id_fkey FOREIGN KEY (pendulo_id) REFERENCES unidade_modelo.pendulo(id);


--
-- TOC entry 13691 (class 2606 OID 443643)
-- Name: estrutura_amostragem estrutura_amostragem_produto_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_amostragem
    ADD CONSTRAINT estrutura_amostragem_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES unidade_modelo.produto(id);


--
-- TOC entry 13692 (class 2606 OID 443648)
-- Name: estrutura_amostragem estrutura_amostragem_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_amostragem
    ADD CONSTRAINT estrutura_amostragem_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


--
-- TOC entry 13701 (class 2606 OID 443653)
-- Name: estrutura_armazenagem_divisao_pendulo estrutura_armazenagem_divisa_estrutura_armazenagem_divisa_fkey1; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_armazenagem_divisao_pendulo
    ADD CONSTRAINT estrutura_armazenagem_divisa_estrutura_armazenagem_divisa_fkey1 FOREIGN KEY (estrutura_armazenagem_divisao_id) REFERENCES unidade_modelo.estrutura_armazenagem_divisao(id);


--
-- TOC entry 13699 (class 2606 OID 443658)
-- Name: estrutura_armazenagem_divisao_aerador estrutura_armazenagem_divisao_aerador_aerador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_armazenagem_divisao_aerador
    ADD CONSTRAINT estrutura_armazenagem_divisao_aerador_aerador_id_fkey FOREIGN KEY (aerador_id) REFERENCES unidade_modelo.aerador(id);


--
-- TOC entry 13700 (class 2606 OID 443663)
-- Name: estrutura_armazenagem_divisao_aerador estrutura_armazenagem_divisao_estrutura_armazenagem_divisa_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_armazenagem_divisao_aerador
    ADD CONSTRAINT estrutura_armazenagem_divisao_estrutura_armazenagem_divisa_fkey FOREIGN KEY (estrutura_armazenagem_divisao_id) REFERENCES unidade_modelo.estrutura_armazenagem_divisao(id);


--
-- TOC entry 13696 (class 2606 OID 443668)
-- Name: estrutura_armazenagem_divisao estrutura_armazenagem_divisao_estrutura_armazenagem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_armazenagem_divisao
    ADD CONSTRAINT estrutura_armazenagem_divisao_estrutura_armazenagem_id_fkey FOREIGN KEY (estrutura_armazenagem_id) REFERENCES unidade_modelo.estrutura_armazenagem(id);


--
-- TOC entry 13702 (class 2606 OID 443673)
-- Name: estrutura_armazenagem_divisao_pendulo estrutura_armazenagem_divisao_pendulo_pendulo_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_armazenagem_divisao_pendulo
    ADD CONSTRAINT estrutura_armazenagem_divisao_pendulo_pendulo_id_fkey FOREIGN KEY (pendulo_id) REFERENCES unidade_modelo.pendulo(id);


--
-- TOC entry 13697 (class 2606 OID 443678)
-- Name: estrutura_armazenagem_divisao estrutura_armazenagem_divisao_produto_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_armazenagem_divisao
    ADD CONSTRAINT estrutura_armazenagem_divisao_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES unidade_modelo.produto(id);


--
-- TOC entry 13698 (class 2606 OID 443683)
-- Name: estrutura_armazenagem_divisao estrutura_armazenagem_divisao_programa_aeracao_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_armazenagem_divisao
    ADD CONSTRAINT estrutura_armazenagem_divisao_programa_aeracao_id_fkey FOREIGN KEY (programa_aeracao_id) REFERENCES unidade_modelo.programa_aeracao(id);


--
-- TOC entry 13695 (class 2606 OID 443688)
-- Name: estrutura_armazenagem estrutura_armazenagem_estacao_meteorologica_ordem_consulta_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_armazenagem
    ADD CONSTRAINT estrutura_armazenagem_estacao_meteorologica_ordem_consulta_fkey FOREIGN KEY (estacao_meteorologica_ordem_consulta_id) REFERENCES unidade_modelo.estacao_meteorologica_ordem_consulta(id);


--
-- TOC entry 13703 (class 2606 OID 443693)
-- Name: estrutura_armazenagem_propriedade estrutura_armazenagem_propriedade_estrutura_armazenagem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_armazenagem_propriedade
    ADD CONSTRAINT estrutura_armazenagem_propriedade_estrutura_armazenagem_id_fkey FOREIGN KEY (estrutura_armazenagem_id) REFERENCES unidade_modelo.estrutura_armazenagem(id);


--
-- TOC entry 13704 (class 2606 OID 443698)
-- Name: estrutura_armazenagem_propriedade estrutura_armazenagem_propriedade_fabricante_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_armazenagem_propriedade
    ADD CONSTRAINT estrutura_armazenagem_propriedade_fabricante_id_fkey FOREIGN KEY (fabricante_id) REFERENCES "ceres-base".fabricante(id);


--
-- TOC entry 13705 (class 2606 OID 443703)
-- Name: estrutura_armazenagem_propriedade estrutura_armazenagem_propriedade_fabricante_vendedor_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_armazenagem_propriedade
    ADD CONSTRAINT estrutura_armazenagem_propriedade_fabricante_vendedor_id_fkey FOREIGN KEY (fabricante_vendedor_id) REFERENCES "ceres-base".fabricante(id);


--
-- TOC entry 13706 (class 2606 OID 443708)
-- Name: estrutura_armazenagem_respiro estrutura_armazenagem_respiro_estrutura_armazenagem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.estrutura_armazenagem_respiro
    ADD CONSTRAINT estrutura_armazenagem_respiro_estrutura_armazenagem_id_fkey FOREIGN KEY (estrutura_armazenagem_id) REFERENCES unidade_modelo.estrutura_armazenagem(id);


--
-- TOC entry 13707 (class 2606 OID 443713)
-- Name: log_comando_aeracao log_comando_aeracao_armazenagem_evento_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.log_comando_aeracao
    ADD CONSTRAINT log_comando_aeracao_armazenagem_evento_id_fkey FOREIGN KEY (armazenagem_evento_id) REFERENCES unidade_modelo.armazenagem_evento(id);


--
-- TOC entry 13708 (class 2606 OID 443718)
-- Name: log_comando_aeracao log_comando_aeracao_categoria_log_aeracao_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.log_comando_aeracao
    ADD CONSTRAINT log_comando_aeracao_categoria_log_aeracao_id_fkey FOREIGN KEY (categoria_log_aeracao_id) REFERENCES "ceres-base".categoria_log_aeracao(id);


--
-- TOC entry 13709 (class 2606 OID 443723)
-- Name: log_comando_aeracao log_comando_aeracao_estrutura_armazenagem_divisao_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.log_comando_aeracao
    ADD CONSTRAINT log_comando_aeracao_estrutura_armazenagem_divisao_id_fkey FOREIGN KEY (estrutura_armazenagem_divisao_id) REFERENCES unidade_modelo.estrutura_armazenagem_divisao(id);


--
-- TOC entry 13710 (class 2606 OID 443728)
-- Name: log_comando_aeracao log_comando_aeracao_estrutura_armazenagem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.log_comando_aeracao
    ADD CONSTRAINT log_comando_aeracao_estrutura_armazenagem_id_fkey FOREIGN KEY (estrutura_armazenagem_id) REFERENCES unidade_modelo.estrutura_armazenagem(id);


--
-- TOC entry 13711 (class 2606 OID 443733)
-- Name: log_comando_aeracao log_comando_aeracao_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.log_comando_aeracao
    ADD CONSTRAINT log_comando_aeracao_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


--
-- TOC entry 13712 (class 2606 OID 443738)
-- Name: log_programa_aeracao log_programa_aeracao_programa_aeracao_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.log_programa_aeracao
    ADD CONSTRAINT log_programa_aeracao_programa_aeracao_id_fkey FOREIGN KEY (programa_aeracao_id) REFERENCES unidade_modelo.programa_aeracao(id);


--
-- TOC entry 13713 (class 2606 OID 443743)
-- Name: log_programa_aeracao log_programa_aeracao_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.log_programa_aeracao
    ADD CONSTRAINT log_programa_aeracao_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


--
-- TOC entry 13714 (class 2606 OID 443748)
-- Name: log_regra_aeracao log_regra_aeracao_regra_aeracao_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.log_regra_aeracao
    ADD CONSTRAINT log_regra_aeracao_regra_aeracao_id_fkey FOREIGN KEY (regra_aeracao_id) REFERENCES unidade_modelo.regra_aeracao(id);


--
-- TOC entry 13715 (class 2606 OID 443753)
-- Name: log_regra_aeracao log_regra_aeracao_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.log_regra_aeracao
    ADD CONSTRAINT log_regra_aeracao_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


--
-- TOC entry 13716 (class 2606 OID 443758)
-- Name: mesorregiao mesorregiao_uf_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.mesorregiao
    ADD CONSTRAINT mesorregiao_uf_id_fkey FOREIGN KEY (uf_id) REFERENCES unidade_modelo.uf(id);


--
-- TOC entry 13718 (class 2606 OID 443763)
-- Name: pendulo_canal pendulo_canal_equipamento_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pendulo_canal
    ADD CONSTRAINT pendulo_canal_equipamento_id_fkey FOREIGN KEY (equipamento_id) REFERENCES unidade_modelo.equipamento(id);


--
-- TOC entry 13719 (class 2606 OID 443768)
-- Name: pendulo_canal pendulo_canal_pendulo_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pendulo_canal
    ADD CONSTRAINT pendulo_canal_pendulo_id_fkey FOREIGN KEY (pendulo_id) REFERENCES unidade_modelo.pendulo(id);


--
-- TOC entry 13717 (class 2606 OID 443773)
-- Name: pendulo pendulo_estrutura_armazenagem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pendulo
    ADD CONSTRAINT pendulo_estrutura_armazenagem_id_fkey FOREIGN KEY (estrutura_armazenagem_id) REFERENCES unidade_modelo.estrutura_armazenagem(id);


--
-- TOC entry 13720 (class 2606 OID 443778)
-- Name: pendulo_leitura pendulo_leitura_pendulo_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pendulo_leitura
    ADD CONSTRAINT pendulo_leitura_pendulo_id_fkey FOREIGN KEY (pendulo_id) REFERENCES unidade_modelo.pendulo(id);


--
-- TOC entry 13721 (class 2606 OID 443783)
-- Name: pendulo_nivel_sensor pendulo_nivel_sensor_estoque_historico_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pendulo_nivel_sensor
    ADD CONSTRAINT pendulo_nivel_sensor_estoque_historico_id_fkey FOREIGN KEY (estoque_historico_id) REFERENCES unidade_modelo.estoque_historico(id);


--
-- TOC entry 13722 (class 2606 OID 443788)
-- Name: pendulo_nivel_sensor pendulo_nivel_sensor_pendulo_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pendulo_nivel_sensor
    ADD CONSTRAINT pendulo_nivel_sensor_pendulo_id_fkey FOREIGN KEY (pendulo_id) REFERENCES unidade_modelo.pendulo(id);


--
-- TOC entry 13723 (class 2606 OID 443793)
-- Name: pendulo_propriedade pendulo_propriedade_pendulo_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pendulo_propriedade
    ADD CONSTRAINT pendulo_propriedade_pendulo_id_fkey FOREIGN KEY (pendulo_id) REFERENCES unidade_modelo.pendulo(id);


--
-- TOC entry 13724 (class 2606 OID 443798)
-- Name: pendulo_troca_historico pendulo_troca_historico_pendulo_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pendulo_troca_historico
    ADD CONSTRAINT pendulo_troca_historico_pendulo_id_fkey FOREIGN KEY (pendulo_id) REFERENCES unidade_modelo.pendulo(id);


--
-- TOC entry 13725 (class 2606 OID 443803)
-- Name: pendulo_troca_historico pendulo_troca_historico_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pendulo_troca_historico
    ADD CONSTRAINT pendulo_troca_historico_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


--
-- TOC entry 13726 (class 2606 OID 443808)
-- Name: pendulo_ultima_leitura pendulo_ultima_leitura_pendulo_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pendulo_ultima_leitura
    ADD CONSTRAINT pendulo_ultima_leitura_pendulo_id_fkey FOREIGN KEY (pendulo_id) REFERENCES unidade_modelo.pendulo(id);


--
-- TOC entry 13727 (class 2606 OID 443813)
-- Name: perfil_funcionalidade perfil_funcionalidade_funcionalidade_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.perfil_funcionalidade
    ADD CONSTRAINT perfil_funcionalidade_funcionalidade_id_fkey FOREIGN KEY (funcionalidade_id) REFERENCES unidade_modelo.funcionalidade(id);


--
-- TOC entry 13728 (class 2606 OID 443818)
-- Name: perfil_funcionalidade perfil_funcionalidade_perfil_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.perfil_funcionalidade
    ADD CONSTRAINT perfil_funcionalidade_perfil_id_fkey FOREIGN KEY (perfil_id) REFERENCES unidade_modelo.perfil(id);


--
-- TOC entry 13729 (class 2606 OID 443823)
-- Name: pilha_comando_aeracao pilha_comando_aeracao_armazenagem_evento_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pilha_comando_aeracao
    ADD CONSTRAINT pilha_comando_aeracao_armazenagem_evento_id_fkey FOREIGN KEY (armazenagem_evento_id) REFERENCES unidade_modelo.armazenagem_evento(id);


--
-- TOC entry 13730 (class 2606 OID 443828)
-- Name: pilha_comando_aeracao pilha_comando_aeracao_estrutura_armazenagem_divisao_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pilha_comando_aeracao
    ADD CONSTRAINT pilha_comando_aeracao_estrutura_armazenagem_divisao_id_fkey FOREIGN KEY (estrutura_armazenagem_divisao_id) REFERENCES unidade_modelo.estrutura_armazenagem_divisao(id);


--
-- TOC entry 13731 (class 2606 OID 443833)
-- Name: pilha_comando_aeracao pilha_comando_aeracao_estrutura_armazenagem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pilha_comando_aeracao
    ADD CONSTRAINT pilha_comando_aeracao_estrutura_armazenagem_id_fkey FOREIGN KEY (estrutura_armazenagem_id) REFERENCES unidade_modelo.estrutura_armazenagem(id);


--
-- TOC entry 13732 (class 2606 OID 443838)
-- Name: pilha_comando_aeracao pilha_comando_aeracao_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.pilha_comando_aeracao
    ADD CONSTRAINT pilha_comando_aeracao_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


--
-- TOC entry 13734 (class 2606 OID 443843)
-- Name: planta_unidade_estrutura planta_unidade_estrutura_estrutura_armazenagem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.planta_unidade_estrutura
    ADD CONSTRAINT planta_unidade_estrutura_estrutura_armazenagem_id_fkey FOREIGN KEY (estrutura_armazenagem_id) REFERENCES unidade_modelo.estrutura_armazenagem(id);


--
-- TOC entry 13735 (class 2606 OID 443848)
-- Name: planta_unidade_estrutura planta_unidade_estrutura_planta_unidade_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.planta_unidade_estrutura
    ADD CONSTRAINT planta_unidade_estrutura_planta_unidade_id_fkey FOREIGN KEY (planta_unidade_id) REFERENCES unidade_modelo.planta_unidade(id);


--
-- TOC entry 13733 (class 2606 OID 443853)
-- Name: planta_unidade planta_unidade_unidade_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.planta_unidade
    ADD CONSTRAINT planta_unidade_unidade_id_fkey FOREIGN KEY (unidade_id) REFERENCES unidade_modelo.unidade(id);


--
-- TOC entry 13736 (class 2606 OID 443858)
-- Name: produto produto_produto_tipo_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.produto
    ADD CONSTRAINT produto_produto_tipo_id_fkey FOREIGN KEY (produto_tipo_id) REFERENCES "ceres-base".produto_tipo(id);


--
-- TOC entry 13737 (class 2606 OID 443863)
-- Name: programa_aeracao_historico programa_aeracao_historico_estrutura_armazenagem_divisao_i_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.programa_aeracao_historico
    ADD CONSTRAINT programa_aeracao_historico_estrutura_armazenagem_divisao_i_fkey FOREIGN KEY (estrutura_armazenagem_divisao_id) REFERENCES unidade_modelo.estrutura_armazenagem_divisao(id);


--
-- TOC entry 13738 (class 2606 OID 443868)
-- Name: programa_aeracao_historico programa_aeracao_historico_log_programa_aeracao_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.programa_aeracao_historico
    ADD CONSTRAINT programa_aeracao_historico_log_programa_aeracao_id_fkey FOREIGN KEY (log_programa_aeracao_id) REFERENCES unidade_modelo.log_programa_aeracao(id);


--
-- TOC entry 13739 (class 2606 OID 443873)
-- Name: programa_aeracao_historico programa_aeracao_historico_programa_aeracao_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.programa_aeracao_historico
    ADD CONSTRAINT programa_aeracao_historico_programa_aeracao_id_fkey FOREIGN KEY (programa_aeracao_id) REFERENCES unidade_modelo.programa_aeracao(id);


--
-- TOC entry 13740 (class 2606 OID 443878)
-- Name: programa_aeracao_historico programa_aeracao_historico_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.programa_aeracao_historico
    ADD CONSTRAINT programa_aeracao_historico_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


--
-- TOC entry 13741 (class 2606 OID 443883)
-- Name: refresh_token refresh_token_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.refresh_token
    ADD CONSTRAINT refresh_token_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


--
-- TOC entry 13742 (class 2606 OID 443888)
-- Name: regiao regiao_pais_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.regiao
    ADD CONSTRAINT regiao_pais_id_fkey FOREIGN KEY (pais_id) REFERENCES unidade_modelo.pais(id);


--
-- TOC entry 13747 (class 2606 OID 443893)
-- Name: secador_alerta_configuracao secador_alerta_configuracao_secador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_alerta_configuracao
    ADD CONSTRAINT secador_alerta_configuracao_secador_id_fkey FOREIGN KEY (secador_id) REFERENCES unidade_modelo.secador(id);


--
-- TOC entry 13748 (class 2606 OID 443898)
-- Name: secador_alerta_destinatario secador_alerta_destinatario_secador_alerta_configuracao_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_alerta_destinatario
    ADD CONSTRAINT secador_alerta_destinatario_secador_alerta_configuracao_id_fkey FOREIGN KEY (secador_alerta_configuracao_id) REFERENCES unidade_modelo.secador_alerta_configuracao(id);


--
-- TOC entry 13749 (class 2606 OID 443903)
-- Name: secador_alerta_destinatario secador_alerta_destinatario_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_alerta_destinatario
    ADD CONSTRAINT secador_alerta_destinatario_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


--
-- TOC entry 13752 (class 2606 OID 443908)
-- Name: secador_alerta_registro_aplicativo secador_alerta_registro_aplic_secador_alerta_destinatario__fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_alerta_registro_aplicativo
    ADD CONSTRAINT secador_alerta_registro_aplic_secador_alerta_destinatario__fkey FOREIGN KEY (secador_alerta_destinatario_id) REFERENCES unidade_modelo.secador_alerta_destinatario(id);


--
-- TOC entry 13754 (class 2606 OID 443913)
-- Name: secador_alerta_registro_aplicativo_status secador_alerta_registro_aplic_secador_alerta_registro_apli_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_alerta_registro_aplicativo_status
    ADD CONSTRAINT secador_alerta_registro_aplic_secador_alerta_registro_apli_fkey FOREIGN KEY (secador_alerta_registro_aplicativo) REFERENCES unidade_modelo.secador_alerta_registro_aplicativo(id);


--
-- TOC entry 13753 (class 2606 OID 443918)
-- Name: secador_alerta_registro_aplicativo secador_alerta_registro_aplicat_secador_alerta_registro_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_alerta_registro_aplicativo
    ADD CONSTRAINT secador_alerta_registro_aplicat_secador_alerta_registro_id_fkey FOREIGN KEY (secador_alerta_registro_id) REFERENCES unidade_modelo.secador_alerta_registro(id);


--
-- TOC entry 13750 (class 2606 OID 443923)
-- Name: secador_alerta_registro secador_alerta_registro_produto_tipo_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_alerta_registro
    ADD CONSTRAINT secador_alerta_registro_produto_tipo_id_fkey FOREIGN KEY (produto_tipo_id) REFERENCES "ceres-base".produto_tipo(id);


--
-- TOC entry 13751 (class 2606 OID 443928)
-- Name: secador_alerta_registro secador_alerta_registro_secador_alerta_configuracao_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_alerta_registro
    ADD CONSTRAINT secador_alerta_registro_secador_alerta_configuracao_id_fkey FOREIGN KEY (secador_alerta_configuracao_id) REFERENCES unidade_modelo.secador_alerta_configuracao(id);


--
-- TOC entry 13755 (class 2606 OID 443933)
-- Name: secador_alerta_registro_sistema secador_alerta_registro_siste_secador_alerta_destinatario__fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_alerta_registro_sistema
    ADD CONSTRAINT secador_alerta_registro_siste_secador_alerta_destinatario__fkey FOREIGN KEY (secador_alerta_destinatario_id) REFERENCES unidade_modelo.secador_alerta_destinatario(id);


--
-- TOC entry 13756 (class 2606 OID 443938)
-- Name: secador_alerta_registro_sistema secador_alerta_registro_sistema_secador_alerta_registro_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_alerta_registro_sistema
    ADD CONSTRAINT secador_alerta_registro_sistema_secador_alerta_registro_id_fkey FOREIGN KEY (secador_alerta_registro_id) REFERENCES unidade_modelo.secador_alerta_registro(id);


--
-- TOC entry 13757 (class 2606 OID 443943)
-- Name: secador_comando_dryer secador_comando_dryer_secador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_comando_dryer
    ADD CONSTRAINT secador_comando_dryer_secador_id_fkey FOREIGN KEY (secador_id) REFERENCES unidade_modelo.secador(id);


--
-- TOC entry 13758 (class 2606 OID 443948)
-- Name: secador_comando_dryer secador_comando_dryer_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_comando_dryer
    ADD CONSTRAINT secador_comando_dryer_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


--
-- TOC entry 13759 (class 2606 OID 443953)
-- Name: secador_comando_hd secador_comando_hd_secador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_comando_hd
    ADD CONSTRAINT secador_comando_hd_secador_id_fkey FOREIGN KEY (secador_id) REFERENCES unidade_modelo.secador(id);


--
-- TOC entry 13760 (class 2606 OID 443958)
-- Name: secador_comando_hd secador_comando_hd_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_comando_hd
    ADD CONSTRAINT secador_comando_hd_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


--
-- TOC entry 13761 (class 2606 OID 443963)
-- Name: secador_comando_wms secador_comando_wms_secador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_comando_wms
    ADD CONSTRAINT secador_comando_wms_secador_id_fkey FOREIGN KEY (secador_id) REFERENCES unidade_modelo.secador(id);


--
-- TOC entry 13762 (class 2606 OID 443968)
-- Name: secador_comando_wms secador_comando_wms_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_comando_wms
    ADD CONSTRAINT secador_comando_wms_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


--
-- TOC entry 13743 (class 2606 OID 443973)
-- Name: secador secador_display_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador
    ADD CONSTRAINT secador_display_id_fkey FOREIGN KEY (display_id) REFERENCES unidade_modelo.equipamento(id);


--
-- TOC entry 13744 (class 2606 OID 443978)
-- Name: secador secador_equipamento_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador
    ADD CONSTRAINT secador_equipamento_id_fkey FOREIGN KEY (equipamento_id) REFERENCES unidade_modelo.equipamento(id);


--
-- TOC entry 13745 (class 2606 OID 443983)
-- Name: secador secador_fabricante_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador
    ADD CONSTRAINT secador_fabricante_id_fkey FOREIGN KEY (fabricante_id) REFERENCES "ceres-base".fabricante(id);


--
-- TOC entry 13763 (class 2606 OID 443988)
-- Name: secador_leitura_dryer secador_leitura_dryer_secador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_leitura_dryer
    ADD CONSTRAINT secador_leitura_dryer_secador_id_fkey FOREIGN KEY (secador_id) REFERENCES unidade_modelo.secador(id);


--
-- TOC entry 13764 (class 2606 OID 443993)
-- Name: secador_leitura_hd secador_leitura_hd_secador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_leitura_hd
    ADD CONSTRAINT secador_leitura_hd_secador_id_fkey FOREIGN KEY (secador_id) REFERENCES unidade_modelo.secador(id);


--
-- TOC entry 13765 (class 2606 OID 443998)
-- Name: secador_leitura_wms secador_leitura_wms_secador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_leitura_wms
    ADD CONSTRAINT secador_leitura_wms_secador_id_fkey FOREIGN KEY (secador_id) REFERENCES unidade_modelo.secador(id);


--
-- TOC entry 13766 (class 2606 OID 444003)
-- Name: secador_limpeza_historico secador_limpeza_historico_secador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_limpeza_historico
    ADD CONSTRAINT secador_limpeza_historico_secador_id_fkey FOREIGN KEY (secador_id) REFERENCES unidade_modelo.secador(id);


--
-- TOC entry 13767 (class 2606 OID 444008)
-- Name: secador_limpeza_historico secador_limpeza_historico_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_limpeza_historico
    ADD CONSTRAINT secador_limpeza_historico_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


--
-- TOC entry 13768 (class 2606 OID 444013)
-- Name: secador_parametro_dryer secador_parametro_dryer_secador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_parametro_dryer
    ADD CONSTRAINT secador_parametro_dryer_secador_id_fkey FOREIGN KEY (secador_id) REFERENCES unidade_modelo.secador(id);


--
-- TOC entry 13769 (class 2606 OID 444018)
-- Name: secador_parametro_hd secador_parametro_hd_secador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_parametro_hd
    ADD CONSTRAINT secador_parametro_hd_secador_id_fkey FOREIGN KEY (secador_id) REFERENCES unidade_modelo.secador(id);


--
-- TOC entry 13770 (class 2606 OID 444023)
-- Name: secador_processo secador_processo_secador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_processo
    ADD CONSTRAINT secador_processo_secador_id_fkey FOREIGN KEY (secador_id) REFERENCES unidade_modelo.secador(id);


--
-- TOC entry 13771 (class 2606 OID 444028)
-- Name: secador_produto_historico secador_produto_historico_produto_tipo_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_produto_historico
    ADD CONSTRAINT secador_produto_historico_produto_tipo_id_fkey FOREIGN KEY (produto_tipo_id) REFERENCES "ceres-base".produto_tipo(id);


--
-- TOC entry 13772 (class 2606 OID 444033)
-- Name: secador_produto_historico secador_produto_historico_secador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_produto_historico
    ADD CONSTRAINT secador_produto_historico_secador_id_fkey FOREIGN KEY (secador_id) REFERENCES unidade_modelo.secador(id);


--
-- TOC entry 13773 (class 2606 OID 444038)
-- Name: secador_produto_historico secador_produto_historico_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_produto_historico
    ADD CONSTRAINT secador_produto_historico_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


--
-- TOC entry 13746 (class 2606 OID 444043)
-- Name: secador secador_produto_tipo_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador
    ADD CONSTRAINT secador_produto_tipo_id_fkey FOREIGN KEY (produto_tipo_id) REFERENCES "ceres-base".produto_tipo(id);


--
-- TOC entry 13774 (class 2606 OID 444048)
-- Name: secador_sensor_dryer secador_sensor_dryer_secador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_sensor_dryer
    ADD CONSTRAINT secador_sensor_dryer_secador_id_fkey FOREIGN KEY (secador_id) REFERENCES unidade_modelo.secador(id);


--
-- TOC entry 13775 (class 2606 OID 444053)
-- Name: secador_sensor_hd secador_sensor_hd_secador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_sensor_hd
    ADD CONSTRAINT secador_sensor_hd_secador_id_fkey FOREIGN KEY (secador_id) REFERENCES unidade_modelo.secador(id);


--
-- TOC entry 13776 (class 2606 OID 444058)
-- Name: secador_sensor_wms secador_sensor_wms_secador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_sensor_wms
    ADD CONSTRAINT secador_sensor_wms_secador_id_fkey FOREIGN KEY (secador_id) REFERENCES unidade_modelo.secador(id);


--
-- TOC entry 13777 (class 2606 OID 444063)
-- Name: secador_ultima_leitura_dryer secador_ultima_leitura_dryer_secador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_ultima_leitura_dryer
    ADD CONSTRAINT secador_ultima_leitura_dryer_secador_id_fkey FOREIGN KEY (secador_id) REFERENCES unidade_modelo.secador(id);


--
-- TOC entry 13778 (class 2606 OID 444068)
-- Name: secador_ultima_leitura_hd secador_ultima_leitura_hd_secador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_ultima_leitura_hd
    ADD CONSTRAINT secador_ultima_leitura_hd_secador_id_fkey FOREIGN KEY (secador_id) REFERENCES unidade_modelo.secador(id);


--
-- TOC entry 13779 (class 2606 OID 444073)
-- Name: secador_ultima_leitura_wms secador_ultima_leitura_wms_secador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_ultima_leitura_wms
    ADD CONSTRAINT secador_ultima_leitura_wms_secador_id_fkey FOREIGN KEY (secador_id) REFERENCES unidade_modelo.secador(id);


--
-- TOC entry 13781 (class 2606 OID 444078)
-- Name: secador_visao_area secador_visao_area_secador_visao_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_visao_area
    ADD CONSTRAINT secador_visao_area_secador_visao_id_fkey FOREIGN KEY (secador_visao_id) REFERENCES unidade_modelo.secador_visao(id);


--
-- TOC entry 13780 (class 2606 OID 444083)
-- Name: secador_visao secador_visao_secador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_visao
    ADD CONSTRAINT secador_visao_secador_id_fkey FOREIGN KEY (secador_id) REFERENCES unidade_modelo.secador(id);


--
-- TOC entry 13782 (class 2606 OID 444088)
-- Name: secador_visao_sensor_dryer secador_visao_sensor_dryer_secador_visao_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_visao_sensor_dryer
    ADD CONSTRAINT secador_visao_sensor_dryer_secador_visao_id_fkey FOREIGN KEY (secador_visao_id) REFERENCES unidade_modelo.secador_visao(id);


--
-- TOC entry 13783 (class 2606 OID 444093)
-- Name: secador_visao_sensor_dryer secador_visao_sensor_dryer_sensor_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_visao_sensor_dryer
    ADD CONSTRAINT secador_visao_sensor_dryer_sensor_id_fkey FOREIGN KEY (sensor_id) REFERENCES unidade_modelo.secador_sensor_dryer(id);


--
-- TOC entry 13784 (class 2606 OID 444098)
-- Name: secador_visao_sensor_hd secador_visao_sensor_hd_secador_visao_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_visao_sensor_hd
    ADD CONSTRAINT secador_visao_sensor_hd_secador_visao_id_fkey FOREIGN KEY (secador_visao_id) REFERENCES unidade_modelo.secador_visao(id);


--
-- TOC entry 13785 (class 2606 OID 444103)
-- Name: secador_visao_sensor_hd secador_visao_sensor_hd_sensor_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_visao_sensor_hd
    ADD CONSTRAINT secador_visao_sensor_hd_sensor_id_fkey FOREIGN KEY (sensor_id) REFERENCES unidade_modelo.secador_sensor_hd(id);


--
-- TOC entry 13786 (class 2606 OID 444108)
-- Name: secador_visao_sensor_wms secador_visao_sensor_wms_secador_visao_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_visao_sensor_wms
    ADD CONSTRAINT secador_visao_sensor_wms_secador_visao_id_fkey FOREIGN KEY (secador_visao_id) REFERENCES unidade_modelo.secador_visao(id);


--
-- TOC entry 13787 (class 2606 OID 444113)
-- Name: secador_visao_sensor_wms secador_visao_sensor_wms_sensor_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secador_visao_sensor_wms
    ADD CONSTRAINT secador_visao_sensor_wms_sensor_id_fkey FOREIGN KEY (sensor_id) REFERENCES unidade_modelo.secador_sensor_wms(id);


--
-- TOC entry 13788 (class 2606 OID 444118)
-- Name: secagem_evento secagem_evento_secador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secagem_evento
    ADD CONSTRAINT secagem_evento_secador_id_fkey FOREIGN KEY (secador_id) REFERENCES unidade_modelo.secador(id);


--
-- TOC entry 13789 (class 2606 OID 444123)
-- Name: secagem_ultimo_evento secagem_ultimo_evento_secador_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.secagem_ultimo_evento
    ADD CONSTRAINT secagem_ultimo_evento_secador_id_fkey FOREIGN KEY (secador_id) REFERENCES unidade_modelo.secador(id);


--
-- TOC entry 13790 (class 2606 OID 444128)
-- Name: sensor_co2 sensor_co2_equipamento_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.sensor_co2
    ADD CONSTRAINT sensor_co2_equipamento_id_fkey FOREIGN KEY (equipamento_id) REFERENCES unidade_modelo.equipamento(id);


--
-- TOC entry 13791 (class 2606 OID 444133)
-- Name: sensor_co2 sensor_co2_estrutura_armazenagem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.sensor_co2
    ADD CONSTRAINT sensor_co2_estrutura_armazenagem_id_fkey FOREIGN KEY (estrutura_armazenagem_id) REFERENCES unidade_modelo.estrutura_armazenagem(id);


--
-- TOC entry 13792 (class 2606 OID 444138)
-- Name: sensor_co2_leitura sensor_co2_leitura_sensor_co2_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.sensor_co2_leitura
    ADD CONSTRAINT sensor_co2_leitura_sensor_co2_id_fkey FOREIGN KEY (sensor_co2_id) REFERENCES unidade_modelo.sensor_co2(id);


--
-- TOC entry 13793 (class 2606 OID 444143)
-- Name: sensor_co2_ultima_leitura sensor_co2_ultima_leitura_sensor_co2_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.sensor_co2_ultima_leitura
    ADD CONSTRAINT sensor_co2_ultima_leitura_sensor_co2_id_fkey FOREIGN KEY (sensor_co2_id) REFERENCES unidade_modelo.sensor_co2(id);


--
-- TOC entry 13794 (class 2606 OID 444148)
-- Name: sensor_plenum sensor_plenum_equipamento_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.sensor_plenum
    ADD CONSTRAINT sensor_plenum_equipamento_id_fkey FOREIGN KEY (equipamento_id) REFERENCES unidade_modelo.equipamento(id);


--
-- TOC entry 13795 (class 2606 OID 444153)
-- Name: sensor_plenum sensor_plenum_estrutura_armazenagem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.sensor_plenum
    ADD CONSTRAINT sensor_plenum_estrutura_armazenagem_id_fkey FOREIGN KEY (estrutura_armazenagem_id) REFERENCES unidade_modelo.estrutura_armazenagem(id);


--
-- TOC entry 13796 (class 2606 OID 444158)
-- Name: sensor_plenum_leitura sensor_plenum_leitura_sensor_plenum_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.sensor_plenum_leitura
    ADD CONSTRAINT sensor_plenum_leitura_sensor_plenum_id_fkey FOREIGN KEY (sensor_plenum_id) REFERENCES unidade_modelo.sensor_plenum(id);


--
-- TOC entry 13797 (class 2606 OID 444163)
-- Name: sensor_plenum_ultima_leitura sensor_plenum_ultima_leitura_sensor_plenum_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.sensor_plenum_ultima_leitura
    ADD CONSTRAINT sensor_plenum_ultima_leitura_sensor_plenum_id_fkey FOREIGN KEY (sensor_plenum_id) REFERENCES unidade_modelo.sensor_plenum(id);


--
-- TOC entry 13798 (class 2606 OID 444168)
-- Name: sensor_volume sensor_volume_equipamento_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.sensor_volume
    ADD CONSTRAINT sensor_volume_equipamento_id_fkey FOREIGN KEY (equipamento_id) REFERENCES unidade_modelo.equipamento(id);


--
-- TOC entry 13799 (class 2606 OID 444173)
-- Name: sensor_volume sensor_volume_estrutura_armazenagem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.sensor_volume
    ADD CONSTRAINT sensor_volume_estrutura_armazenagem_id_fkey FOREIGN KEY (estrutura_armazenagem_id) REFERENCES unidade_modelo.estrutura_armazenagem(id);


--
-- TOC entry 13800 (class 2606 OID 444178)
-- Name: sensor_volume_leitura sensor_volume_leitura_sensor_volume_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.sensor_volume_leitura
    ADD CONSTRAINT sensor_volume_leitura_sensor_volume_id_fkey FOREIGN KEY (sensor_volume_id) REFERENCES unidade_modelo.sensor_volume(id);


--
-- TOC entry 13801 (class 2606 OID 444183)
-- Name: sensor_volume_ultima_leitura sensor_volume_ultima_leitura_sensor_volume_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.sensor_volume_ultima_leitura
    ADD CONSTRAINT sensor_volume_ultima_leitura_sensor_volume_id_fkey FOREIGN KEY (sensor_volume_id) REFERENCES unidade_modelo.sensor_volume(id);


--
-- TOC entry 13803 (class 2606 OID 444188)
-- Name: silo_anel silo_anel_silo_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.silo_anel
    ADD CONSTRAINT silo_anel_silo_id_fkey FOREIGN KEY (silo_id) REFERENCES unidade_modelo.silo(id);


--
-- TOC entry 13802 (class 2606 OID 444193)
-- Name: silo silo_estrutura_armazenagem_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.silo
    ADD CONSTRAINT silo_estrutura_armazenagem_id_fkey FOREIGN KEY (estrutura_armazenagem_id) REFERENCES unidade_modelo.estrutura_armazenagem(id);


--
-- TOC entry 13804 (class 2606 OID 444198)
-- Name: silo_pendulo_visualizacao silo_pendulo_visualizacao_anel_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.silo_pendulo_visualizacao
    ADD CONSTRAINT silo_pendulo_visualizacao_anel_id_fkey FOREIGN KEY (anel_id) REFERENCES unidade_modelo.silo_anel(id);


--
-- TOC entry 13805 (class 2606 OID 444203)
-- Name: silo_pendulo_visualizacao silo_pendulo_visualizacao_pendulo_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.silo_pendulo_visualizacao
    ADD CONSTRAINT silo_pendulo_visualizacao_pendulo_id_fkey FOREIGN KEY (pendulo_id) REFERENCES unidade_modelo.pendulo(id);


--
-- TOC entry 13806 (class 2606 OID 444208)
-- Name: uf uf_pais_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.uf
    ADD CONSTRAINT uf_pais_id_fkey FOREIGN KEY (pais_id) REFERENCES unidade_modelo.pais(id);


--
-- TOC entry 13807 (class 2606 OID 444213)
-- Name: uf uf_regiao_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.uf
    ADD CONSTRAINT uf_regiao_id_fkey FOREIGN KEY (regiao_id) REFERENCES unidade_modelo.regiao(id);


--
-- TOC entry 13808 (class 2606 OID 444218)
-- Name: unidade unidade_cidade_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.unidade
    ADD CONSTRAINT unidade_cidade_id_fkey FOREIGN KEY (cidade_id) REFERENCES unidade_modelo.cidade(id);


--
-- TOC entry 13809 (class 2606 OID 444223)
-- Name: unidade unidade_cliente_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.unidade
    ADD CONSTRAINT unidade_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES unidade_modelo.cliente(id);


--
-- TOC entry 13810 (class 2606 OID 444228)
-- Name: unidade_parametrizacao unidade_parametrizacao_unidade_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.unidade_parametrizacao
    ADD CONSTRAINT unidade_parametrizacao_unidade_id_fkey FOREIGN KEY (unidade_id) REFERENCES unidade_modelo.unidade(id);


--
-- TOC entry 13811 (class 2606 OID 444233)
-- Name: unidade_produto_interno unidade_produto_interno_unidade_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.unidade_produto_interno
    ADD CONSTRAINT unidade_produto_interno_unidade_id_fkey FOREIGN KEY (unidade_id) REFERENCES unidade_modelo.unidade(id);


--
-- TOC entry 13812 (class 2606 OID 444238)
-- Name: usuario_perfil usuario_perfil_perfil_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.usuario_perfil
    ADD CONSTRAINT usuario_perfil_perfil_id_fkey FOREIGN KEY (perfil_id) REFERENCES unidade_modelo.perfil(id);


--
-- TOC entry 13813 (class 2606 OID 444243)
-- Name: usuario_perfil usuario_perfil_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.usuario_perfil
    ADD CONSTRAINT usuario_perfil_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


--
-- TOC entry 13814 (class 2606 OID 444248)
-- Name: usuario_unidade usuario_unidade_unidade_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.usuario_unidade
    ADD CONSTRAINT usuario_unidade_unidade_id_fkey FOREIGN KEY (unidade_id) REFERENCES unidade_modelo.unidade(id);


--
-- TOC entry 13815 (class 2606 OID 444253)
-- Name: usuario_unidade usuario_unidade_usuario_id_fkey; Type: FK CONSTRAINT; Schema: unidade_modelo; Owner: ceres
--

ALTER TABLE ONLY unidade_modelo.usuario_unidade
    ADD CONSTRAINT usuario_unidade_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES unidade_modelo.usuario(id);


-- Completed on 2024-05-31 16:15:59

--
-- PostgreSQL database dump complete
--

