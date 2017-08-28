import java.util.*;

public class Trooper {
    private String name;
    private boolean mustached;
    public Trooper(String name, boolean hasMustache) {
        this.name = name; this.mustached = hasMustache;
    }
    public String getName() { return name; }
    public boolean hasMustache() { return mustached; }
    public boolean equals(Object other) {
        if (this == other) return true;
        if (null == other || !(other instanceof Trooper)) return false;
        Trooper that = (Trooper) other;
        return this.name.equals(that.name) && this.mustached == that.mustached;
    }

    public String toString() {
        return name + " - " + mustached;
    }
    public int hashCode() { return super.hashCode(); }

    public static void main(String[] args) {
        ArrayList<Trooper> troopers = new ArrayList<>();
        troopers.add(new Trooper("Farva", true));
        troopers.add(new Trooper("Farva", true));
        troopers.add(new Trooper("Rabbit", false));
        troopers.add(new Trooper("Mac", true));
        troopers.add(new Trooper("Tester", false));
        Collections.sort(troopers, new Comparator<Trooper>(){
            public int compare(Trooper a, Trooper b) {
                if (a.hasMustache() == b.hasMustache()) {
                    return a.getName().compareTo(b.getName());
                } else if (a.hasMustache()) {
                    return 1;
                } else {
                    return -1;
                }
            }   
        });
        troopers.forEach(System.out::println);
        System.out.println("-----");

        Comparator<Trooper> byMustacheThenName = Comparator.comparing(Trooper::getName).thenComparing(Trooper::hasMustache);
        Collections.sort(troopers, Comparator.comparing(Trooper::getName).thenComparing(Trooper::hasMustache));
        troopers.forEach(System.out::println);


    }
}