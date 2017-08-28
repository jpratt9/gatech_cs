import java.util.Set;
import java.util.HashSet;
/**
 * Represents a local voting district, the initial place where votes are cast,
 * and therefore the only object that needs to actually contain the voter
 * objects (this simplifies the memory used in the election greatly given
 * the requirements of the homework).
 *
 * This local district has a name and set of voters.
 *
 * @author jpratt9
 * @version  1
 */
public class LocalDistrict extends District {

    private Set<Voter> voters;

    /**
     * See District constructor. Also initializes voters to an empty hash set.
     * @param name of this district
     */
    public LocalDistrict(String name) {
        super(name);
        voters = new HashSet<>(0);
    }


    /**
     * Attempts to add a voter v to this district's set of voters.
     * If v was null or already in the set, returns true.
     * Else, v is added to the set, the number of voters is incremented by 1,
     * and v's candidate's are parsed:
     * if v's candidate is already on the ballot, increment his/her score
     * depending on how v ranked them;
     * else, add the candidate to the district's ballot with a score
     * depending on how v ranked him/her.
     * @param v voter to be added
     * @return  true IFF v was not null and was not already contained within
     * the set of voters for this district.
     */
    public boolean addVoter(Voter v) {
        if (v == null || voters.contains(v)) {
            return false;
        }
        // add voter
        voters.add(v);
        addVoters(1);
        // add voter's choices
        for (Candidate c : v.getChoices()) {
            if (candidates.contains(c)) {
                candidates.get(candidates.indexOf(c)).addScore(c.getScore());
            } else {
                candidates.add(c);
            }
        }
        return true;
    }

    /**
     * @return a deep-copied set of the voters in this district
     */
    public Set<Voter> getVoters() {
        return new HashSet<Voter>(voters);
    }

}