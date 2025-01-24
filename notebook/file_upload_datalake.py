import os
from azure.storage.blob import BlobServiceClient, BlobClient, ContainerClient
from azure.core.exceptions import ResourceExistsError

# Substitua pelas suas credenciais do Azure
account_name = "storagenestlecase"
account_key = "suachave"
container_name = "raw"  # O nome do contêiner da camada raw

# Caminho da pasta local onde os arquivos CSV estão armazenados
local_directory = r"C:\Users\Danil\OneDrive\Documents\Case Nestle\base_de_dados"

# URL do Data Lake (formato do Azure Storage Gen2)
url = f"https://{account_name}.dfs.core.windows.net/{container_name}"

# Criação do cliente BlobServiceClient
blob_service_client = BlobServiceClient(account_url=url, credential=account_key)

# Função para enviar arquivos
def upload_files_to_datalake(local_directory, container_name):
    # Lista todos os arquivos no diretório local
    for filename in os.listdir(local_directory):
        # Verifica se o arquivo é CSV
        if filename.endswith(".csv"):
            local_file_path = os.path.join(local_directory, filename)
            blob_name = f"raw/{filename}"  # Caminho onde o arquivo será armazenado no Data Lake

            try:
                # Criação do BlobClient para enviar o arquivo
                blob_client = blob_service_client.get_blob_client(container=container_name, blob=blob_name)
                
                # Enviando o arquivo
                with open(local_file_path, "rb") as data:
                    blob_client.upload_blob(data, overwrite=True)  # Seta overwrite=True para sobrescrever caso o arquivo já exista
                print(f"Arquivo '{filename}' enviado com sucesso para o Data Lake.")

            except ResourceExistsError:
                print(f"O arquivo '{filename}' já existe no Data Lake.")
            except Exception as e:
                print(f"Erro ao enviar o arquivo '{filename}': {e}")

# Chama a função para enviar os arquivos CSV para o Data Lake
upload_files_to_datalake(local_directory, container_name)
