SHELL := /bin/bash
.PHONY: all quick compile once view compile-title merge-title view-title clean

all: compile compile-title merge-title

quick: once merge-title

compile:
	pdflatex ThesisCvM
	pdflatex ThesisCvM

once:
	pdflatex ThesisCvM

view:
	evince ThesisCvM.pdf &

compile-title:
	cd title; pdflatex title.tex

merge-title: 
	pdfunite title/title.pdf ThesisCvM.pdf "ThesisCvM(Title).pdf"

view-title:
	evince "ThesisCvM(Title).pdf" &

clean: 
	@yes | rm -f ThesisCvM.aux ThesisCvM.blg ThesisCvM.log ThesisCvM.toc
