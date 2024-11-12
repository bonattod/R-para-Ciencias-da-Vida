# Introdução ao R: Conceitos Básicos

# 1. Imprimindo na tela
print("Bem-vindo ao R!")  # Exibe uma mensagem na console

# 2. Atribuição de variáveis
x <- 10  # Atribuindo o valor 10 à variável x
y <- 20  # Atribuindo o valor 20 à variável y

# 3. Operações matemáticas
soma <- x + y  # Soma de x e y
subtracao <- x - y  # Subtração de x e y
multiplicacao <- x * y  # Multiplicação de x e y
divisao <- y / x  # Divisão de y por x

# Imprimindo os resultados das operações
print(paste("Soma:", soma))
print(paste("Subtração:", subtracao))
print(paste("Multiplicação:", multiplicacao))
print(paste("Divisão:", divisao))

# 4. Vetores
vetor <- c(1, 2, 3, 4, 5)  # Criação de um vetor com 5 elementos
print("Vetor:")
print(vetor)

# Operações com vetores
soma_vetor <- vetor + 1  # Adicionando 1 a cada elemento do vetor
print("Vetor após adição:")
print(soma_vetor)

# 5. Matrizes
matriz <- matrix(1:9, nrow = 3, ncol = 3)  # Criação de uma matriz 3x3
print("Matriz 3x3:")
print(matriz)

# Acessando elementos da matriz
print(paste("Elemento na posição (2,3):", matriz[2, 3]))  # Linha 2, Coluna 3

# 6. Data Frames
dados <- data.frame(
  Nome = c("Ana", "João", "Maria"),
  Idade = c(23, 35, 29),
  Altura = c(1.65, 1.80, 1.70)
)  # Criação de um data frame

print("Data Frame:")
print(dados)

# Como saber o número de linhas e de colunas do meu data frame? Comando dim()
dim(dados)

# Acessando colunas de um data frame
print("Coluna 'Idade':")
print(dados$Idade)

# 7. Estruturas de controle: if-else e for loop

# Exemplo de if-else
if (x > y) {
  print("x é maior que y")
} else {
  print("x não é maior que y")
}

# Exemplo de loop for
print("Imprimindo valores de 1 a 5:")
for (i in 1:5) {
  print(i)
}

# 8. Gráficos simples
# Gráfico de dispersão (scatter plot)
plot(
  dados$Idade, dados$Altura,
  main = "Gráfico de Idade vs Altura",  # Título
  xlab = "Idade",  # Rótulo do eixo X
  ylab = "Altura",  # Rótulo do eixo Y
  pch = 16,  # Tipo de ponto
  col = "blue"  # Cor dos pontos
)
dev.off() #Comando para fechar gráficos abertos no ambiente do R

# Adicionando e removendo colunas de um data frame
dados$Peso<-c(50, 60, 70) # Cria a coluna "Peso"
dados_reduzidos<-dados "Transpõe os dados originais para um segundo data frame"
dados_reduzidos$Peso<-NULL "Remove a coluna "Peso""

# 9. Salvando objetos no ambiente de trabalho
save(dados, file = "dados.RData")  # Salvando o data frame em um arquivo .RData
print("Data frame salvo em 'dados.RData'.")

# 10. Carregando um objeto salvo
load("dados.RData")  # Carrega o objeto salvo
print("Data frame carregado:")
print(dados)

# 11. Encerrando a sessão do R
q("no")  # Encerra a sessão sem salvar o workspace

### Como usar o script:
# 1. Salve o código em um arquivo, como `intro_script.R`.
# 2. Execute no RStudio ou diretamente na console R com o comando:
# Rscript intro_script.R