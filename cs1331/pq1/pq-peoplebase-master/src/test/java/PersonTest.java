import static org.junit.Assert.*;
import org.junit.Test;

public class PersonTest {
    @Test
    public void constructorTest() {
        try {
            Person a = new Person("Bob", "Peoria");
        } catch (Throwable t) {
            fail("-10 Constructor threw exception for valid input:");
        }
    }

    @Test
    public void gettersTest() {
        String expectedName = "Bob";
        String expectedHomeTown = "Peoria";
        Person p = new Person(expectedName, expectedHomeTown);
        assertEquals("-10 getName() returns incorrect value:",
                     expectedName, p.getName());
        assertEquals("-10 getHomeTown() returns incorrect value",
                     expectedHomeTown, p.getHomeTown());
    }
}
