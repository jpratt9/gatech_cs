public class Student {

    private String name;
    private Course[] courses;

    public Student(String n, Course[] c) {
        name = n;
        courses = c;
    }

    public int getCredits() {
        int total = 0;
        for (Course c : courses) {
            total += c.getCredits();
        }
        return total;
    }

    public String toString() {
        String res = name + " is taking ";
        res += (courses.length) + " courses:\n";
        for (Course c : courses) {
            res += c.toString() + "\n";
        }
        return res;
    }

    public double getGPA() {
        double sum = 0.0;
        double num = 0.0;

        for (Course c : courses) {
            sum += c.getGrade() * c.getCredits();
            num += c.getCredits();
        }
        if (num > 0) {
            return sum / num;
        } else {
            return 0.0;
        }
    }

}