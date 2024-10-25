### **Script: Manipulação de Dados Biológicos em R com tidyverse**

# ========================================================
# Introdução ao tidyverse para manipulação de DataFrames
# Exemplo: Dados de expressão gênica em diferentes espécies
# ========================================================

# 1. Instalação e carregamento do pacote tidyverse ----
# tidyverse é um conjunto de pacotes para manipulação e visualização de dados
if (!require(tidyverse)) install.packages("tidyverse")  # Instalar se não estiver instalado
library(tidyverse)  # Carregar a biblioteca

# 2. Criação de um dataframe de exemplo ----
# Simula dados de expressão de genes para três espécies diferentes
expressao_genica <- tibble(
  Gene = c("GeneA", "GeneB", "GeneC", "GeneA", "GeneB", "GeneC"),
  Especie = c("Homo sapiens", "Homo sapiens", "Homo sapiens",
              "Mus musculus", "Mus musculus", "Mus musculus"),
  Expressao = c(12.5, 8.3, 15.2, 10.8, 7.5, 13.4),
  Condicao = c("Controle", "Controle", "Controle",
               "Tratado", "Tratado", "Tratado")
)

# Visualizar o dataframe inicial
print(expressao_genica)

# 3. Seleção de colunas específicas com select() ----
# Seleciona apenas as colunas 'Gene' e 'Expressao'
expressao_selecionada <- expressao_genica %>%
  select(Gene, Expressao)

# Exibe o resultado
print(expressao_selecionada)

# 4. Filtragem de dados com filter() ----
# Filtra as linhas onde a espécie é "Homo sapiens"
expressao_filtrada <- expressao_genica %>%
  filter(Especie == "Homo sapiens")

print(expressao_filtrada)

# 5. Criação de novas colunas com mutate() ----
# Adiciona uma nova coluna com a expressão log-transformada
expressao_transformada <- expressao_genica %>%
  mutate(LogExpressao = log(Expressao))

print(expressao_transformada)

# 6. Agrupamento e sumarização com group_by() e summarize() ----
# Calcula a expressão média para cada gene agrupado por condição
media_expressao <- expressao_genica %>%
  group_by(Gene, Condicao) %>%
  summarize(Media_Expressao = mean(Expressao), .groups = "drop")

print(media_expressao)

# 7. Pivotagem dos dados com pivot_wider() ----
# Converte o formato longo para formato largo
dados_largos <- expressao_genica %>%
  pivot_wider(names_from = Condicao, values_from = Expressao)

print(dados_largos)

# 8. Tratamento de valores faltantes com replace_na() ----
# Suponha que temos valores NA em algumas células
dados_faltantes <- tibble(
  Gene = c("GeneA", "GeneB", "GeneC"),
  Controle = c(12.5, NA, 15.2),
  Tratado = c(10.8, 7.5, NA)
)

# Preencher NAs com 0
dados_faltantes_corrigidos <- dados_faltantes %>%
  replace_na(list(Controle = 0, Tratado = 0))

print(dados_faltantes_corrigidos)

# 9. Ordenação dos dados com arrange() ----
# Ordena os genes pela expressão em ordem decrescente
dados_ordenados <- expressao_genica %>%
  arrange(desc(Expressao))

print(dados_ordenados)

# 10. Visualização rápida dos dados com glimpse() ----
# Fornece uma visão geral compacta do dataframe
glimpse(expressao_genica)

# 11. Salvando o dataframe manipulado em um arquivo CSV ----
# Exporta os dados transformados para um arquivo .csv
write_csv(media_expressao, "media_expressao.csv")

# ========================================================
# Fim do Script
# ========================================================

### **Explicação e Sugestões de Uso**
#1. **Tópicos Cobrindo as Operações Básicas**:
#- *Seleção* (`select`), *filtragem* (`filter`), *mutação de colunas* (`mutate`), *agregação* (`summarize`).
#- *Pivotagem* entre formatos longos e largos e *tratamento de NAs* com `replace_na`.
#- A *ordenação* dos dados é útil em análises exploratórias iniciais.

#2. **Contexto Biológico**:
#Os dados simulados representam níveis de expressão gênica em duas condições (Controle e Tratado) para duas espécies. Esse exemplo é útil para ilustrar tarefas comuns em biologia computacional, como transformação de dados e cálculo de médias.
