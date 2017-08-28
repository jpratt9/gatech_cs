import java.util.List;
import java.util.ArrayList;

/**
 * Represents a musician with a modifiable funds available for buying
 * instruments, set name, and modifiable List of owned instruments.
 *
 * @author jpratt9
 * @version 1.0, 10-20-2015
 */

public class Musician {
    private String name;
    private List<Instrument> instruments;
    private double funds;

    /**
     * Creates a Musician with all required parameters.  Note that funds is
     * rounded to the nearest 100th.
     * @param name the musician's name.
     * @param funds funds available for buying instruments.
     * @param starter the musician's starter instrument.
     */
    public Musician(String name, double funds, Instrument starter) {
        this.name = name;
        this.funds = (int) (funds * 100) / 100.0;
        instruments = new ArrayList<Instrument>();
        instruments.add(starter);
    }

    /**
     * Returns a clone of the musician's list of instruments.
     * @return a clone of the Musician's list of instruments.
     */
    public List<Instrument> getInstruments() {
        List<Instrument> res = new ArrayList<Instrument>();
        for (Instrument ins : instruments) {
            res.add(ins);
        }
        return res;
    }

    /**
     * Returns the funds the musician has available.
     * @return the funds the musician has available.
     */
    public double getFunds() {
        return funds;
    }

    /**
     * Returns the musician's name.
     * @return the musician's name.
     */
    public String getName() {
        return name;
    }

    /**
     * Attempts to purchase an instrument.  If it is successful, it will add
     * this instrument to their list and subtract the cost of the instrument
     * from their funds.  See notEnoughFundsCheck and sameInstrumentCheck.  Note
     * that funds are rounded off to the second decimal place.
     * @param i the instrument to be bought.
     */
    public void purchase(Instrument i) {
        try {
            notEnoughFundsCheck(i);
            sameInstrumentCheck(i);
            instruments.add(i);
            funds -= i.getPrice();
            funds = (int) (funds * 100) / 100.0;
        } catch (SameInstrumentException e) {
            e.printStackTrace();
        } catch (NotEnoughFundsException e) {
            e.printStackTrace();
        }
    }

    /**
     * Attempts to sell an instrument.  If it is successful, it will remove
     * this instrument from their instruments list and subtracts the cost of the
     * instrument from their funds.  See unownedInstrumentCheck and
     * lastInstrumentCheck.  Note that funds are rounded off to the second
     * decimal place.
     * @param i the instrument to be sold.
     */
    public void sell(Instrument i) {
        try {
            unownedInstrumentCheck(i);
            lastInstrumentCheck();
            instruments.remove(i);
            funds += i.getPrice();
            funds = (int) (funds * 100) / 100.0;
        } catch (UnownedInstrumentException e) {
            e.printStackTrace();
        } catch (LastInstrumentException e) {
            e.printStackTrace();
        }

    }

    // throws a NotEnoughFundsException if the instrument is too expensive
    private void notEnoughFundsCheck(Instrument i) throws
            NotEnoughFundsException {
        if (i.getPrice() > funds) {
            throw(new NotEnoughFundsException(name + " cannot afford the "
                    + "following instrument: " + i.toString()));
        }
    }

    // throws a SameInstrumentException if the musician already owns this
    // instrument
    private void sameInstrumentCheck(Instrument i) throws
            SameInstrumentException {
        for (Instrument ins : instruments) {
            if (ins.getSerial().equals(i.getSerial())) {
                throw(new SameInstrumentException(name + " already has an "
                        + "instrument with this SN - " + ins.toString()));
            }
        }
    }

    // throws a LastInstrumentException if the musician attempts to sell their
    // last instruemnt
    private void lastInstrumentCheck() throws LastInstrumentException {
        if (instruments.size() == 1) {
            throw(new LastInstrumentException(name + " tried selling their "
                    + "last instrument."));
        }
    }

    // throws an UnownedInstrumentException if the musician does not own this
    // instrument
    private void unownedInstrumentCheck(Instrument i) throws
            UnownedInstrumentException {
        if (!instruments.contains(i)) {
            throw(new UnownedInstrumentException(name + " tried to sell an "
                    + "instrument they don't own - " + i.toString() + "."));
        }
    }


}