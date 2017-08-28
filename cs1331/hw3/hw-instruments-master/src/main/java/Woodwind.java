/**
 * Represents a woodwind instrument with a set price, serial number, and
 * tuning quality.
 *
 * @author jpratt9
 * @version 1.0, 10-20-2015
 */

public abstract class Woodwind extends Instrument {

    private String tuning;

    /**
     * Creates a Woodwind instrument with all required parameters.
     * @param price the price of the instrument.
     * @param tuning the tuning quality of the instrument.
     */
    public Woodwind(double price, String tuning) {
        super(price);
        this.tuning = tuning;
    }

    /**
     * Creates a Woodwind instrument with tuning of "a little sharp."
     * @param price the price of the instrument.
     */
    public Woodwind(double price) {
        this(price, "A little sharp");
    }

    /**
     * @return the tuning quality of this Woodwind instrument.
     */
    public String getTuning() {
        return tuning;
    }
}