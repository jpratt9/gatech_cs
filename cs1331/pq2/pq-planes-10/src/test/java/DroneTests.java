import static org.junit.Assert.*;
import static org.junit.Assume.*;
import org.junit.Test;

import java.lang.reflect.*;
import java.util.Arrays;

public class DroneTests {
    private static final String DRONE_CLASS_NAME = "Drone";
    private static final double DRONE_RANGE = 244.0;
    private static final int DRONE_HORSEPOWER = 288;

    private Class<?> droneClass;
    private Class<?> planeClass = PlaneTests.getPlaneClass();

    private boolean droneClassExists() {
        try {
            droneClass = Class.forName(DRONE_CLASS_NAME);
        } catch (ClassNotFoundException e) {
            return false;
        }
        return true;
    }

    @Test
    public void droneExists() {
        assertTrue("-40 Could not find class " + DRONE_CLASS_NAME, droneClassExists());
    }

    @Test
    public void droneImplements() {
        assumeTrue(PlaneTests.planeClassExists());
        assumeTrue(droneClassExists());
        assertTrue("-10 " + DRONE_CLASS_NAME + " class doesn't implement Plane",
            Arrays.asList(droneClass.getInterfaces()).contains(planeClass));
    }

    @Test
    public void droneConstructor() {
        assumeTrue(PlaneTests.planeClassExists());
        assumeTrue(droneClassExists());
        try {
            droneClass.getConstructor(int.class, double.class);
        } catch (Exception e) {
            fail("-5 couldn't find constructor for " + DRONE_CLASS_NAME + " that takes in a horsepower and range");
        }
    }

    @Test
    public void droneGetRange() {
        assumeTrue(PlaneTests.planeClassExists());
        assumeTrue(droneClassExists());
        try {
            Object drone = droneClass.getConstructor(int.class, double.class)
                .newInstance(DRONE_HORSEPOWER, DRONE_RANGE);

            assertEquals("-5 " + DRONE_CLASS_NAME
                + " getRange() returns incorrect value", DRONE_RANGE,
                (Double) droneClass.getMethod("getRange").invoke(drone), 0.1);
        } catch (NoSuchMethodException e) {
            fail("-5 getRange() isn't present in Plane, can't test return value in " + DRONE_CLASS_NAME);
        } catch (InvocationTargetException | IllegalAccessException | InstantiationException e) {
            fail("-5 " + DRONE_CLASS_NAME + " doesn't have a constructor that takes in a horsepower and range; can't test method");
        }
    }

    @Test
    public void droneGetHorsepower() {
        assumeTrue(PlaneTests.planeClassExists());
        assumeTrue(droneClassExists());
        try {
            Object drone = droneClass.getConstructor(int.class, double.class)
                .newInstance(DRONE_HORSEPOWER, DRONE_RANGE);

            assertEquals("-5 " + DRONE_CLASS_NAME + " getHorsepower() returns incorrect value",
                DRONE_HORSEPOWER, droneClass.getMethod("getHorsepower").invoke(drone));
        } catch (NoSuchMethodException e) {
            fail("-5 getHorsepower() isn't present in Plane, can't test return value in " + DRONE_CLASS_NAME);
        } catch (InvocationTargetException | IllegalAccessException | InstantiationException e) {
            fail("-5 " + DRONE_CLASS_NAME + " doesn't have a constructor that takes in a horsepower and range; can't test method");
        }
    }

}
