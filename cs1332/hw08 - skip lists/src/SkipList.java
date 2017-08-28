import java.util.HashSet;
import java.util.Set;
import java.util.NoSuchElementException;
/**
 * Your implementation of a skip list.
 * 
 * @author John Pratt
 * @version 1.0
 */
public class SkipList<T extends Comparable<? super T>>
    implements SkipListInterface<T> {
    // Do not add any additional instance variables
    private CoinFlipper coinFlipper;
    private int size;
    private SkipListNode<T> head;

    /**
     * Constructs a SkipList object that stores data in ascending order.
     * When an item is inserted, the flipper is called until it returns a tails.
     * If, for an item, the flipper returns n heads, the corresponding node has
     * n + 1 levels.
     *
     * @param coinFlipper the source of randomness
     */
    public SkipList(CoinFlipper coinFlipper) {
        this.coinFlipper = coinFlipper;
        size = 0;
        // fixme
        head = new SkipListNode<>(null, 1);
    }

    @Override
    public T first() {
        if (size == 0) {
            throw new NoSuchElementException("Skip list is empty.");
        }

        return getFirstNode().getData();
    }

    /**
     * Does the actual finding of the first non-phantom node in the skip list.
     *
     * @return first non-phantom node in skip list.
     */
    private SkipListNode<T> getFirstNode() {
        SkipListNode<T> iter = head;
        while (iter.getDown() != null) {
            iter = iter.getDown();
        }
        return iter.getNext() != null
                ? iter.getNext()
                : iter;
    }

    @Override
    public T last() {
        if (size == 0) {
            throw new NoSuchElementException("Skip list is empty.");
        }

        SkipListNode<T> iter = head;
        do {
            iter = iter.getNext() == null ? iter : iter.getNext();
            while (iter.getNext() == null && iter.getDown() != null) {
                iter = iter.getDown();
            }
        } while (iter.getNext() != null);

        return iter.getData();
    }

    @Override
    public void put(T data) {
        if (data == null) {
            throw new IllegalArgumentException("Cannot insert null data into "
                    + "skip list.");
        }


        SkipListNode<T> iter = head;
        SkipListNode<T> tmpIter;
        do {
            while (iter.getNext() != null
                    && data.compareTo(iter.getNext().getData()) > 0) {
                iter = iter.getNext();
            }
            tmpIter = iter;
            iter = iter.getDown();
        } while (iter != null);
        iter = tmpIter;
        int level = 1;
        SkipListNode<T> insert;
        SkipListNode<T> belowInsert = null;
        SkipListNode<T> tmp;
        do {
            insert = new SkipListNode<>(data, level);
            insert.setPrev(iter);
            if (iter.getNext() != null) {
                insert.setNext(iter.getNext());
                tmp = iter.getNext();
                tmp.setPrev(insert);
            }
            iter.setNext(insert);
            if (belowInsert != null) {
                belowInsert.setUp(insert);
            }
            insert.setDown(belowInsert);

            belowInsert = insert;
            while (iter.getUp() == null && iter.getPrev() != null) {
                iter = iter.getPrev();
            }
            level++;
            if (iter.getUp() == null) {
                tmp = new SkipListNode<>(null, level, null, null, null, iter);
                iter.setUp(tmp);
            }
            iter = iter.getUp();
        } while (coinFlipper.flipCoin() == CoinFlipper.Coin.HEADS);
        size++;
        if (iter.getLevel() >= head.getLevel()) {
            head = iter;
        }
    }

    @Override
    public T remove(T data) {
        if (data == null) {
            throw new IllegalArgumentException("Cannot remove null data from "
                    + "the skip list.");
        }


        SkipListNode<T> iter = searchHelper(data);
        if (size == 0 || iter == null) {
            throw new NoSuchElementException("Attempted to remove item that "
                    + "was not contained in the skip list.");
        }
        if (iter.getData().equals(data)) {
            T foundData = iter.getData();
            while (iter != null) {
                iter = removeHelper(iter).getDown();
            }
            size--;
            return foundData;
        } else {
            throw new NoSuchElementException("Attempted to remove data that "
                    + "was not in the skip list.");
        }
    }

    // fixme
    /**
     * Does the actual removal and restructuring of the skip list based ont the
     * item removed.
     *
     * @param iter the current node to be removed
     * @return the node that was removed
     */
    private SkipListNode<T> removeHelper(SkipListNode<T> iter) {
        SkipListNode<T> tmp = iter;
        // structure is as follows:
        //       a
        //       ^
        //       |
        //       v
        // b <-> c <-> d
        //       ^
        //       |
        //       v
        //       e

        // first step: assign b.next = d
        // note that we don't have to check if tmp has a prev node
        // since it does by definition (we already made sure it
        // wasn't null, and it's a next node of some other node)
        tmp = tmp.getPrev();
        if (iter.getNext() != null) {
            tmp.setNext(iter.getNext().getNext());
        } else {
            tmp.setNext(null);
        }

        // second: if d isn;t null, assign d.prev = b
        if (iter.getNext() != null) {
            tmp = iter.getNext();
            tmp.setPrev(tmp.getPrev().getPrev());
        }
        tmp = iter;

        // third: if a isn't null, assign a.down = d
        if (tmp.getUp() != null) {
            tmp = tmp.getUp();
            tmp.setDown(tmp.getDown().getDown());
        }
        tmp = iter;

        // fourth: if e isn't null, assign e.up = a
        if (tmp.getDown() != null) {
            tmp = tmp.getDown();
            tmp.setUp(tmp.getUp().getUp());
        }

        // lastly, if the level is empty and its not the head level,
        // completely remove it

        if (iter.getLevel() != head.getLevel()
                && iter.getNext() == null
                && iter.getPrev().getData() == null) {
            head = iter.getPrev();
            head.setUp(null);
        }

        return iter;
    }

    @Override
    public boolean contains(T data) {
        if (data == null) {
            throw new IllegalArgumentException("Cannot check if null data "
                    + "is in the skip list.");
        }

        SkipListNode<T> iter = searchHelper(data);
        return iter != null && iter.getData().equals(data);
    }

    @Override
    public T get(T data) {
        if (data == null) {
            throw new IllegalArgumentException("Cannot get null data from the"
                    + " skip list.");
        }

        SkipListNode<T> iter = searchHelper(data);
        if (iter != null) {
            return iter.getData();
        }

        throw new NoSuchElementException("Cannot get data that is not "
                + "contained in the skip list.");
    }

    // fixme
    /**
     * Finds and returns the first node containing {@code data}, otherwise
     * returns {@code null}.
     *
     * @param data the data to be found
     * @return the node containing {@code data}, or {@code null} if {@code
     * data} is not in the skip list.
     */
    private SkipListNode<T> searchHelper(T data) {
        SkipListNode<T> iter = head;
        do {
            while (iter.getNext() != null
                    && data.compareTo(iter.getNext().getData()) >= 0) {
                iter = iter.getNext();
                if (iter.getData().equals(data)) {
                    return iter;
                }
            }
            iter = iter.getDown();
        } while (iter != null);
        return iter;
    }

    @Override
    public int size() {
        return size;
    }

    @Override
    public void clear() {
        head.setDown(null);
        head.setNext(null);
        head.setLevel(1);
        size = 0;
    }

    @Override
    public Set<T> dataSet() {
        Set<T> dataSet = new HashSet<>(0);
        if (size == 0) {
            return dataSet;
        }
        SkipListNode<T> iter = getFirstNode();
        do {
            dataSet.add(iter.getData());
            iter = iter.getNext();
        } while (iter != null);
        return dataSet;
    }

    @Override
    public SkipListNode<T> getHead() {
        return head;
    }
    
    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("**********************\n");
        builder.append(String.format("SkipList (size = %d)\n", size()));
        SkipListNode<T> levelCurr = getHead();

        while (levelCurr != null) {
            SkipListNode<T> curr = levelCurr;
            int level = levelCurr.getLevel();
            builder.append(String.format("Level: %2d   ", level));

            while (curr != null) {
                builder.append(String.format("(%s)%s", curr.getData(),
                            curr.getNext() == null ? "\n" : ", "));
                curr = curr.getNext();
            }
            levelCurr = levelCurr.getDown();
        }
        builder.append("**********************\n");
        return builder.toString();
    }

}
