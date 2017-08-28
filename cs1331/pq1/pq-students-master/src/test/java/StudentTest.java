import static org.junit.Assert.*;
import org.junit.Test;
import java.util.regex.Matcher;

public class StudentTest {
    Course[] courses = {new Course("CS 1331", 3, 4),
            new Course("ENGL 1101", 3, 3), new Course("MATH 1501", 4, 2)};

    @Test
    public void constructorTest() {
        try {
            Student stud = new Student("George P.", courses);
        } catch (Throwable t) {
            fail("-10 Constructor threw exception for valid input:");
        }
    }

    @Test
    public void getCreditsTest() {
        Student stud = new Student("George P.", courses);
        assertEquals("-10 Student getCredits() returns incorrect value:",
                10, stud.getCredits());
    }

    @Test
    public void toStringTest() {
        Student stud = new Student("George P.", courses);
        assertEquals("-10 Student toString() returns incorrect value:",
                "George P. is taking 3 courses:\nCS 1331: 4\nENGL 1101: 3\n"
                + "MATH 1501: 2\n", stud.toString().replaceAll(
                Matcher.quoteReplacement(System.getProperty("line.separator")),
                "\n").replaceAll(Matcher.quoteReplacement(" \n"), "\n"));
    }
    
    @Test
    public void getGPATest() {
        Student stud = new Student("George P.", courses);
        if (stud.getGPA() == 2) {
            fail("-4 Student getGPA value is close but not exactly right.");
        } else if (stud.getGPA() != 2.9) {
            fail("-7 Student getGPA returns incorrect value.");
        }
    }
}
