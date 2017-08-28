import java.util.List;
import java.util.ArrayList;

/**
 * Represents a voter with a name and list of candidates who (s)he has chosen
 * to vote for.
 *
 * @author jpratt9
 * @version  1
 */

public class Voter {
    private String name;
    private List<Candidate> choices;

    /**
     * Creates a voter from the inputted line of text.
     * Each candidate this voter has chosen gets a score from 1-3 depending
     * on whether they were picked 3rd, 2nd, or 1st by the voter.
     * @param  in String in the format "NAME: CHOICE1, CHOICE2, CHOICE3"
     */
    public Voter(String in) {
        String[] tmp = in.split(": ");
        choices = new ArrayList<>(3);
        name = tmp[0];
        tmp = tmp[1].split(", ");
        choices.add(new Candidate(tmp[0], 3));
        choices.add(new Candidate(tmp[1], 2));
        choices.add(new Candidate(tmp[2], 1));
    }

    /**
     * @return this voter's name
     */
    public String getName() {
        return name;
    }

    /**
     * @param  i choice number sought to be returned
     * @return the ith candidate this voter has chosen
     */
    public Candidate getChoice(int i) {
        if (i < 1 || i > 3) {
            return null;
        }
        return choices.get(i - 1);
    }

    /**
     * @return the list of choices this voter has voted for
     * (in order of preference)
     */
    public List<Candidate> getChoices() {
        return new ArrayList<>(choices);
    }

    /**
     * @param o object to be compared against
     * @return true IFF o is not null, is a voter, this and o have the same
     * name, and this and o made the exact same choices in the election
     */
    public boolean equals(Object o) {
        if (o == null || !(o instanceof Voter)) {
            return false;
        }

        if (this == o) {
            return true;
        }

        Voter v = (Voter) o;
        return this.name.equals(v.name) && this.choices.equals(v.choices);
    }

    /**
     * @return a hash code for this voter, which takes into account the voter's
     * name and choices they made
     */
    public int hashCode() {
        // TODO javadocs
        int hash = 31;
        hash += 17 * name.hashCode();
        for (int i = 0; i < 3; i++) {
            hash += 17 * choices.get(i).hashCode();
        }
        return hash;
    }

    /**
     * @return a string representation of this voter in the form:
     * Name: $name | First Choice: "$firstChoice" | Second Choice:
     * "$secondChoice" | Third Choice: "$thirdChoice"
     */
    public String toString() {
        String res = "Name: " + name;
        res = res + " | First choice: \"" + getChoice(1).toString();
        res = res + "\" | Second choice: \"" + getChoice(2).toString();
        res = res + "\" | Third choice: \"" + getChoice(3).toString();
        return res + "\"";
    }
}