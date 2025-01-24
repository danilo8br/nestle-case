IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseParquetFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseParquetFormat] 
	WITH ( FORMAT_TYPE = PARQUET)
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'processed_storagenestlecase_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [processed_storagenestlecase_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://processed@storagenestlecase.dfs.core.windows.net' 
	)
GO

CREATE EXTERNAL TABLE datalab.cargos (
	[cargo] nvarchar(4000),
	[nivel] nvarchar(4000),
	[area] nvarchar(4000),
	[cod_area] nvarchar(4000),
	[cod_nivel] nvarchar(4000),
	[quadro] nvarchar(4000),
	[bonus] nvarchar(4000),
	[contratacao] nvarchar(4000)
	)
	WITH (
	LOCATION = 'processed/BaseCargos.parquet',
	DATA_SOURCE = [processed_storagenestlecase_dfs_core_windows_net],
	FILE_FORMAT = [SynapseParquetFormat]
	)
GO

CREATE EXTERNAL TABLE datalab.cep (
	[cep] nvarchar(4000),
	[estado] nvarchar(4000),
	[regiao] nvarchar(4000)
	)
	WITH (
	LOCATION = 'processed/BaseCep.parquet',
	DATA_SOURCE = [processed_storagenestlecase_dfs_core_windows_net],
	FILE_FORMAT = [SynapseParquetFormat]
	)
GO

CREATE EXTERNAL TABLE datalab.clientes (
	[valor_contrato_anual] int,
	[quantidade_servicos] int,
	[cargo_responsavel] nvarchar(4000),
	[cep] nvarchar(4000),
	[data_inicio_contrato] nvarchar(4000),
	[nivel_importancia] int
	)
	WITH (
	LOCATION = 'processed/BaseClientes.parquet',
	DATA_SOURCE = [processed_storagenestlecase_dfs_core_windows_net],
	FILE_FORMAT = [SynapseParquetFormat]
	)
GO

CREATE EXTERNAL TABLE datalab.funcionarios (
	[rg] nvarchar(4000),
	[cpf] nvarchar(4000),
	[ramal] int,
	[estado_civil] nvarchar(4000),
	[nome_completo] nvarchar(4000),
	[login] nvarchar(4000),
	[data_nascimento] nvarchar(4000),
	[cep] nvarchar(4000),
	[data_contratacao] nvarchar(4000),
	[data_demissao] nvarchar(4000),
	[dias_uteis_ano_orcamentario] int,
	[salario_base] float,
	[impostos] float,
	[beneficios] float,
	[vt] float,
	[vr] float,
	[cargo] nvarchar(4000),
	[codigos] nvarchar(4000),
	[quantidade_acessos] int,
	[ferias_acumuladas] int,
	[ferias_remuneradas] nvarchar(4000),
	[horas_extras] int,
	[valores_adicionais] int,
	[id_pessoal] nvarchar(4000),
	[id_area] int
	)
	WITH (
	LOCATION = 'processed/BaseFuncionarios.parquet',
	DATA_SOURCE = [processed_storagenestlecase_dfs_core_windows_net],
	FILE_FORMAT = [SynapseParquetFormat]
	)
GO

CREATE EXTERNAL TABLE datalab.nivel (
	[nivel] nvarchar(4000),
	[descricao_nivel] nvarchar(4000),
	[tempo_nivel] int,
	[plano_saude] nvarchar(4000),
	[plano_odontologico] nvarchar(4000),
	[setor_responsavel] nvarchar(4000),
	[plano_carreira] nvarchar(4000)
	)
	WITH (
	LOCATION = 'processed/BaseNivel.parquet',
	DATA_SOURCE = [processed_storagenestlecase_dfs_core_windows_net],
	FILE_FORMAT = [SynapseParquetFormat]
	)
GO

CREATE EXTERNAL TABLE datalab.pq (
	[id_rh] int,
	[rg] nvarchar(4000),
	[cpf] nvarchar(4000),
	[ramal] int,
	[estado_civil] nvarchar(4000),
	[nome_completo] nvarchar(4000),
	[login] nvarchar(4000),
	[data_de_nascimento] nvarchar(4000),
	[cep] nvarchar(4000),
	[data_de_contratacao] nvarchar(4000),
	[data_de_demissao] nvarchar(4000),
	[dias_uteis_trabalhados_ano_orcamentario] int,
	[salario_base] int,
	[impostos] float,
	[beneficios] float,
	[vt] int,
	[vr] float,
	[cargo] nvarchar(4000),
	[codigos] nvarchar(4000),
	[quantidade_de_acessos] int,
	[ferias_acumuladas] int,
	[ferias_remuneradas] int,
	[horas_extras] int,
	[valores_adicionais] int,
	[id_da_area] int,
	[operacoes] nvarchar(4000),
	[cargo_nivel] int,
	[descricao_nivel] nvarchar(4000),
	[tempo_no_nivel] nvarchar(4000),
	[plano_de_saude] int,
	[plano_odontologico] nvarchar(4000),
	[setor_responsavel] nvarchar(4000),
	[plano_de_carreira] int
	)
	WITH (
	LOCATION = 'processed/BasePQ.parquet',
	DATA_SOURCE = [processed_storagenestlecase_dfs_core_windows_net],
	FILE_FORMAT = [SynapseParquetFormat]
	)
GO
