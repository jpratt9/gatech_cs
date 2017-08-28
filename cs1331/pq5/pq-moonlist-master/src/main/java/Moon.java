public class Moon implements Comparable<Moon> {

    // Planets from closest to the sun to farthest are
    // Mercury -> Venus -> Earth -> Mars -> Jupiter -> Saturn
    // -> Uranus -> Neptune
    public enum Planet {
        MERCURY, VENUS, EARTH, MARS, JUPITER, SATURN, URANUS, NEPTUNE
    }

    private String name;
    private Planet planet; // planet that this moon orbits

    public Moon(String name, Planet planet) {
        this.name = name;
        this.planet = planet;
    }

    public String getName() {
        return name;
    }

    public Planet getPlanet() {
        return planet; // planet that this moon orbits
    }

    @Override
    public String toString() {
        return String.format("%s: %s", name, planet);
    }

    @Override
    public boolean equals(Object o) {
        if (o instanceof Moon) {
            return this.name.equals(((Moon) o).name);
        }
        return false;
    }

    @Override
    public int hashCode() {
        return this.name.hashCode();
    }

    @Override
    public int compareTo(Moon o) {
        Moon other = (Moon) o;
        return this.name.compareTo(other.getName());
    }
}
