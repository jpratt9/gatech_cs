import java.util.Collection;
import java.util.Iterator;
import java.util.Set;

/**
* This class implements the SimpleSet interface, backed by an array. This class
* does not permit the null element.  It guarantees uniqueness.
*
* @param <T> Param Type
* @version 1.0
* @author jpratt9
*/
public class MySet<T> implements Set<T> {

    private T[] backingArray;
    private int numElements;

    /**
     * Creates a set with an empty backing array.
     */
    public MySet() {
        numElements = 0;
        backingArray = (T[]) new Object[0];
    }

    /* Implement methods here */

    /**
     * Adds t to this set if and only if t is neither null nor
     * contained within backingArray.  Returns true and increments numElements
     * if and only if backingArray is modified.
     *
     * @param           t the T to be added to backingArray
     * @return          true if and only if backingArray is modified.
     */
    @Override
    public boolean add(T t) {
        if (t == null || contains(t)) {
            return false;
        }
        T[] res = (T[]) new Object[numElements + 1];
        for (int i = 0; i < numElements; i++) {
            res[i] = backingArray[i];
        }
        res[numElements++] = t;
        backingArray = res;
        return true;
    }

    /**
     * Adds each element in c to this set.  See add().
     *
     * @param           c a Collection of T objects to be added to backingArray.
     * @return          true if and only if backingArray is modified.
     */
    @Override
    public boolean addAll(Collection<? extends T> c) {
        boolean changed = false;
        T[] those = (T[]) c.toArray();
        for (T that : those) {
            changed = add(that) || changed;
        }
        return changed;
    }

    /**
     * Clears this set. Does so by setting backingArray to an empty T array of
     * length 0 and sets numElements to 0.
     */
    @Override
    public void clear() {
        backingArray = (T[]) new Object[0];
        numElements = 0;
    }

    /**
     * Returns true if and only if o is contined within this set.
     *
     * @param           o an object to be checked.
     * @return          true if and only if o is contined within backingArray
     */
    @Override
    public boolean contains(Object o) {
        for (int i = 0; i < size(); i++) {
            if (o.equals(backingArray[i])) {
                return true;
            }
        }
        return false;
    }

    /**
     * Returns true if and only if this set contains all elements in c.
     *
     * @param           c a collection to be examined
     * @return          true if and only if backingArray contains all elements
     *                       from c.
     */
    @Override
    public boolean containsAll(Collection<?> c) {
        for (Object that : c.toArray()) {
            if (!(contains(that))) {
                return false;
            }
        }
        return true;
    }

    /**
     * If o is null or not an instance of Set, returns false. If not, returns
     * true if o is this set. If not, returns false if o is a set of the same
     * size as this set. If o is the same size as this set, returns
     * containsAll((Collection) o).
     *
     * @param           o an object to be checked.
     * @return          true if the o is equal to this set.
     */
    @Override
    public boolean equals(Object o) {
        if (o == null || !(o instanceof Set)) {
            return false;
        }

        if (this == o) {
            return true;
        }

        Collection c = (Collection) o;
        return c.size() == size() && containsAll(c);
    }

    /**
     * Computes and returns a hash code for this set.  The hash code is defined
     * as
     *     17 + sum(31 * backingArrayHashes[i], i = 0, i = n)
     * where sum(nums[i], i = 0, i = n) computes the sum of all elements in nums
     * given that nums is of length n, backingArrayHashes is an array of the
     * hash codes of all elements in this set.
     * @return          the hash code of this set.
     */
    @Override
    public int hashCode() {
        int res = 17;
        for (T thisOne : backingArray) {
            res += 31 * thisOne.hashCode();
        }
        return res;
    }

    /**
     * Returns true if this set is empty (the size of the backingArray is 0).
     * @return          true if this set is empty.
     */
    @Override
    public boolean isEmpty() {
        return numElements == 0;
    }

    /**
     * Removes o from this set if it is not null and is contained within it.
     * @return          true if this set was modified.
     */
    @Override
    public boolean remove(Object o) {
        if (o == null || !(contains(o))) {
            return false;
        }
        T[] tmp = (T[]) new Object[numElements - 1];
        boolean found = false;
        for (int i = 0; i < size(); i++) {
            if (o.equals(backingArray[i])) {
                found = true;
            } else {
                int shift = found ? 1 : 0;
                tmp[i - shift] = backingArray[i];
            }
        }
        numElements--;
        backingArray = tmp;
        return true;
    }

    /**
     * Calls remove(Object o) on each element contained within c.  See remove.
     * @return          true if this set was modified.
     */
    @Override
    public boolean removeAll(Collection<?> c) {
        boolean changed = false;
        for (Object that : c.toArray()) {
            changed = remove(that) || changed;
        }
        return changed;
    }

    /**
     * Modifies this set to be the intersection of this set and c.
     * @return          true if this set was modified.
     */
    @Override
    public boolean retainAll(Collection<?> c) {
        boolean changed = false;
        for (T t : backingArray) {
            if (!c.contains(t)) {
                remove(t);
                changed = true;
            }
        }
        return changed;
    }

    /**
     * @return          the size of this set.
     */
    @Override
    public int size() {
        return numElements;
    }

    /**
     * @return          A shallow copy of backingArray.
     */
    @Override
    public Object[] toArray() {
        Object[] res = new Object[numElements];
        for (int i = 0; i < numElements; i++) {
            res[i] = backingArray[i];
        }
        return res;
    }

    /**
     * Dummy method.
     * @return          null
     */
    @Override
    public <T> T[] toArray(T[] a) {
        return null;
    }


    /*
    ----------------------------------------------
    These methods are provided to help you, DO NOT MODIFY!
    Refer to the slides on Iterators if you want to learn more
    http://cs1331.org/slides/iterators.pdf
    */

    /**
    * Returns an iterator if you wish to use it
    * @return An iterator for the SimpleSet
    */
    public Iterator<T> iterator() {
        return new MySetIterator();
    }

    private class MySetIterator implements Iterator {

        private int index = 0;
        public boolean hasNext() {
            return index < numElements;
        }

        public T next() {
            return backingArray[index++];
        }

        public void remove() {
            MySet.this.remove(backingArray[index]);
            index--;
        }
    }

}
