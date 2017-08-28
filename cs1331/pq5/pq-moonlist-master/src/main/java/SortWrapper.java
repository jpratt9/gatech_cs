/* This class is for grading convenience
 * DO NOT modify or delete this class */

import java.util.Arrays;
import java.util.Comparator;

public class SortWrapper {
    private static Class<? extends Comparator> comparatorClass;

    public static Class<? extends Comparator> getComparatorClass() {
        return comparatorClass;
    }

    public static void sort(Moon[] array) {
        Arrays.sort(array);
    }

    public static void sort(Moon[] array, Comparator<? super Moon> c) {
        comparatorClass = c.getClass();
        Arrays.<Moon>sort(array, c);
    }
}
