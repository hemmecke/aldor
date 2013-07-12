THIS := $(dir $(lastword $(MAKEFILE_LIST)))

libaxllib_ASOURCES :=	\
	array.as	\
	axlcat.as	\
	basic.as	\
	axl_boolean.as	\
	bpower.as	\
	axl_byte.as	\
	axl_char.as	\
	complex.as	\
	debug.as	\
	dfloat.as	\
	efuns.as	\
	except.as	\
	file.as	\
	axl_float.as	\
	fmtout.as	\
	fname.as	\
	format.as	\
	fprint.as	\
	fstring.as	\
	gener.as	\
	hinteger.as	\
	ieeectl.as	\
	imod.as	\
	integer.as	\
	lang.as	\
	langx.as	\
	list.as	\
	list2.as	\
	machine.as	\
	object.as	\
	opsys.as	\
	oslow.as	\
	parray.as	\
	partial.as	\
	pfloat.as	\
	pkarray.as	\
	pointer.as	\
	ratio.as	\
	ref.as	\
	rtexns.as	\
	segment.as	\
	sfloat.as	\
	sinteger.as	\
	sort.as	\
	string.as	\
	table.as	\
	textread.as	\
	textwrit.as	\
	tuple.as	\
	uarray.as

libaxllib_ASOURCES := $(addprefix $(THIS), $(libaxllib_ASOURCES))

libaxllib_AOBJECTS := $(libaxllib_ASOURCES:.as=.ao)
libaxllib_COBJECTS := $(libaxllib_ASOURCES:.as=.o)


# C library
$(LIBDIR)/libaxllib.a: $(libaxllib_COBJECTS)
	$(AR) cr $@ $^

# Local aldor build rule
$(THIS)%.o: $(THIS)%.as $(BINDIR)/aldor $(BINDIR)/unicl $(aldor_HEADERS) $(INCDIR)/axllib.as
	$(BINDIR)/aldor $(AFLAGS) $<
	$(AR) cr $(LIBDIR)/libaxllib.al $(@:.o=.ao)

# Copy includes
$(INCDIR)/axllib.as: $(THIS)axllib.as
	mkdir -p $(dir $@)
	cp $< $@

# Clean
clean: clean-libaxllib
clean-libaxllib:
	$(RM) $(libaxllib_AOBJECTS)
	$(RM) $(libaxllib_COBJECTS)
	$(RM) $(libaxllib_ASOURCES:.as=.c)
	$(RM) $(LIBDIR)/libaxllib.a $(LIBDIR)/libaxllib.al

# Depend
$(THIS)array.o:	\
	$(THIS)langx.o	\
	$(THIS)parray.o
$(THIS)axlcat.o:	\
	$(THIS)basic.o
$(THIS)list2.o:	\
	$(THIS)list.o
$(THIS)ieeectl.o:	\
	$(THIS)axlcat.o\
	$(THIS)dfloat.o
$(THIS)basic.o:	\
	$(THIS)machine.o
$(THIS)axl_boolean.o:	\
	$(THIS)lang.o	\
	$(THIS)axlcat.o
$(THIS)bpower.o:	\
	$(THIS)sinteger.o
$(THIS)axl_byte.o:	\
	$(THIS)sinteger.o
$(THIS)axl_char.o:	\
	$(THIS)integer.o	\
	$(THIS)segment.o
$(THIS)complex.o:	\
	$(THIS)langx.o	\
	$(THIS)bpower.o	\
	$(THIS)integer.o	\
	$(THIS)string.o
$(THIS)debug.o:	\
	$(THIS)langx.o	\
	$(THIS)textwrit.o
$(THIS)dfloat.o:	\
	$(THIS)langx.o	\
	$(THIS)sfloat.o
$(THIS)efuns.o:	\
	$(THIS)complex.o	\
	$(THIS)except.o	\
	$(THIS)dfloat.o	\
	$(THIS)textwrit.o
$(THIS)except.o:	\
	$(THIS)axlcat.o
$(THIS)file.o:	\
	$(THIS)pointer.o	\
	$(THIS)array.o	\
	$(THIS)fname.o	\
	$(THIS)axl_char.o
$(THIS)axl_float.o:	\
	$(THIS)format.o	\
	$(THIS)except.o	\
	$(THIS)integer.o	\
	$(THIS)fprint.o	\
	$(THIS)segment.o
$(THIS)fmtout.o:	\
	$(THIS)textwrit.o
$(THIS)fname.o:	\
	$(THIS)oslow.o
$(THIS)format.o:	\
	$(THIS)axl_char.o	\
	$(THIS)dfloat.o	\
	$(THIS)textwrit.o
$(THIS)fprint.o:	\
	$(THIS)langx.o	\
	$(THIS)string.o
$(THIS)fstring.o:	\
	$(THIS)textwrit.o
$(THIS)gener.o:	\
	$(THIS)basic.o
$(THIS)hinteger.o:	\
	$(THIS)sinteger.o
$(THIS)imod.o:	\
	$(THIS)bpower.o	\
	$(THIS)integer.o	\
	$(THIS)axlcat.o	\
	$(THIS)segment.o
$(THIS)integer.o:	\
	$(THIS)sinteger.o
$(THIS)langx.o:	\
	$(THIS)axlcat.o	\
	$(THIS)segment.o	\
	$(THIS)list.o
$(THIS)list.o:	\
	$(THIS)pointer.o	\
	$(THIS)sinteger.o	\
	$(THIS)tuple.o
$(THIS)machine.o:	\
	$(THIS)lang.o
$(THIS)object.o:	\
	$(THIS)langx.o
$(THIS)opsys.o:	\
	$(THIS)file.o
$(THIS)oslow.o:	\
	$(THIS)langx.o	\
	$(THIS)string.o
$(THIS)parray.o:	\
	$(THIS)integer.o
$(THIS)partial.o:	\
	$(THIS)pointer.o	\
	$(THIS)machine.o	\
	$(THIS)string.o
$(THIS)pfloat.o:	\
	$(THIS)format.o	\
	$(THIS)except.o	\
	$(THIS)fprint.o
$(THIS)pkarray.o:	\
	$(THIS)sinteger.o	\
	$(THIS)axlcat.o
$(THIS)pointer.o:	\
	$(THIS)axl_boolean.o
$(THIS)ratio.o:	\
	$(THIS)langx.o	\
	$(THIS)string.o	\
	$(THIS)bpower.o	\
	$(THIS)integer.o
$(THIS)ref.o:	\
	$(THIS)basic.o
$(THIS)segment.o:	\
	$(THIS)axl_boolean.o	\
	$(THIS)gener.o
$(THIS)sfloat.o:	\
	$(THIS)bpower.o	\
	$(THIS)integer.o	\
	$(THIS)string.o
$(THIS)sinteger.o:	\
	$(THIS)segment.o
$(THIS)sort.o:	\
	$(THIS)string.o	\
	$(THIS)list.o
$(THIS)string.o:	\
	$(THIS)array.o	\
	$(THIS)axl_char.o	\
	$(THIS)tuple.o	\
	$(THIS)axlcat.o
$(THIS)table.o:	\
	$(THIS)sfloat.o	\
	$(THIS)list.o	\
	$(THIS)textwrit.o
$(THIS)textread.o:	\
	$(THIS)string.o	\
	$(THIS)file.o
$(THIS)textwrit.o:	\
	$(THIS)opsys.o	\
	$(THIS)string.o
$(THIS)tuple.o:	\
	$(THIS)basic.o
$(THIS)uarray.o:	\
	$(THIS)sinteger.o
$(THIS)rtexns.o:	\
	$(THIS)langx.o	\
	$(THIS)textwrit.o