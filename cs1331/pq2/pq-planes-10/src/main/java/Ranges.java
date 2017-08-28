public class Ranges {

    public static void main(String[] args) {
        worksWhenStarting();
        worksWhenFinished();
    }

    private static void worksWhenStarting() {
        Biplane testBiplane = new Biplane();
        Jet testJet = new Jet();

        System.out.println(testBiplane + "/" + testBiplane.getHorsepower() + "/"
                + testBiplane.getRange());
        System.out.println(testJet + "/" + testJet.getHorsepower() + "/"
                + testJet.getRange());
    }

    private static void worksWhenFinished() {
        Plane[] testPlanes = {new Biplane(),
            new Jet(),
            new Drone(100, 200.5)
        };

        for (Plane testPlane: testPlanes) {
            System.out.println(testPlane + " gets " + testPlane
                .getHorsepower()
                + "hp and has a range of " + testPlane.getRange()
                  + " miles.");
        }
    }
}
