public class Biplane implements Plane {

    private static final double MPG = 50; // miles per gallon
    private static final int TANK_SIZE = 120; // gallons

    public double getRange() {
        return (double) TANK_SIZE * MPG;
    }

    public int getHorsepower() {
        return 134;
    }

    @Override
    public String toString() {
        return "Biplane";
    }
}
