**Súmula da disciplina**

Fundamentos de R: programas e interfaces; operadores, variáveis, funções e diretórios; pacotes para manipulação e criação de vetores, matrizes, tabelas e listas; tipos de dados biológicos e suas entradas; boas práticas de computação em R: ambiente, scripts e projetos; pacotes para análises de dados de larga escala (genômica, transcritômica e proteômica); pacotes para análises estatísticas; pacotes para a criação de gráficos e representação visual de dados.

**Pré-requisitos:**

Não há a necessidade de conhecimentos prévios em R ou qualquer outra linguagem de programação.

**Objetivos**

A disciplina tem como objetivo central proporcionar uma compreensão abrangente da programação em R, bem como as suas ferramentas e aplicações focadas para as Ciências da Vida. Para tanto, a disciplina busca familiarizar os discentes com a linguagem e a programação R para dados biológicos. Nesse sentido, o objetivo central da disciplina será alcançado: (I) pela compreensão dos diferentes componentes da programação em R, como operadores e funções, para análise de dados biológicos, (ii) pela escolha da forma de entrada de dados biológicos uni e multidimensionais, (iii) pelo processamento dos dados biológicos e uso de pacotes específicos para a descoberta de conhecimento biológico, (iv) pelo emprego específico de pacotes gráficos para a representação visual dos resultados gerados e (v) pelo emprego de boas práticas de programação.

Incorporando informações do documento disponibilizado, aqui está a versão modificada e traduzida:

---

**Começando**

Materiais e Recursos para ajudar a começar no mundo R!

Este tutorial foi gerado como um projeto em R, o que significa que contém todos os dados de entrada, scripts e saídas em um único local. O uso de projetos em R é uma prática recomendada, e mais importante, é uma prática reprodutível. Todos os arquivos de script (exceto os R Notebooks) possuem caminhos automaticamente configurados em relação ao diretório do projeto R.

Clone este repositório e gere os seus Scripts R para cada módulo dentro do diretório do projeto R existente. Se preferir, salve os seus RScripts na pasta do Google Drive para a disciplina, cujas permissões serão fornecidas durante as aulas. 

**[R cheat sheet](https://github.com/bonattod/R-para-Ciencias-da-Vida/blob/main/base-r-cheat-sheet.pdf)** – Imprima isto e mantenha em seu espaço de trabalho enquanto aprende. Mais cheatsheets avançados podem ser encontrados à medida que você progride.

Encontramos dois ótimos tutoriais de R. Existem MUITOS disponíveis, por isso oferecemos duas opções – uma que você pode baixar e usar no RStudio no seu computador ou uma baseada na web. QUALQUER UMA deve ser suficiente para você começar com o básico.

**Tutoriais de R**:

* Baixável via swirl:
   1. Instale o pacote swirl no R/RStudio usando o comando 'install.packages("swirl")'.
   2. Execute `swirl::install_course("The R Programming Environment")` no console do R.
   3. Inicie o swirl com o comando `swirl()`.

* Baseado na web: Tinystats

**Leitura Sugerida**

Um excelente texto complementar para aprender R é o livro *R in Action* (https://www.manning.com/books/r-in-action). Leituras sugeridas serão fornecidas para cada tópico.

Opcional: Alternativas ao *R in Action* incluem vários livros GRATUITOS sobre R. Duas opções são indicadas abaixo: 
* *YaRrr! The Pirate’s Guide to R* (https://bookdown.org/ndphillips/YaRrr/)
* *Hands-On Programming with R* (https://rstudio-education.github.io/hopr/)

**Objetivos de Aprendizagem**
* Praticar a arte da reprodutibilidade utilizando scripts em R.
* Familiarizar-se com o ambiente de trabalho no RStudio.
* Aprender a conduzir análises básicas no R.
* Aprender a manipular arquivos no R.
* Analisar diferentes exemplos de dados biológicos.
* Gerar gráficos e outros tipos de representações de dados biológicos.

**Tópicos**
1. **Módulo 1:** Introdução à disciplina; Histórico do R e a sua importância para a análise de dados biológicos
   
2. **Módulo 2:** Procedimentos iniciais com o R: interfaces e atualizações
   * **Atividade #1:**  

4. **Módulo 3:** Boas práticas de programação em R

5. **Módulo 4:** Pacotes do R para a análise de dados biológicos
   * **Atividade #2:** Prática de Gráficos no R

6. **Módulo 5:** Gráficos Avançados no R

7. **Módulo 6:** Usando o R na Linha de Comando

8. **Módulo 7:** Programação em R
   * **Atividade #3:** Usando R em um Supercomputador – Construção de um Script de Pipeline

