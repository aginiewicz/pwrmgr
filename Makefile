PROJECT=msc

all: bib ind
	pdflatex ${PROJECT}.tex
	pdflatex ${PROJECT}.tex

bib: base
	biber ${PROJECT}.bcf

ind: base
	texindy -L polish -M lang/polish/utf8 ${PROJECT}.idx

base:
	pdflatex ${PROJECT}.tex

clean:
	rm -f ${PROJECT}.{aux,bcf,bbl,blg,idx,ind,log,toc,lof,lol,lot,run.xml}

distclean: clean
	rm -f ${PROJECT}.pdf

fresh: all clean

