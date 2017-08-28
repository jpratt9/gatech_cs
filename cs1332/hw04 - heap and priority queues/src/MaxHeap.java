import java.util.NoSuchElementException;

/**
 * Your implementation of a max heap.
 *
 * @author John Pratt
 * @version 1.0
 */
public class MaxHeap<T extends Comparable<? super T>>
    implements HeapInterface<T> {

    private T[] backingArray;
    private int size;
    // Do not add any more instance variables. Do not change the declaration
    // of the instance variables above.

    /**
     * Creates a Heap with an initial size of {@code STARTING_SIZE}.
     *
     * Use the constant field in the interface. Do not use magic numbers!
     */
    public MaxHeap() {
        backingArray = (T[]) new Comparable[STARTING_SIZE];
        size = 0;
    }

    @Override
    public void add(T item) throws IllegalArgumentException {
        if (item == null) {
            throw new IllegalArgumentException("Cannot add null data to the "
                    + "data structure");
        }
        /*System.out.print("Adding " + item + " at index " + (size + 1));
        System.out.print(" | length:" + backingArray.length);
        System.out.print(" | size:" + size);
        System.out.println(" | size == backingArray.length - 1"
                + (size == backingArray.length - 1));*/
        if (size == backingArray.length - 1) {
            T[] newBackingArray = (T[]) new Comparable[backingArray.length * 2];
            for (int i = 1; i < backingArray.length; i++) {
                newBackingArray[i] = backingArray[i];
            }
            backingArray = newBackingArray;
        }

        backingArray[++size] = item;
        int index = size;
        T oldParent;
        while (hasParent(index)
                && item.compareTo(backingArray[index / 2]) >= 0) {
            oldParent = backingArray[index / 2];
            backingArray[index / 2] = backingArray[index];
            backingArray[index] = oldParent;
            index = index / 2;
        }
    }
    /**
     * Returns the index of the parent associated with index i.
     *
     * @param i the index to be checked
     * @return index of parent associated with i
     */
    private int parent(int i) {
        return i / 2;
    }

    /**
     * Returns true iff the node represented by backing array element i is
     * not the root and its parent is not null.
     *
     * @param i the index to be checked
     * @return true iff the node represented by backing array element i is
     * not the root and its parent is not null.
     */
    private boolean hasParent(int i) {
        return i > 1 && backingArray[parent(i)] != null;
    }

    @Override
    public T remove() throws NoSuchElementException {
        if (isEmpty()) {
            throw new NoSuchElementException("Cannot remove from empty data "
                    + "structure.");
        }

        T res = backingArray[1];
        swap(1, size - 1);
        backingArray[size - 1] = null;
        downheap(1);
        size--;
        return res;
    }
    /**
     * Swaps the contents of the backing array at the two given indices.
     *
     * @param i one of the indices to have its content swapped
     * @param j one of the indices to have its content swapped
     */
    private void swap(int i, int j) {
        T tmp = backingArray[i];
        backingArray[i] = backingArray[j];
        backingArray[j] = tmp;
    }

    /**
     * Moves the entry at index "index" lower if necessary to restore the
     * heap property.
     *
     * @param index one of the indices to have its content swapped
     */
    private void downheap(int index) {
        boolean heapified = false;
        while (hasLeft(index) && heapified) {
            int leftIndex = left(index);
            int bigChildIndex = leftIndex;
            if (hasRight(index)) {
                int rightIndex = right(index);
                if (backingArray[leftIndex]
                        .compareTo(backingArray[rightIndex]) < 0) {
                    bigChildIndex = rightIndex;
                }
            }
            if (backingArray[bigChildIndex].compareTo
                    (backingArray[index]) <= 0) {
                break;
            }
            swap(index, bigChildIndex);
        }
    }


    /**
     * Returns the index of the left child node of the node at index i in the
     * backing array.
     *
     * @param i the index to be checked
     * @return index of left child associated with i
     */
    private int left(int i) {
        return 2 * i + 1;
    }

    /**
     * Returns the index of the right child node of the node at index i in the
     * backing array.
     *
     * @param i the index to be checked
     * @return index of right child associated with i
     */
    private int right(int i) {
        return 2 * i + 2;
    }

    /**
     * Returns true iff the left child of node at index i is not null.
     *
     * @param i the index to be checked
     * @return true iff the left child of node at index i is not null
     */
    private boolean hasLeft(int i) {
        return left(i) < size;
    }

    /**
     * Returns true iff the right child of node at index i is not null.
     *
     * @param i the index to be checked
     * @return true iff the right child of node at index i is not null
     */
    private boolean hasRight(int i) {
        return right(i) < size;
    }

    @Override
    public boolean isEmpty() {
        return size == 0;
    }

    @Override
    public int size() {
        return size;
    }

    @Override
    public void clear() {
        backingArray = (T[]) new Comparable[STARTING_SIZE];
        size = 0;
    }

    @Override
    public Comparable[] getBackingArray() {
        // DO NOT CHANGE THIS METHOD!
        return backingArray;
    }

}
