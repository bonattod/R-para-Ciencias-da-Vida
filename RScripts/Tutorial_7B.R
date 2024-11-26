### Passos do Script
# - **Leitura dos arquivos**: carregar os dados a partir dos arquivos TSV.
# - **Manipulação básica**: seleção e filtragem de colunas.
# - **Integração**: uso de `inner_join()` ou `left_join()` para combinar os dataframes.
# - **Exploração dos dados**: agrupamento e sumarização.
# - **Tratamento de valores faltantes**.

  ### **RScript: Manipulação de DataFrames Biológicos com tidyverse**

# ========================================================
# Manipulação e Integração de Dois DataFrames Biológicos
# ========================================================

# 1. Instalação e carregamento do pacote tidyverse ----
if (!require(tidyverse)) install.packages("tidyverse")
library(tidyverse)

# 2. Leitura dos arquivos TSV ----
# Definir o caminho correto dos arquivos anexados
arquivo_genes <- "/mnt/data/ORF_Genes_names_processed_update_2019.tsv"
arquivo_features <- "/mnt/data/AllGene_ChromosomalFeatures_modified.csv"

# Converter dataframes convencionais em tibbles
genes <- as_tibble(arquivo_genes)
features <- as_tibble(arquivo_features)

# Verificar as primeiras linhas de cada dataframe
print(head(genes))
print(head(features))

# 3. Seleção de colunas importantes ----
# Vamos escolher as colunas mais relevantes para manipulação futura

genes_selecionados <- genes %>% select(GeneID = `Genes`, ORF_ID = `Feature`)

features_selecionados <- features %>% select(GeneID = `Genes`, Chromosome = `chromosome_name`, Start = `start_position`, End = `end_position`, Description = `status_description`)

# Exibir as colunas selecionadas
print(head(genes_selecionados))
print(head(features_selecionados))

# 4. Integração dos dois dataframes com left_join() ----
# Juntar as informações com base no nome do gene (GeneID)

dados_combinados <- genes_selecionados %>% left_join(features_selecionados, by = "GeneID")

# Verificar a combinação
print(head(dados_combinados))

# 5. Filtragem: Genes localizados no cromossomo "ChrI" ----
genes_chrI <- dados_combinados %>% filter(Chromosome == "I")

print(head(genes_chrI))

# 6. Criação de uma nova coluna com a duração do gene ----
# A duração será calculada como End - Start

dados_combinados <- dados_combinados %>% mutate(Gene_Length = End - Start)

print(head(dados_combinados))

# 7. Agrupamento e sumarização: Contar genes por cromossomo ----
contagem_por_cromossomo <- dados_combinados %>% group_by(Chromosome) %>% summarize(Total_Genes = n(), .groups = "drop")
print(contagem_por_cromossomo)

# 8. Tratamento de valores faltantes ----
# Substituir valores NA na coluna 'Description' por "Descrição ausente"

dados_combinados <- dados_combinados %>% replace_na(list(Description = "Descrição ausente"))
print(head(dados_combinados))

# 9. Ordenação dos dados pelo comprimento do gene ----
dados_ordenados <- dados_combinados %>% arrange(desc(Gene_Length))
print(head(dados_ordenados))

# 10. Exportação dos dados manipulados para CSV ----
# Salvar o dataframe final em um arquivo CSV

write_csv(dados_combinados, "dados_combinados.csv")

# ========================================================
# Fim do Script
# ========================================================


  ### **Descrição do Script**
# 1. **Leitura dos Arquivos**: Utilizamos `read_tsv()` para ler arquivos TSV.
# 2. **Seleção de Colunas**: Extraímos apenas as informações necessárias para análise.
# 3. **Integração**: Combinamos os dois dataframes usando `left_join()` para associar os dados.
# 4. **Filtragem e Mutação**: Filtramos genes específicos e criamos novas colunas derivadas.
# 5. **Agrupamento e Sumarização**: Contamos o número de genes por cromossomo.
# 6. **Tratamento de NAs**: Substituímos valores ausentes na descrição.
# 7. **Ordenação**: Organizamos os dados em ordem decrescente de comprimento do gene.
