import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import java.util.NoSuchElementException;

import static org.junit.Assert.*;

/**
 * (hopefully) Comprehensive tests for Homework 2
 *
 * @author flynn
 * @version 1.1
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class StacksQueuesTylersTests {

    private StackInterface<String> stack;
    private QueueInterface<String> queue;

    public static final int TIMEOUT = 200;

    @Test(timeout = TIMEOUT, expected = IllegalArgumentException.class)
    public void test_01_arrayQueue_arg_exception() {
        queue = new ArrayQueue();
        queue.enqueue(null);
    }

    @Test(timeout = TIMEOUT, expected = IllegalArgumentException.class)
    public void test_02_listQueue_arg_exception() {
        queue = new LinkedListQueue();
        queue.enqueue(null);
    }

    @Test(timeout = TIMEOUT, expected = NoSuchElementException.class)
    public void test_03_arrayQueue_nosuch_exception() {
        queue = new ArrayQueue();
        queue.dequeue();
    }

    @Test(timeout = TIMEOUT, expected = NoSuchElementException.class)
    public void test_04_listQueue_nosuch_exception() {
        queue = new LinkedListQueue();
        queue.dequeue();
    }

    @Test(timeout = TIMEOUT, expected = IllegalArgumentException.class)
    public void test_05_arrayStack_arg_exception() {
        stack = new ArrayStack();
        stack.push(null);
    }

    @Test(timeout = TIMEOUT, expected = IllegalArgumentException.class)
    public void test_06_listStack_arg_exception() {
        stack = new LinkedListStack();
        stack.push(null);
    }

    @Test(timeout = TIMEOUT, expected = NoSuchElementException.class)
    public void test_07_arrayStack_nosuch_exception() {
        stack = new ArrayStack();
        stack.pop();
    }

    @Test(timeout = TIMEOUT, expected = NoSuchElementException.class)
    public void test_08_listStack_nosuch_exception() {
        stack = new LinkedListStack();
        stack.pop();
    }

    @Test(timeout = TIMEOUT)
    public void test_09_arrayStack() {
        stack = new ArrayStack();
        // Did you implement the default constructor properly?
        compareStackToArray(new String[]{}, StackInterface.INITIAL_CAPACITY);
        stack = new ArrayStack(1);
        // Did you implement the initialCapacity constructor properly?
        compareStackToArray(new String[]{}, 1);
        stackMaker(new String[]{"a"});
        compareStackToArray(new String[]{"a"}, 1);
        stackMaker(new String[]{"a", "b"});
        // Did you regrow the backing array?
        compareStackToArray(new String[]{"b", "a"}, 2);
        stackMaker(new String[]{"a", "b", "c"});
        // Did you double the the backing array capacity?
        compareStackToArray(new String[]{"c", "b", "a"}, 4);
    }

    @Test(timeout = TIMEOUT)
    public void test_10_listStack() {
        stack = new LinkedListStack();
        compareStackToArray(new String[]{}, 0);
        stackMaker(new String[]{"a", "b", "c"});
        compareStackToArray(new String[]{"c", "b", "a"}, 3);
    }

    @Test(timeout = TIMEOUT)
    public void test_11_arrayQueue() {
        queue = new ArrayQueue();
        // Did you implement the default constructor properly?
        compareQueueToArray(new String[]{}, QueueInterface.INITIAL_CAPACITY);
        queue = new ArrayQueue(1);
        // Did you implement the initialCapacity constructor properly?
        compareQueueToArray(new String[]{}, 1);
        queueMaker(new String[]{"a"});
        compareQueueToArray(new String[]{"a"}, 1);
        queueMaker(new String[]{"a", "b"});
        // Did you regrow the backing array?
        compareQueueToArray(new String[]{"a", "b"}, 2);
        queueMaker(new String[]{"a", "b", "c"});
        // Did you double the the backing array capacity?
        compareQueueToArray(new String[]{"a", "b", "c"}, 4);
        /***********************************************************************
         *                       Simple queue wrapping                         *
         **********************************************************************/
        queueMaker(new String[]{"a", "b", "c", "d"});
        // queue should be {"a" (front), "b", "c", "d" (back)}
        assertEquals("a", queue.dequeue());
        // queue should be {null, "b" (front), "c", "d" (back)}
        queue.enqueue("e");
        // queue should be {"e" (back), "b" (front), "c", "d"}
        // queue should dequeue in the following order:
        compareQueueToArray(new String[]{"b", "c", "d", "e"}, 4);
        /***********************************************************************
         *                      Advanced queue wrapping                        *
         **********************************************************************/
        queueMaker(new String[]{"a", "b", "c", "d"});
        // queue should be {"a" (front), "b", "c", "d" (back)}
        assertEquals("a", queue.dequeue());
        // queue should be {null, "b" (front), "c", "d" (back)}
        queue.enqueue("e");
        // queue should be {"e" (back), "b" (front), "c", "d"}
        queue.enqueue("f");
        // queue should regrow and adjust front and back indices
        // queue should dequeue in the following order:
        compareQueueToArray(new String[]{"b", "c", "d", "e", "f"}, 8);
    }

    @Test(timeout = TIMEOUT)
    public void test_12_listQueue() {
        queue = new LinkedListQueue();
        compareQueueToArray(new String[]{}, 0);
        queueMaker(new String[]{"a", "b", "c"});
        compareQueueToArray(new String[]{"a", "b", "c"}, 3);
    }

    /**
     * Helper method to create an arrayStack or a listStack based on
     * @param arr The stack basis
     */
    private void stackMaker(String[] arr) {
        for (String item : arr) {
            stack.push(item);
        }
    }

    /**
     * Helper method to create an arrayQueue or a listQueue based on
     * @param arr The queue basis
     */
    private void queueMaker(String[] arr) {
        for (String item : arr) {
            queue.enqueue(item);
        }
    }

    /**
     * !!! VERY DESTRUCTIVE !!!
     * @param arr the array of expected objects against which stack is tested
     * @param size The expected size of stack backer
     */
    private void compareStackToArray(String[] arr, int size) {
        if (stack instanceof ArrayStack) {
            Object[] actualArr = ((ArrayStack) stack).getBackingArray();
            int nullCount = 0;
            for (int i = 0; i < actualArr.length; i++) {
                if (actualArr[i] == null) {
                    nullCount++;
                }
            }
            assertEquals("Did you nullify all popped items?",
                    size - arr.length, nullCount);
        }
        int notNullCount = arr.length;
        for (int i = 0; i < arr.length; i++) {
            assertEquals("Did you update size?", notNullCount, stack.size());
            assertEquals("Did you pop the right item?", arr[i], stack.pop());
            notNullCount--;
            if (notNullCount == 0) {
                assertTrue("Did you implement isEmpty properly?", stack.isEmpty());
            }
        }
    }

    /**
     * !!! VERY DESTRUCTIVE !!!
     * @param arr the array of expected objects against which queue is tested
     * @param size The expected size of queue backer
     */
    private void compareQueueToArray(Object[] arr, int size) {
        if (queue instanceof ArrayQueue) {
            Object[] actualArr = ((ArrayQueue) queue).getBackingArray();
            int nullCount = 0;
            for (int i = 0; i < actualArr.length; i++) {
                if (actualArr[i] == null) {
                    nullCount++;
                }
            }
            assertEquals("Did you nullify all dequeued items?",
                    size - arr.length, nullCount);
        }
        int notNullCount = arr.length;
        for (int i = 0; i < arr.length; i++) {
            assertEquals("Did you update size?", notNullCount, queue.size());
            assertEquals("Did you dequeue the right item?", arr[i], queue.dequeue());
            notNullCount--;
            if (notNullCount == 0) {
                assertTrue("Did you implement isEmpty properly?", queue.isEmpty());
            }
        }
    }

}