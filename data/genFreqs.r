library(ggplot2)

x=read.table('axiomSolved.dat',header=TRUE,sep=";",as.is=TRUE)
colnames(x) <- c("inv","ax","solved")
top =as.data.frame(
	Reduce(
		rbind,
		lapply(
			unique(x$inv),
			function(i)
				cbind(
					seq(1,60),
					rep(i,60),
					#Normalizamos por la suma de la columna.
					as.double(x[x$inv==i,]$solved/sum(x[x$inv == i,]$solved))
				)
		)
	)
)

colnames(top) <- c("ax","inv","val")
#norms = Reduce(rbind,sapply(unique(x$inv),function(i) rep(as.double(sum(x[x$inv ==i,]$solved)),60)))
#x$norms=x$solved/norms

norms = unique(sapply(unique(x$inv),function(i) rbind(rep(as.double(sum(x[x$inv == i,]$solved)),60))))

toplot = as.data.frame(Reduce(rbind,lapply(seq(1,360),function(i) cbind(x[i,]$inv,x[i,]$ax,as.double(x[i,]$solved/norms[colnames(norms) == x[i,]$inv])))))
toplot$norms=as.double(as.character(toplot$V3))
colnames(toplot) <- c("inv","ax","V3","norms")
toplot$ax = as.double(as.character(toplot$ax))
top$inv = factor(top$inv)
#ggplot(top,aes(x=factor(ax),y=val,fill=factor(inv))) + geom_bar(stat="identity")
#ggplot(x,aes(x=ax,y=norms,fill=inv)) + geom_bar(stat = "identity") + xlab("Number of axioms") + ylab("Number of problems solved")
ggplot(toplot,aes(x=ax,y=norms,fill=inv)) + geom_bar(stat = "identity") + xlab("Number of axioms") + ylab("Number of problems solved")

ggsave('ei.png')
