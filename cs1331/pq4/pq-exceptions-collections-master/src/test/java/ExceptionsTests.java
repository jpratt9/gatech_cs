import static org.junit.Assert.*;
import static org.junit.Assume.*;
import org.junit.Test;

import java.lang.reflect.*;
import java.util.Arrays;

public class ExceptionsTests {
    private static final String EXCEPTION_CLASS_NAME = "NoSuchUserException";

    public static Class<?> getExceptionClass() {
        try {
            return Class.forName(EXCEPTION_CLASS_NAME);
        } catch (ClassNotFoundException e) {
            return null;
        }
    }

    public static boolean exceptionClassExists() {
        return getExceptionClass() != null;
    }

    @Test
    public void exceptionExists() {
        assertTrue("-45 Could not find " + EXCEPTION_CLASS_NAME + " class",
            exceptionClassExists());
    }

    @Test
    public void exceptionIsException() {
        assumeTrue(exceptionClassExists());
        //TODO update point value
        assertTrue("-10 " + EXCEPTION_CLASS_NAME + " isn't an exception",
            Throwable.class.isAssignableFrom(getExceptionClass())); 
    }

    @Test
    public void exceptionIsChecked() {
        assumeTrue(exceptionClassExists());
        assertTrue("-5 " + EXCEPTION_CLASS_NAME + " isn't checked",
            !getExceptionClass().getSuperclass().equals(RuntimeException.class)
            && 
            !getExceptionClass().getSuperclass().equals(Error.class));
    }

    @Test
    public void exceptionConstructor() {
        assumeTrue(exceptionClassExists());
        Constructor<?> fullConstructor = null; 
        Constructor<?> intConstructor = null; 
        Constructor<?> throwableConstructor = null; 
        try {
            fullConstructor = getExceptionClass()
                .getConstructor(int.class, Throwable.class);
        } catch (Exception e) {}

        try {
            intConstructor = getExceptionClass()
                .getConstructor(int.class);
        } catch (Exception e) {}
        
        try {
            throwableConstructor = getExceptionClass()
                .getConstructor(Throwable.class);
        } catch (Exception e) {}

        if (fullConstructor == null) {
            if (intConstructor == null && throwableConstructor != null) {
                fail("-10 " + EXCEPTION_CLASS_NAME + " constructor is missing"
                    + " int parameter");
            } else if (throwableConstructor == null && intConstructor != null) {
                fail("-5 " + EXCEPTION_CLASS_NAME + " constructor is missing"
                    + " Throwableparameter");
            } else {
                fail("-15 could not find constructor for "
                    + EXCEPTION_CLASS_NAME + " that takes in an int and"
                    + " a Throwable.");
            }
        }
    }        

    @Test
    public void exceptionMessage() {
        assumeTrue(exceptionClassExists());
        Object exception = null;
        try {
            exception = getExceptionClass().getConstructor(int.class,
                Throwable.class).newInstance(7, null);
        } catch (Exception e) {
            try {
                exception = getExceptionClass().getConstructor(int.class)
                    .newInstance(7);
            } catch (Exception e2) {
                // Just return; they'll lose points for not having the 
                // constructor right anyway
                return;
            }
        }
        
        try {
            assertEquals("-10 Exception message was not correct",
                "User 7 does not exist",
                ((String) getExceptionClass().getMethod("getMessage")
                    .invoke(exception)).trim());
        } catch (Exception e) {
            fail("-10 Exception message not correct due to getMessage method"
                + " not existing. Are you sure " + EXCEPTION_CLASS_NAME
                + " is actually an exception?");
        }
    }

    @Test
    public void exceptionCause() {
        assumeTrue(exceptionClassExists());
        Object exception = null;
        Throwable cause = new Throwable("Test throwable");
        try {
            exception = getExceptionClass().getConstructor(int.class,
                Throwable.class).newInstance(0, cause);
        } catch (Exception e) {
            try {
                exception = getExceptionClass().getConstructor(Throwable.class)
                    .newInstance(cause);
            } catch (Exception e2) {
                // Just return; they'll lose points for not having the 
                // constructor right anyway
                return;
            }
        }
        
        try {
            assertEquals("-5 Exception cause was not correct",
                cause,
                getExceptionClass().getMethod("getCause").invoke(exception));
        } catch (Exception e) {
            fail("-5 Exception message not correct due to getCause method"
                + " not existing. Are you sure " + EXCEPTION_CLASS_NAME
                + " is actually an exception?");
        }
    }

    @Test
    public void userDao() {
        UserDao dao = new UserDao(new String[] {"tshields3"});
        try {
            dao.getUser(7); 
        } catch(Throwable e) {
            if (e instanceof ArrayIndexOutOfBoundsException) {
                if (exceptionClassExists()) {
                    fail("-20 Doesn't catch ArrayIndexOutOfBoundsException "
                        + "in UserDao");
                } else {
                    fail("-5 Doesn't catch ArrayIndexOutOfBoundsException or"
                        + " throw " + EXCEPTION_CLASS_NAME + " in UserDao");
                }
            } else if (getExceptionClass().isInstance(e)) {
                if (!(e.getCause() instanceof ArrayIndexOutOfBoundsException)) {
                    fail("-5 Doesn't set ArrayIndexOutOfBoundsException "
                        + " as cause of " + EXCEPTION_CLASS_NAME);
                } else {
                    return;
                }
            } else {
                return;
            }
        }

        fail("-15 Doesn't throw " + EXCEPTION_CLASS_NAME + " in UserDao");
    }

}
