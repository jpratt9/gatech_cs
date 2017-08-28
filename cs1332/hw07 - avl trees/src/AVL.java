import java.util.*;

/**
 * Your implementation of an AVL Tree.
 *
 * @author John Pratt
 * @version 1.0
 */
public class AVL<T extends Comparable<? super T>> implements AVLInterface<T> {

    // Do not make any new instance variables.
    private AVLNode<T> root;
    private int size;

    /**
     * A no argument constructor that should initialize an empty AVL tree.
     * DO NOT IMPLEMENT THIS CONSTRUCTOR!
     */
    public AVL() {
    }

    /**
     * Initializes the AVL tree with the data in the Collection. The data
     * should be added in the same order it is in the Collection.
     *
     * @param data the data to add to the tree
     * @throws IllegalArgumentException if data or any element in data is null
     */
    public AVL(Collection<T> data) {
        if (data == null) {
            throw new IllegalArgumentException("Cannot add null Collection to"
                    + " the AVL tree.");
        }
        size = 0;
        root = null;
        for (T t : data) {
            this.add(t);
        }
    }
    /**
     * Calculates the balance factor associated with AVL node {@code focus},
     * which is defined as the difference in the heights of its children
     * (left - right).
     *
     * @param focus the AVL node whose balance factor is to be calculated
     * @return the balance factor assocaited with {@code focus}
     */
    private int getBalanceFactor(AVLNode<T> focus) {
        return height(focus.getLeft()) - height(focus.getRight());
    }

    /**
     * Internal method for doing a right rotation on AVL node {@code y}.
     *
     * @param y the pivot AVL node to be rotated to the right.
     * @return the node that now occupies the place {@code y} did in the tree.
     */
    private AVLNode<T> rotateRight(AVLNode<T> y) {
        AVLNode<T> x = y.getLeft();
        AVLNode<T> t2 = x.getRight();

        x.setRight(y);
        y.setLeft(t2);

        y.setHeight(height(y));
        y.setBalanceFactor(getBalanceFactor(y));
        x.setHeight(height(x));
        x.setBalanceFactor(getBalanceFactor(x));

        return x;
    }

    /**
     * Internal method for doing a left rotation on AVL node {@code y}.
     *
     * @param x the pivot AVL node to be rotated to the left.
     * @return the node that now occupies the place {@code x} did in the tree.
     */
    private AVLNode<T> rotateLeft(AVLNode<T> x) {
        AVLNode<T> y = x.getRight();
        AVLNode<T> t2 = y.getLeft();

        y.setLeft(x);
        x.setRight(t2);

        x.setHeight(height(x));
        x.setBalanceFactor(getBalanceFactor(x));
        y.setHeight(height(y));
        y.setBalanceFactor(getBalanceFactor(y));

        return y;
    }

    @Override
    public void add(T data) {
        if (data == null) {
            throw new IllegalArgumentException("Cannot add null data to the "
                    + "AVL tree.");
        }
        AVLNode<T> inserting = new AVLNode<>(data);
        inserting.setHeight(0);
        inserting.setBalanceFactor(0);

        if (root == null) {
            root = inserting;
            size++;
        } else {
            root = add(root, data);
        }
        updateNodes(root, inserting);
    }

    /**
     * Internal method for adding data to the tree. See {@code
     * AVLInterface::add}.
     *
     * @param focus current node being focused on.
     * @param data the actual data to be added to the tree
     * @return the modified version of {@code focus} once {@code data} has
     * been added (this, after recursion finishes is the modified version of
     * {@code root}.
     */
    private AVLNode<T> add(AVLNode<T> focus, T data) {
        if (focus == null) {
            size++;
            AVLNode<T> inserted = new AVLNode<>(data);
            inserted.setHeight(0);
            inserted.setBalanceFactor(0);
            return new AVLNode<>(data);
        }

        if (data.compareTo(focus.getData()) < 0) {
            focus.setLeft(add(focus.getLeft(), data));
        } else if (data.compareTo(focus.getData()) > 0) {
            focus.setRight(add(focus.getRight(), data));
        }

        focus.setHeight(height(focus));
        focus.setBalanceFactor(getBalanceFactor(focus));
        int balance = focus.getBalanceFactor();
        // left left
        if (balance > 1 && data.compareTo(focus.getLeft().getData()) < 0) {
            return rotateRight(focus);
        }
        // right right
        if (balance < -1 && data.compareTo(focus.getRight().getData()) > 0) {
            return rotateLeft(focus);
        }
        //left right
        if (balance > 1 && data.compareTo(focus.getLeft().getData()) > 0) {
            focus.setLeft(rotateLeft(focus.getLeft()));
            return rotateRight(focus);
        }
        // right left
        if (balance < -1 && data.compareTo(focus.getRight().getData()) < 0) {
            focus.setRight(rotateRight(focus.getRight()));
            return rotateLeft(focus);
        }
        return focus;
    }

    /**
     * Internal method that updates nodes' {@code height} and {@code
     * balanceFactor} that were run through when data was added.
     *
     * @param parent the node on the path to {@code inserted} that needs to
     *               have its {@code height} and {@code balanceFactor}
     *               updated after an insertion.
     * @param inserted the node containing the {@code data} that was inserted
     *                 when {@code add} was called.
     * @return the updated version of parent.
     */
    private AVLNode<T> updateNodes(AVLNode<T> parent, AVLNode<T> inserted) {
        if (parent == null) {
            return parent;
        }
        if (inserted.getData().compareTo(parent.getData()) < 0) {
            parent = updateNodes(parent.getLeft(), inserted);
        } else if (inserted.getData().compareTo(parent.getData()) > 0) {
            parent = updateNodes(parent.getRight(), inserted);
        } else {
            parent.setHeight(height(parent));
            parent.setBalanceFactor(getBalanceFactor(parent));
        }
        return parent;
    }

    @Override
    public T remove(T data) {
        if (data == null) {
            throw new IllegalArgumentException("Cannot remove null data from "
                    + "BST.");
        }
        AVLNode<T> dumby = new AVLNode<T>(null);
        removeHelper(root, dumby, data);
        if (dumby.getData() == null) {
            throw new NoSuchElementException("Cannot remove data from BST "
                    + "that is not in BST.");
        }
        return dumby.getData();
    }

    // Helper method for BST::remove to make it recursive
    // (via https://piazza.com/class/ijhd4dhacv9du?cid=175)

    /**
     * Internal method for {@code AVL::remove}. See {@code
     * AVLInterface::remove}.
     *
     * @param focus current node being focused on.
     * @param dumby a dumby node to be passed into the successor helper.
     * @param data data to be removed from the tree.
     * @return the modified version of {@code focus} once {@code data} has
     * been removed (this, after recursion finishes, is the modified version of
     * {@code root}).
     */
    private AVLNode<T> removeHelper(AVLNode<T> focus, AVLNode<T> dumby,
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
                AVLNode<T> dumby1 = new AVLNode<>(null);
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

    /**
     * Helper method for finding a successor after removing data. See {@code
     * AVLInterface::remove}.
     *
     * @param focus current node being focused on.
     * @param dumby a dumby node that simply allows the method to "climb back
     *              up" after doing recursion.
     * @return the modified version of {@code focus} once {@code data} has
     * been removed (this, after recursion finishes, is the modified version of
     * {@code root}).
     */
    private AVLNode<T> successorHelper(AVLNode<T> focus, AVLNode<T> dumby) {
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
            throw new IllegalArgumentException("Cannot get null data from AVL"
                    + " tree.");
        }
        return get(root, data);
    }

    /**
     * Internal implementation of {@code AVL::get}. See {@code
     * AVLInterface::get}.
     *
     * @param focus current node being focused on.
     * @param data data to be extracted.
     * @throws NoSuchElementException if data is not in the tree.
     * @return a {@code T} object that equals {@code data} which is in the tree.
     */
    private T get(AVLNode<T> focus, T data) {
        // Data isn't in the BST
        if (focus == null) {
            throw new NoSuchElementException("Cannot remove data that is not "
                    + "in AVL tree.");
        }

        if (focus.getData().equals(data)) {
            return focus.getData();
        } else if (focus.getData().compareTo(data) > 0) {
            return get(focus.getLeft(), data);
        } else {
            return get(focus.getRight(), data);
        }
    }

    @Override
    public boolean contains(T data) {
        if (data == null) {
            throw new IllegalArgumentException("Cannot get null data from BST"
                    + ".");
        }
        return contains(root, data);
    }

    /**
     * Internal implementation of {@code AVL::contains}. See {@code
     * AVLInterface::contains}.
     *
     * @param focus current node being checked.
     * @param data data to be checked for.
     * @return {@code true} if there is a {@code T} object in the tree that
     * equals {@code data}, false otherwise.
     */
    private boolean contains(AVLNode<T> focus, T data) {
        if (focus == null) {
            return false;
        }
        if (focus.getData().compareTo(data) > 0) {
            return contains(focus.getLeft(), data);
        } else if (focus.getData().compareTo(data) < 0) {
            return contains(focus.getRight(), data);
            // Found it
        } else {
            return focus.getData().equals(data);
        }
    }

    @Override
    public int size() {
        return size;
    }

    @Override
    public List<T> preorder() {
        List<T> res = new ArrayList<>(0);
        if (root == null) {
            return res;
        }
        res.add(root.getData());
        res.addAll(preorder(root.getLeft()));
        res.addAll(preorder(root.getRight()));
        return res;
    }

    /**
     * Internal implementation of {@code AVL::preorder}. See {@code
     * AVLInterface::preorder}.
     *
     * @param focus current node being processed.
     * @return a {@code java.utils.ArrayList} containing all of the elements
     * in this tree in preorder.
     */
    private List<T> preorder(AVLNode<T> focus) {
        List<T> res = new ArrayList<>(0);
        if (focus != null) {
            res.add(focus.getData());
            res.addAll(preorder(focus.getLeft()));
            res.addAll(preorder(focus.getRight()));
        }
        return res;
    }

    @Override
    public List<T> postorder() {
        List<T> res = new ArrayList<>(0);
        if (root == null) {
            return res;
        }
        res.addAll(postorder(root.getLeft()));
        res.addAll(postorder(root.getRight()));
        res.add(root.getData());
        return res;
    }

    /**
     * Internal implementation of {@code AVL::postorder}. See {@code
     * AVLInterface::postorder}.
     *
     * @param focus current node being processed.
     * @return a {@code java.utils.ArrayList} containing all of the elements
     * in this tree in postorder.
     */
    private List<T> postorder(AVLNode<T> focus) {
        List<T> res = new ArrayList<>(0);
        if (focus != null) {
            res.addAll(postorder(focus.getLeft()));
            res.addAll(postorder(focus.getRight()));
            res.add(focus.getData());
        }
        return res;
    }

    @Override
    public List<T> inorder() {
        List<T> res = new ArrayList<>(0);
        if (root == null) {
            return res;
        }
        res.addAll(inorder(root.getLeft()));
        res.add(root.getData());
        res.addAll(inorder(root.getRight()));
        return res;
    }

    /**
     * Internal implementation of {@code AVL::inorder}. See {@code
     * AVLInterface::inorder}.
     *
     * @param focus current node being processed.
     * @return a {@code java.utils.ArrayList} containing all of the elements
     * in this tree in inorder.
     */
    private List<T> inorder(AVLNode<T> focus) {
        List<T> res = new ArrayList<>(0);
        if (focus != null) {
            res.addAll(inorder(focus.getLeft()));
            res.add(focus.getData());
            res.addAll(inorder(focus.getRight()));
        }
        return res;
    }

    @Override
    public List<T> levelorder() {
        LinkedList<AVLNode<T>> queue = new LinkedList<>();
        List<T> res = new ArrayList<>(size);
        AVLNode<T> tmp;
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
        if (root == null) {
            return -1;
        }
        return height(root);
    }

    /**
     * Internal implementation of {@code AVL::height}. See {@code
     * AVLInterface::height}.
     *
     * @param focus node to have its height computed.
     * @return the height of {@code focus}. See {@code
     * AVLInterface::height}. for the formula for height.
     */
    private int height(AVLNode<T> focus) {
        if (focus == null) {
            return -1;
        }
        if (focus != null
                && (focus.getLeft() != null || focus.getRight() != null)) {
            return Math.max(height(focus.getLeft()), height(focus.getRight()))
                    + 1;
        } else {
            return 0;
        }
    }
    
    /**
     * Compares two AVLs and checks to see if the trees are the same.  If
     * the trees have the same data in a different arrangement, this method
     * should return false.  This will only return true if the tree is in the
     * exact same arrangement as the other tree.
     *
     * You may assume that you won't get an AVL with a different generic type.
     * For example, if this AVL holds Strings, then you will not get as an input
     * an AVL that holds Integers.
     * 
     * Be sure to also implement the other general checks that .equals() should
     * check as well.
     * 
     * @param other the Object we are comparing this AVL to
     * @return true if other is equal to this AVL, false otherwise.
     */
    public boolean equals(Object other) {
        if (!(other instanceof AVL)) {
            return false;
        }
        AVL<T> o = (AVL<T>) other;
        if ((root == null && o.root != null)
            || (root != null && o.root == null)) {
            return false;
        }
        return equalsHelper(root, o.root);
    }

    /**
     * Internal implementation of {@code AVL::equals}. See {@code
     * AVLInterface::equals}.
     *
     * @param n1 root node 1 to be compared.
     * @param n2 root node 2 to be compared.
     * @return true iff the nodes n1 and n2 are equal. See {@code
     * AVLInterface::equals}.
     */

    private boolean equalsHelper(AVLNode<T> n1, AVLNode<T> n2) {
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
    public AVLNode<T> getRoot() {
        // DO NOT EDIT THIS METHOD!
        return root;
    }
}
