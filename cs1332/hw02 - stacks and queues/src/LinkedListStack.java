/**
 * Your implementation of a Stack backed by a LinkedList.
 *
 * @author John Pratt
 * @version 1.0
 */
public class LinkedListStack<T> implements StackInterface<T> {

    // Do not add new instance variables.
    // Do not modify this variable.
    private LinkedListInterface<T> backingList;
    
    /**
     * Initialize the Stack.
     */
    public LinkedListStack() {
        backingList = new SinglyLinkedList<T>();
    }

    @Override // FIXME
    public void push(T item) throws IllegalArgumentException {
        if (item == null) {
            throw new IllegalArgumentException("Cannot push null object onto "
                    + "stack");
        }
        backingList.addToFront(item);
    }

    @Override
    public T pop() throws java.util.NoSuchElementException {
        if (isEmpty()) {
            throw new java.util.NoSuchElementException("Cannot pop from empty "
                    + "stack.");
        }
        return backingList.removeFromFront();
    }

    @Override
    public int size() {
        return backingList.size();
    }

    @Override
    public boolean isEmpty() {
        return backingList.isEmpty();
    }
    
    /**
     * Used for testing your code.
     * DO NOT USE THIS METHOD!
     *
     * @return the backing list of this stack.
     */
    public LinkedListInterface<T> getBackingList() {
        return backingList;
    }

}
