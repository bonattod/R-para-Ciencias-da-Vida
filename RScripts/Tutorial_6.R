#####################################################################################################
#Tutorial para uso das bibliotecas GEOquery e KEGGREST para prospecção de bancos de dados biológicos#
#####################################################################################################
# Carrega os pacotes necessários
library(GEOquery)   # Para prospecção de dados do GEO (Gene Expression Omnibus)
library(KEGGREST)   # Para acessar dados de pathways do KEGG

# Passo 1: Obter um dataset de expressão gênica do GEO
# O ID da série GEO que queremos investigar (exemplo: GSE10072)
geo_id <- "GSE10072"

# Baixa e processa os dados da série GEO
# getGEO() é uma função para acessar datasets públicos do GEO
geo_data <- getGEO(geo_id, GSEMatrix = TRUE)

# Verifica o tipo de dados retornado
# Isso ajuda a entender a estrutura e as variáveis presentes no dataset
class(geo_data)

# Se o dataset contiver uma matriz de expressão, ela estará no primeiro elemento da lista
# geo_data[[1]] é o objeto com os dados da série GEO
expression_data <- exprs(geo_data[[1]])

# Visualiza as primeiras linhas da matriz de expressão
# head() exibe uma amostra dos dados para verificação
head(expression_data)

# Passo 2: Análise de um gene específico
# Escolha de um gene para análise (exemplo: gene BRCA1)
gene_of_interest <- "BRCA1"

# Consulta ao banco de dados KEGG para obter o ID do gene no KEGG
# keggFind() permite buscar entradas no KEGG com base em palavras-chave
kegg_gene_id <- keggFind("hsa", gene_of_interest)

# Exibe o ID do gene encontrado
kegg_gene_id

# Passo 3: Recupera informações de pathway para o gene de interesse
# keggLink() obtém pathways relacionados a um gene específico
pathways <- keggLink("pathway", kegg_gene_id)
pathways<-keggLink("pathway", "hsa:672")

# Exibe os pathways associados ao gene
pathways

# Passo 4: Obtém detalhes sobre um pathway específico (exemplo: primeiro pathway)
# Usamos o primeiro pathway encontrado para obter detalhes
pathway_id <- names(pathways)[1]

# keggGet() recupera detalhes de uma entrada no KEGG
pathway_info <- keggGet(pathway_id)

# Exibe o nome e descrição do pathway
cat("Nome do pathway:", pathway_info[[1]]$NAME, "\n")
cat("Descrição do pathway:", pathway_info[[1]]$DESCRIPTION, "\n")

# Visualização final das informações do gene e do pathway
# head() e cat() são usados para dar uma visão inicial do conteúdo do pathway
cat("Informações completas sobre o pathway:")
pathway_info