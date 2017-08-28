/**
 * Your implementation of a Queue backed by an array.
 *
 * @author John Pratt
 * @version 1.0
 */
public class ArrayQueue<T> implements QueueInterface<T> {
    
    // Do not add instance variables.
    private T[] backingArray;
    private int size;
    private int front;
    private int back;

    /**
     * Construct a Queue with an initial capacity of {@code INITIAL_CAPACITY}.
     *
     * Use Constructor Chaining
     */
    public ArrayQueue() {
        backingArray = (T[]) new Object[INITIAL_CAPACITY];
        size = 0;
        front = 0;
        back = 0;
    }

    /**
     * Construct a Queue with the specified initial capacity of
     * {@code initialCapacity}.
     * @param initialCapacity Initial capacity of the backing array.
     */
    public ArrayQueue(int initialCapacity) {
        backingArray = (T[]) new Object[initialCapacity];
        size = 0;
        front = 0;
        back = 0;
    }

    @Override
    public void enqueue(T item) throws IllegalArgumentException {
        if (item == null) {
            throw new IllegalArgumentException("Cannot push null object onto "
                    + "stack.");
        }
        if (size == backingArray.length) {
            T[] newBackingArray = (T[]) new Object[size * 2];
            for (int i = 0; i < size; i++) {
                newBackingArray[i] = backingArray[(i + front) % size];
            }
            backingArray = newBackingArray;
            front = 0;
            back = size - 1;
        }
        // technically an empty queue is a special case (I know it probably
        // shouldn't be, but this made the code work. sue me.)
        back = (size == 0 && front == back)
                ? back
                : (back + 1) % backingArray.length;
        backingArray[back] = item;
        size++;
    }

    @Override
    public T dequeue() throws java.util.NoSuchElementException {
        if (isEmpty()) {
            throw new java.util.NoSuchElementException("Cannot dequeue from "
                + "empty queue.");
        }
        T res = backingArray[front];

        backingArray[front] = null;
        front = (front + 1) % backingArray.length;
        size--;
        return res;
    }

    @Override
    public int size() {
        return size;
    }

    @Override
    public boolean isEmpty() {
        return size == 0;
    }

    /**
     * Used for testing your code.
     * DO NOT USE THIS METHOD!
     *
     * @return the backing array of this queue.
     */
    public Object[] getBackingArray() {
        return backingArray;
    }

}
