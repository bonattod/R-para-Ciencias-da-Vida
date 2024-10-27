##Exercício Completo: Visualização de Dados Biológicos com ggplot2 e ggstatsplot

#Objetivo: Este exercício visa familiarizar os alunos com a criação de gráficos de alta qualidade utilizando as bibliotecas ggplot2 e ggstatsplot, com foco em dados biológicos.

#Carregando as bibliotecas e os dados:

library(ggplot2)
library(ggstatsplot)
library(palmerpenguins)

#1. Gráficos básicos com ggplot2

#Histograma
ggplot(penguins, aes(x = body_mass_g, fill = species)) +
  geom_histogram() +
  labs(title = "Distribuição da Massa Corporal por Espécie",
       x = "Massa Corporal (g)",
       y = "Frequência")

#Boxplot
ggplot(penguins, aes(x = species, y = bill_length_mm)) +
  geom_boxplot() +
  labs(title = "Comprimento do Bico por Espécie",
       x = "Espécie",
       y = "Comprimento do Bico (mm)")

#Gráfico de Dispersão
ggplot(penguins, aes(x = body_mass_g, y = flipper_length_mm, color = species)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Massa Corporal vs. Comprimento da Nadadeira por Espécie",
       x = "Massa Corporal (g)",
       y = "Comprimento da Nadadeira (mm)")

#2. Gráficos com ggstatsplot:

#Histograma com testes estatísticos:
gghist(data = penguins, x = body_mass_g,
       title = "Distribuição da Massa Corporal",
       xlab = "Massa Corporal (g)",
       test.args = list(distribution = "norm"))

#Boxplot com comparação de grupos:
ggbetweenstats(
  data = penguins,
  x = species,
  y = bill_length_mm,
  type = "nonparametric"
)

#Gráfico de dispersão com correlação e regressão:
ggscatterstats(
  data = penguins,
  x = body_mass_g,
  y = flipper_length_mm,
  conf.level = 0.95,
  cor.method = "pearson"
)

#3. Personalização dos gráficos:

#Temas: Use `theme_classic()`, `theme_minimal()`, `theme_bw()`, etc., para alterar a aparência geral do gráfico.
#Cores: Utilize a escala de cores `scale_color_manual()` ou `scale_fill_manual()` para personalizar as cores.
#Facetas: Crie gráficos separados para cada nível de uma variável categórica usando `facet_wrap()` ou `facet_grid()`.
#Annotações: Adicione títulos, rótulos, legendas e linhas de referência usando `labs()`, `geom_hline()`, `geom_vline()`, etc.

#Observações:
# A biblioteca ggstatsplot facilita a criação de gráficos com testes estatísticos integrados.
# A personalização dos gráficos é fundamental para comunicar os resultados de forma clara e eficaz.
# Explore a documentação das bibliotecas ggplot2 e ggstatsplot para descobrir mais opções e recursos.

#Recursos adicionais:
# Documentação do ggplot2: [https://ggplot2.tidyverse.org/](https://www.google.com/url?sa=E&source=gmail&q=https://ggplot2.tidyverse.org/)
# Documentação do ggstatsplot: [https://indrajeetpatil.github.io/ggstatsplot/](https://www.google.com/url?sa=E&source=gmail&q=https://indrajeetpatil.github.io/ggstatsplot/)