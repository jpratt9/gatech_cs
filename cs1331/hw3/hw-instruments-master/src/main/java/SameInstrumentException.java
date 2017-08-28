/**
 * This exception will be thrown by all concrete subclasses of Instrument in the
 * sameInstrumentCheck method when a Musician attempts to purchase an
 * instrument that they already own.  It is caught in the purchase method of the
 * same class.
 *
 * @author jpratt9
 * @version 1.0, 10-20-2015
 */

public class SameInstrumentException extends Exception {

    /**
     * Creates a SameInstrumentException with the specified detail
     * message.
     * @param message the detail message.
     */
    public SameInstrumentException(String message) {
        super(message);
    }
}