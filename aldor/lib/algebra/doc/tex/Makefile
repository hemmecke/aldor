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
## This is the Makefile to build the LibAlgebra documentation.
###################################################################

top_srcdir=../../../../..
top_builddir=../../../../..
ALDOC2HTML= perl ${top_srcdir}/aldor/lib/aldor/doc/tex/aldoc2html.pl

MKDIR_P=mkdir -p

# The following list has been generated via
# grep -lR '^#if ALDOC' aldor/lib/algebra/* |sort -u|sed -e 's/^/  /;s/$/ \\/'
libalgebra_sources = \
  aldor/lib/algebra/src/algext/sit_algext.as \
  aldor/lib/algebra/src/algext/sit_sae.as \
  aldor/lib/algebra/src/algext/sit_saexcpt.as \
  aldor/lib/algebra/src/algext/sit_upmod.as \
  aldor/lib/algebra/src/basic/compbug/sit_interp.as \
  aldor/lib/algebra/src/basic/compbug/sit_shell.as \
  aldor/lib/algebra/src/basic/sit_complex.as \
  aldor/lib/algebra/src/basic/sit_indvar.as \
  aldor/lib/algebra/src/basic/sit_mkpring.as \
  aldor/lib/algebra/src/basic/sit_permut.as \
  aldor/lib/algebra/src/basic/sit_pring.as \
  aldor/lib/algebra/src/basic/sit_product.as \
  aldor/lib/algebra/src/categories/alg_cansimp.as \
  aldor/lib/algebra/src/categories/alg_ffield.as \
  aldor/lib/algebra/src/categories/alg_frering.as \
  aldor/lib/algebra/src/categories/alg_idxfrng.as \
  aldor/lib/algebra/src/categories/alg_modcmp.as \
  aldor/lib/algebra/src/categories/alg_primsrc.as \
  aldor/lib/algebra/src/categories/alg_rescls.as \
  aldor/lib/algebra/src/categories/alg_rring.as \
  aldor/lib/algebra/src/categories/sit_abgroup.as \
  aldor/lib/algebra/src/categories/sit_abmon.as \
  aldor/lib/algebra/src/categories/sit_algebra.as \
  aldor/lib/algebra/src/categories/sit_automor.as \
  aldor/lib/algebra/src/categories/sit_basic.as \
  aldor/lib/algebra/src/categories/sit_char0.as \
  aldor/lib/algebra/src/categories/sit_charp.as \
  aldor/lib/algebra/src/categories/sit_chrem.as \
  aldor/lib/algebra/src/categories/sit_comring.as \
  aldor/lib/algebra/src/categories/sit_dcmprng.as \
  aldor/lib/algebra/src/categories/sit_deriv.as \
  aldor/lib/algebra/src/categories/sit_diffext.as \
  aldor/lib/algebra/src/categories/sit_difring.as \
  aldor/lib/algebra/src/categories/sit_euclid.as \
  aldor/lib/algebra/src/categories/sit_field.as \
  aldor/lib/algebra/src/categories/sit_freealg.as \
  aldor/lib/algebra/src/categories/sit_freelar.as \
  aldor/lib/algebra/src/categories/sit_freelc.as \
  aldor/lib/algebra/src/categories/sit_freemod.as \
  aldor/lib/algebra/src/categories/sit_fset.as \
  aldor/lib/algebra/src/categories/sit_gcd.as \
  aldor/lib/algebra/src/categories/sit_gexpcat.as \
  aldor/lib/algebra/src/categories/sit_group.as \
  aldor/lib/algebra/src/categories/sit_idxfalg.as \
  aldor/lib/algebra/src/categories/sit_idxflar.as \
  aldor/lib/algebra/src/categories/sit_idxflc.as \
  aldor/lib/algebra/src/categories/sit_idxfmod.as \
  aldor/lib/algebra/src/categories/sit_intdom.as \
  aldor/lib/algebra/src/categories/sit_integer.as \
  aldor/lib/algebra/src/categories/sit_linarit.as \
  aldor/lib/algebra/src/categories/sit_module.as \
  aldor/lib/algebra/src/categories/sit_monoid.as \
  aldor/lib/algebra/src/categories/sit_ncid.as \
  aldor/lib/algebra/src/categories/sit_pable.as \
  aldor/lib/algebra/src/categories/sit_power.as \
  aldor/lib/algebra/src/categories/sit_prfcat0.as \
  aldor/lib/algebra/src/categories/sit_ptools.as \
  aldor/lib/algebra/src/categories/sit_qring.as \
  aldor/lib/algebra/src/categories/sit_ring.as \
  aldor/lib/algebra/src/categories/sit_spf0.as \
  aldor/lib/algebra/src/categories/sit_spfcat0.as \
  aldor/lib/algebra/src/categories/sit_spzble.as \
  aldor/lib/algebra/src/extree/alg_leaf.as \
  aldor/lib/algebra/src/extree/alg_op.as \
  aldor/lib/algebra/src/extree/operators/sit_OPand.as \
  aldor/lib/algebra/src/extree/operators/sit_OPassgn.as \
  aldor/lib/algebra/src/extree/operators/sit_OPbigO.as \
  aldor/lib/algebra/src/extree/operators/sit_OPcase.as \
  aldor/lib/algebra/src/extree/operators/sit_OPcplex.as \
  aldor/lib/algebra/src/extree/operators/sit_OPequal.as \
  aldor/lib/algebra/src/extree/operators/sit_OPexpt.as \
  aldor/lib/algebra/src/extree/operators/sit_OPfact.as \
  aldor/lib/algebra/src/extree/operators/sit_OPif.as \
  aldor/lib/algebra/src/extree/operators/sit_OPless.as \
  aldor/lib/algebra/src/extree/operators/sit_OPlist.as \
  aldor/lib/algebra/src/extree/operators/sit_OPllist.as \
  aldor/lib/algebra/src/extree/operators/sit_OPmatrx.as \
  aldor/lib/algebra/src/extree/operators/sit_OPminus.as \
  aldor/lib/algebra/src/extree/operators/sit_OPmore.as \
  aldor/lib/algebra/src/extree/operators/sit_OPnoteq.as \
  aldor/lib/algebra/src/extree/operators/sit_OPplus.as \
  aldor/lib/algebra/src/extree/operators/sit_OPprefx.as \
  aldor/lib/algebra/src/extree/operators/sit_OPquot.as \
  aldor/lib/algebra/src/extree/operators/sit_OPsubsc.as \
  aldor/lib/algebra/src/extree/operators/sit_OPtimes.as \
  aldor/lib/algebra/src/extree/operators/sit_OPvect.as \
  aldor/lib/algebra/src/extree/parser/sit_infexpr.as \
  aldor/lib/algebra/src/extree/parser/sit_lspexpr.as \
  aldor/lib/algebra/src/extree/parser/sit_maple.as \
  aldor/lib/algebra/src/extree/parser/sit_parser.as \
  aldor/lib/algebra/src/extree/parser/sit_scanner.as \
  aldor/lib/algebra/src/extree/parser/sit_token.as \
  aldor/lib/algebra/src/extree/sit_extree.as \
  aldor/lib/algebra/src/extree/sit_optools.as \
  aldor/lib/algebra/src/ffield/alg_pf2.as \
  aldor/lib/algebra/src/ffield/sit_prfcat.as \
  aldor/lib/algebra/src/ffield/sit_spf.as \
  aldor/lib/algebra/src/ffield/sit_sprfcat.as \
  aldor/lib/algebra/src/ffield/sit_zpf.as \
  aldor/lib/algebra/src/fraction/sit_lcqotct.as \
  aldor/lib/algebra/src/fraction/sit_matquot.as \
  aldor/lib/algebra/src/fraction/sit_qotbyc0.as \
  aldor/lib/algebra/src/fraction/sit_qotbyct.as \
  aldor/lib/algebra/src/fraction/sit_qotfcat.as \
  aldor/lib/algebra/src/fraction/sit_qotfct0.as \
  aldor/lib/algebra/src/fraction/sit_qotient.as \
  aldor/lib/algebra/src/fraction/sit_quotby.as \
  aldor/lib/algebra/src/fraction/sit_quotcat.as \
  aldor/lib/algebra/src/fraction/sit_uflgqot.as \
  aldor/lib/algebra/src/fraction/sit_vecquot.as \
  aldor/lib/algebra/src/mat/gauss/sit_dfge.as \
  aldor/lib/algebra/src/mat/gauss/sit_ff2ge.as \
  aldor/lib/algebra/src/mat/gauss/sit_ffge.as \
  aldor/lib/algebra/src/mat/gauss/sit_hermge.as \
  aldor/lib/algebra/src/mat/gauss/sit_linelim.as \
  aldor/lib/algebra/src/mat/gauss/sit_oge.as \
  aldor/lib/algebra/src/mat/linalg2/sit_popov.as \
  aldor/lib/algebra/src/mat/linalg2/sit_upcrtla.as \
  aldor/lib/algebra/src/mat/linalg/sit_bsolve.as \
  aldor/lib/algebra/src/mat/linalg/sit_laring.as \
  aldor/lib/algebra/src/mat/linalg/sit_linalg.as \
  aldor/lib/algebra/src/mat/linalg/sit_overdet.as \
  aldor/lib/algebra/src/mat/modular/compbug/sit_speclin.as \
  aldor/lib/algebra/src/mat/modular/sit_modpoge.as \
  aldor/lib/algebra/src/mat/sit_dnsemat.as \
  aldor/lib/algebra/src/mat/sit_matcat.as \
  aldor/lib/algebra/src/mat/sit_vector.as \
  aldor/lib/algebra/src/multpoly/exponent/sm_dirprod.as \
  aldor/lib/algebra/src/multpoly/exponent/sm_dirprodc.as \
  aldor/lib/algebra/src/multpoly/exponent/sm_expocat.as \
  aldor/lib/algebra/src/multpoly/exponent/sm_fvt.as \
  aldor/lib/algebra/src/multpoly/exponent/sm_listovar.as \
  aldor/lib/algebra/src/multpoly/exponent/sm_midl.as \
  aldor/lib/algebra/src/multpoly/exponent/sm_midrl.as \
  aldor/lib/algebra/src/multpoly/exponent/sm_mievc.as \
  aldor/lib/algebra/src/multpoly/exponent/sm_milex.as \
  aldor/lib/algebra/src/multpoly/exponent/sm_osymbol.as \
  aldor/lib/algebra/src/multpoly/exponent/sm_tuplovar.as \
  aldor/lib/algebra/src/multpoly/exponent/sm_vt.as \
  aldor/lib/algebra/src/multpoly/exponent/sm_zevc.as \
  aldor/lib/algebra/src/multpoly/multpolycat/alg_poltype.as \
  aldor/lib/algebra/src/multpoly/multpolycat/alg_stdfrng.as \
  aldor/lib/algebra/src/multpoly/multpolycat/sm_famr0.as \
  aldor/lib/algebra/src/multpoly/multpolycat/sm_polring0.as \
  aldor/lib/algebra/src/multpoly/multpolycat/sm_polring.as \
  aldor/lib/algebra/src/multpoly/multpolycat/sm_rmpcat0.as \
  aldor/lib/algebra/src/multpoly/multpolydom/alg_smp.as \
  aldor/lib/algebra/src/multpoly/multpolydom/sm_dmp0.as \
  aldor/lib/algebra/src/multpoly/multpolydom/sm_dmp1.as \
  aldor/lib/algebra/src/multpoly/multpolydom/sm_rmp.as \
  aldor/lib/algebra/src/multpoly/multpolydom/sm_rmpz.as \
  aldor/lib/algebra/src/multpoly/multpolydom/sm_rmpzx.as \
  aldor/lib/algebra/src/multpoly/multpolypkg/alg_bivarpk.as \
  aldor/lib/algebra/src/multpoly/multpolypkg/alg_ZpUVres.as \
  aldor/lib/algebra/src/numbers/sit_primgen.as \
  aldor/lib/algebra/src/numbers/sit_prmroot.as \
  aldor/lib/algebra/src/numbers/sit_prmtabl.as \
  aldor/lib/algebra/src/polyfactor0/sit_zfactor.as \
  aldor/lib/algebra/src/polyfactorp/sit_upfactp.as \
  aldor/lib/algebra/src/series/alg_serpoly.as \
  aldor/lib/algebra/src/series/compbug/sit_duts.as \
  aldor/lib/algebra/src/series/sit_seqence.as \
  aldor/lib/algebra/src/series/sit_sercat.as \
  aldor/lib/algebra/src/univpoly/alg_sup0.as \
  aldor/lib/algebra/src/univpoly/alg_sup1.as \
  aldor/lib/algebra/src/univpoly/alg_sup.as \
  aldor/lib/algebra/src/univpoly/categories/alg_modgcdp.as \
  aldor/lib/algebra/src/univpoly/categories/alg_polydio.as \
  aldor/lib/algebra/src/univpoly/categories/sit_fftring.as \
  aldor/lib/algebra/src/univpoly/categories/sit_fring.as \
  aldor/lib/algebra/src/univpoly/categories/sit_froot.as \
  aldor/lib/algebra/src/univpoly/categories/sit_resprs.as \
  aldor/lib/algebra/src/univpoly/categories/sit_sqfree.as \
  aldor/lib/algebra/src/univpoly/categories/sit_ufalg.as \
  aldor/lib/algebra/src/univpoly/categories/sit_uffalg.as \
  aldor/lib/algebra/src/univpoly/categories/sit_ugring.as \
  aldor/lib/algebra/src/univpoly/categories/sit_umonom.as \
  aldor/lib/algebra/src/univpoly/categories/sit_upolalg.as \
  aldor/lib/algebra/src/univpoly/categories/sit_upolc0.as \
  aldor/lib/algebra/src/univpoly/categories/sit_zring.as \
  aldor/lib/algebra/src/univpoly/gcd/sit_heugcd.as \
  aldor/lib/algebra/src/univpoly/gcd/sit_modgcd.as \
  aldor/lib/algebra/src/univpoly/gcd/sit_modpgcd.as \
  aldor/lib/algebra/src/univpoly/sit_dup.as \
  aldor/lib/algebra/src/univpoly/sit_polkara.as \
  aldor/lib/algebra/src/univpoly/sit_ufacpol.as \
  aldor/lib/algebra/src/univpoly/sit_upolc.as \
  aldor/lib/algebra/src/util/alg_version.as \

libalgebra_apis = ${patsubst aldor/lib/algebra/src/%.as, %.tex, ${libalgebra_sources}}

libalgebra_figs = algbcat algpolcat
libalgebra_pdfs = ${patsubst %, %.pdf, ${libalgebra_figs}}
libalgebra_epss = ${patsubst %, %.eps, ${libalgebra_figs}}

libalgebra.pdf: %.pdf: %.tex ${libalgebra_pdfs} ${libalgebra_apis}
	pdflatex $*
	makeindex $*
	pdflatex $*
	pdflatex $*

libalgebra.dvi libalgebra-html.dvi: %.dvi: %.tex ${libalgebra_epss} ${libalgebra_apis}
	latex $*
	makeindex $*
	latex $*
	latex $*

libalgebra.ps: libalgebra.dvi
	dvips $<

${libalgebra_pdfs}: %.pdf: %.fig
	fig2dev -Lpdf $< $@

${libalgebra_epss}: %.eps: %.fig
	fig2dev -Leps $< > $@

${libalgebra_apis}: %.tex: ${top_srcdir}/aldor/lib/algebra/src/%.as
	${MKDIR_P} ${@D}
	awk -e '/^#if ALDOC/,/^#endif/ {if(/#if ALDOC/ || /^#endif/){print ""}else{print}}' $< > $@


html: libalgebra-html/libalgebra-html.html

libalgebra-html/libalgebra-html.html: libalgebra-html/%.html: %.dvi
	latex2html $*

libalgebra-html.tex: libalgebra.tex ${libalgebra_apis}
	${ALDOC2HTML} libalgebra > $@



clean:
	-rm -r libalgebra-html*
	-rm ${libalgebra_apis} ${libalgebra_epss} ${libalgebra_pdfs}
	-rm ${patsubst %, libalgebra.%, aux dvi ps pdf ilg ind idx out toc}
