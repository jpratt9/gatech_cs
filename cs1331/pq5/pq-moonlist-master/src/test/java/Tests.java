import static org.junit.Assert.*;
import static org.junit.Assume.*;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import java.lang.reflect.*;

import java.util.Arrays;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

import java.util.regex.Pattern;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class Tests {
    
    private static final List<Moon> MOONS = Arrays.asList(
        new Moon("EarthMoon", Moon.Planet.EARTH),
        new Moon("Venus Moon", Moon.Planet.VENUS),
        new Moon("NeptuneMoon", Moon.Planet.NEPTUNE),
        new Moon("MarsMoon", Moon.Planet.MARS),
        new Moon("Jupiter Moon", Moon.Planet.JUPITER));


    /* Problem 1: Provide a natural ordering for Moon */

    @Test
    public void moonIsComparable() {
        // TODO: make sure Comparable interface is type parameterized
        try {
            assertTrue("-5 Moon does not implement Comparable",
                Arrays.asList(Class.forName("Moon").getInterfaces()).contains(Comparable.class));
        } catch (ClassNotFoundException e) {
            fail("-5 Moon class doesn't exist, can't check if it is Comparable");
        }
    }

    @Test
    public void moonImplementsTypeParameterizedComparable() {
        try {
            Type comparableInterface = Class.forName("Moon")
                .getGenericInterfaces()[0];
            if (comparableInterface instanceof ParameterizedType) {
                assertEquals("-5 Moon implements Comparable, but it is"
                    + " type-parameterized to "
                    + ((ParameterizedType) comparableInterface)
                        .getActualTypeArguments()[0]
                    + " instead of Moon",
                    Class.forName("Moon"),
                    ((ParameterizedType) comparableInterface)
                        .getActualTypeArguments()[0]);
            } else {
                fail("-5 Moon implements Comparable, but it is"
                    + " not type-parameterized to only be compared to other"
                    + " Moons");
            }
        } catch (ArrayIndexOutOfBoundsException e) {
            fail("-5 Moon class doen't implement Comparable, can't check"
                + " if it is type-parameterized.");
        } catch (ClassNotFoundException e) {
            fail("-5 Moon class doesn't exist, can't check if Comparable is "
                + "type parameterized");
        }
    }

    @Test
    public void moonCompareTo() {
        try {
            Method compareTo = Moon.class.getMethod("compareTo", Moon.class);

            for (Moon s1 : MOONS) {
                for (Moon s2 : MOONS) {
                    assertEquals("-5 Moon compareTo is incorrect",
                        s1.getName().compareTo(s2.getName()),
                        (int) compareTo.invoke(s1, s2));
                }
            }

        } catch (ClassCastException e) {
            fail("-5 Moon compareTo should return an int");
        } catch (NoSuchMethodException | IllegalAccessException
            | InvocationTargetException e) {
            fail("-5 Moon compareTo method not found");
        }
    }

    @Test
    public void sortByName() {
        MoonList moonList = new MoonList(MOONS.size());
        MOONS.forEach(moonList::add);
        List<Moon> sortedMoons = Arrays.asList(
            new Moon("EarthMoon", Moon.Planet.EARTH),
            new Moon("Jupiter Moon", Moon.Planet.JUPITER),
            new Moon("MarsMoon", Moon.Planet.MARS),
            new Moon("NeptuneMoon", Moon.Planet.NEPTUNE),
            new Moon("Venus Moon", Moon.Planet.VENUS));
        
        moonList.sortByName();

        for (int i = 0; i < sortedMoons.size(); i++) {
            assertEquals("-5 sortByName sorts list incorrectly",
                sortedMoons.get(i), moonList.get(i));
        }
    }

    /* Problem 2: sortByPlanet */
    
    @Test
    public void sortByPlanet() {
        MoonList moonList = new MoonList(MOONS.size());
        MOONS.forEach(moonList::add);
        List<Moon> sortedMoons = Arrays.asList(
            new Moon("Venus Moon", Moon.Planet.VENUS),
            new Moon("EarthMoon", Moon.Planet.EARTH),
            new Moon("MarsMoon", Moon.Planet.MARS),
            new Moon("Jupiter Moon", Moon.Planet.JUPITER),
            new Moon("NeptuneMoon", Moon.Planet.NEPTUNE));
        
        moonList.sortByPlanet();

        for (int i = 0; i < sortedMoons.size(); i++) {
            assertEquals("-20 sortByPlanet sorts list incorrectly",
                sortedMoons.get(i), moonList.get(i));
        }
    }

    @Test
    public void sortByPlanetUsesLambda() {
        MoonList moonList = new MoonList(MOONS.size());
        MOONS.forEach(moonList::add);
        moonList.sortByPlanet();
        assertTrue("-10 sortByPlanet does not use a lambda expression",
            SortWrapper.getComparatorClass() != null && Pattern
                .matches("MoonList\\$\\$Lambda\\$\\d+/\\d+", SortWrapper
                .getComparatorClass().getName()));
    }

    /* Problem 3: MoonIterator */
    
    public Class<?> getMoonIterator() {
        try {
            return Class.forName("MoonList$MoonIterator");
        } catch (Throwable e) {
            try {
                return Class.forName("MoonIterator");
            } catch (Throwable e2) {
                return null;
            }
        }
    }

    @Test
    public void moonIteratorExists() {
        assertTrue("-10 No MoonIterator class found",
            getMoonIterator() != null);
    }


    @Test
    public void moonIteratorIsInnerClass() {
        assumeTrue(getMoonIterator() != null);
        assertTrue("-5 MoonIterator is not an inner class",
            Arrays.asList(MoonList.class.getDeclaredClasses())
            .contains(getMoonIterator()));
    }

    @Test
    public void moonIteratorImplementsIterator() {
        assumeTrue(getMoonIterator() != null);
        assertTrue("-5 MoonIterator should implement the Iterator interface",
            Arrays.asList(getMoonIterator().getInterfaces()).contains(
                Iterator.class));
    }

    @Test
    public void listIteratorTypeParameterizedIterator() {
        assumeTrue(getMoonIterator() != null);
        assumeTrue(Arrays.asList(getMoonIterator().getInterfaces()).contains(
                Iterator.class));
        try {
            Type iteratorInterface = getMoonIterator()
                .getGenericInterfaces()[0];
            if (iteratorInterface instanceof ParameterizedType) {
                assertEquals("-5 MoonIterator implements Iterator, but it is"
                    + " type-parameterized to "
                    + ((ParameterizedType) iteratorInterface)
                        .getActualTypeArguments()[0]
                    + " instead of Moon",
                    Class.forName("Moon"),
                    ((ParameterizedType) iteratorInterface)
                        .getActualTypeArguments()[0]);
            } else {
                fail("-5 MoonIterator implements Iterator, but it is"
                    + " not type-parameterized to only be an iterator for"
                    + " Moons");
            }
        } catch (ArrayIndexOutOfBoundsException e) {
            fail("-5 MoonIterator class doen't implement Iterator, can't check"
                + " if it is type-parameterized.");
        } catch (ClassNotFoundException e) {
            fail("-5 MoonIterator class doesn't exist, can't check if Iterator is "
                + "type parameterized");
        }
    }



    /* Problem 4: Iterable / iterator() */

    @Test
    public void isIterable() {
        assertTrue("-10 MoonList is not Iterable",
            Arrays.asList(MoonList.class.getInterfaces()).contains(
                Iterable.class));
    }

    @Test
    public void moonListImplementsTypeParameterizedIterable() {
        assumeTrue(Arrays.asList(MoonList.class.getInterfaces()).contains(
                Iterable.class));
        try {
            Type iterableInterface = Class.forName("MoonList")
                .getGenericInterfaces()[0];
            if (iterableInterface instanceof ParameterizedType) {
                assertEquals("-5 MoonList implements Iterable, but it is"
                    + " type-parameterized to "
                    + ((ParameterizedType) iterableInterface)
                        .getActualTypeArguments()[0]
                    + " instead of Moon",
                    Class.forName("Moon"),
                    ((ParameterizedType) iterableInterface)
                        .getActualTypeArguments()[0]);
            } else {
                fail("-5 MoonList implements Iterable, but it is"
                    + " not type-parameterized to only be iterable over "
                    + " Moons");
            }
        } catch (ArrayIndexOutOfBoundsException e) {
            fail("-5 MoonList class doen't implement Iterable, can't check"
                + " if it is type-parameterized.");
        } catch (ClassNotFoundException e) {
            fail("-5 MoonList class doesn't exist, can't check if Iterable is "
                + "type parameterized");
        }
    }



    @Test
    public void hasIteratorMethod() {
        MoonList moonList = new MoonList(MOONS.size());
        try {
            Method iteratorMeth = MoonList.class.getMethod("iterator");
            Iterator iterator = (Iterator) iteratorMeth.invoke(moonList);

            // TODO: check type parameterized?
        } catch (ClassCastException e) {
            fail("-10 iterator() doesn't return an Iterator");
        } catch (Exception e) {
            fail("-10 does not have an iterator() method");
        }
    }

    @Test
    public void iteratorHasNext() {
        try {
            MoonList moonList = new MoonList(MOONS.size());
            MOONS.forEach(moonList::add);
            Method iteratorMeth = MoonList.class.getMethod("iterator");
            Iterator iterator = (Iterator) iteratorMeth.invoke(moonList);

            for (int i = 0; i < MOONS.size(); i++) {
                assertTrue("-10 iterator's hasNext returns incorrect values",
                    iterator.hasNext());
            }
        } catch (Exception e) {
            fail("-10 Can't find iterator method to test hasNext");
        }
    }

    @Test
    public void iteratorNext() {
        try {
            MoonList moonList = new MoonList(MOONS.size());
            MOONS.forEach(moonList::add);
            Method iteratorMeth = MoonList.class.getMethod("iterator");
            Iterator iterator = (Iterator) iteratorMeth.invoke(moonList);

            for (int i = 0; i < MOONS.size(); i++) {
                assertEquals("-10 iterator's next returns incorrect values",
                    moonList.get(i),
                    iterator.next());
            }
        } catch (Exception e) {
            fail("-10 Can't find iterator method to test next");
        }
    }
}
