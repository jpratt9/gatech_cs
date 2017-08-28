import java.util.NoSuchElementException;

/**
 * Your implementation of a max priority queue.
 * 
 * @author John Pratt
 * @version 1.0
 */
public class MaxPriorityQueue<T extends Comparable<? super T>>
    implements PriorityQueueInterface<T> {

    private MaxHeap<T> backingHeap;
    // Do not add any more instance variables. Do not change the declaration
    // of the instance variables above.

    /**
     * Creates a priority queue.
     */
    public MaxPriorityQueue() {
        backingHeap = new MaxHeap<>();
    }

    @Override
    public void enqueue(T item) throws IllegalArgumentException {
        if (item == null) {
            throw new IllegalArgumentException("Cnnot add null data to data "
                    + "structure.");
        }
        backingHeap.add(item);
    }

    @Override
    public T dequeue() throws NoSuchElementException {
        if (backingHeap.isEmpty()) {
            throw new NoSuchElementException("Cannot remove data from empty "
                    + "data structure.");
        }

        return backingHeap.remove();
    }

    @Override
    public boolean isEmpty() {
        return backingHeap.isEmpty();
    }

    @Override
    public int size() {
        return backingHeap.size();
    }

    @Override
    public void clear() {
        backingHeap.clear();
    }

    @Override
    public MaxHeap<T> getBackingHeap() {
        // DO NOT CHANGE THIS METHOD!
        return backingHeap;
    }

}
