import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class Zoo {
    // TODO: change below to use the appropriate Java collection instead of an
    // array
    private Animal[] animals;
    private int count;

    public Zoo() {
        this.animals = new Animal[10];
    }

    public void add(Animal a) {
        // TODO: delete all the code below and replace with a single line
        // after you change the array to a Java collection
        animals[count++] = a;
        if (count == animals.length) {
            animals = Arrays.copyOf(animals, count * 2);
        }
    }

    public List<Animal> getList() {
        // TODO: YOUR CODE HERE
        return null;
    }

    /*
     * TODO: YOUR CODE BELOW
     * Fill out the return type and method body
     **/

    /*
    public ?? getTypes() {
        // YOUR CODE HERE
    }
    */

    public Map<Animal, Integer> getAnimalCounts(Animal[] zooSection) {
        // TODO: YOUR CODE HERE

        return null;
    }
}
