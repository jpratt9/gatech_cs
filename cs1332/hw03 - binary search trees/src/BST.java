import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.LinkedList;
import java.util.NoSuchElementException;

public class BST<T extends Comparable<? super T>> implements BSTInterface<T> {
    // DO NOT ADD OR MODIFY INSTANCE VARIABLES.
    private BSTNode<T> root;
    private int size;

    /**
     * A no argument constructor that should initialize an empty BST.
     * YOU DO NOT NEED TO IMPLEMENT THIS CONSTRUCTOR!
     */
    public BST() {
    }

    /**
     * Initializes the BST with the data in the Collection. The data in the BST
     * should be added in the same order it is in the Collection.
     *
     * @param data the data to add to the tree
     * @throws IllegalArgumentException if data or any element in data is null
     */
    public BST(Collection<T> data) {
        if (data == null) {
            throw new IllegalArgumentException("Cannot add null data to "
                    + "BST.");
        }
        size = 0;
        root = null;
        for (T item : data) {
            add(item);
        }
    }

    @Override
    public void add(T data) {
        if (data == null) {
            throw new IllegalArgumentException("Cannot add null data to BST.");
        }
        if (root == null) {
            root = new BSTNode(data);
            size++;
        } else {
            addHelper(root, data);
        }

    }

    // Helper method for BST::add to make it recursive
    // (via https://piazza.com/class/ijhd4dhacv9du?cid=175)
    private void addHelper(BSTNode<T> focus, T data) {
        if (focus.getData().compareTo(data) > 0) {
            if (focus.getLeft() == null) {
                focus.setLeft(new BSTNode(data));
                size++;
            } else {
                addHelper(focus.getLeft(), data);
            }
        } else if (focus.getData().compareTo(data) < 0) {
            if (focus.getRight() == null) {
                focus.setRight(new BSTNode(data));
                size++;
            } else {
                addHelper(focus.getRight(), data);
            }
        }
    }

    // ALGORITHM
    // three scenarios - no children, one child, two children
    // 1) FIND NODE
    // ((COPY NODE FOR LATER REFERENCE))
    // 2) GO DOWN RIGHT ONE
    // 3) GO DOWN LEFT AS FAR AS POSSIBLE
    // 4) SET FARTHEST RIGHT (!) OF NEW NODE TO BE RIGHT OF NODE TO BE REMOVED
    // 5) SUB IN OLD NODE FOR NEW ONE

    @Override
    public T remove(T data) {
        if (data == null) {
            throw new IllegalArgumentException("Cannot remove null data from "
                    + "BST.");
        }
        BSTNode<T> dumby = new BSTNode<T>(null);
        removeHelper(root, dumby, data);
        if (dumby.getData() == null) {
            throw new NoSuchElementException("Cannot remove data from BST "
                    + "that is not in BST.");
        }
        return dumby.getData();
    }

    // Helper method for BST::remove to make it recursive
    // (via https://piazza.com/class/ijhd4dhacv9du?cid=175)
    private BSTNode<T> removeHelper(BSTNode<T> focus, BSTNode<T> dumby,
                                    T data) {

        // Data isn't in the BST
        if (focus == null) {
            throw new NoSuchElementException("Cannot remove data from BST "
                    + "that is not in BST.");
        }
        if (focus.getData().compareTo(data) > 0) {
            focus.setLeft(removeHelper(focus, focus.getLeft(), data));
            return focus;     // go left
        } else if (focus.getData().compareTo(data) < 0) {
            focus.setRight(removeHelper(focus, focus.getRight(), data));    //
            // go right
            return focus;
            // Found it
        } else {
            size--;
            // no children
            dumby.setData(focus.getData());
            if (focus.getLeft() == null && focus.getRight() == null) {
                focus = null;
            } else if (focus.getLeft() != null && focus.getRight() != null) {
                BSTNode<T> dumby1 = new BSTNode<>(null);
                successorHelper(focus.getRight(), dumby1);
                focus.setData(dumby1.getData());
                return focus; // ?
                //one child
            } else if (focus.getLeft() != null) {
                return focus.getLeft();
            } else {
                return focus.getRight();
            }
        }
        return focus;
    }

    private BSTNode<T> successorHelper(BSTNode<T> focus, BSTNode<T> dumby) {
        if (focus == null) {
            return null;
        }
        if (focus.getLeft() != null) {
            focus.setLeft(successorHelper(focus, focus.getLeft()));
            return focus;
        } else {
            dumby.setData(focus.getData());
            return focus.getRight();
        }
    }

    @Override
    public T get(T data) {
        if (data == null) {
            throw new IllegalArgumentException("Cannot get null data from BST"
                    + ".");
        }
        return getHelper(root, data);
    }

    // Helper method for BST::get to make it recursive
    private T getHelper(BSTNode<T> focus, T data) {
        // Data isn't in the BST
        if (focus == null) {
            throw new NoSuchElementException("Cannot remove data from BST "
                    + "that is not in BST.");
        }

        if (focus.getData().equals(data)) {
            return focus.getData();
        } else if (focus.getData().compareTo(data) > 0) {
            return getHelper(focus.getLeft(), data);
        } else {
            return getHelper(focus.getRight(), data);
        }
    }

    @Override
    public boolean contains(T data) {
        if (data == null) {
            throw new IllegalArgumentException("Cannot get null data from BST"
                    + ".");
        }
        return containsHelper(root, data);
    }

    // Helper method for BST::contains to make it recursive
    private boolean containsHelper(BSTNode<T> focus, T data) {
        if (focus == null) {
            return false;
        }
        if (focus.getData().compareTo(data) > 0) {
            return containsHelper(focus.getLeft(), data);
        } else if (focus.getData().compareTo(data) < 0) {
            return containsHelper(focus.getRight(), data);
            // Found it
        } else {
            return focus.getData().equals(data);
        }
    }

    @Override
    public int size() {
        return size;
    }

    // middle, left, right
    @Override
    public List<T> preorder() {
        List<T> res = new ArrayList<>(0);
        res.add(root.getData());
        res.addAll(preorderHelper(root.getLeft()));
        res.addAll(preorderHelper(root.getRight()));
        return res;
    }

    private List<T> preorderHelper(BSTNode<T> focus) {
        List<T> res = new ArrayList<>(0);
        if (focus != null) {
            res.add(focus.getData());
            res.addAll(preorderHelper(focus.getLeft()));
            res.addAll(preorderHelper(focus.getRight()));
        }
        return res;
    }

    // left, right, middle
    @Override
    public List<T> postorder() {
        List<T> res = new ArrayList<>(0);
        res.addAll(postorderHelper(root.getLeft()));
        res.addAll(postorderHelper(root.getRight()));
        res.add(root.getData());
        return res;
    }

    private List<T> postorderHelper(BSTNode<T> focus) {
        List<T> res = new ArrayList<>(0);
        if (focus != null) {
            res.addAll(postorderHelper(focus.getLeft()));
            res.addAll(postorderHelper(focus.getRight()));
            res.add(focus.getData());
        }
        return res;
    }

    // left, middle, right
    @Override
    public List<T> inorder() {
        List<T> res = new ArrayList<>(0);
        res.addAll(inorderHelper(root.getLeft()));
        res.add(root.getData());
        res.addAll(inorderHelper(root.getRight()));
        return res;
    }

    private List<T> inorderHelper(BSTNode<T> focus) {
        List<T> res = new ArrayList<>(0);
        if (focus != null) {
            res.addAll(inorderHelper(focus.getLeft()));
            res.add(focus.getData());
            res.addAll(inorderHelper(focus.getRight()));
        }
        return res;
    }

    //
    @Override
    public List<T> levelorder() {
        LinkedList<BSTNode<T>> queue = new LinkedList<>();
        List<T> res = new ArrayList<>(size);
        BSTNode<T> tmp;
        queue.add(root);
        while (!queue.isEmpty()) {
            tmp = queue.pollFirst();
            if (tmp != null) {
                res.add(tmp.getData());
                queue.add(tmp.getLeft());
                queue.add(tmp.getRight());
            }
        }
        return res;
    }


    @Override
    public void clear() {
        root = null;
        size = 0;
    }

    @Override
    public int height() {
        return (root != null) ? heightHelper(root) : -1;
    }

    // helper method to make BST::height recursive
    private int heightHelper(BSTNode<T> focus) {
        if (focus != null
                && (focus.getLeft() != null || focus.getRight() != null)) {
            int lHeight = heightHelper(focus.getLeft());
            int rHeight = heightHelper(focus.getRight());

            return Math.max(lHeight, rHeight) + 1;
        } else {
            return 0;
        }
    }
    
    /**
     * Compares two BSTs and checks to see if the trees are the same.  If
     * the trees have the same data in a different arrangement, this method
     * should return false.  This will only return true if the tree is in the
     * exact same arrangement as the other tree.
     *
     * You may assume that you won't get a BST with a different generic type.
     * For example, if this BST holds Strings, then you will not get as an input
     * a BST that holds Integers.
     * 
     * Be sure to also implement the other general checks that .equals() should
     * check as well.
     *
     * Should have a running time of O(n).
     * 
     * @param other the Object we are comparing this BST to
     * @return true if other is equal to this BST, false otherwise.
     */
    public boolean equals(Object other) {
        if (other == null || !(other instanceof BSTNode) || this == null) {
            return false;
        }

        return equalsHelper(root, (BSTNode) other);
    }

    // private method for doing equals recursively
    private boolean equalsHelper(BSTNode n1, BSTNode n2) {
        if (n1 == n2) {
            return true;
        }

        if (n1 == null || n2 == null) {
            return false;
        }

        return n1.getData().equals(n2.getData())
                && equalsHelper(n1.getLeft(), n2.getLeft())
                && equalsHelper(n1.getRight(), n2.getRight());
    }

    @Override
    public BSTNode<T> getRoot() {
        // DO NOT EDIT THIS METHOD!
        return root;
    }
}
