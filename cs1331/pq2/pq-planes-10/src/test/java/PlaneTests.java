import static org.junit.Assert.*;
import static org.junit.Assume.*;
import org.junit.Test;

import java.lang.reflect.*;
import java.util.Arrays;

public class PlaneTests {
    private static Class<?> planeClass;

    public static Class<?> getPlaneClass() {
        try {
            return Class.forName("Plane");
        } catch (ClassNotFoundException e) {
            return null;
        }
    }

    public static boolean planeClassExists() {
        try {
            planeClass = Class.forName("Plane");
        } catch (ClassNotFoundException e) {
            return false;
        }
        return true;
    }

    @Test
    public void planeExists() {
        assertTrue("-60 Could not find Plane interface", planeClassExists());
    }

    @Test
    public void planeInterface() {
        assumeTrue(planeClassExists());
        assertTrue("-10 Plane is not an interface",
            Modifier.isInterface(planeClass.getModifiers()));
    }

    @Test
    public void biplaneImplements() {
        assumeTrue(planeClassExists());
        assertTrue("-10 Biplane class doesn't implement Plane",
            Arrays.asList(Biplane.class.getInterfaces()).contains(planeClass));
    }

    @Test
    public void jetImplements() {
        assumeTrue(planeClassExists());
        assertTrue("-10 Jet class doesn't implement Plane",
            Arrays.asList(Jet.class.getInterfaces()).contains(planeClass));
    }

    @Test
    public void planeGetRange() {
        assumeTrue(planeClassExists());
        try {
            planeClass.getMethod("getRange");
        } catch (NoSuchMethodException e) {
            fail("-5 no getRange method in Plane");
        }
    }

    @Test
    public void planeGetHorsepower() {
        assumeTrue(planeClassExists());
        try {
            planeClass.getMethod("getHorsepower");
        } catch (NoSuchMethodException e) {
            fail("-5 no getHorsepower method in Plane");
        }
    }

    @Test
    public void biplaneGetRange() {
        assertEquals("-2 Biplane getRange() returns incorrect value",
                6000.0, new Biplane().getRange(), 0.1);
    }

    @Test
    public void jetGetRange() {
        assertEquals("-2 Jet getRange() returns incorrect value",
                31324.0, new Jet().getRange(), 0.1);
    }

    @Test
    public void biplaneGetHorsepower() {
        assertEquals("-2 Biplane getHorsepower() returns incorrect value",
            134, new Biplane().getHorsepower());
    }

    @Test
    public void jetGetHorsepower() {
        assertEquals("-2 Jet getHorsepower() returns incorrect value",
            300, new Jet().getHorsepower());
    }
}
