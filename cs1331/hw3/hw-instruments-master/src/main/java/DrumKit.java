/**
 * Represents a drum kit with a set price, serial number, and volume.
 *
 * @author jpratt9
 * @version 1.0, 10-20-2015
 */

public class DrumKit extends Percussion {

    /**
     * Creates a DrumSet with all required parameters.
     * @param price the price of the instrument.
     * @param volume how loud the instrument is, represented as a dynamic.
     */
    public DrumKit(double price, String volume) {
        super(price, volume);
    }

    /**
     * Creates a DrumSet with default volume (See Percussion).
     * @param price the price of the instrument.
     */
    public DrumKit(double price) {
        super(price);
    }

    /**
     * Returns the sound of the instrument as a String.
     * @return the sound the DrumSet makes.
     */
    public String play() {
        return "ba-dum-tss";
    }

    /**
     * Converts the DrumSet to a readable format detailing all of its instance
     * variables.
     * @return String representation of the DrumSet.
     */
    @Override
    public String toString() {
        return "Drum kit - $" + String.format("%.2f", getPrice()) + ", SN:"
                + getSerial() + ", Volume:\"" + getVolume() + "\"";
    }

    /**
     * Checks whether or not two drumsets are equal by comparing serial numbers.
     * @param obj other Object for this drumsets to be compared to.
     * @return true if the two have the same serial number.
     */
    @Override
    public boolean equals(Object obj) {
        if (obj == null || !(obj instanceof DrumKit)) {
            return false;
        } else {
            return this.getSerial().equals(((DrumKit) obj).getSerial());
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