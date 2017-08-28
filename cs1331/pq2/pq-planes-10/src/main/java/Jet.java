public class Jet implements Plane {

    private static final double MPG = 95.5; // miles per gallon
    private static final int TANK_SIZE = 328; // gallons

    public double getRange() {
        return (double) TANK_SIZE * MPG;
    }

    public int getHorsepower() {
        return 300;
    }

    @Override
    public String toString() {
        return "Jet";
    }
}
