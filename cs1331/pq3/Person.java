public final class Person {
    private String name;
    private int birthYear;

    public Person(String name, int birthYear) {
        this.name = name;
        this.birthYear = birthYear;
    }

    public String getName() {
        return name;
    }

    public int getBirthYear() {
        return birthYear;
    }

    public int compareTo(Person other) {
        if (this.birthYear != other.getBirthYear()) {
            return this.birthYear - other.getBirthYear();
        } else {
            return this.name.compareTo(other.getName());
        }
    }


}