import java.util.Calendar;

/**
 * Represents an instrument with a set price and serial number.
 *
 * @author jpratt9
 * @version 1.0, 10-20-2015
 */

public abstract class Instrument {

    protected static final String CHARS =
            "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    protected static final int BASE = 36;
    protected static Calendar c = Calendar.getInstance();
    private double price;
    private String serial;

    /**
     * Creates an Instrument with all required parameters.
     * @param price the price of the instrument
     */
    public Instrument(double price) {
        this.price = (int) (price * 100) / 100.0;
        this.serial = makeSN();
        c.add(Calendar.MILLISECOND, 1);  // increment our "date" so that each
                                         // instrment has a guaranteed unique SN
    }

    // encodes the current system time into a String to be used as a SN
    private String makeSN() {
        long num = c.getTime().getTime();
        String res = "";
        while (num > 0) {
            res = res + CHARS.charAt((int) (num % BASE));
            num /= BASE;
        }
        return new StringBuilder(res).reverse().toString();
    }

    /**
     * @return this instrument's sound.
     */
    public abstract String play();

    /**
     * @return this instrument's price
     */
    public double getPrice() {
        return price;
    }

    /**
     * @return this instrument's serial number
     */
    public String getSerial() {
        return serial;
    }
}