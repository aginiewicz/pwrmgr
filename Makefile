PROJECT=msc
BIBFILE=bibliografia
ENCODING=88592

all: base bib ind
	pdflatex ${PROJECT}.tex
	pdflatex ${PROJECT}.tex

nobib: base ind
	pdflatex ${PROJECT}.tex
	pdflatex ${PROJECT}.tex

noind: base bib
	pdflatex ${PROJECT}.tex
	pdflatex ${PROJECT}.tex

bare: 
	pdflatex ${PROJECT}.tex
	pdflatex ${PROJECT}.tex

base:
	pdflatex ${PROJECT}.tex

bib: base
	mv ${BIBFILE}.bib ${BIBFILE}.bib.copy
	iconv -f utf8 -t iso8859-2 ${BIBFILE}.bib.copy > ${BIBFILE}.bib
	bibtex8 -c ${ENCODING}pl.csf ${PROJECT}.aux
	mv ${BIBFILE}.bib.copy ${BIBFILE}.bib
	mv ${PROJECT}.bbl ${PROJECT}.bbl.copy
	iconv -f iso8859-2 -t utf8 ${PROJECT}.bbl.copy > ${PROJECT}.bbl
	rm ${PROJECT}.bbl.copy 

ind: base
	xindy -L polish -C utf8 -M texindy ${PROJECT}.idx

clean:
	rm -f ${PROJECT}.{aux,bbl,blg,idx,ind,log,toc,lof,lol,lot}
distclean: clean
	rm -f ${PROJECT}.pdf

fresh: all clean
