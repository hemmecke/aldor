###################################################################
##
## Copyright (C) 2013  Ralf Hemmecke <ralf@hemmecke.org>
##
###################################################################
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.
###################################################################
## This is the Makefile to build the LibAldor documentation.
###################################################################

top_srcdir=../../../../..
top_builddir=../../../../..
ALDOC2HTML= perl ${top_srcdir}/aldor/lib/aldor/doc/tex/aldoc2html.pl

MKDIR_P=mkdir -p

# The following list has been generated via
# grep -lR '^#if ALDOC' aldor/lib/aldor/* |sort -u|sed -e 's/^/  /;s/$/ \\/'
libaldor_sources = \
  aldor/lib/aldor/src/arith/sal_arith.as \
  aldor/lib/aldor/src/arith/sal_binpow.as \
  aldor/lib/aldor/src/arith/sal_bool.as \
  aldor/lib/aldor/src/arith/sal_bsearch.as \
  aldor/lib/aldor/src/arith/sal_complex.as \
  aldor/lib/aldor/src/arith/sal_dfloat.as \
  aldor/lib/aldor/src/arith/sal_fltcat.as \
  aldor/lib/aldor/src/arith/sal_int.as \
  aldor/lib/aldor/src/arith/sal_intcat.as \
  aldor/lib/aldor/src/arith/sal_lincomb.as \
  aldor/lib/aldor/src/arith/sal_mint.as \
  aldor/lib/aldor/src/arith/sal_oarith.as \
  aldor/lib/aldor/src/arith/sal_pointer.as \
  aldor/lib/aldor/src/arith/sal_random.as \
  aldor/lib/aldor/src/arith/sal_segment.as \
  aldor/lib/aldor/src/arith/sal_sfloat.as \
  aldor/lib/aldor/src/base/ald_pfunc.as \
  aldor/lib/aldor/src/base/sal_base.as \
  aldor/lib/aldor/src/base/sal_bstream.as \
  aldor/lib/aldor/src/base/sal_byte.as \
  aldor/lib/aldor/src/base/sal_char.as \
  aldor/lib/aldor/src/base/sal_copy.as \
  aldor/lib/aldor/src/base/sal_gener.as \
  aldor/lib/aldor/src/base/sal_htype.as \
  aldor/lib/aldor/src/base/sal_itype.as \
  aldor/lib/aldor/src/base/sal_manip.as \
  aldor/lib/aldor/src/base/sal_order.as \
  aldor/lib/aldor/src/base/sal_otype.as \
  aldor/lib/aldor/src/base/sal_partial.as \
  aldor/lib/aldor/src/base/sal_serial.as \
  aldor/lib/aldor/src/base/sal_syntax.as \
  aldor/lib/aldor/src/base/sal_torder.as \
  aldor/lib/aldor/src/base/sal_tstream.as \
  aldor/lib/aldor/src/datastruc/ald_flags.as \
  aldor/lib/aldor/src/datastruc/ald_queue.as \
  aldor/lib/aldor/src/datastruc/ald_symbol.as \
  aldor/lib/aldor/src/datastruc/ald_symtab.as \
  aldor/lib/aldor/src/datastruc/sal_array.as \
  aldor/lib/aldor/src/datastruc/sal_barray.as \
  aldor/lib/aldor/src/datastruc/sal_bdata.as \
  aldor/lib/aldor/src/datastruc/sal_bstruc.as \
  aldor/lib/aldor/src/datastruc/sal_ckarray.as \
  aldor/lib/aldor/src/datastruc/sal_cklist.as \
  aldor/lib/aldor/src/datastruc/sal_ckmembk.as \
  aldor/lib/aldor/src/datastruc/sal_data.as \
  aldor/lib/aldor/src/datastruc/sal_ddata.as \
  aldor/lib/aldor/src/datastruc/sal_fstruc.as \
  aldor/lib/aldor/src/datastruc/sal_hash.as \
  aldor/lib/aldor/src/datastruc/sal_kntry.as \
  aldor/lib/aldor/src/datastruc/sal_list.as \
  aldor/lib/aldor/src/datastruc/sal_lstruc.as \
  aldor/lib/aldor/src/datastruc/sal_memblk.as \
  aldor/lib/aldor/src/datastruc/sal_parray.as \
  aldor/lib/aldor/src/datastruc/sal_pkarray.as \
  aldor/lib/aldor/src/datastruc/sal_set.as \
  aldor/lib/aldor/src/datastruc/sal_slist.as \
  aldor/lib/aldor/src/datastruc/sal_sortas.as \
  aldor/lib/aldor/src/datastruc/sal_sset.as \
  aldor/lib/aldor/src/datastruc/sal_stream.as \
  aldor/lib/aldor/src/datastruc/sal_string.as \
  aldor/lib/aldor/src/datastruc/sal_table.as \
  aldor/lib/aldor/src/gmp/sal_fltgmp.as \
  aldor/lib/aldor/src/gmp/sal_intgmp.as \
  aldor/lib/aldor/src/util/ald_trace.as \
  aldor/lib/aldor/src/util/sal_cmdline.as \
  aldor/lib/aldor/src/util/sal_file.as \
  aldor/lib/aldor/src/util/sal_timer.as \
  aldor/lib/aldor/src/util/sal_version.as

libaldor_apis = ${patsubst aldor/lib/aldor/src/%.as, %.tex, ${libaldor_sources}}

libaldor_figs = sallicat sallidata
libaldor_pdfs = ${patsubst %, %.pdf, ${libaldor_figs}}
libaldor_epss = ${patsubst %, %.eps, ${libaldor_figs}}

libaldor.pdf: %.pdf: %.tex ${libaldor_pdfs} ${libaldor_apis}
	pdflatex $*
	makeindex $*
	pdflatex $*
	pdflatex $*

libaldor.dvi libaldor-html.dvi: %.dvi: %.tex ${libaldor_epss} ${libaldor_apis}
	latex $*
	makeindex $*
	latex $*
	latex $*

libaldor.ps: libaldor.dvi
	dvips $<

${libaldor_pdfs}: %.pdf: %.fig
	fig2dev -Lpdf $< $@

${libaldor_epss}: %.eps: %.fig
	fig2dev -Leps $< > $@

${libaldor_apis}: %.tex: ${top_srcdir}/aldor/lib/aldor/src/%.as
	${MKDIR_P} ${@D}
	awk -e '/^#if ALDOC/,/^#endif/ {if(/#if ALDOC/ || /^#endif/){print ""}else{print}}' $< > $@


html: libaldor-html/libaldor-html.html

libaldor-html/libaldor-html.html: libaldor-html/%.html: %.dvi
	latex2html $*

libaldor-html.tex: libaldor.tex ${libaldor_apis}
	${ALDOC2HTML} libaldor > $@



clean:
	-rm -r libaldor-html*
	-rm ${libaldor_apis} ${libaldor_epss} ${libaldor_pdfs}
	-rm ${patsubst %, libaldor.%, aux dvi ps pdf ilg ind idx out toc}
