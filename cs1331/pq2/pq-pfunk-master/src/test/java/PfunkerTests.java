import static org.junit.Assert.*;
import static org.junit.Assume.*;
import org.junit.Test;

import java.lang.reflect.*;

public class PfunkerTests {
    private static Class pfunkerClass;

    public static Class<?> getPfunkerClass() {
        try {
            return Class.forName("Pfunker");
        } catch (ClassNotFoundException e) {
            return null;
        }
    }

    public static boolean pfunkerClassExists() {
        try {
            pfunkerClass = Class.forName("Pfunker");
        } catch (ClassNotFoundException e) {
            return false;
        }
        return true;
    }

    @Test
    public void pfunkerExists() {
        assertTrue("-60 Could not find class Pfunker", pfunkerClassExists());
    }

    @Test
    public void lollypopExtends() {
        assumeTrue(pfunkerClassExists());
        assertTrue("-5 Lollypop class doesn't extend Pfunker",
            Lollypop.class.getSuperclass().equals(pfunkerClass));
    }

    @Test
    public void cloneExtends() {
        assumeTrue(pfunkerClassExists());
        assertTrue("-5 Clone class doesn't extend Pfunker",
            Clone.class.getSuperclass().equals(pfunkerClass));
    }

    @Test
    public void pfunkerAbstract() {
        assumeTrue(pfunkerClassExists());
        assertTrue("-5 Pfunker is not abstract",
            Modifier.isAbstract(pfunkerClass.getModifiers()));
    }

    @Test
    public void pfunkerConstructor() {
        assumeTrue(pfunkerClassExists());
        try {
            pfunkerClass.getConstructor(String.class);
        } catch (NoSuchMethodException e) {
            fail("-5 no constructor in Pfunker that takes in the name");
        }
    }

    @Test
    public void pfunkerGetName() {
        assumeTrue(pfunkerClassExists());
        try {
            //Object chris = pfunkerClass.getConstructor(String.class)
            //    .newInstance("Chris");
            //assertEquals("-3 getName returns wrong value",
            //    "Chris",
            pfunkerClass.getMethod("getName"); //.invoke(chris));
        } catch (NoSuchMethodException e) {
            fail("-5 no getName method in Pfunker");
        }
    }

    @Test
    public void getNameRefactoredLollypop() {
        assumeTrue(pfunkerClassExists());
        try {
            assertEquals("-3 getName() isn't refactored out of Lollypop",
                pfunkerClass, Lollypop.class.getMethod("getName")
                    .getDeclaringClass());
        } catch (NoSuchMethodException e) {
            //TODO?
        }
    }

    @Test
    public void getNameRefactoredClone() {
        assumeTrue(pfunkerClassExists());
        try {
            assertEquals("-3 getName() isn't refactored out of Clone",
                pfunkerClass, Clone.class.getMethod("getName")
                    .getDeclaringClass());
        } catch (NoSuchMethodException e) {
            //TODO?
        }
    }

    @Test
    public void lollypopGetName() {
        assertEquals("-2 Lollypop getName() returns incorrect value",
            "Thomas", new Lollypop("Thomas").getName());
    }

    @Test
    public void cloneGetName() {
        assertEquals("-2 Clone getName() returns incorrect value",
            "Chris", new Clone("Chris").getName());
    }

    @Test
    public void pfunkerAccomplishTask() {
        assumeTrue(pfunkerClassExists());
        try {
            assertTrue("-6 Pfunker accomplishTask is not abstract",
                Modifier.isAbstract(pfunkerClass
                    .getMethod("accomplishTask", String.class).getModifiers()));
        } catch (NoSuchMethodException e) {
            fail("-10 no accomplishTask(String task) method in Pfunker");
        }
    }

    @Test
    public void lollypopAccomplishTask() {
        assertEquals("-2 Lollypop accomplishTask returns incorrect value",
            "Thomas will grading by pulling two all-nighters"
            + " in a row.", new Lollypop("Thomas").accomplishTask("grading"));
    }

    @Test
    public void cloneAccomplishTask() {
        assertEquals("-2 Clone accomplishTask returns incorrect value",
            "Chris will his thesis by working on it between "
            + "ultimate frisbee games.", new Clone("Chris")
                .accomplishTask("his thesis"));
    }


}
