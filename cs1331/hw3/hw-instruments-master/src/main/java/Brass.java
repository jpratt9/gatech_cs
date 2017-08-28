/**
 * Represents a brass instrument with a set price, serial number, and number of
 * sticky valves.
 *
 * @author jpratt9
 * @version 1.0, 10-20-2015
 */

public abstract class Brass extends Instrument {

    private int numStickyValves;

    /**
     * Creates a Brass instrument with all required parameters.
     * @param price the price of the instrument.
     * @param numStickyValves the number of sticky valves this Brass instrument
     *                        has.
     */
    public Brass(double price, int numStickyValves) {
        super(price);
        this.numStickyValves = numStickyValves;
    }

    /**
     * Creates a Brass instrument with no sticky valves.
     * @param price the price of the instrument.
     */
    public Brass(double price) {
        this(price, 0);
    }

    /**
     * @return the number of stick valves this Brass instrment has.
     */
    public int getNumStickyValves() {
        return numStickyValves;
    }
}