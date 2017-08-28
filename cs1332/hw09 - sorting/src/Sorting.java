import java.util.ArrayList;
import java.util.Comparator;
import java.util.Random;

/**
 * Your implementation of various sorting algorithms.
 *
 * @author John Pratt
 * @version 1.0
 */
public class Sorting {


    /**
     * Master checker for IllegalArgumentExceptions
     *
     * @throws IllegalArgumentException if the array or comparator is null
     * @param <T> data type to sort
     * @param arr the array that must be sorted after the method runs
     * @param comparator the Comparator used to compare the data in arr
     */

    private static <T> void nullChecker(T[] arr, Comparator<T> comparator) {
        if (arr == null) {
            throw new IllegalArgumentException("Array to be sorted cannot be "
                    + "null.");
        }
        if (comparator == null) {
            throw new IllegalArgumentException("Comparator cannot be null.");
        }
    }

    /**
     * Implement bubble sort.
     *
     * It should be:
     *  in-place
     *  stable
     *
     * Have a worst case running time of:
     *  O(n^2)
     *
     * And a best case running time of:
     *  O(n)
     *
     * Any duplicates in the array should be in the same relative position after
     * sorting as they were before sorting. (stable).
     *
     * See the PDF for more info on this sort.
     *
     * @throws IllegalArgumentException if the array or comparator is null
     * @param <T> data type to sort
     * @param arr the array that must be sorted after the method runs
     * @param comparator the Comparator used to compare the data in arr
     */
    public static <T> void bubbleSort(T[] arr, Comparator<T> comparator) {
        nullChecker(arr, comparator);
        int n = arr.length;
        T tmp;
        do {
            int newN = 0;
            for (int i = 1; i < n; i++) {
                if (comparator.compare(arr[i-1], arr[i]) > 0) {
                    tmp = arr[i];
                    arr[i] = arr[i - 1];
                    arr[i - 1] = tmp;
                    newN = i;
                }
            }
            n = newN;
        } while (n != 0);
    }
    
    /**
     * Implement insertion sort.
     *
     * It should be:
     *  in-place
     *  stable
     *
     * Have a worst case running time of:
     *  O(n^2)
     *
     * And a best case running time of:
     *  O(n)
     *
     * Any duplicates in the array should be in the same relative position after
     * sorting as they were before sorting. (stable).
     *
     * See the PDF for more info on this sort.
     *
     * @throws IllegalArgumentException if the array or comparator is null
     * @param <T> data type to sort
     * @param arr the array that must be sorted after the method runs
     * @param comparator the Comparator used to compare the data in arr
     */
    public static <T> void insertionSort(T[] arr, Comparator<T> comparator) {
        nullChecker(arr, comparator);
        T tmp;
        int j;
        for (int i = 1; i < arr.length; i++) {
            j = i;
            while (j > 0 && comparator.compare(arr[j - 1], arr[j]) > 0) {
                tmp = arr[j];
                arr[j] = arr[j - 1];
                arr[j - 1] = tmp;
                j--;
            }
        }
    }

    /**
     * Implement selection sort.
     *
     * It should be:
     *  in-place
     *
     * Have a worst case running time of:
     *  O(n^2)
     *
     * And a best case running time of:
     *  O(n^2)
     *
     * Note that there may be duplicates in the array, but they may not
     * necessarily stay in the same relative order.
     *
     * @throws IllegalArgumentException if the array or comparator is null
     * @param <T> data type to sort
     * @param arr the array that must be sorted after the method runs
     * @param comparator the Comparator used to compare the data in arr
     */
    public static <T> void selectionSort(T[] arr, Comparator<T> comparator) {
        nullChecker(arr, comparator);
        int min;
        T tmp;
        for (int i = 0; i < arr.length; i++) {
            min = i;
            for (int j = i + 1; j < arr.length; j++) {
                if (comparator.compare(arr[j], arr[min]) < 0) {
                    min = j;
                }
            }
            tmp = arr[i];
            arr[i] = arr[min];
            arr[min] = tmp;
        }
        /*
        int place = 0;
        System.out.println("Selection sorted array:");
        for (T t : arr) {
            System.out.println((place++) + " : " + t + " | ");
        }*/
    }

    /**
     * Implement quick sort.
     *
     * Use the provided random object to select your pivots.
     * For example if you need a pivot between a (inclusive)
     * and b (exclusive) where b > a, use the following code:
     *
     * int pivotIndex = r.nextInt(b - a) + a;
     *
     * It should be:
     *  in-place
     *
     * Have a worst case running time of:
     *  O(n^2)
     *
     * And a best case running time of:
     *  O(n log n)
     *
     * Note that there may be duplicates in the array.
     * 
     * Make sure you code the algorithm as you have been taught it in class.
     * There are several versions of this algorithm and you may not get full
     * credit if you do not use the one we have taught you!
     *
     * @throws IllegalArgumentException if the array or comparator or rand is
     * null
     * @param <T> data type to sort
     * @param arr the array that must be sorted after the method runs
     * @param comparator the Comparator used to compare the data in arr
     * @param rand the Random object used to select pivots
     */
    public static <T> void quickSort(T[] arr, Comparator<T> comparator,
                                     Random rand) {
        nullChecker(arr, comparator);
    }

    /**
     * Implement merge sort.
     *
     * It should be:
     *  stable
     *
     * Have a worst case running time of:
     *  O(n log n)
     *
     * And a best case running time of:
     *  O(n log n)
     *
     * You can create more arrays to run mergesort, but at the end,
     * everything should be merged back into the original T[]
     * which was passed in.
     *
     * Any duplicates in the array should be in the same relative position after
     * sorting as they were before sorting.
     *
     * @throws IllegalArgumentException if the array or comparator is null
     * @param <T> data type to sort
     * @param arr the array to be sorted
     * @param comparator the Comparator used to compare the data in arr
     */
    public static <T> void mergeSort(T[] arr, Comparator<T> comparator) {
        nullChecker(arr, comparator);
        arr = mergeSortHelper(arr, comparator);
    }

    /**
     * Does the actual merge sorting using return statements (seemed easier
     * at the time)
     *
     * @param <T> data type to sort
     * @param arr the array that must be sorted after the method runs
     * @param comparator the Comparator used to compare the data in arr
     * @return the merge-sorted array!
     */

    private static <T> T[] mergeSortHelper(T[] arr, Comparator<T> comparator) {
        if (arr.length <= 1) {
            return arr;
        } else {
            int odd = arr.length % 2 == 0 ? 0 : 1;
            int mid = arr.length / 2;
            T[] left = (T[]) (new Object[mid / 2]);
            T[] right = (T[]) (new Object[mid / 2 + odd]);
            T[] res = (T[]) (new Object[mid]);
            int i = 0;
            for (; i < mid; i++) {
                left[i] = arr[i];
            }
            for (; i < arr.length; i++) {
                right[i - mid] = arr[i];
            }
            left = mergeSortHelper(left, comparator);
            right = mergeSortHelper(right, comparator);
            if (comparator.compare(left[left.length - 1], right[0]) <= 0) {
                i = 0;
                for (; i < mid; i++) {
                    res[i] = left[i];
                }
                for (; i < arr.length; i++) {
                    res[i] = right[i - mid];
                }
                arr = res;
            }
            res = merge(left, right, comparator);
            arr = res;
        }
    }

    /**
     * Returns a merge of left and right.
     *
     * @throws IllegalArgumentException if the array or comparator is null
     * @param <T> data type to sort
     * @param left the left array to be merged
     * @param right the right arrray to be merged
     * @param comp the Comparator used to compare the data
     * @return the merge of left and right.
     */
    private static <T> T[] merge(T[] left, T[] right, Comparator<T> comp) {
        int len = left.length;
        len = len < right.length ? right.length : len;
        T[] res =(T[]) new Object[len];
        int leftLen = left.length;
        int rightLen = right.length;
        int leftInd = 0;
        int rightInd = 0;
        int resInd = 0;
        while (leftInd < leftLen && rightInd < rightLen) {
            if (comp.compare(left[leftInd], right[rightInd]) <= 0) {
                res[resInd] = left[leftInd++];
            } else {
                res[resInd] = right[rightInd++];
            }
        }

    }

    /*
    // splitting! i ended up completely reworking my merge sort and not
    needing this, but i'm pretty proud of this, so you get to read it if you're
    here
    // javadocs - whichhalf = 0..1
    private static <T> T[] split(T[] arr, int whichHalf) {
        T[] res;
        if (arr.length == 0) {
            return new T[0];
        }
        int odd = arr.length % 2 == 0 ? 0 : 1;
        // length will be len/2 ( + 1 if second half and odd length)
        res = new T[arr.length / 2 + odd * whichHalf]; // remind me again why
                                                       // java implements
                                                       // booleans natively?
        //int maxIndex = whichHalf == 0 ? arr.length / 2: arr.length;
        int arrIndex = whichHalf == 0 ? 0 : arr.length / 2;
        for (int resIndex = 0; resIndex < res.length; resIndex++) {
            res[resIndex] = arr[arrIndex++];
        }
        return res;
    }
    */

    /**
     * Implement LSD (least significant digit) radix sort.
     *
     * Remember you CANNOT convert the ints to strings at any point in your
     * code!
     *
     * It should be:
     *  stable
     *
     * Have a worst case running time of:
     *  O(kn)
     *
     * And a best case running time of:
     *  O(kn)
     *
     * Any duplicates in the array should be in the same relative position after
     * sorting as they were before sorting. (stable)
     *
     * Do NOT use {@code Math.pow()} in your sort. Instead, if you need to, use
     * the provided {@code pow()} method below.
     *
     * You may use {@code java.util.ArrayList} or {@code java.util.LinkedList}
     * if you wish, but it may only be used inside radix sort and any radix sort
     * helpers. Do NOT use these classes with other sorts.
     *
     * @throws IllegalArgumentException if the array is null
     * @param arr the array to be sorted
     * @return the sorted array
     */
    public static int[] lsdRadixSort(int[] arr) {
        if (arr == null) {
            throw new IllegalArgumentException("Passed in array (\'arr\') "
                    + "cannot be null");
        }
        // we in base 10 after all
        final int BASE = 10;
        // buckets is the array list containing each ... bucket!
        ArrayList<ArrayList<Integer>> buckets = new
                ArrayList<>(BASE);
        for (int i = 0; i < BASE; i++) {
            buckets.add(new ArrayList<>());
        }
        // max is the largest int in the array
        int max = arr[0];
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] > max) {
                max = arr[i];
            }
        }
        //maxpow is the number of digits in max
        int maxpow = 0;
        while (pow(10, maxpow) < max) {
            maxpow++;
        }
        maxpow = pow(10,maxpow) == max ? maxpow : maxpow - 1;
        //int divisor;
        int[] tmpArr = new int[arr.length]; //working array
        int bucketNum;
        int pow = 0;
        int tmpArrIter;
        carryOver(arr, tmpArr);
        while (pow <= maxpow) {
            tmpArrIter = 0;
            for (int i = 0; i < arr.length; i++) {
                bucketNum = placeVal(tmpArr[i], pow); // we need digit in the
                                                    // the pow+1th (or '10^pow')
                                                    // place
                buckets.get(bucketNum).add(tmpArr[i]);
                // now we transfer from array to bucket
            }
            // once we've done that for every value, we need to rearrange the
            // working array in the new order we've established with the LSD

            for (ArrayList<Integer> list : buckets) {
                for (int i = 0; i < list.size(); i++) {
                    tmpArr[tmpArrIter] = list.get(i);
                    tmpArrIter++;
                }
            }
            // increment pow to move to next LSD
            pow++;
        }
        // clear out the buckets now that tmpArr contains all numbers in LSD
        // sorted order, ignoring sign. now we take sign (+/-) into account
        buckets.clear();
        buckets.add(new ArrayList<>());
        buckets.add(new ArrayList<>());
        // bucket "0" is negatives, "1" is positives
        for (int i : tmpArr) {
            int index = Math.abs(i) == i ? 1 : 0;
            buckets.get(index).add(i);
        }

        // be sure to reverse ordering on the negatives!
        for (int i = 0; i < buckets.get(0).size() / 2; i++) {
            // save
            int tmp1 = buckets.get(0).get(i);
            int tmp2 = buckets.get(0).get(buckets.get(0).size() - i);
            // swap
            buckets.get(0).set(i,tmp2);
            buckets.get(0).set(buckets.get(0).size() - i, tmp1);

        }

        // now we add the properly sorted negatives along with postives into
        // the result!
        tmpArrIter = 0;
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < buckets.get(i).size(); j++) {
                tmpArr[tmpArrIter] = buckets.get(i).get(j);
            }
        }
        // tmpArray is now theoretically sorted! It only took kn + ~3n = (k +
        // 3) * n
        return tmpArr;
    }

    /**
     * Returns the value contained in the place (0..log10(max)) of num.
     *
     * @throws IllegalArgumentException if the array or comparator is null
     * @param num number to be inspected
     * @param place place slot to be checked
     * @param for example 1023, 2 yields 0
     */

    private static int placeVal(int num, int place) {
        // please don't ask me why any of this works. it has to do with
        // going from double to int cutting off decimal places and double
        // precision being better than int. all i know is that it works.
        num = Math.abs(num);
        if (num < pow(10, place)) {
            return 0;
        }
        int tmp = (int) ((double) (num) / pow(10, place));
        if (tmp > 0 && tmp < 10) {
            return tmp;
        }
        tmp = (int) ((double) (num) / pow(10, place + 1));
        return (tmp - num) / pow(10, place);
    }

    private static void carryOver(int[] from, int[] to) {
        if (from.length != to.length) {
            throw new IllegalArgumentException("Inputted arrays need to be of"
                    + " equal length!");
        }
        for (int i = 0; i < from.length; i++) {
            to[i] = from[i];
        }
    }
    
    /**
     * Implement MSD (most significant digit) radix sort.
     *
     * Remember you CANNOT convert the ints to strings at any point in your
     * code!
     *
     * It should:
     *
     * Have a worst case running time of:
     *  O(kn)
     *
     * And a best case running time of:
     *  O(kn)
     *
     * Do NOT use {@code Math.pow()} in your sort. Instead, if you need to, use
     * the provided {@code pow()} method below.
     *
     * You may use {@code java.util.ArrayList} or {@code java.util.LinkedList}
     * if you wish, but it may only be used inside radix sort and any radix sort
     * helpers. Do NOT use these classes with other sorts.
     *
     * @throws IllegalArgumentException if the array is null
     * @param arr the array to be sorted
     * @return the sorted array
     */
    public static int[] msdRadixSort(int[] arr) {
        if (arr == null) {
            throw new IllegalArgumentException("Cannot sort null array.");
        }
        ArrayList<ArrayList<Integer>> buckets = new ArrayList<>();
        // initialize empty buckets
        for (int i = -9; i < 10; i++) {
            buckets.add(new ArrayList<>());
        }
        // find the largest magnitude in the array
        int max = arr[0];
        for (int i : arr) {
            if (Math.abs(i) > max) {
                max = Math.abs(i);
            }
        }
        // find log10(max) (the MSD!)
        int maxpow = 0;
        while (pow(10, maxpow) < max) {
            maxpow++;
        }
        maxpow = pow(10,maxpow) == max ? maxpow : maxpow - 1;

        // place numbers into their initial bucket (the largest buckets that
        // will exist)
        for (int i : arr) {
            buckets.get(i / maxpow).add(i);
        }

        // for every bucket, if it's not length 1 and having its ones place
        // read, recurse to the next largest MSD
        for (ArrayList<Integer> bucket : buckets) {
            if (bucket.size() > 1 && maxpow > 0) {
                msdRadixSort(bucket, maxpow - 1);
            }
        }

        // dump all the buckets into a primitive int array, then return that
        int[] result = new int[arr.length];
        int resultIter = 0;
        for (ArrayList<Integer> bucket : buckets) {
            for (Integer i : bucket) {
                result[resultIter] = i;
            }
        }

        return result;
    }

    /**
     * Actual implementation of msdRadixSort using ArrayList (for the big
     * buckets!)
     *
     * @param arr the array that must be sorted after the method runs
     * @return an ArrayList of Integers that is the MSD sort result examining
     * MSD maxpow
     */

    private static ArrayList<Integer> msdRadixSort(ArrayList<Integer> arr, int
            maxpow) {
        ArrayList<ArrayList<Integer>> buckets = new ArrayList<>();
        // initialize empty buckets
        for (int i = -9; i < 10; i++) {
            buckets.add(new ArrayList<>());
        }
        // move everything from the array over to its proper bucket
        for (int i : arr) {
            int placeVal = placeValMSD(i, maxpow); //MSD treats negatives
            // differently than LSD, where it was safer to just deal with
            // them at the end
            buckets.get(placeVal).add(i);
        }
        // iterate through the buckets, and if you find a bucket that's not 1
        // long, recursively msd radix sort the bucket
        for (ArrayList<Integer> bucket : buckets) {
            if (bucket.size() > 1 && maxpow > 0) {
                msdRadixSort(bucket, maxpow - 1);
            } else {
                return bucket;
            }
        }

        // pour everything from the buckets into one bucket
        ArrayList<Integer> result = new ArrayList<>();
        for (ArrayList<Integer> bucket : buckets) {
            for (Integer i : bucket) {
                result.add(i);
            }
        }
        return result;
    }

    /**
     * Finds the digit at "place"s in the number "num". This is negative if
     * the number is negative now!
     *
     * @param num integer to be inspected
     * @param place slot to be examined (going from right to left, it can be
     *              0..log10(max))
     * @return the value in the place place in num
     */

    private static int placeValMSD(int num, int place) {
        // please don't ask me why any of this works. it has to do with
        // going from double to int cutting off decimal places and double
        // precision being better than int. all i know is that it works.
        int sign = Math.abs(num) / num;
        num = Math.abs(num);
        if (num < pow(10, place)) {
            return 0;
        }
        int tmp = (int) ((double) (num) / pow(10, place));
        if (tmp > 0 && tmp < 10) {
            return sign * tmp;
        }
        tmp = (int) ((double) (num) / pow(10, place + 1));
        return sign * (tmp - num) / pow(10, place);
    }


    /**
     * Calculate the result of a number raised to a power. Use this method in
     * your radix sorts instead of {@code Math.pow()}.
     * 
     * DO NOT MODIFY THIS METHOD.
     *
     * @throws IllegalArgumentException if both {@code base} and {@code exp} are
     * 0
     * @throws IllegalArgumentException if {@code exp} is negative
     * @param base base of the number
     * @param exp power to raise the base to. Must be 0 or greater.
     * @return result of the base raised to that power
     */
    private static int pow(int base, int exp) {
        if (exp < 0) {
            throw new IllegalArgumentException("Exponent cannot be negative.");
        } else if (base == 0 && exp == 0) {
            throw new IllegalArgumentException(
                    "Both base and exponent cannot be 0.");
        } else if (exp == 0) {
            return 1;
        } else if (exp == 1) {
            return base;
        }
        int halfPow = pow(base, exp / 2);
        if (exp % 2 == 0) {
            return halfPow * halfPow;
        } else {
            return halfPow * pow(base, (exp / 2) + 1);
        }
    }
}
