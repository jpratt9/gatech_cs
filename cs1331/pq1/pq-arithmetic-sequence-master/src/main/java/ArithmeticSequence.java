public class ArithmeticSequence {
    private int firstTerm;
    private int difference;

    public ArithmeticSequence(int firstTerm, int difference) {
        this.firstTerm = firstTerm;
        this.difference = difference;
    }

    public int getFirstTerm() {
        return firstTerm;
    }

    public int getDifference() {
        return difference;
    }

    public int nth(int n) {
        return firstTerm + (n - 1) * difference;
    }

    public int[] subsequence(int n, int m) {
        int len = m - n + 1;
        int[] res = new int[len];
        for(int i = 0; i < len; i++) {
            res[i] = firstTerm + difference * (i + n - 1);
        }
        return res;
    }

    public int sumTo(int nth) {
        int sum = 0;
        for (int i = 1; i <= nth; i++) {
            sum += nth(i);
        }
        return sum;
    }
}