00-Main.pdf: pdf

pdf:
	pdflatex 00-Main.tex
	bibtex   00-Main
	pdflatex 00-Main.tex
	pdflatex 00-Main.tex
	
push: pdf
	git commit -a -m "Makefile PDF Build/Push"
	git push

clean:
	rm *.fdb_latexmk *.bbl *.log *.aux *.blg *.dvi *.pdf *.toc *.url *.lof


