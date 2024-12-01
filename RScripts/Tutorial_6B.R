# Carregando pacotes necessários para análise de dados genômicos
library(GEOquery) # Para obter e manipular dados da base de dados GEO
library(limma)    # Para análise de dados de expressão diferencial
library(affy)     # Para pré-processamento de microarrays Affymetrix
library(readr)    # Para leitura eficiente de dados tabulares

# Obtendo o conjunto de dados GEO "GSE9423" e salvando-o em um objeto
gse_9423 <- getGEO("GSE9423", GSEMatrix=TRUE)[[1]]

# Verificando a classe do objeto carregado (esperado: ExpressionSet)
class(gse_9423)

# Mostrando informações sobre o conjunto de dados
show(gse_9423)

# Exibindo as primeiras linhas da matriz de expressão
head(exprs(gse_9423))

# Exibindo os nomes dos recursos (genes ou sondas) no conjunto de dados
head(featureNames(gse_9423))

# Listando os nomes das amostras
sampleNames(gse_9423)

# Mostrando os metadados das amostras (ex.: condições experimentais)
phenoData(gse_9423)

# Repetindo a listagem dos nomes das amostras
sampleNames(gse_9423)

# Extraindo o identificador ORF das sondas
ORF <- featureData(gse_9423)@data$ORF

# Selecionando apenas sondas válidas com identificadores não nulos
use_probe <- which(is.na(ORF) == FALSE & match(ORF, "", nomatch=0) == 0)

# Criando uma matriz de expressão filtrada com sondas válidas
data.matrix <- exprs(gse_9423)[use_probe,]

# Substituindo os nomes das linhas pela identificação ORF
rownames(data.matrix) <- ORF[use_probe]

# Exibindo as primeiras linhas da matriz de expressão filtrada
head(data.matrix)

# Removendo variáveis temporárias para liberar memória
rm(ORF, use_probe)

# Calculando a mediana dos valores na matriz de expressão, ignorando NAs
Med <- median(data.matrix, na.rm=TRUE)

# Exibindo a mediana calculada anteriormente
Med

# Contando o número de valores ausentes (NA) na matriz de expressão
na.length <- length(which(is.na(data.matrix) == TRUE))

# Exibindo o número de valores ausentes
na.length

# Removendo a variável temporária usada para contar NAs
rm(na.length)

# Normalizando a matriz de expressão para reduzir variabilidade técnica entre amostras
data.matrix <- normalizeBetweenArrays(data.matrix)

# Calculando a mediana dos valores para cada identificador de linha (ORF)
tmp <- aggregate(data.matrix, list(rownames(data.matrix)), median)

# Exibindo as primeiras linhas da matriz temporária criada na agregação
head(tmp)

# Convertendo os dados agregados de volta para o formato de matriz
data.matrix <- as.matrix(tmp[,-1])

# Ajustando os nomes das linhas para os identificadores ORF correspondentes
rownames(data.matrix) <- tmp[,1]

# Exibindo as primeiras linhas da matriz de expressão normalizada
head(data.matrix)

# Exibindo as dimensões da matriz final (número de linhas e colunas)
dim(data.matrix)

# Removendo a variável temporária utilizada na agregação
rm(tmp)

# Extraindo a descrição experimental das amostras do objeto phenoData
exp.description <- phenoData(gse_9423)@data$description

# Simplificando os rótulos das amostras, retirando redundâncias na descrição
exp.status <- gsub("Biological replicate [0-9] of [0-9]\\.(.)", "\\1", exp.description)

# Criando um dataframe de alvos para análise baseada no status experimental
targets <- data.frame(Cy3 = rep("null", length = length(exp.status)), Cy5 = exp.status)

# Ajustando os nomes das linhas do dataframe de alvos para corresponder às amostras
rownames(targets) <- sampleNames(gse_9423)

# Criando uma matriz de design para análise diferencial, usando "null" como referência
design <- modelMatrix(targets, ref = "null")

# Exibindo a matriz de design gerada
design

# Removendo variáveis temporárias relacionadas às descrições e ao dataframe de alvos
rm(exp.description, exp.status, targets)

# Armazenando os nomes das comparações especificadas na matriz de design
compare <- colnames(design)

# Exibindo os nomes das comparações especificadas na matriz de design
compare

# Renomeando as colunas da matriz de design para representar os grupos experimentais
colnames(design) <- c("group1", "group2", "group3", "group4", "group5", "group6")

# Renomeando os elementos da variável compare para coincidir com os grupos
names(compare) <- c("group1", "group2", "group3", "group4", "group5", "group6")

# Armazenando a matriz de design e as informações de comparação em uma lista
design <- list(matrix = design, info = compare)

# Exibindo o design atualizado
design

# Removendo a variável temporária relacionada às comparações
rm(compare)

# Preparando a matriz de dados de expressão para análise
use.data.matrix <- data.matrix

# Atualizando a matriz de design na lista de design
design$matrix <- design$matrix

# Ajustando um modelo linear aos dados de expressão, com base na matriz de design
fit <- lmFit(use.data.matrix, design$matrix)

# Comentários descrevendo as diferentes condições experimentais
# group1 - "levedura CB11 em fermentação por 30 horas" - F30
# group2 - "levedura CB11 em fermentação por 60 horas" - F60
# group3 - "levedura CB11 em fermentação por 8 horas" - F8
# group4 - "levedura CB11 propagada 0 horas após inoculação" - P0
# group5 - "levedura CB11 propagada 30 horas após inoculação" - P30
# group6 - "levedura CB11 propagada 8 horas após inoculação" - P8

# Exemplo de criação de matrizes de contraste para comparações específicas:
# Expressão gênica em levedura em fermentação por 8 h vs. propagada 0 h
# constrast.matrix <- makeContrasts(group3-group4, levels = design$matrix)

# Expressão gênica em levedura em fermentação por 30 h vs. propagada 0 h
# constrast.matrix <- makeContrasts(group1-group4, levels = design$matrix)

# Expressão gênica em levedura em fermentação por 60 h vs. propagada 0 h
# constrast.matrix <- makeContrasts(group2-group4, levels = design$matrix)

# Expressão gênica em levedura em fermentação por 8 h vs. propagada 8 h
# constrast.matrix <- makeContrasts(group3-group6, levels = design$matrix)

# Expressão gênica em levedura em fermentação por 30 h vs. propagada 8 h
# constrast.matrix <- makeContrasts(group1-group6, levels = design$matrix)

# Expressão gênica em levedura em fermentação por 30 h vs. propagada 8 h
# constrast.matrix <- makeContrasts(group1-group6, levels = design$matrix)

# Realizando a comparação entre leveduras em fermentação por 8 h versus leveduras propagadas 0h após a inoculação.
constrast.matrix<-makeContrasts(group3-group4,levels=design$matrix) #Cria uma matriz de contraste para comparar as expressões gênicas entre os grupos "group3" e "group4".
fit2<-contrasts.fit(fit,constrast.matrix) #Ajusta os coeficientes do modelo linear (fit) aos contrastes definidos em constrast.matrix.
fit2<-eBayes(fit2) #Aplica o método Bayes empírico para ajustar os valores de p e melhorar a robustez das inferências estatísticas no modelo ajustado.
DE_9423_F8_P0<-topTable(fit2,adjust="BH",coef=1,number=5000,p.value=0.1) #Extrai os genes diferencialmente expressos (DE) com base no modelo ajustado e no contraste "group3 vs. group4".

# Gera um gráfico do tipo "vulcão" com os dados de DEGs acima
plot(DE_9423_F8_P0$logFC, -log10(DE_9423_F8_P0$P.Value),
     xlab = "Log Fold Change", ylab = "-log10(p-Value)",
     main = "Volcano Plot")

#Selecionar todos os DEGs com |logFC| > 2 e adj.P.Val < 0.05. Gerar um novo dataframe contendo dados sobre os nomes convencionais de genes, localização cromossomal, etc...

DE_9423_F8_P0$threshold = as.factor(abs(DE_9423_F8_P0$logFC) > 2 & DE_9423_F8_P0$adj.P.Val < 0.05)
dd_text_9423_F8_P0 = DE_9423_F8_P0[(abs(DE_9423_F8_P0$logFC) > 2) & (DE_9423_F8_P0$adj.P.Val < 0.05),]
dd_text_9423_F8_P0<-setNames(cbind(rownames(dd_text_9423_F8_P0),dd_text_9423_F8_P0,row.names = NULL),c("Genes","logFC","AveExpr","t","P.Value","adj.P.Val","B","threshold"))
dd_text_9423_F8_P0<-merge(dd_text_9423_F8_P0,AllGene_ChromosomalFeatures_modified,by.x="Genes")
ORF_dd_text_9423_F8_P0<-dd_text_9423_F8_P0[grep('ORF',dd_text_9423_F8_P0$gene_biotype),]

ORF_dd_text_9423_F8_P0<-merge(ORF_dd_text_9423_F8_P0,ORF_Genes_names_processed_update_2019,by.x='Genes',by.y = 'Genes')
ORF_dd_text_9423_F8_P0<-merge(ORF_dd_text_9423_F8_P0,AllGene_ChromosomalFeatures_with_description,by.x='Genes',by.y = 'Genes')

# Contagem do número de genes superexpressos e subexpressos por cromossomo
library(dplyr)
ORF_dd_text_9423_F8_P0 %>% group_by(chromosome_name) %>% summarise(pos = sum(logFC > 0),neg = sum(logFC < 0))