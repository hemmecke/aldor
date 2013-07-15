#include "axlobs.h"
#include "testlib.h"
#include "abquick.h"

local void testSymeSExpr();

void
symeTest()
{
	init();
	TEST(testSymeSExpr);
	fini();
}

extern int stabDebug;

local void
testSymeSExpr()
{
	
	String aSimpleDomain = "+++Comment\nDom: Category == with {f: () -> () ++ f\n}";
	StringList lines = listList(String)(1, aSimpleDomain);
	AbSynList code = listCons(AbSyn)(stdtypes(), abqParseLines(lines));
	
	AbSyn absyn = abNewSequenceL(sposNone, code);

	initFile();
	Stab stab = stabFile();
	
	abPutUse(absyn, AB_Use_NoValue);
	scopeBind(stab, absyn);
	typeInfer(stab, absyn);

	testTrue("Declare is sefo", abIsSefo(absyn));
	testIntEqual("Error Count", 0, comsgErrorCount());

	SymeList symes = stabGetMeanings(stab, ablogFalse(), symInternConst("Dom"));
	testIntEqual("unique meaning", 1, listLength(Syme)(symes));

	Syme syme = car(symes);
	SExpr sx = symeSExprAList(syme);
	afprintf(dbOut, "%pSExpr", sx);
	
	finiFile();
}