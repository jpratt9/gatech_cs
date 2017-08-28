/**
 * Represents a candidate in an election, with a name and a score.
 * @author jpratt9
 * @version  1
 */
public class Candidate {

    private String name;
    private int score;

    /**
     * Creates a candidate named name with a score of score.
     * @param  name string representing this's name
     * @param  score int representing this's starting score
     */
    public Candidate(String name, int score) {
        this.name = name;
        this.score = score;
    }

    /**
     * Creates a candidate that is a deep copy of c, including name and score.
     * @param  c candidate to be copied
     */
    public Candidate(Candidate c) {
        this.name = "" + c.name;
        this.score = c.score;
    }

    /**
     * @return this's name
     */
    public String getName() {
        return name;
    }

    /**
     * @return this's score
     */
    public int getScore() {
        return score;
    }

    /**
     * Increments this's score by n - used in voting when the candidate
     * is already on the "ballot," so to speak.
     * @param n amount fo increment score by
     */
    public void addScore(int n) {
        score += n;
    }

    /**
     * A little redundant, but why not. Sets the score of this candidate to
     * score
     * @param score new score for this candidate
     */
    public void setScore(int score) {
        this.score = score;
    }

    /**
     * @param o object to be compared against
     * @return  true IFF o is not null, is a candidate, and has the same name as
     * this.
     */
    public boolean equals(Object o) {
        if (o == null || !(o instanceof Candidate)) {
            return false;
        }

        if (this == o) {
            return true;
        }

        return this.name.equals(((Candidate) o).name);
    }

    /**
     * @return hash code for this candidate which only takes name into account
     * (because of the way voting works, each voter has their own candidates but
     * the district also has a collection of candidates so I needed to make sure
     * you can't end up with duplicate candidates coming from people voting
     * for candidates who've already been voted for, and make sure their score
     * just gets added to if this happens)
     */
    public int hashCode() {
        return name.hashCode();
    }

    /**
     * @return string representation of this candidate, in the form
     * $name - $score
     */
    public String toString() {
        return name + " - " + score;
    }
}