#########################################################################
#Tutorial para uso das funções nativas do R para a visualização de dados#
#########################################################################

# Carregando o conjunto de dados iris (interno do R)
data(iris)

# Visualizando as primeiras linhas do dataset
head(iris)

# Gráfico de barras: Contagem de espécies
barplot(table(iris$Species),
        main = "Contagem de Espécies",
        xlab = "Espécies",
        ylab = "Frequência")

# Histograma: Distribuição do comprimento da sépala
hist(iris$Sepal.Length,
     main = "Distribuição do Comprimento da Sépala",
     xlab = "Comprimento da Sépala")

# Gráfico de dispersão: Relação entre comprimento e largura da sépala
plot(iris$Sepal.Length, iris$Sepal.Width,
     main = "Relação entre Comprimento e Largura da Sépala",
     xlab = "Comprimento da Sépala",
     ylab = "Largura da Sépala")

# Boxplot: Comparação da largura da pétala entre as espécies
boxplot(Petal.Width ~ Species, data = iris,
        main = "Comparação da Largura da Pétala entre Espécies",
        xlab = "Espécies",
        ylab = "Largura da Pétala")

# Carregando o dataset iris
data(iris)

# Gráfico de barras com cores personalizadas e fonte diferente
barplot(table(iris$Species),
        main = "Contagem de Espécies",
        xlab = "Espécies",
        ylab = "Frequência",
        col = c("blue", "green", "red"),  # Cores personalizadas
        cex.axis = 1.2,                 # Aumenta o tamanho do texto dos eixos
        family = "serif")               # Utiliza fonte serif

# Histograma com cor de preenchimento e contorno
hist(iris$Sepal.Length,
     main = "Distribuição do Comprimento da Sépala",
     xlab = "Comprimento da Sépala",
     col = "lightblue",                # Cor de preenchimento
     border = "darkblue")              # Cor do contorno

# Gráfico de dispersão com pontos coloridos e tamanhos diferentes
plot(iris$Sepal.Length, iris$Sepal.Width,
     main = "Relação entre Comprimento e Largura da Sépala",
     xlab = "Comprimento da Sépala",
     ylab = "Largura da Sépala",
     col = iris$Species,              # Cor dos pontos de acordo com a espécie
     pch = 19,                      # Pontos sólidos
     cex = 1.5)                     # Aumenta o tamanho dos pontos

# Boxplot com cores personalizadas e linhas mais grossas
boxplot(Petal.Width ~ Species, data = iris,
        main = "Comparação da Largura da Pétala entre Espécies",
        xlab = "Espécies",
        ylab = "Largura da Pétala",
        col = c("pink", "lightgreen", "skyblue"),
        whisklty = 1.5,                # Aumenta o comprimento das linhas dos bigodes
        boxwex = 0.5)                 # Diminui a largura das caixas