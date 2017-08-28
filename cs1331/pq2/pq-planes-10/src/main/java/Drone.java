public class Drone implements Plane {

    private int horsepower;
    private double range;

    public Drone(int horsepower, double range) {
        this.horsepower = horsepower;
        this.range = range;
    }

    public double getRange() {
        return range;
    }

    public int getHorsepower() {
        return horsepower;
    }
}