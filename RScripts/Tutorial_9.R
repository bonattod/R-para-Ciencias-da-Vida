##############################################
# RScript: Integração do R com Python e LaTeX#
##############################################

# 1. Integração do R com Python ----
# Para integrar R com Python, utilizamos o pacote 'reticulate', que permite executar código Python diretamente no R.
# Este pacote facilita a chamada de scripts Python e permite usar funções Python dentro do R.

# Instalando e carregando o pacote reticulate (caso não esteja instalado)
if (!require(reticulate)) install.packages("reticulate")
library(reticulate)

# Definindo o ambiente Python (opcional - especifica o caminho do Python)
# use_python("/usr/bin/python3")  # Ajuste para o caminho da instalação do Python

# 1.1. Executando código Python diretamente no R
# Aqui utilizamos py_run_string() para executar uma linha de código Python no R.
py_run_string("print('Executando código Python a partir do R!')")

# 1.2. Transferência de dados entre R e Python
# Definimos variáveis em R e as transferimos para o Python, e vice-versa.

# Criando uma variável no R
numeros_r <- c(1, 2, 3, 4, 5)

# Transferindo para o ambiente Python
py$numeros_py <- numeros_r

# Executando um cálculo no Python com a variável 'numeros_py' enviada pelo R
py_run_string("
media = sum(numeros_py) / len(numeros_py)
print('Média calculada no Python:', media)
")

# 1.3. Funções Python no R
# Podemos importar bibliotecas Python e usá-las diretamente no R.
np <- import("numpy")  # Importando a biblioteca numpy
matriz <- np$array(matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2))
print(matriz)

# 2. Integração do R com LaTeX ----
# A integração do R com LaTeX é feita com o pacote 'knitr', que permite a criação de relatórios LaTeX a partir de RMarkdown.
# No RMarkdown, podemos compilar e gerar um documento em PDF que usa LaTeX para renderizar fórmulas matemáticas e o texto.

# Instalando e carregando o pacote knitr
if (!require(knitr)) install.packages("knitr")
library(knitr)

# 2.1. Gerando um relatório em LaTeX com RMarkdown
# Primeiro, criamos um arquivo RMarkdown (.Rmd) com conteúdo em LaTeX.

# Gerando um arquivo RMarkdown
rmd_file <- "relatorio_exemplo.Rmd"
writeLines(c(
  "---",
  "title: 'Relatório em LaTeX Gerado pelo R'",
  "output: pdf_document",
  "---",
  "",
  "# Introdução",
  "Este é um relatório de exemplo gerado pelo R usando RMarkdown e LaTeX.",
  "",
  "# Resultados",
  "Abaixo, uma fórmula matemática escrita em LaTeX:",
  "",
  "$$ E = mc^2 $$",
  "",
  "# Dados e Tabelas",
  "Segue uma tabela gerada com os dados do R:",
  "",
  "```{r}",
  "data.frame(Valores = c(10, 20, 30, 40), Quadrado = c(100, 400, 900, 1600))",
  "```"
), con = rmd_file)

# 2.2. Renderizando o documento para PDF
# Para gerar o PDF, usamos o comando render() do pacote rmarkdown (exige a instalação do LaTeX no sistema).
if (!require(rmarkdown)) install.packages("rmarkdown")
library(rmarkdown)

render(rmd_file)  # Este comando gera um PDF "relatorio_exemplo.pdf" no diretório de trabalho

# Fim do script ----
message("Integração do R com Python e LaTeX concluída com sucesso.")
