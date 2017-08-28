/**
 * Represents a trumpet with a set price, serial number, and volume.
 *
 * @author jpratt9
 * @version 1.0, 10-20-2015
 */

public class Trumpet extends Brass {

    /**
     * Creates a Trumpet with all required parameters.
     * @param price the price of the instrument
     * @param numStickyValves the number of sticky valves the instrument has.
     */
    public Trumpet(double price, int numStickyValves) {
        super(price, numStickyValves);
    }

    /**
     * Creates a Trumpet without any sticky valves.
     * @param price the price of the instrument.
     */
    public Trumpet(double price) {
        super(price);
    }

    /**
     * Returns the sound of the instrument as a String.
     * @return the sound a Trumpet makes.
     */
    public String play() {
        return "JOHN CENA!!! doo-doodoo-dooooo...";
    }

    /**
     * Converts the Trumpet to a readable format detailing all of its instance
     * variables.
     * @return String representation of the Trumpet.
     */
    @Override
    public String toString() {
        return "Trumpet - $" + String.format("%.2f", getPrice()) + ", SN:"
                + getSerial() + ", Number of Sticky Valves: "
                + getNumStickyValves();
    }

    /**
     * Checks whether or not two trumpets are equal by comparing serial numbers.
     * @param obj other Object for this trumpet to be compared to.
     * @return true if the two have the same serial number.
     */
    @Override
    public boolean equals(Object obj) {
        if (obj == null || !(obj instanceof Trumpet)) {
            return false;
        } else {
            return this.getSerial().equals(((Trumpet) obj).getSerial());
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