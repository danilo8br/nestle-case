# Configuração do provedor Azure
provider "azurerm" {
  features {}
}

# Definir um Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "nestlecase"
  location = "eastus"
}

# Criar a conta de armazenamento com suporte ao Data Lake Gen2
resource "azurerm_storage_account" "storage_account" {
  name                     = "storagenestlecase" # Nome único
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  enable_hierarchical_namespace = true # Habilita Gen2

  tags = {
    environment = "dev"
  }
}

# Criar um container no Data Lake
resource "azurerm_storage_container" "container" {
  name                  = "datalake-container"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}

# Criar External Data Source para o Synapse
resource "azurerm_synapse_external_data_source" "external_data_source" {
  name                 = "processed_storagenestlecase_dfs_core_windows_net"
  synapse_workspace_id = "workspace_id" # Substitua pelo ID do seu Synapse Workspace
  location             = "abfss://processed@storagedatalakegen2.dfs.core.windows.net"
}

# Criar External File Format (Parquet)
resource "azurerm_synapse_external_file_format" "parquet_file_format" {
  name                 = "SynapseParquetFormat"
  synapse_workspace_id = "workspace_id" # Substitua pelo ID do seu Synapse Workspace
  format_type          = "PARQUET"
}
