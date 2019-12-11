## UTILIZANDO O PACOTE SCOTTKNOT
setwd("")

ob_dados <-read.csv("Exemplo-dados.csv", header = TRUE, sep=";",dec=".")

## CONFIGURA OS DADOS PARA TER UMA ESTRUTURA INTERNA DE OBJETO R. OU SEJA, OS CAMPOS
## TORNAM-SE OBJETOS.
str(ob_dados)

## TRANSFORMA OS DADOS EM DADOS, IMPORTANTE PARA NÚMEROS SEREM ENTENDIDOS COMO NÚMEROS
## E NÃO COMO STRINGS
ob_fatores<-transform(ob_dados, Trat=factor(TRAT), Rep=factor(REP));

## AOV: REALIZA A ANÁLISE DE VARIÂNCIA, SENDO VALOR A VARIÁVEL RESPOSTA. ARMAZENANDO O
## DENTRO DO OBJETO OB_ANOVA.
ob_anova<-aov(ob_fatores$VALOR ~ TRAT + REP, data = ob_fatores);

## CARREGANDO O PACOTE SCOTTKNOTT, PREVIAMENTO INSTALADO.
require(ScottKnott)
## EXECUTANDO A ANOVA E ATRIBUINDO O VALOR AO OBJETO, OB_SK
ob_sk <- SK(ob_anova)

## PLOTANDO O GRÁFICO.
plot(ob_sk,title = 'TESTE SCOTT KNOTT',xlab = 'Agrupamento', ylab='Médias')
