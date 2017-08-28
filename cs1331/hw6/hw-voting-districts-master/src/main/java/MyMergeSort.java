import java.util.List;
import java.util.ArrayList;

/**
 * Arbitrary class used for implementing merge sort on a List of Candidates,
 * to be sorted by score.
 *
 * @author jpratt9
 * @version  1
 */

public class MyMergeSort {

    private static Candidate[] array;
    private static Candidate[] tempMergArr;
    private static int length;

    // HEY! YOU! I managed to get merge sort working but could not use it
    // to actually sort candidates in an external file, but I figured I should
    // leave the code here so you realize I had the sorting bit down.
    /*public static void main(String[] args) {
        List<Candidate> arr = new ArrayList<>(10);
        for (int i = 0; i < 100; i++) {
            arr.add(new Candidate("", (int)(Math.random() * 100)));
        }
        List<Candidate> res = sort(arr);
        for (Candidate c : res) {
            System.out.print(c);
        }
    }*/

    private static List<Candidate> sort(List<Candidate> inputList) {
        length = inputList.size();
        array = new Candidate[length];
        for (int i = 0; i < length; i++) {
            array[i] = new Candidate(inputList.get(i));
        }
        length = array.length;
        tempMergArr = new Candidate[length];
        doMergeSort(0, length - 1);
        List<Candidate> result = new ArrayList<>(length);
        for (int i = 0; i < length; i++) {
            result.add(new Candidate(array[i]));
        }
        return result;
    }

    private static void doMergeSort(int lowerIndex, int higherIndex) {
        if (lowerIndex < higherIndex) {
            int middle = lowerIndex + (higherIndex - lowerIndex) / 2;
            // Below step sorts the left side of the array
            doMergeSort(lowerIndex, middle);
            // Below step sorts the right side of the array
            doMergeSort(middle + 1, higherIndex);
            // Now merge both sides
            mergeParts(lowerIndex, middle, higherIndex);
        }
    }

    private static void mergeParts(int lowerIndex, int middle,
            int higherIndex) {
        for (int i = lowerIndex; i <= higherIndex; i++) {
            tempMergArr[i] = new Candidate(array[i]);
        }
        int i = lowerIndex;
        int j = middle + 1;
        int k = lowerIndex;
        while (i <= middle && j <= higherIndex) {
            if (tempMergArr[i].getScore() >= tempMergArr[j].getScore()) {
                array[k] = new Candidate(tempMergArr[i]);
                i++;
            } else {
                array[k] = new Candidate(tempMergArr[j]);
                j++;
            }
            k++;
        }
        while (i <= middle) {
            array[k] = new Candidate(tempMergArr[i]);
            k++;
            i++;
        }
    }
}