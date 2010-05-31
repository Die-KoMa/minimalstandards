###############################################################################
#
# Makefile f"ur den Arbeitskreis (KOMA) Minimalstandards in der Lehre.
# $Id: Makefile,v 1.3 2008/03/23 19:04:52 brainbug Exp $
###############################################################################
QUELLEN=minimalstandards.tex praeambel.tex veranstaltungsangebot.tex titelseiten.tex formen.tex infrastruktur.tex service.tex\
	phasen.pdf dimensionen.pdf

.SUFFIXES:	.obj .png

.obj.png:
	tgif -print -png $<
	

all:	minsanity

dokumentiert: minsanity

minsanity:	$(QUELLEN)
	@pdflatex -output-directory out -jobname koma-minsanity minimalstandards	&& \
	pdflatex -output-directory out  -jobname koma-minsanity minimalstandards	> /dev/null 2>&1	&& printf "\n..Zweiter Durchlauf ok\n" && \
	pdflatex -output-directory out  -jobname koma-minsanity minimalstandards	> /dev/null 2>&1	&& printf "\n..Dritter Durchlauf ok.\n\n"

clean:
	@rm -f out/*.aux
	@rm -f out/*.log
	@rm -f out/*.pdf
	@rm -f out/*.ps
	@rm -f out/*.out
	@rm -f out/*.toc
