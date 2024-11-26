### **RScript: Manipulação de DataFrames Biológicos com Comandos Básicos do R**

# ========================================================
# Manipulação e Integração de Dois DataFrames Biológicos
# ========================================================

# 1. Leitura dos arquivos TSV ----
# Usamos read.table() para ler arquivos TSV com separador '\t'
genes <- read.table("/mnt/data/ORF_Genes_names_processed_update_2019.tsv", header = TRUE, sep = "\t", stringsAsFactors = FALSE)
features <- read.table("/mnt/data/AllGene_ChromosomalFeatures_modified.csv", header = TRUE, sep = "\t", stringsAsFactors = FALSE)

# Visualizar as primeiras linhas de cada dataframe
head(genes)
head(features)

# 2. Seleção de colunas específicas ----
# Usamos colunas específicas de interesse com subsetting
genes_selecionados <- genes[, c("Genes", "Feature")]
colnames(genes_selecionados) <- c("GeneID", "ORF_ID")  # Renomeando colunas

features_selecionados <- features[, c("Genes", "chromosome_name", "start_position", "end_position", "status_description")]
colnames(features_selecionados) <- c("GeneID", "Chromosome", "Start", "End", "Description")

# Visualizar as colunas selecionadas
head(genes_selecionados)
head(features_selecionados)

# 3. Integração dos DataFrames com merge() ----
# Unimos os dataframes pela coluna 'GeneID'
dados_combinados <- merge(genes_selecionados, features_selecionados, by = "GeneID", all.x = TRUE)

# Visualizar o resultado da combinação
head(dados_combinados)

# 4. Filtragem: Genes localizados no cromossomo "ChrI" ----
genes_chrI <- dados_combinados[dados_combinados$Chromosome == "I", ]

# Verificar o filtro aplicado
head(genes_chrI)

# 5. Criação de nova coluna com o comprimento do gene ----
# Calculamos a diferença entre as colunas 'End' e 'Start'
dados_combinados$Gene_Length <- dados_combinados$End - dados_combinados$Start

# Visualizar a nova coluna
head(dados_combinados)

# 6. Agrupamento e Contagem de Genes por Cromossomo ----
# Usamos table() para contar a frequência de cada cromossomo
contagem_por_cromossomo <- as.data.frame(table(dados_combinados$Chromosome))
colnames(contagem_por_cromossomo) <- c("Chromosome", "Total_Genes")

# Visualizar a contagem por cromossomo
print(contagem_por_cromossomo)

# 7. Tratamento de Valores Faltantes (NA) ----
# Substituímos NAs na coluna 'Description' por "Descrição ausente"
dados_combinados$Description[is.na(dados_combinados$Description)] <- "Descrição ausente"

# Verificar se os NAs foram preenchidos
head(dados_combinados)

# 8. Ordenação dos Dados pelo Comprimento do Gene ----
# Usamos order() para ordenar em ordem decrescente de 'Gene_Length'
dados_ordenados <- dados_combinados[order(-dados_combinados$Gene_Length), ]

# Visualizar os dados ordenados
head(dados_ordenados)

# 9. Exportação dos Dados Manipulados para CSV ----
# Salvamos o dataframe final em um arquivo CSV
write.csv(dados_combinados, "dados_combinados.csv", row.names = FALSE)

# ========================================================
# Fim do Script
# ========================================================

  ### **Descrição do Script**
# 1. **Leitura dos Arquivos**: Usamos `read.table()` para ler arquivos TSV.
# 2. **Seleção de Colunas**: Extraímos apenas as colunas relevantes usando subsetting.
# 3. **Integração de Dados**: Utilizamos `merge()` para unir os dataframes.
# 4. **Filtragem e Cálculo de Comprimento**: Filtramos genes específicos e criamos uma coluna com o comprimento dos genes.
# 5. **Agrupamento e Contagem**: Usamos `table()` para contar genes por cromossomo.
# 6. **Tratamento de NAs**: Substituímos valores faltantes na descrição.
# 7. **Ordenação**: Ordenamos os dados usando `order()`.
# 8. **Exportação**: Salvamos o resultado em um arquivo CSV.