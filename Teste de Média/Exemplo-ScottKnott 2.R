require(ExpDes.pt)
## UTILIZANDO O PACOTE SCOTTKNOT
setwd("/home/kureshio/github/Estatística R/Teste de Média/")

## LENDO O ARQUIVO DE DADOS E INFORMANDO QUE TEM CABEÇALHO E QUE O SEPARADORES SÃO; E O . É 
## O DECIMAL.
ob_dados <-read.csv("Exemplo-dados.csv", header = TRUE, sep=";",dec=".")

## CONFIGURA OS DADOS PARA TER UMA ESTRUTURA INTERNA DE OBJETO R. OU SEJA, OS CAMPOS
## TORNAM-SE OBJETOS.
str(ob_dados)

## TRANSFORMA OS DADOS EM DADOS, IMPORTANTE PARA NÚMEROS SEREM ENTENDIDOS COMO NÚMEROS
## E NÃO COMO STRINGS
ob_fatores<-transform(ob_dados, Trat=factor(TRAT), Rep=factor(REP));

## COMANDO DIC, PERTENCE AO PACOTE EXPDES. NOTE QUE JÁ SAI NA SEQUÊNCIA O TESTE SCOTTKNOTT
dic(trat=ob_fatores$TRAT, resp=ob_fatores$VALOR, quali = TRUE, mcomp='sk', sigT = 0.05)
