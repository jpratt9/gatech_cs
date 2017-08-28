/**
 * Represents a flute with a set price, serial number, and tuning.
 *
 * @author jpratt9
 * @version 1.0, 10-20-2015
 */

public class Flute extends Woodwind {

    /**
     * Creates a Flute with all required parameters.
     * @param price the price of the instrument.
     * @param tuning the tuning quality of the instrument.
     */
    public Flute(double price, String tuning) {
        super(price, tuning);
    }

    /**
     * Creates a Woodwind instrument with default tuning (See WoodWind).
     * @param price the price of the instrument.
     */
    public Flute(double price) {
        super(price);
    }

    /**
     * @return the sound the Flute makes.
     */
    public String play() {
        return "toodaloodalooo...";
    }

    /**
     * Converts the Flute to a readable format detailing all of its instance
     * variables.
     * @return String representation of the Flute.
     */
    @Override
    public String toString() {
        return "Flute - $" + String.format("%.2f", getPrice()) + ", SN:"
                + getSerial() + ", Tuning: \"" + getTuning() + ".\"";
    }

    /**
     * Checks whether or not two Flutes are equal by comparing serial numbers.
     * @param obj other Object for this Flute to be compared to.
     * @return true if the two have the same serial number.
     */
    @Override
    public boolean equals(Object obj) {
        if (obj == null  || !(obj instanceof Flute)) {
            return false;
        } else {
            return this.getSerial().equals(((Flute) obj).getSerial());
        }
    }

    /**
     * Returns a hash code value for the object.
     * @return true if the two have the same serial number.
     */
    @Override
    public int hashCode() {
        return getSerial().hashCode();
    }
}