/**
 * Represents a percussion instrument with a set price, serial number, and
 * loudness.
 *
 * @author jpratt9
 * @version 1.0, 10-20-2015
 */

public abstract class Percussion extends Instrument {

    private String volume;

    /**
     * Creates a Percussion instrument with all required parameters.
     * @param price the price of the instrument.
     * @param volume how loud the instrument is, represented as a dynamic.
     */
    public Percussion(double price, String volume) {
        super(price);
        this.volume = volume;
    }

    /**
     * Creates a Percussion instrument with Fortisimo volume.
     * @param price the price of the instrument.
     */
    public Percussion(double price) {
        this(price, "Fortisimo");
    }

    /**
    * @return the loudness of this Percussion instrument.
    */
    public String getVolume() {
        return volume;
    }
}