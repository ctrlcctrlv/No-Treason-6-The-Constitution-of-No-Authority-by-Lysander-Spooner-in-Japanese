SHELL:=/bin/bash

all:
	bash -c 'echo '\''let i=1 | g/\\chapter{}/s//\="\\chapter{第".i."章}"/ | let i=i+1'$$'\n''wq! spooner.tmp.tex'\'' | /usr/bin/ex spooner.tex' ||\
	pandoc -f latex -t html -i spooner.tmp.tex -o dist/spooner.html &&\
	pandoc -f latex -t markdown -i spooner.tmp.tex -o dist/spooner.md &&\
	pandoc -f latex -t asciidoc -i spooner.tmp.tex -o dist/spooner.asciidoc &&\
	uplatex-dev spooner.tex && dvipdfmx spooner.dvi -o dist/spooner.pdf
