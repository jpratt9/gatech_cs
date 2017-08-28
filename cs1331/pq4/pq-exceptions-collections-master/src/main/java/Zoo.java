import java.util.List;
import java.util.ArrayList;
import java.util.Set;
import java.util.HashSet;
import java.util.Map;
import java.util.HashMap;

/**
 * @author   jpratt9
 * @version  1.0, 2015-10-13 10:53AM EST
 */

public class Zoo {

    private List<Animal> animals;
    private int count;

    public Zoo() {
        this.animals = new ArrayList<Animal>(10);
    }

    public void add(Animal a) {
        this.animals.add(a);
    }

    public List<Animal> getList() {
        return animals;
    }

    public Set<Animal> getTypes() {
        return new HashSet<Animal>(animals);
    }

    public Map<Animal, Integer> getAnimalCounts(Animal[] animals) {
        // returns a HashSet of the Animals contained within the Zoo's animals
        // (not the parameter for getAnimalCounts)
        Set<Animal> types = getTypes();
        Map<Animal, Integer> res = new HashMap<Animal, Integer>();
        // take into account every animal in the ZOO'S animal types
        // we use a set here to speed up the sorting (after all, we won't have
        // duplicates in the end!)
        for (Animal a : types) {
            res.put(a, 0);
        }

        // increment each value corresponding to the keys given by
        // the LOCAL animals
        for (Animal a : animals) {
            
                // if it already has that key,
                // increment the value corresponding to this key
                res.put(a, res.get(a) + 1);
            
        }
        return res;
    }
}
