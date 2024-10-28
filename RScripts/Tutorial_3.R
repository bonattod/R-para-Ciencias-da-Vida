###############################################
#RScript para boas práticas de computação em R#
###############################################

# 1. Configurando o Ambiente ----
# Aqui configuramos o ambiente e registramos as operações no log.
# setwd() define o diretório de trabalho e facilita a localização de arquivos.

# Definindo diretório de trabalho
setwd("caminho/para/diretorio")

# Criando um arquivo de log para registrar operações
log_file <- "registro_log.txt"
write(paste0("Iniciando script de análise:"," ", Sys.time()), file = log_file)

# 2. Carregando Pacotes ----
# Carregamos os pacotes necessários, como 'dplyr' para manipulação de dados.
# O comando require() verifica a instalação e carrega apenas se disponível, evitando erros de execução.

# Verifica e carrega 'dplyr'
if(!require(dplyr)) install.packages("dplyr")
library(dplyr)

# 3. Funções Auxiliares ----
# Definimos funções para manter o código modular e reutilizável.
# Cada função possui comentários detalhados para fácil entendimento.

# Função que calcula a média de um vetor e registra a operação
calcula_media <- function(numeros) {
  # Verifica se o vetor está vazio
  if (length(numeros) == 0) {
    stop("Erro: O vetor está vazio.")
  }

  # Calcula e retorna a média
  media <- mean(numeros)

  # Log da operação
  write(paste("Média calculada:", media, "às", Sys.time()), file = log_file, append = TRUE)
  return(media)
}
numeros<-c(1:1000)
calcula_media(numeros)

# Função para limpar e organizar um dataframe
limpa_dados <- function(dados) {
  # Remove colunas com muitos valores NA
  dados <- dados %>% select_if(~ sum(is.na(.)) < nrow(dados) * 0.5)

  # Substitui valores NA restantes por zero
  dados[is.na(dados)] <- 0

  # Log da operação
  write("Dados limpos às " %>% Sys.time(), file = log_file, append = TRUE)
  return(dados)
}

# 4. Processamento de Dados ----
# Exemplos de manipulação de dados com uso de 'dplyr'.

# Criando um dataframe de exemplo
df_exemplo <- data.frame(
  nome = c("Ana", "Beto", "Carlos", "Daniela", "Eduardo"),
  idade = c(25, NA, 30, NA, 45),
  salario = c(5000, 7000, NA, 6000, 8000)
)

# Limpeza dos dados
df_limpo <- limpa_dados(df_exemplo)

# Exemplo de filtragem e organização com dplyr
df_final <- df_limpo %>%
  filter(salario > 5000) %>%
  arrange(desc(idade))

# Log da operação de processamento
write("Processamento de dados concluído às " %>% Sys.time(), file = log_file, append = TRUE)

# 5. Salvando Resultados ----
# Exporta o dataframe final para um arquivo CSV, registrando a operação.
write.csv(df_final, "dados_processados.csv", row.names = FALSE)
write("Arquivo de dados salvo às " %>% Sys.time(), file = log_file, append = TRUE)

# 6. Mensagens de Finalização ----
# Mensagem indicando que o script foi concluído com sucesso.
message("Script concluído com sucesso.")
