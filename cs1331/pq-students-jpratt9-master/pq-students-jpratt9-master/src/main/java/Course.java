public class Course {

    private String name;
    private int credits;
    private String grade;

    public Course(String n, int c, int g) {
        name = n;
        credits = c;
        if (g == 4) {
            grade = "A";
        } else if (g == 3) {
            grade = "B";
        } else if (g == 2) {
            grade = "C";
        } else if (g == 1) {
            grade = "D";
        } else {
            grade = "F";
        }
    }

    public int getCredits() {
        return credits;
    }

    public int getGrade() {
        if (grade.equals("A")) {
            return 4;
        } else if (grade.equals("B")) {
            return 3;
        } else if (grade.equals("C")) {
            return 2;
        } else if (grade.equals("D")) {
            return 1;
        } else {
            return 0;
        }
    }

    public String toString() {
        return name + ": " + getGrade();
    }

}