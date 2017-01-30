REPORT		= report
REPORT_TEX	= $(REPORT).tex
REPORT_TARGET	= $(REPORT_TEX:.tex=.pdf)

TARGETS		= $(REPORT_TARGET)

-include	.Makefiles.dep

LATEX   	?= texi2pdf
VIEWER		?= evince

TODEL		= tags *~ .*.swp *.log *.aux *.dvi *.png

IMG		= ./data
BUILD_DIR	= ./tmp


all: latex

latex: $(TARGETS)

$(REPORT_TARGET): $(REPORT_TEX) $(REPORT_DEPS)
	$(LATEX) $< -o $(REPORT_TARGET) --build-dir=$(BUILD_DIR) -I "$(IMG)" -I "$(REPORT)"
	find tmp -iname "*.idx" -exec makeindex {} \;
	makeindex $(REPORT)/report.glo -s $(REPORT)/report.ist -o tmp/report.t2d/pdf/build/report.gls
	$(LATEX) $< -o $(REPORT_TARGET) --build-dir=$(BUILD_DIR) -I "$(IMG)" -I "$(REPORT)"


clean:
	rm -rf $(BUILD_DIR) 

distclean: clean
	$(RM) $(RMFLAGS) $(TARGETS)

view_report: $(REPORT_TARGET)
	$(VIEWER) $(REPORT_TARGET)

dep:
	for i in `find $(REPORT) -iname "*.tex" -o -iname "*.glo"`; do 		\
		echo -n "$$i " >> .Makefiles.dep 				\
	done 									\
	echo -n "report/report.bib " >> .Makefiles.dep 				\
	for i in `find $(IMG)`; do 						\
		echo -n "$$i " >> .Makefiles.dep 				\
	done
