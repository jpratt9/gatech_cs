public abstract class Student {
    private String name;
    public Student(String name) {this.name = name; }
    public void party() {
        System.out.printf("%s is partying hard", name);
    }
    public abstract void study();
}

