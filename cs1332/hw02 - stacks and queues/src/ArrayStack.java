/**
 * Your implementation of a Stack backed by an array.
 *
 * @author John Pratt
 * @version 1.0
 */
public class ArrayStack<T> implements StackInterface<T> {
    // Do not add any new instance variables!
    private T[] backingArray;
    private int size;

    /**
     * Construct a Stack with an initial capacity of {@code INITIAL_CAPACITY}.
     *
     * Use constructor chaining.
     */
    public ArrayStack() {
        backingArray = (T[]) new Object[INITIAL_CAPACITY];
        size = 0;
    }

    /**
     * Construct a Stack with the specified initial capacity of
     * {@code initialCapacity}.
     * @param initialCapacity Initial capacity of the backing array.
     */
    public ArrayStack(int initialCapacity) {
        backingArray = (T[]) new Object[initialCapacity];
        size = 0;
    }

    @Override // FIXME
    public void push(T item) {
        if (item == null) {
            throw new IllegalArgumentException("Cannot push null object onto "
                    + "stack.");
        }
        if (size == backingArray.length) {
            T[] newBackingArray = (T[]) new Object[size * 2];
            for (int i = 0; i < size; i++) {
                newBackingArray[i] = backingArray[i];
            }
            backingArray = newBackingArray;
        }
        backingArray[size] = item;
        size++;
    }

    @Override
    public T pop() throws java.util.NoSuchElementException {
        if (isEmpty()) {
            throw new java.util.NoSuchElementException("Cannot pop from "
                    + "empty stack.");
        }
        T res = backingArray[size - 1];
        backingArray[--size] = null;
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
