import java.io.File;
import java.util.Scanner;

// John Pratt
// 2015-09-12

public class GradeHistogram {

    public static void main(String[] args) throws Exception {
        Scanner fileReader = new Scanner(new File(args[0]));
        String line;
        int bucketSize;
        int temp;
        int[] nums;

        if (args.length == 2) {
            bucketSize = Integer.parseInt(args[1]);
        } else {
            Scanner keyboard = new Scanner(System.in);
            System.out.println("What bucket size would you like?\n>>> ");
            bucketSize = keyboard.nextInt();
        }

        nums = new int[100 / bucketSize + 1];

        do {
            line = fileReader.nextLine().split(",")[1];
            temp = Integer.parseInt(line.trim());
            nums[(100 - temp) / bucketSize]++;
        } while (fileReader.hasNext());

        for (int i = 0; i < nums.length; i++) {
            if (i == 0) {
                System.out.print((100 - i * bucketSize) + " - "
                    + (100 - (i + 1) * bucketSize + 1) + " | ");
            } else if (i < nums.length - 1) {
                temp = 100 - i * bucketSize;
                if (temp < 10) {
                    System.out.print(" ");
                }
                System.out.print(" " + temp + " - ");
                temp = 100 - (i + 1) * bucketSize + 1;
                if (temp < 10) {
                    System.out.print(" ");
                }
                System.out.print(temp + " | ");
            } else {
                temp = 100 - i * bucketSize;
                System.out.print("  " + temp + " -  0 | ");
            }
            for (int j = 0; j < nums[i]; j++) {
                System.out.print("[]");
            }
            System.out.print("\n");
        }
    }
}