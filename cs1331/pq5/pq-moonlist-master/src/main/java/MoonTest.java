public class MoonTest {

    public static void main(String[] args) {
        MoonList moonList = new MoonList(10);
        moonList.add(new Moon("Triton", Moon.Planet.NEPTUNE));
        moonList.add(new Moon("Io", Moon.Planet.JUPITER));
        moonList.add(new Moon("Phobos", Moon.Planet.MARS));
        moonList.add(new Moon("Titania", Moon.Planet.URANUS));
        moonList.add(new Moon("Ganymede", Moon.Planet.JUPITER));
        moonList.add(new Moon("Deimos", Moon.Planet.MARS));
        moonList.add(new Moon("Callisto", Moon.Planet.JUPITER));
        moonList.add(new Moon("Titan", Moon.Planet.SATURN));
        moonList.add(new Moon("Europa", Moon.Planet.JUPITER));
        moonList.add(new Moon("Moon (The)", Moon.Planet.EARTH));

        moonList.sortByName();
        System.out.println("If you want to test the code, edit the "
            + " MoonTest.java file after you make MoonList implement Iterable"
            + " and uncomment the indicated lines");

        moonList.forEach(System.out::println);
        System.out.println();
        moonList.sortByPlanet();

        moonList.forEach(System.out::println);
        System.out.println("Planets from closest to the sun to farthest are "
                + "Mercury -> Venus -> Earth -> Mars -> Jupiter -> Saturn"
                + " -> Uranus -> Neptune");
        System.out.println("Note: Mecury and Venus do not have moons,"
                + " so they will not appear on this list");
    }
}
