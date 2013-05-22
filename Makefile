html:
	pandoc --mathjax --template template.html -t slidy -s slides.md -o slides.html

pdf:
	pandoc -t beamer slides.md -o slides.pdf
