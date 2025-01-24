# Case Nestle

Este projeto tem como objetivo construir um pipeline de dados, envolvendo a ingestão, processamento e armazenamento de dados em um Data Lake utilizando a arquitetura do Azure.

## Arquitetura do Pipeline
![alt text](image.png)

## Tecnologias
**Ingestão:** Python  
**Processamento:** PySpark (Databricks)  
**Armazenamento:** Azure Data Lake Storage Gen 2  
**Formato de Dados:** CSV, Parquet  
**Cloud:** Azure (Data Lake Storage Gen 2, Databricks, Synapse Analytics, Bit Bucket, Key Vault, Activet AD)
**Visualização de Dados:** Power BI
**Ferramentas:** Git, GitHub, Figma

## Cenário
**Dados**  
Os dados para este projeto são extraídos de seis arquivos CSV contendo informações sobre funcionários de uma empresa fictícia. 

**Visão Geral do Pipeline de Dados**  
O pipeline inicia com a ingestão dos dados para o **Azure Data Lake Storage (ADLS) Gen 2** utilizando Python. Dentro do **Databricks**, os arquivos CSV são consumidos, transformados para o formato **Parquet** e armazenados na camada **Bronze**. Após essa etapa, os dados passam por validações e transformações e são movidos para a camada **Silver**. Quando limpos e ajustados, os dados são enviados para a camada **Gold**, onde são transformados em insights e otimizados para fácil acesso. Com os dados processados, eles são consumidos pelo **Azure Synapse Analytics** para análises em larga escala. Por fim, são criados **dashboards interativos no Power BI** para visualização dos resultados e tomada de decisões. Além disso, a infraestrutura necessária para a execução do pipeline é provisionada e gerenciada utilizando **Terraform**, garantindo a criação e configuração automatizada de recursos no Azure.

Os passos do projeto são:

1. **Ingestão de Dados:**  
    A primeira etapa do pipeline é a ingestão dos dados para o **Azure Data Lake Storage (ADLS) Gen 2** utilizando **Python**. Os arquivos CSV são enviados para o Data Lake para processamento posterior.
    
2. **Transformação de Dados (Databricks com PySpark):**  
    Após a ingestão, os dados são consumidos dentro do **Databricks** com o uso de **PySpark**, transformando os arquivos CSV para o formato **Parquet**.
    
3. **Armazenamento na Camada Bronze:**  
    Os dados transformados para **Parquet** são armazenados na **camada Bronze** do Data Lake, mantendo uma versão otimizada dos dados para processamento posterior.
    
4. **Tratamento de Dados (Validações e Transformações):**  
    Os dados passam por um processo de tratamento, que inclui validações e transformações necessárias, como limpeza de dados e ajustes conforme os requisitos de negócios.
    
5. **Armazenamento na Camada Silver:**  
    Após o tratamento, os dados processados são movidos para a **camada Silver**, onde ficam armazenados com qualidade e prontos para análises mais aprofundadas.

 6. **Armazenamento na Camada Gold:**  
    Após a geração dos insights e a criação de formatos de fácil acesso, os dados são movidos para a **camada Gold**, onde ficam organizados e otimizados para consultas analíticas de alto desempenho e utilizados para relatórios executivos.
    
7. **Geração de Insights e Acesso Fácil aos Dados:**  
	Com os dados já limpos e ajustados, são gerados insights e transformados em formatos de fácil acesso para consumo, facilitando a tomada de decisões e a exploração de dados por usuários e sistemas.
    
8. **Consumo pelo Azure Synapse Analytics:**  
    Os dados são consumidos pelo **Azure Synapse Analytics** para realizar consultas e análises em larga escala, aproveitando a escalabilidade da plataforma para gerar relatórios e insights rápidos.
    
9. **Criação de Dashboards no Power BI:**  
    Por fim, **dashboards interativos** são criados no **Power BI**, oferecendo uma interface visual para a análise dos dados e apresentação dos insights gerados no pipeline.
    
10. **Infraestrutura como Código (Terraform)**:
	A infraestrutura necessária para suportar o pipeline de dados é provisionada utilizando **Terraform**, garantindo consistência, automação e facilidade de replicação do ambiente. Isso inclui a configuração do **Azure Data Lake Storage (ADLS) Gen 2**, **Databricks**, **Synapse Analytics**, e outras dependências utilizadas no projeto.


