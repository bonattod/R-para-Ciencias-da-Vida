### **RScript: Introdução a Vetores, Matrizes e DataFrames**

# 1. Vetores em R -----------------------------------------------
# Vetores são a estrutura mais básica de dados no R e podem armazenar
# elementos do mesmo tipo (numéricos, caracteres, lógicos).

# Exemplo: Vetor com pesos (em gramas) de sementes de plantas.
peso_sementes <- c(1.2, 1.5, 1.8, 1.4, 1.9)
print(peso_sementes)  # Exibe o vetor de pesos.

# Exemplo: Vetor com tipos de espécies.
especies <- c("Arabidopsis", "Zea mays", "Oryza sativa", "Solanum", "Glycine")
print(especies)

# Operações com vetores.
media_peso <- mean(peso_sementes)  # Calcula a média dos pesos.
print(media_peso)

# Subsetting: Acessando o segundo elemento do vetor de espécies.
print(especies[2])

# 2. Matrizes em R ----------------------------------------------
# Matrizes são bidimensionais (linhas e colunas) e armazenam dados do mesmo tipo.

# Exemplo: Matriz com dados de crescimento (em cm) de 3 plantas em 5 dias.
crescimento <- matrix(
  c(10.1, 12.3, 15.2, 18.1, 20.4,  # Planta 1
    8.5, 11.2, 14.0, 16.8, 19.5,   # Planta 2
    9.0, 10.5, 13.8, 17.0, 20.1),  # Planta 3
  nrow = 3, byrow = TRUE
)
print(crescimento)  # Exibe a matriz.

# Nomeando as linhas e colunas da matriz.
rownames(crescimento) <- c("Planta_1", "Planta_2", "Planta_3")
colnames(crescimento) <- paste("Dia", 1:5, sep = "_")
print(crescimento)  # Matriz com nomes.

# Acessando um valor específico: Crescimento da Planta_2 no Dia_3.
print(crescimento["Planta_2", "Dia_3"])

# 3. DataFrames em R --------------------------------------------
# DataFrames são semelhantes a tabelas e podem conter diferentes tipos de dados.

# Exemplo: DataFrame com dados de uma coleta biológica.
dados_coleta <- data.frame(
  ID = 1:4,  # Identificação da amostra.
  Especie = c("Arabidopsis", "Zea mays", "Oryza sativa", "Glycine"),
  Altura_cm = c(15.2, 123.5, 110.3, 45.8),  # Altura das plantas.
  Biomassa_g = c(1.2, 20.5, 15.8, 5.2)  # Biomassa correspondente.
)
print(dados_coleta)  # Exibe o DataFrame.

# Acessando uma coluna específica: Alturas das plantas.
print(dados_coleta$Altura_cm)

# Filtrando dados: Plantas com altura maior que 50 cm.
altas <- subset(dados_coleta, Altura_cm > 50)
print(altas)

# Adicionando uma nova coluna: Presença de flores (sim/não).
dados_coleta$Floracao <- c(TRUE, FALSE, TRUE, FALSE)
print(dados_coleta)

# 4. Salvando e Carregando Dados --------------------------------
# Salvando o DataFrame em um arquivo CSV.
write.csv(dados_coleta, "dados_coleta.csv", row.names = FALSE)

# Carregando o arquivo CSV novamente.
dados_importados <- read.csv("dados_coleta.csv")
print(dados_importados)

# 5. Resumo e Estatísticas --------------------------------------
# Resumo das variáveis numéricas no DataFrame.
print(summary(dados_coleta))

### **Explicação do Script**
# 1. **Vetores**: São usados para armazenar dados unidimensionais como pesos e espécies. O exemplo demonstra como realizar operações básicas e acessar elementos individuais.
# 2. **Matrizes**: Demonstram como trabalhar com dados bidimensionais (linhas e colunas) relacionados ao crescimento de plantas. O script mostra como nomear dimensões e acessar valores específicos.
# 3. **DataFrames**: Usam dados coletados em campo para ilustrar o uso de tabelas com múltiplos tipos de dados. Inclui operações como acesso a colunas e filtragem de dados.
# 4. **Salvando e carregando dados**: Demonstra como exportar e importar arquivos CSV.
# 5. **Resumo estatístico**: O uso do `summary()` fornece uma visão rápida das variáveis numéricas.
