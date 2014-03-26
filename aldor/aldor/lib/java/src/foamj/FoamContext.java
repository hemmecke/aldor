package foamj;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

public class FoamContext {
	
        public void startFoam(FoamClass c, String[] args) {
	    Word[] mainArgv = new Word[1];
	    mainArgv[0] = Word.U.fromArray(literalCharArray(c.getClass().getName()));
	    Globals.setGlobal("mainArgc", Word.U.fromSInt(1).toValue());
	    Globals.setGlobal("mainArgv", Word.U.fromArray(mainArgv).toValue());
	    c.run();
	}

	private static char[] literalCharArray(String s) {
	    char[] arr = new char[s.length()+1];
	    for (int i=0; i<s.length(); i++)
		arr[i] = s.charAt(i);
	    arr[s.length()] = '\0';

	    return arr;
	}


	@SuppressWarnings("unchecked")
	public Clos createLoadFn(final String name) {
		Fn loader = new Fn("constructor-"+name) {
			public Value ocall(Env env, Value... vals) {
				Class<FoamClass> c;
				try {
					c = (Class<FoamClass>) ClassLoader.getSystemClassLoader().loadClass(name);
					Constructor<FoamClass> cons = c.getConstructor(FoamContext.class);
					FoamClass fc = cons.newInstance(FoamContext.this);
					fc.run();
				} catch (ClassNotFoundException e) {
					throw new RuntimeException(e);
				} catch (SecurityException e) {
					throw new RuntimeException(e);
				} catch (NoSuchMethodException e) {
					throw new RuntimeException(e);
				} catch (IllegalArgumentException e) {
					throw new RuntimeException(e);
				} catch (InstantiationException e) {
					throw new RuntimeException(e);
				} catch (IllegalAccessException e) {
					throw new RuntimeException(e);
				} catch (InvocationTargetException e) {
					throw new RuntimeException(e);
				}
				return null;
			}
			
		};
		return new Clos(null, loader);
	}
	
	
}
