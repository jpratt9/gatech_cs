/**
 * Created by Bill on 1/23/2016.
 */
public class MySimpleTest {
    public static void main(String[] args) {
        SinglyLinkedList<String> list = new SinglyLinkedList<>();
        list.addToBack("a");
        System.out.println(list.getHead());

        System.out.println(list.removeAllOccurrences("b"));
        System.out.println(list.removeAllOccurrences("a"));
    }
}
