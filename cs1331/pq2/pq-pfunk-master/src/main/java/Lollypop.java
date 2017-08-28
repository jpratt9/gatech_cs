public class Lollypop extends Pfunker {

    private String name;

    public Lollypop(String name) {
        super(name);
    }

    public String accomplishTask(String task) {
        return super.getName()
            + " will " + task + " by pulling two all-nighters in a row.";
    }
}
