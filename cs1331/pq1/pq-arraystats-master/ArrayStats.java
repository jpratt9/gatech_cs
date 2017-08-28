import java.util.Arrays;

public class ArrayStats {

    public static int range(int[] nums) {
        int min = nums[0];
        int max = nums[0];
        for (int i = 1; i < nums.length; i++) {
            if (nums[i] < min) {
                min = nums[i];
            }
            if (nums[i] > max) {
                max = nums[i];
            }
        }
        return max - min;
    }

    public static int mode(int[] nums) {
        int min = nums[0];
        for (int i = 1; i < nums.length; i++) {
            if (nums[i] < min) {
                min = nums[i];
            }
        }
        int range = ArrayStats.range(nums);
        int[] freqs = new int[range + 1];
        for (int i = 0; i < nums.length; i++) {
            freqs[nums[i] - min]++;
        }
        int iMax = 0;
        for (int i = 1; i < freqs.length; i++) {
            if (freqs[i] > freqs[iMax]) {
                iMax = i;
            }
        }
        return iMax + min;
    }

    public static int mean(int[] nums) {
        int sum = 0;
        for (int i = 0; i < nums.length; i++) {
            sum += nums[i];
        }
        return sum / nums.length;
    }

    public static int median(int[] nums) {
        Arrays.sort(nums);
        if (nums.length % 2 == 0) {
            if (nums[nums.length / 2] < nums[nums.length / 2 - 1]) {
                return nums[nums.length / 2];
            } else {
                return nums[nums.length / 2 - 1];
            }
        } else {
            return nums[nums.length / 2];
        }
    }

    public static void main(String[] args) {
        int[] nums = {10, 11, 5, 1, 2, 3, 4, 3, 4, 6, 3, 3, 7};
        System.out.println("range:  " + ArrayStats.range(nums));
        System.out.println("mode:   " + ArrayStats.mode(nums));
        System.out.println("mean:   " + ArrayStats.mean(nums));
        System.out.println("median: " + ArrayStats.median(nums));
    }
}