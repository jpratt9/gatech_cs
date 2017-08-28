/**
 * Represents a music store with musicians. Used for testing Instrument, Brass,
 * Woodwind, Percussion, Stringed, Trumpet, Flute, DrumKit, Violin, and
 * Musician.  Driver class. Please forgive double rounding errors (since we're
 * not allowed to use BigDecimal).
 *
 * @author jpratt9
 * @version 1.0, 10-20-2015
 */

public class MusicStore {

    private static Trumpet t1;
    private static Trumpet t2;
    private static Trumpet t3;
    private static Flute f1;
    private static Flute f2;
    private static DrumKit d1;
    private static DrumKit d2;
    private static Violin v1;
    private static Violin v2;
    private static Musician tom;

    // I used quite a few self-documenting helper methods here to make the main
    // method's process more clear.

    /**
     * Creates a Woodwind instrument with tuning of "a little sharp."
     * @param args command line arguments (none used)
     */
    public static void main(String[] args) {
        welcome();      // welcome message

        // initialize all instruments
        trumpetMake();
        fluteMake();
        drumKitMake();
        violinMake();

        tom = new Musician("Tom", 1000.00, t1); // Musician 1 starts with t1

        toStringTest(); // tests toString()
        playTest();     // tests play()

        // getter testing...
        getSerialTest();
        getPriceTest();
        getPropertyTest();

        println("((Normal purchase/sell testing)):");
        // normal (exception-free) buying and selling testing...
        buyAndSellTest();

        println("((Exception purchase/sell testing)):");
        notEnoughFundsTest();       // not enough funds exception testing
        unownedInstrumentTest();    // unowned instrument exception testing
        sameInstrumentTest();       // same instrument exception testing
        lastInstrumentTest();       // last instrument exception testing

        // adding another instrument type testing (?)
        println("Tom wants a violin - " + v1.toString());
        tom.purchase(v1);
        println("Tom's new balance is $" + tom.getFunds());
    }

    // I wrote a few self-documenting helper methods to help keep below the main
    // line limit

    // helper method to clean up SOP code
    private static void println(Object o) {
        System.out.println(o);
    }

    // welcome message
    private static void welcome() {
        println("---------------------------");
        println("Welcome to the Music Store!");
        println("---------------------------");
    }

    // initializes trumpets
    private static void trumpetMake() {
        t1 = new Trumpet(55.55, 3);     // Trumpet #1 uses constructor 1
        t2 = new Trumpet(399.99, 1);    // Trumpet #2 uses constructor 2
        t3 = new Trumpet(899.99);       // Trumpet #3 is "expensive"
    }

    // initializes flutes
    private static void fluteMake() {
        // Flute #1 uses Flute contructor #1
        f1 = new Flute(100.0, "Pretty good");
        // Flute #2 uses Flute contructor #2
        f2 = new Flute(50.0);
    }

    // initializes drum kits
    private static void drumKitMake() {
        // DrumKit #1 uses DrumKit contructor #1
        d1 = new DrumKit(99.99, "Mezzo forte");
        // DrumKit #2 uses DrumKit contructor #2
        d2 = new DrumKit(69.95);
    }

    // initializes violins
    private static void violinMake() {
        v1 = new Violin(49.99, true);   // Violin #1 uses Violin contructor #1
        v2 = new Violin(69.95);         // Violin #2 uses Violin contructor #2
    }

    // shows that all constructors worked, and that toString works correctly
    private static void toStringTest() {
        println("((toString testing))");
        println("(Trumpets):");
        println(t1.toString());
        println(t2.toString());
        println(t3.toString() + "\n");
        println("(Flutes):");
        println(f1.toString());
        println(f2.toString() + "\n");
        println("(Drum kits):");
        println(d1.toString());
        println(d2.toString() + "\n");
        println("(Violins):");
        println(v1.toString());
        println(v2.toString() + "\n\n");
    }

    // tests play()
    private static void playTest() {
        println("((play testing)):");
        println("The trumpet goes:  \"" + t1.play() + "\"");
        println("The flute goes:    \"" + f2.play() + "\"");
        println("The drumkit goes:  \"" + d1.play() + "\"");
        println("The violin goes:   \"" + d2.play() + "\"\n\n");
    }

    // tests getSerial()
    private static void getSerialTest() {
        println("((General getter testing)):");
        println("(getSerial testing):");
        println("Trumpet #1 SN:     \"" + t1.getSerial() + "\"");
        println("Flute #1 SN:       \"" + f1.getSerial() + "\"");
        println("Drum kit #1 SN:    \"" + d1.getSerial() + "\"");
        println("Violin #1 SN:      \"" + v1.getSerial() + "\"\n");
    }

    // tests getPrice()
    private static void getPriceTest() {
        println("(getPrice testing):");
        println("Trumpet #1 costs:     $" + t1.getPrice());
        println("Flute #1 costs:       $" + f1.getPrice());
        println("Drum kit #1 costs:    $" + d1.getPrice());
        println("Violin #1 costs:      $" + v1.getPrice() + "\n");
    }

    // tests class-specific getters:
    // getNumStickyValves(), getTuning(), getVolume(), and getPlucked()
    private static void getPropertyTest() {
        println("(Property getter testing):");
        println("Trumpet #1 has: " + t1.getNumStickyValves() + " sticky valves"
                + ".");
        println("Flute #1 has:       " + f1.getTuning() + " tuning.");
        println("Drum kit #1 has:    " + d1.getVolume() + " dynamic.");
        println("Violin #1 has plucked a plucked string? " + v1.getPlucked()
                + "\n\n");
    }

    // tests Musician buying and selling without exceptions
    private static void buyAndSellTest() {
        println("Tom will now buy t2...");
        tom.purchase(t2);
        println("Tom's new balance is $" + tom.getFunds() + ".");
        println("Tom will now sell t1...");
        tom.sell(t1);
        println("Tom's new balance is $" + tom.getFunds() + ".\n\n");
    }

    // tests the NotEnoughFundsException using an instrument that is too
    // expensive for Tom
    private static void notEnoughFundsTest() {
        println("(NotEnoughFundsException testing):");
        println("Tom will now attempt to buy t3...");
        tom.purchase(t3);
        println("Tom's new balance is $" + tom.getFunds() + ".\n");
    }

    // tests the UnownedInstrumentException by having Tom attempt to sell t3
    private static void unownedInstrumentTest() {
        println("(UnownedInstrumentException testing):");
        println("Tom will now attempt to sell t3...");
        tom.sell(t3);
        println("Tom's new balance is $" + tom.getFunds() + ".\n");
    }

    // tests SameInstrumentException
    private static void sameInstrumentTest() {
        println("(SameInstrumentException testing):");
        println("Tom will now attempt to buy t2...");
        tom.purchase(t2);
        println("Tom's new balance is $" + tom.getFunds() + ".\n");
    }

    // tests LastInstrumentException
    private static void lastInstrumentTest() {
        println("(LastInstrumentException testing):");
        println("Tom will now attempt to sell his last instruemnt...");
        tom.sell(t2);
        println("Tom's new balance is $" + tom.getFunds() + ".\n");
    }
}