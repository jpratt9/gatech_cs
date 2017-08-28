/**
 * This exception will be thrown by all concrete subclasses of Instrument in the
 * notEnoughFundsCheck method when a Musician attempts to purchase an
 * instrument that costs more than they can afford.  It is caught in the
 * purchase method of the same class.
 *
 * @author jpratt9
 * @version 1.0, 10-20-2015
 */

public class NotEnoughFundsException extends Exception {

    /**
     * Creates a NotEnoughFundsException with the specified detail
     * message.
     * @param message the detail message.
     */
    public NotEnoughFundsException(String message) {
        super(message);
    }

}