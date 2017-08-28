import static org.junit.Assert.*;
import org.junit.Test;

public class CourseTest {


    @Test
    public void constructorTest() {
        try {
            Course course = new Course("CS 1331", 3, 4); 
        } catch (Throwable t) {
            fail("-10 Constructor threw exception for valid input:");
        }
    }

    @Test
    public void toStringTest() {
        Course course = new Course("CS 1331", 3, 4);
        assertEquals("-10 toString() returns incorrect value:",
                     "CS 1331: 4", course.toString().trim());
    }

    @Test
    public void getCreditsTest() {
        Course course = new Course("CS 1331", 3, 4);
        assertEquals("-10 getCredits() returns incorrect value:",
                     3, course.getCredits());
    }

    @Test
    public void getGradeTest() {
        Course course = new Course("CS 1331", 3, 4);
        assertEquals("-10 getGrade() returns incorrect value:",
                     4, course.getGrade()); 
    }
}
