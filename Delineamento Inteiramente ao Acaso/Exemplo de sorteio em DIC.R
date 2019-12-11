rm(list=ls()) # limpar os objetos
require(agricolae) # carregar pacote agricolae
trat <- c(1,2,3,4);trat # tratamentos
r=c(5,5,5,5);r # numero repetições

sort <- design.crd(trat,r,seed=10,serie=0); sort # sorteio para um DIC

matrix(sort$book$trat,6,byrow=T) # croqui
