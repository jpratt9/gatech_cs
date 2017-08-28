/**
 * Represents a violin with a set price, serial number, and
 * condition of having a plucked string.
 *
 * @author jpratt9
 * @version 1.0, 10-20-2015
 */

public class Violin extends Stringed {

    /**
     * Creates a Violin with all required parameters.
     * @param price the price of the instrument
     * @param plucked whether or not the instrument has a plucked string
     */
    public Violin(double price, boolean plucked) {
        super(price, plucked);
    }

    /**
     * Creates a Violin without any plucked strings.
     * @param price the price of the instrument.
     */
    public Violin(double price) {
        super(price);
    }

    /**
     * Returns the sound of the instrument as a String.
     * @return the sound the Violin makes.
     */
    public String play() {
        return "fiddle fiddle dee fiddle dee...";
    }

    /**
     * Converts the Violin to a readable format detailing all of its instance
     * variables.
     * @return String representation of the Violin.
     */
    @Override
    public String toString() {
        return "Violin - $" + String.format("%.2f", getPrice()) + ", SN:"
                + getSerial() + ", Plucked: " + getPlucked();
    }

    /**
     * Checks whether or not two Violins are equal by comparing serial numbers.
     * @param obj other Object for this Violin to be compared to.
     * @return true if the two have the same serial number.
     */
    @Override
    public boolean equals(Object obj) {
        if (obj == null || !(obj instanceof Violin)) {
            return false;
        } else {
            return this.getSerial().equals(((Violin) obj).getSerial());
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