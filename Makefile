###############################################################################
#
# Makefile f"ur den Arbeitskreis (KOMA) Minimalstandards in der Lehre.
# $Id: Makefile,v 1.3 2008/03/23 19:04:52 brainbug Exp $
###############################################################################
QUELLEN=shell.tex praeambel.tex stpo.tex formen.tex infrastruktur.tex service.tex\
	phasen.png dims.png

.SUFFIXES:	.obj .png

.obj.png:
	tgif -print -png $<
	

all:	minsanity

minsanity:	out/koma-minsanity.pdf

out/koma-minsanity.pdf:	$(QUELLEN)
	@pdflatex -output-directory out -jobname koma-minsanity shell	&& \
	pdflatex -output-directory out  -jobname koma-minsanity shell	> /dev/null 2>&1	&& printf "\n..Zweiter Durchlauf ok\n" && \
	pdflatex -output-directory out  -jobname koma-minsanity shell	> /dev/null 2>&1	&& printf "\n..Dritter Durchlauf ok.\n\n"

clean:
	@rm -f out/*.aux
	@rm -f out/*.log
	@rm -f out/*.pdf
	@rm -f out/*.ps
	@rm -f out/*.out
	@rm -f out/*.toc
