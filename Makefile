00-Main.pdf: pdf

pdf: 00-Main.tex
	pdflatex 00-Main.tex
	bibtex    00-Main
	makeindex 00-Main
	pdflatex 00-Main.tex
	pdflatex 00-Main.tex

# this is ugly... fix later
XOPT=-output-directory bib
xx-references.pdf: bib/xx-references.tex
	pdflatex ${XOPT} bib/xx-references.tex
	TEXMFOUTPUT=bib bibtex bib/xx-references 
	pdflatex ${XOPT} bib/xx-references.tex
	pdflatex ${XOPT} bib/xx-references.tex
	
push: pdf
	git commit -a -m "Makefile PDF Build/Push"
	git push

annote_blanks:
	grep @ 99-references.bib | cut -d{ -f2 | cut -d, -f1 | xargs -i touch annotations/{}.tex \;


clean:
	-rm -f \
		*.fdb_latexmk \
		*.bbl \
		*.log \
		*.aux \
		*.blg \
		*.dvi \
		*.pdf \
		*.toc \
		*.url \
		*.lof \
		*.orig \
		*.idx \
		*.ilg \
		*.ind \
		*.out \
		*.lot \
		*.url

# sam2p - image conversion

# add to bib
# cat /tmp/Exported\ Items.bib >> 99-references.bib ; make annote_blanks
#
# sed -e 's/[a-zA-Z]*//g' -e 's/ //g' -e's/“/\`\`/' -e"s/”/''/g" test.txt
# sed -e 's/[a-zA-Z0-9,\.\-\(\) ]*//g' -e's/-/--/g' -e's/“/\`\`/g' -e"s/”/''/g" -e"s/…/\\\ldots /g" test.txt
# sed -e's/-/--/g' -e's/“/\`\`/g' -e"s/”/''/g" -e"s/…/\\\ldots /g" test.txt
#
# cat test.txt| sed -e's/-/--/g' -e's/“/\`\`/g' -e"s/”/''/g" -e"s/…/\\\ldots /g" -e"s/$/\n/" -e"s/’/'/g" | fmt --width=80
