public class Pyramid extends Pfunker    {

    private String name;

    public Pyramid(String name) {
        super(name);
    }

    public String accomplishTask(String task) {
        return super.getName()
            + " will "
            + task + " by delegating to graduate students.";
    }
}
