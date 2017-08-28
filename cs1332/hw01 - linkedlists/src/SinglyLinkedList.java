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
    public void addAtIndex(int index, T data) throws IllegalArgumentException,
        IndexOutOfBoundsException {
        if (data == null) {
            throw new IllegalArgumentException("Cannot insert null data into "
                    + "data structure.");
        }
        if (index < 0) {
            throw new IndexOutOfBoundsException("Index cannot be negative.");
        } else if (index > size) {
            throw new IndexOutOfBoundsException("Index must be less than or "
                + "equal to size of data structure.");
        }

        if (index == size) {
            addToBack(data);
        } else if (index == 0) {
            addToFront(data);
        } else {
            LinkedListNode<T> beforeNewNode = head;
            for (int i = 0; i < (index - 1); i++) {
                beforeNewNode = beforeNewNode.getNext();
            }
            // get node after new one
            LinkedListNode<T> afterNewNode = beforeNewNode.getNext();
            // set new node's "next" to be the old next
            LinkedListNode<T> newNode = new LinkedListNode(data, afterNewNode);
            //set the next of the node before new node to be the new node
            beforeNewNode.setNext(newNode);
            size++;
        }

    }

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
    public T get(int index) throws IndexOutOfBoundsException {
        if (index < 0) {
            throw new IndexOutOfBoundsException("Index cannot be negative.");
        } else if (index >= size) {
            throw new IndexOutOfBoundsException("Index must be less than size "
                + "of data structure.");
        } if (size == 0) {
            return null;
        } else if (index == 0) { // head
            return head.getData();
        } else if (index == (size - 1)) { // tail
            return tail.getData();
        } else { // middle of list
            LinkedListNode<T> res = head;
            for (int i = 0; i < index; i++) {
                res = res.getNext();
            }
            return res.getData();
        }
    }

    // DO ME
    @Override
    public T removeAtIndex(int index) throws IndexOutOfBoundsException {
        if (index < 0) {
            throw new IndexOutOfBoundsException("Index cannot be negative.");
        } else if (index >= size) {
            throw new IndexOutOfBoundsException("Index must be less than size "
                + "of data structure.");
        } else {
            if (index == 0) {
                return removeFromFront();
            } else if (index == (size - 1)) {
                return removeFromBack();
            } else {
                LinkedListNode<T> beforeRemove = head;
                for (int i = 1; i < index; i++) {
                    beforeRemove = beforeRemove.getNext();
                }
                LinkedListNode<T> afterRemove = beforeRemove.getNext()
                    .getNext();
                T res = beforeRemove.getNext().getData();
                beforeRemove.setNext(afterRemove);
                size--;
                return res;
            }
        }
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
    public boolean removeAllOccurrences(T data)
            throws IllegalArgumentException {
        if (data == null) {
            throw new IllegalArgumentException("Cannot remove null data from "
                    + "data structure.");
        }
        LinkedListNode<T> currNode = head;
        LinkedListNode<T> prevNode = null;
        boolean changed = false;
        int i = 0;
        while (currNode != null) {
            if (currNode.getData().equals(data)) {
                if (i == 0) {
                    removeFromFront();
                    currNode = head;
                } else if (i == size - 1) {
                    tail = prevNode;
                    currNode = null;
                    size--;
                } else {
                    prevNode.setNext(currNode.getNext());
                    currNode = currNode.getNext();
                    size--;
                }
                changed = true;
            } else {
                prevNode = currNode;
                currNode = currNode.getNext();
                i++;
            }
        }
        return changed;
    }

    @Override
    public Object[] toArray() {
        Object[] res = new Object[size];
        LinkedListNode<T> currentNode = head;
        for (int i = 0; i < size; i++) {
            res[i] = currentNode.getData();
            currentNode = currentNode.getNext();
        }
        return res;
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
        head = null;
        tail = null;
        size = 0;
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
