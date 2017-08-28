/**
 * Represents a stringed instrument with a set price, serial number, and
 * condition of having a plucked string.
 *
 * @author jpratt9
 * @version 1.0, 10-20-2015
 */

public abstract class Stringed extends Instrument {

    private boolean plucked;

    /**
     * Creates a Stringed instrument with all required parameters.
     * @param price the price of the instrument
     * @param plucked whether or not the instrument has a plucked string
     */
    public Stringed(double price, boolean plucked) {
        super(price);
        this.plucked = plucked;
    }

    /**
     * Creates a Stringed instrument without any plucked strings.
     * @param price the price of the instrument.
     */
    public Stringed(double price) {
        this(price, false);
    }

    /**
     * @return whether this Stringed instrument is plucked.
     */
    public boolean getPlucked() {
        return plucked;
    }
}