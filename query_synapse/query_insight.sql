-- Distribuição de Cargos por Nível
SELECT 
    nivel,
    COUNT(*) AS quantidade_cargos
FROM 
    datalab.cargos
GROUP BY 
    nivel
ORDER BY 
    quantidade_cargos DESC;

-- Relação de Contratações por Área
SELECT 
    area,
    COUNT(*) AS total_contratacoes
FROM 
    datalab.cargos
GROUP BY 
    area
ORDER BY 
    total_contratacoes DESC;

-- Tipos de Contratação por Área
SELECT 
    Estado, 
    COUNT(*) AS Quantidade_CEPs
FROM datalab.cep
GROUP BY Estado
ORDER BY Quantidade_CEPs DESC;

-- Distribuição de CEPs por Estado (BaseCEP)
SELECT 
    uf AS [Estado], 
    COUNT(*) AS [Quantidade de CEPs]
FROM datalab.cep
GROUP BY uf
ORDER BY COUNT(*) DESC;

-- Distribuição de CEPs por Estado (BaseCEP)
SELECT 
    Cargo, 
    COUNT(*) AS Quantidade_Funcionarios
FROM datalab.funcionarios
GROUP BY Cargo
ORDER BY Quantidade_Funcionarios DESC;
