## UMA DAS FORMAS DE FAZER TRANSFORMAÇÕES DE DADOS É A UTILIZAÇÃO DO COMANDO BOXCOX.
## EXEMPLO
##
## REALIZE UMA ANÁLISE DE VARIANÇA (ANOVA)
dados <-read.csv("Exemplo-dados.csv", header = TRUE, sep=";",dec=".")
str(dados)
fatores<-transform(dados, Trat=factor(CULTIVAR), Rep=factor(REP))
AOVDados<-aov(fatores$VALOR ~ CULTIVAR + REP, data = fatores)


## REALIZE OS TESTES DAS PRESUPOSIÇÕES.
## NÃO APRESENTOU NORMALIDADE
## NÃO APRESENTOU HOMOGENEIDADE DAS VARIANÇAS
## NÃO APRESENTOU INDEPENDENCIA DOS ERROS
## EM CASO DE DBC NÃO APRESENTOU ADITIVIDADE DOS DADOS
## É NECESSÁRIO TRANSORMAR OS DADOS.

## BOXCOX

## CARREGANDO O PACOTE MASS. DEVE-SE SER INSTALADO PREVIAMENTE
require("MASS")


## PODE UTILIZAR UMA DAS FORMAS ABAIXO.

## FORMA 1
ob_lambda <- boxcox(fatores$VALOR ~ fatores$Trat, data=fatores, plotit=T)

## FORMA 2
ob_lambda <- boxcox(fatores$VALOR ~ fatores$Trat, data=fatores, lam=seq(-1, 1, 1/10))

## OBSERVE QUE O RESULTADO DO LAMBDA É ATRIBUÍDO AO OBJETO ob_lambda


fatores$vlrTransformado <- fatores$VALOR^lambda
AOVTransformado<- aov(fatores$vlrTransformado~fatores$Trat+fatores$Rep, data=fatores)

plot(AOVTransformado)
