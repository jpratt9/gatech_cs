import static org.junit.Assert.*;
import org.junit.Test;
import org.junit.Before;

public class PeoplebaseTest {

    Person alice = new Person("Alice", "Peoria");
    Person baojiang = new Person("Baojiang", "Springfield");
    Person chaaya = new Person("Chaaya", "Atlanta");
    Person dominique = new Person("Dominique", "Springfield");

    Peoplebase pbase;

    @Before
    public void constructorTest() {
        try {
            pbase = new Peoplebase(alice, baojiang, chaaya, dominique);
        } catch (Throwable t) {
            fail("-10 Constructor threw exception for valid input:");
        }
    }

    @Test
    public void toStringTest() {
        assertEquals("-10 toString() returns incorrect value:",
                     "Alice from Peoria", alice.toString());
    }

    @Test
    public void findByNameTest() {
        assertEquals("-10 findByName(\"Chaaya\") returns incorrect value:",
                     chaaya, pbase.findByName("Chaaya"));
    }

    @Test
    public void findByHomeTownTest() {
        assertEquals("-10 findByHomeTown(\"Springfield\") returns incorrect value:",
                     baojiang, pbase.findByHomeTown("Springfield"));
    }
}
