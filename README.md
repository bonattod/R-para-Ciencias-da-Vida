**Súmula da disciplina**

Fundamentos de R: programas e interfaces; operadores, variáveis, funções e diretórios; pacotes para manipulação e criação de vetores, matrizes, tabelas e listas; tipos de dados biológicos e suas entradas; boas práticas de computação em R: ambiente, scripts e projetos; pacotes para análises de dados de larga escala (genômica, transcritômica e proteômica); pacotes para análises estatísticas; pacotes para a criação de gráficos e representação visual de dados.

**Pré-requisitos:**

Não há a necessidade de conhecimentos prévios em R ou qualquer outra linguagem de programação.

**Objetivos**

A disciplina tem como objetivo central proporcionar uma compreensão abrangente da programação em R, bem como as suas ferramentas e aplicações focadas para as Ciências da Vida. Para tanto, a disciplina busca familiarizar os discentes com a linguagem e a programação R para dados biológicos. Nesse sentido, o objetivo central da disciplina será alcançado: (I) pela compreensão dos diferentes componentes da programação em R, como operadores e funções, para análise de dados biológicos, (ii) pela escolha da forma de entrada de dados biológicos uni e multidimensionais, (iii) pelo processamento dos dados biológicos e uso de pacotes específicos para a descoberta de conhecimento biológico, (iv) pelo emprego específico de pacotes gráficos para a representação visual dos resultados gerados e (v) pelo emprego de boas práticas de programação.

**[Arquivo com a súmula e cronograma da disciplina BCM13065 - R para Ciências da Vida](Conteudo_programatico_e_cronograma_BCM13065.pdf)**

**Começando**

Materiais e Recursos para ajudar a começar no mundo R!

Este tutorial foi gerado como um projeto em R, o que significa que contém todos os dados de entrada, scripts e saídas em um único local. O uso de projetos em R é uma prática recomendada, e mais importante, é uma prática reprodutível. Todos os arquivos de script (exceto os R Notebooks) possuem caminhos automaticamente configurados em relação ao diretório do projeto R.

Clone este repositório e gere os seus Scripts R (ou **RScripts**, como são comumente chamados) para cada módulo dentro do diretório do projeto R existente. Se preferir, salve os seus RScripts na pasta do Google Drive para a disciplina, cujas permissões serão fornecidas durante as aulas. 

**[R *cheat sheet*](https://github.com/bonattod/R-para-Ciencias-da-Vida/blob/main/base-r-cheat-sheet.pdf)** – Imprima este *cheat sheet* e mantenha em seu espaço de trabalho enquanto aprende. Mais *cheat sheets* avançados podem ser encontrados à medida que você progride.

**Outros *cheat sheets* interessantes para uso com o R:**
   1. **[dplyr](dplyr_cheat_sheet.pdf)**
   2. **[data.table](data_table_cheat_sheet.pdf)**
   3. **[ggplot2](ggplot2_cheat_sheet.pdf)**
   4. **[Parâmetros gráficos do R base](BaseGraphicsCheatsheet.pdf)**

Dois ótimos tutoriais de R estão indicados abaixo. Existem MUITOS disponíveis, por isso ofereço duas opções – uma que você pode baixar e usar no RStudio no seu computador ou uma baseada na web. QUALQUER UMA deve ser suficiente para você começar com o básico.

**Tutoriais de R**:

* Baixável via swirl:
   1. Instale o pacote swirl no R/RStudio usando o comando 'install.packages("swirl")'.
   2. Execute `swirl::install_course("The R Programming Environment")` no console do R.
   3. Inicie o swirl com o comando `swirl()`.

* Baseado na web: **[Tinystats](https://tinystats.github.io/teacups-giraffes-and-statistics/index.html)**

**Leitura Sugerida**

Um excelente texto complementar para aprender R é o livro *R in Action* (https://www.manning.com/books/r-in-action). Leituras sugeridas poderão ser fornecidas para cada tópico.

Opcional: Alternativas ao *R in Action* incluem vários livros GRATUITOS sobre R. Algumas opções são indicadas abaixo: 
* *YaRrr! The Pirate’s Guide to R* (https://bookdown.org/ndphillips/YaRrr/)
* *Hands-On Programming with R* (https://rstudio-education.github.io/hopr/)
* [*R básico - Volume I*](book-eambr01.pdf)

**Objetivos de Aprendizagem**
* Praticar a arte da reprodutibilidade utilizando scripts em R.
* Familiarizar-se com o ambiente de trabalho no RStudio.
* Aprender a conduzir análises básicas no R.
* Aprender a manipular arquivos no R.
* Analisar diferentes exemplos de dados biológicos.
* Gerar gráficos e outros tipos de representações de dados biológicos.

**Tópicos**
1. **Módulo 1:** Introdução à disciplina; Histórico do R e a sua importância para a análise de dados biológicos.
   * **Tutorial #1:** [Comandos básicos](RScripts/Tutorial_1.R)
   * **Exercício #1** [Praticando comandos básicos no R](Exercicios/Exercício_1_R.pdf)
   
2. **Módulo 2:** Procedimentos iniciais com o R: interfaces e atualizações.
   * **Tutorial #2:** [Interfaces para o R - GUI e IDEs](RScripts/Tutorial_2.pdf)
   * **Exercício #2:** [Uso de diferentes IDEs para o R](Exercicios/Exercício_2_R.pdf)  

3. **Módulo 3:** Boas práticas de programação em R.
   * **Tutorial #3:** [Boas práticas de programação em R](RScripts/Tutorial_3.R)
   * **Exercício #3** [Exercício sobre boas práticas de programação em R](Exercicios/Exercício_3_R.pdf)

5. **Módulo 4:** Pacotes do R para a análise de dados biológicos.
   * **Tutorial #4:** [Instalação de pacotes no ambiente R](RScripts/Tutorial_4.R)
   * **Tutorial #4B:** [Visualizando vinhetas no R](RScripts/Tutorial_4_vinhetas.R)
   * **Exercício #4:** [Praticando a instalação de pacotes no R](Exercicios/Exercício_4_R.pdf)

6. **Módulo 5:** Objetos do R.
   * **Tutorial #5:** [Objetos do R](RScripts/Tutorial_5.R)
   * **Exercício #5:** [Vetores, matrizes e dataframes](Exercicios/Exercício_5_R.pdf)

7. **Módulo 6:** Mineração e prospecção de bancos de dados biológicos.
   * **Tutorial #6:** [Mineração e prospecção de dados biológicos](RScripts/Tutorial_6.R)
   * **Tutorial #6B:** [Análise de um transcritoma de leveduras em condições de fermentação e propagação](RScripts/Tutorial_6B.R)
   * **Exercício #6:** [Prospecção e análise de dados biológicos](Exercicios/Exercício_6_R.pdf)
   * **Exercício #6B:** [Praticando a análise de um transcritoma de leveduras](Exercicios/Exercício_6B_R.pdf)

8. **Módulo 7:** Processamento de dados biológicos – partes 1 e 2.
   * **Tutorial #7A:** [Manipulação de dataframes biológicos com comandos básicos do R](RScripts/Tutorial_7A.R)
   * **Tutorial #7B:** [Manipulação de dataframes biológicos com tidyverse](RScripts/Tutorial_7B.R)
   * **Tutorial #7C:** [Manipulação de dados biológicos em R com tidyverse](RScripts/Tutorial_7C.R)
   * **Exercício #7:** [Uso do tidyrverse para a manipulação de dataframes](Exercicios/Exercício_7_R.pdf)

9. **Módulo 8:** Gráficos e visualização de dados - partes 1 e 2.
   * **Tutorial #8A:** [Uso das funções nativas do R para a visualização de dados](RScripts/Tutorial_8A.R)
   * **Tutorial #8B:** [Uso das bibliotecas ggplot2 e ggstatsplot para a visualização de dados](RScripts/Tutorial_8B.R)
   * **Exercício #8A:** [Uso de funções nativas do R para a visualização de dados biológicos](Exercicios/Exercício_8A_R.pdf)
   * **Exercício #8B:** [Uso do ggplot2 para a visualização de dados biológicos](Exercicios/Exercício_8B_R.pdf)

10. **Módulo 9** Interfaces com outras linguagens e plataformas.
    * **Tutorial #9:** [Integração entre R com Python e LaTex](RScripts/Tutorial_9.R)
    * **Exercício #9:** [Exercício de integração entre R com Python e LaTex](Exercicios/Exercício_9_R.pdf) 

