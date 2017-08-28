import static org.junit.Assert.*;
import static org.junit.Assume.*;
import org.junit.Test;

import java.lang.reflect.*;
import java.util.*;

public class CollectionsTests {
    
    @Test
    public void listTest() {
        Zoo z = new Zoo();
        List<Animal> animals = Arrays.asList(Animal.LION, Animal.LION,
            Animal.TIGER, Animal.BEAR, Animal.CROCODILE, Animal.ELEPHANT);

        animals.stream().forEach(z::add);

        Object result = z.getList();
        assertTrue("-10 getList doesn't return a List", result instanceof List);
        assertEquals("-10 getList returns incorrect value; make sure you've "
            + " switched the array to a list and modified the add method",
            animals, result);
    }

    @Test
    public void getTypes() {
        Zoo z = new Zoo();
        List<Animal> animals = Arrays.asList(Animal.LION, Animal.LION,
            Animal.TIGER, Animal.BEAR, Animal.CROCODILE, Animal.ELEPHANT,
            Animal.YELLOW_JACKET, Animal.YELLOW_JACKET, Animal.FOX, Animal.FOX,
            Animal.RHINO, Animal.CROCODILE, Animal.LION);
        animals.stream().forEach(z::add);
        try {
            Object types = Zoo.class.getMethod("getTypes").invoke(z);
            assertEquals("-20 getTypes returns incorrect value",
                new TreeSet(animals), types);
            assertTrue("-10 getTypes returns correct value, but not in a Set",
                types instanceof Set);
        } catch (Exception e) {
            fail("-20 getTypes method doesn't exist in Zoo or returns incorrect value");
        }
    }
    
    @Test
    public void getAnimalCounts() {
        Zoo z = new Zoo();
        List<Animal> animals = Arrays.asList(Animal.LION, Animal.LION,
            Animal.TIGER, Animal.BEAR, Animal.CROCODILE, Animal.ELEPHANT,
            Animal.YELLOW_JACKET, Animal.YELLOW_JACKET, Animal.FOX, Animal.FOX,
            Animal.RHINO, Animal.CROCODILE, Animal.LION);
        animals.stream().forEach(z::add);
        
        Animal[] section = {Animal.LION, Animal.LION,
            Animal.TIGER, Animal.CROCODILE, Animal.YELLOW_JACKET,
            Animal.YELLOW_JACKET, Animal.FOX, Animal.FOX, Animal.CROCODILE,
            Animal.LION};

        Map<Animal, Integer> result = z.getAnimalCounts(section);
        Map<Animal, Integer> correct = new HashMap<>();
        for (Animal a : animals) {
            correct.put(a, 0);
        }
        correct.put(Animal.LION, 3);
        correct.put(Animal.TIGER, 1);
        correct.put(Animal.CROCODILE, 2);
        correct.put(Animal.YELLOW_JACKET, 2);
        correct.put(Animal.FOX, 2);
        assertEquals("-20 getAnimalCounts returns incorrect value",
            correct, result);
    } 


}
