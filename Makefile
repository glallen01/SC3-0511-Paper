00-Main.pdf: pdf

pdf: 00-Main.tex
	pdflatex 00-Main.tex
	bibtex    00-Main
	makeindex 00-Main
	pdflatex 00-Main.tex
	pdflatex 00-Main.tex
	
push: pdf
	git commit -a -m "Makefile PDF Build/Push"
	git push

annote_blanks:
	grep @ 99-references.bib | cut -d{ -f2 | cut -d, -f1 | xargs -i touch annotations/{}.tex \;

clean:
	rm *.fdb_latexmk *.bbl *.log *.aux *.blg *.dvi *.pdf *.toc *.url *.lof


