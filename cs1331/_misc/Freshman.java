public class Freshman extends Student implements Slacker, Thinker {
    public void study() {
        slackOff();
        think();
        System.out.println("Last minute panic has ensued.");
    }

    void slackOff() {
        party();
    }

    void think() {
        System.out.println("Browsing Wikipedia...");
    }
}