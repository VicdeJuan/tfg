IPETOIPE=ipetoipe
IPELATEXDIR=latex/
IPESTYLES=styles/

FILES=tfg

ALL=$(addsuffix .pdf, ${FILES})

all: ${ALL}

%.pdf: %.ipe
	${IPETOIPE} -pdf $<

clean:
	rm -f ${ALL} latex/text.*
