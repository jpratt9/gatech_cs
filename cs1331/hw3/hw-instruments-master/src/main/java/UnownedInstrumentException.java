/**
 * This exception will be thrown by all concrete subclasses of Instrument in the
 * unownedInstrumentCheck method when a Musician attempts to sell an
 * instrument that they do not already own.  It is caught in the sell method of
 * the same class.
 *
 * @author jpratt9
 * @version 1.0, 10-20-2015
 */

public class UnownedInstrumentException extends Exception {

    /**
     * Creates a UnownedInstrumentException with the specified detail
     * message.
     * @param message the detail message.
     */
    public UnownedInstrumentException(String message) {
        super(message);
    }
}