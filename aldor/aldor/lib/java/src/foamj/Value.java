package foamj;


import foamj.FoamJ.*;
import foamj.FoamJ.Byte;

import java.math.BigInteger;


/**
 * Generic type used where we have to pass random objects around
 */
public interface Value {
    Word asWord();

    int toSInt();

    BigInteger toBInt();

    short toHInt();

    byte toByte();

    double toDFlo();

    float toSFlo();

    Object toArray();

    Record toRecord();

    Clos toClos();

    MultiRecord toMulti();

    boolean toBool();

    char toChar();

    Object toPtr();

    Env toEnv();

    <T> T toJavaObj();

    public class U {
        static public Record toRecord(Value value) {
            if (value == null)
                return null;
            else
                return value.toRecord();
        }

        public static Value fromBool(boolean b) {
            return new Bool(b);
        }

        public static Value fromSInt(int x) {
            return new SInt(x);
        }

        public static Value fromArray(Object x) {
            return new Array(x);
        }

        public static Value fromBInt(BigInteger x) {
            return new BInt(x);
        }

        public static Value fromPtr(Object o) {
            return new Ptr(o);
        }

        public static Value fromSFlo(float o) {
            return new SFlo(o);
        }

        public static Value fromDFlo(double o) {
            return new DFlo(o);
        }

        public static Value fromChar(char o) {
            return new Char(o);
        }

        public static Value fromByte(byte o) {
            return new Byte(o);
        }

        public static Value fromHInt(short o) {
            return new HInt(o);
        }

	public static <T> Value fromJavaObj(T obj) {
	    return new JavaObj<T>(obj);
	}
    }
}
