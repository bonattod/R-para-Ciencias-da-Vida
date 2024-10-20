# ===============================================================
# RScript: Instalação de pacotes para análises biológicas de grande escala
# Fontes: CRAN, Bioconductor e GitHub
# ===============================================================

# 1. Verificar e instalar pacotes do CRAN -----------------------

# Vetor com os nomes dos pacotes do CRAN para análise de dados e estatística
pacotes_cran <- c("data.table",  # Manipulação eficiente de grandes datasets
                  "ggplot2",     # Criação de gráficos e visualização de dados
                  "dplyr")       # Manipulação de dados (parte do tidyverse)

# Função para instalar pacotes do CRAN, se ainda não estiverem instalados
instalar_cran <- function(pacote) {
  if (!requireNamespace(pacote, quietly = TRUE)) { # Verifica se o pacote já está instalado
    install.packages(pacote)  # Instala o pacote se necessário
  }
}

# Aplica a função de instalação para cada pacote listado no vetor 'pacotes_cran'
sapply(pacotes_cran, instalar_cran)

# 2. Instalar pacotes do Bioconductor ---------------------------

# Verifica se o pacote 'BiocManager' está instalado; caso contrário, instala do CRAN
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")  # Instalação do BiocManager
}

# Vetor com pacotes do Bioconductor para análise de dados genômicos e ômicos
pacotes_bioconductor <- c("edgeR",        # Análise estatística de dados de RNA-Seq
                          "Biostrings",   # Manipulação de sequências biológicas
                          "limma")        # Análise de dados de microarrays e RNA-Seq

# Instala todos os pacotes listados no vetor 'pacotes_bioconductor'
BiocManager::install(pacotes_bioconductor, update = TRUE, ask = FALSE)

# 3. Instalar pacotes do GitHub ----------------------------------

# Verifica se o pacote 'remotes' está instalado; caso contrário, instala do CRAN
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")  # Instala o pacote remotes
}

# Instala pacotes do GitHub para manipulação de árvores filogenéticas
remotes::install_github("GuangchuangYu/treeio")  # Pacote para manipular árvores filogenéticas

# 4. Verificar as versões dos pacotes instalados -----------------

# Função para listar e exibir a versão de pacotes instalados
listar_versoes <- function(pacotes) {
  lapply(pacotes, function(pkg) {  # Aplica a função a cada pacote do vetor
    if (requireNamespace(pkg, quietly = TRUE)) {  # Verifica se o pacote está instalado
      cat(pkg, ":", packageVersion(pkg), "\n")  # Exibe a versão do pacote instalado
    } else {
      cat(pkg, ": Não instalado\n")  # Mensagem se o pacote não estiver instalado
    }
  })
}

# Listar versões dos pacotes do CRAN
cat("\nVersões dos pacotes do CRAN:\n")  # Título da seção no console
listar_versoes(pacotes_cran)  # Exibe versões dos pacotes do CRAN

# Listar versões dos pacotes do Bioconductor
cat("\nVersões dos pacotes do Bioconductor:\n")  # Título da seção no console
listar_versoes(pacotes_bioconductor)  # Exibe versões dos pacotes do Bioconductor

# 5. Fim do script ----------------------------------------------

# Mensagem final no console indicando que a instalação foi concluída
cat("\nInstalação concluída! Agora você está pronto para realizar análises biológicas e estatísticas no R.\n")
```

---

  ### **Resumo do RScript**
# - **CRAN:** Instala pacotes gerais, como o `tidyverse` e `vegan`, para manipulação de dados e ecologia.
# - **Bioconductor:** Pacotes como `DESeq2` e `phyloseq` ajudam na análise de dados genômicos e filogenéticos.
# - **GitHub:** Instala pacotes adicionais para manipulação e visualização de árvores, como `ggtree`.
# - **Função de verificação:** A função `listar_versoes` permite confirmar as versões dos pacotes instalados.
