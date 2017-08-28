import static org.junit.Assert.*;
import org.junit.Test;

public class ArithmeticSequenceTest {

    int firstTerm = 1;
    int difference = 2;
    ArithmeticSequence odds = new ArithmeticSequence(firstTerm, difference);

    @Test
    public void constructor() {
        try {
            ArithmeticSequence a = new ArithmeticSequence(1, 2);
        } catch (Throwable t) {
            fail("-10 Constructor threw exception for valid input:");
        }
    }

    @Test
    public void getters() {
        assertEquals("-10 getFirstTerm() returns incorrect value:",
                     firstTerm, odds.getFirstTerm());
        assertEquals("-10 getDifference() returns incorrect value",
                     difference, odds.getDifference());
    }

    @Test
    public void nth() {
        assertEquals("-10 nth(5) returns incorrect value:",
                     9, odds.nth(5));
    }

    @Test
    public void subsequence() {
        int[] exptected = new int[] {5, 7, 9, 11};
        assertArrayEquals("-10 subsequence(3, 6) returns incorrect value:",
                          exptected, odds.subsequence(3, 6));
    }

    @Test
    public void sumTo() {
        assertEquals("-10 sumTo(3) returns incorrect value:",
                     9, odds.sumTo(3));
    }
}
