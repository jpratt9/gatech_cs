import java.util.List;
import java.util.ArrayList;
/**
 * Represents a voting district wth a name, number of voters, and candidates
 * for election.
 *
 * @author jpratt9
 * @version  1
 */
public abstract class District {

    private String name;
    protected List<Candidate> candidates;       // I realize this is bad
                                                // form.
    private int numVoters;

    /**
     * Creates a District called name, with an empty candidates list, and 0
     * voters.
     * @param name of this district
     */
    public District(String name) {
        this.name = name;
        candidates = new ArrayList<>(0);
        numVoters = 0;
    }

    /**
     * @return this district's name
     */
    public String getName() {
        return name;
    }

    /**
     * @return List of this district's candidates
     */
    public List<Candidate> getCandidates() {
        return new ArrayList<>(candidates);
    }

    /**
     * @return this district's number of voters
     */
    public int getNumVoters() {
        return numVoters;
    }

    /**
     * @return this district's number of voters
     */
    public Candidate getWinner() {
        Candidate winner = candidates.get(0);
        for (Candidate c : candidates) {
            if (c.getScore() > winner.getScore()) {
                winner = c;
            }
        }
        return winner;
    }

    /**
     * @param n amount to increase numVoters by
     *  increments numVoters by n
     */
    public void addVoters(int n) {
        numVoters += n;
    }

    /**
     * @return String representation of this district - just its name
     */
    public String toString() {
        // TODO
        return name;
    }

    /**
     * @return hash code for this district - takes into account name,
     * candidates list, and number of voters
     */
    public int hashCode() {
        // TODO
        return 31 + 17 * (name.hashCode() + candidates.hashCode() + numVoters);
    }

    /**
     * @param  o Ojbect to be compared to
     * @return true IFF names, candidate lists, and number of voters are equal
     * between this and o.
     */
    public boolean equals(Object o) {
        // TODO
        if (o == null || !(o instanceof District)) {
            return false;
        }

        if (this == o) {
            return true;
        }

        District d = (District) o;
        return this.name.equals(d.name)
                && this.candidates.size() == d.candidates.size()
                && this.candidates.containsAll(d.candidates)
                && this.numVoters == d.numVoters;
    }
}