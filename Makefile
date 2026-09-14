MAIN = main

.PHONY: all watch clean lint fmt

all:
	latexmk -pdf $(MAIN).tex

watch:
	latexmk -pdf -pvc $(MAIN).tex

clean:
	latexmk -C
	find . -name '*.bak[0-9]*' -delete

lint:
	chktex $(MAIN).tex config.tex src/*.tex inc/fig/*.tex inc/tab/*.tex inc/alg/*.tex

# inc/alg/*.tex is left out on purpose: latexindent flattens algorithmicx blocks
fmt:
	latexindent -w -s -g /dev/null -l .latexindent.yaml $(MAIN).tex config.tex tex/*.tex venues/*.tex src/*.tex inc/fig/*.tex inc/tab/*.tex
	find . -name '*.bak[0-9]*' -delete
