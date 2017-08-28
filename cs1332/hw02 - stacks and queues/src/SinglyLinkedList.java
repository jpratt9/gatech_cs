/**
 * Your implementation of a SinglyLinkedList
 *
 * @author John Pratt
 * @version 1.0
 */
public class SinglyLinkedList<T> implements LinkedListInterface<T> {

    // Do not add new instance variables.
    private LinkedListNode<T> head;
    private LinkedListNode<T> tail;
    private int size;

    @Override
    public void addToFront(T data) throws IllegalArgumentException {
        if (data == null) {
            throw new IllegalArgumentException("Cannot insert null data into "
                    + "data structure.");
        }
        LinkedListNode<T> newHead = new LinkedListNode(data, head);
        head = newHead;
        size++;
        if (tail == null) {
            tail = head;
        }
    }

    @Override
    public void addToBack(T data) {
        if (data == null) {
            throw new IllegalArgumentException("Cannot insert null data into "
                    + "data structure.");
        }
        LinkedListNode<T> newTail = new LinkedListNode<T>(data, null);

        if (size == 0) {
            head = newTail;
            tail = newTail;
        } else {
            tail.setNext(newTail);
            tail = newTail;
        }
        size++;
    }

    @Override
    public T removeFromFront() {
        if (size == 0) {
            return null;
        } else {
            T res = head.getData();
            head = head.getNext();
            size--;
            if (size == 0) {
                tail = null;
            }
            return res;
        }
    }

    @Override
    public T removeFromBack() {
        if (size == 0) {
            return null;
        } else {
            LinkedListNode<T> newTail = head;
            for (int i = 1; i < (size - 1); i++) {
                newTail = newTail.getNext();
            }
            T res = tail.getData();
            size--;
            if (size == 0) {
                tail = null;
                head = null;
            } else {
                tail = newTail;
                tail.setNext(null);
            }
            return res;
        }
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
    public LinkedListNode<T> getHead() {
        // DO NOT MODIFY!
        return head;
    }

    @Override
    public LinkedListNode<T> getTail() {
        // DO NOT MODIFY!
        return tail;
    }
}
