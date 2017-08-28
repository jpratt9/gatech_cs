import static org.junit.Assert.*;
import static org.junit.Assume.*;
import org.junit.Test;

import java.lang.reflect.*;

public class PyramidTests {
    private Class<?> pyramidClass;
    private Class<?> pfunkerClass = PfunkerTests.getPfunkerClass();

    private boolean pyramidClassExists() {
        try {
            pyramidClass = Class.forName("Pyramid");
        } catch (ClassNotFoundException e) {
            return false;
        }
        return true;
    }

    @Test
    public void pyramidExists() {
        assertTrue("-40 Could not find class Pyramid", pyramidClassExists());
    }

    @Test
    public void pyramidExtends() {
        assumeTrue(PfunkerTests.pfunkerClassExists());
        assumeTrue(pyramidClassExists());
        assertTrue("-5 Pyramid class doesn't extend Pfunker",
            pyramidClass.getSuperclass().equals(pfunkerClass));
    }

   @Test
    public void getNameRefactoredPyramid() {
        assumeTrue(PfunkerTests.pfunkerClassExists());
        assumeTrue(pyramidClassExists());
        try {
            assertEquals("-5 getName() isn't refactored out of Pyramid",
                pfunkerClass, pyramidClass.getMethod("getName")
                    .getDeclaringClass());
        } catch (NoSuchMethodException e) {
            // That's fine.
        }
    }

    //TODO: constructor test

    @Test
    public void pyramidGetName() {
        assumeTrue(PfunkerTests.pfunkerClassExists());
        assumeTrue(pyramidClassExists());
        try {
            Object sirnose = pyramidClass.getConstructor(String.class)
                .newInstance("sirnose");

            assertEquals("-5 Pyramid getName() returns incorrect value",
                "sirnose", pyramidClass.getMethod("getName").invoke(sirnose));
        } catch (NoSuchMethodException e) {
            fail("-5 getName() isn't present in Pfunker, can't test return value in Pyramid");
        } catch (InvocationTargetException | IllegalAccessException | InstantiationException e) {
            fail("-5 Pyramid doesn't have constructor that takes in a name; can't test method");
        }
    }

    @Test
    public void pyramidConstructor() {
        assumeTrue(PfunkerTests.pfunkerClassExists());
        assumeTrue(pyramidClassExists());
        try {
            pyramidClass.getConstructor(String.class);
        } catch (Exception e) {
            fail("-5 couldn't find constructor for Pyramid that takes in a name");
        }
    }

    @Test
    public void pyramidAccomplishTask() {
        assumeTrue(PfunkerTests.pfunkerClassExists());
        assumeTrue(pyramidClassExists());
        try {
            Object sirnose = pyramidClass.getConstructor(String.class)
                .newInstance("sirnose");

            assertEquals("-5 Pyramid accomplishTask returns incorrect value",
                "sirnose will research by delegating to graduate"
                + " students.", pyramidClass
                    .getMethod("accomplishTask", String.class)
                    .invoke(sirnose, "research"));
        } catch (NoSuchMethodException e) {
            fail("-10 Pyramid accomplishTask doesn't exist");
        } catch (InvocationTargetException | IllegalAccessException | InstantiationException e) {
            fail("-5 Pyramid doesn't have constructor that takes in a name; can't test method");
        }
    }

}
