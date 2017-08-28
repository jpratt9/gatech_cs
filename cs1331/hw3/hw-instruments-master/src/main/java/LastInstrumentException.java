/**
 * This exception will be thrown by all concrete subclasses of Instrument in the
 * lastInstrumentCheck method when a Musician attempts to sell their last
 * instrument.  It is caught in the purchase method of the same class.
 *
 * @author jpratt9
 * @version 1.0, 10-20-2015
 */

public class LastInstrumentException extends Exception {

    /**
     * Creates a LastInstrumentException with the specified detail
     * message.
     * @param message the detail message.
     */
    public LastInstrumentException(String message) {
        super(message);
    }
}