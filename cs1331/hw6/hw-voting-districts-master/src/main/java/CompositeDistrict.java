import java.util.List;
import java.util.ArrayList;

/**
 * Represents a composite voting district which has a name, and contains
 * a list of districts which may also be composite districts, or may be
 * local districts (not sure if they can be both in my implementation, but they
 * shouldn't be in theory).
 *
 * @author jpratt9
 * @version  1
 */

public class CompositeDistrict extends District {
    private List<District> districts;

    /**
     * See District constructor. Also initializes districts to an empty array
     * list.
     * @param name of this district
     */
    public CompositeDistrict(String name) {
        super(name);
        districts = new ArrayList<>(0);
    }

    /**
     * @return number of districts contained within this
     */
    public int getNumDistricts() {
        return districts.size();
    }

    /**
     * Attempts to add d to this. If d was not null, d is added to the list
     * of districts, and numVoters gets incremented by the number of voters
     * in d. Then, if d's winner was not already on the ballot, adds its
     * winner to the ballot with a score equal to the number of voters in d.
     * Else, increments the score of d's winner (if they were on the ballot for
     * this already) by the number of voters contained in d. Then returns true.
     * @param d district to be added
     * @return true IFF d was not null
     */
    public boolean addDistrict(District d) {
        if (d == null) {
            return false;
        }

        // TODO
        districts.add(d);
        addVoters(d.getNumVoters());
        Candidate winner = d.getWinner();
        int index = -1;
        for (int i = 0; i < candidates.size(); i++) {
            if (candidates.get(i).getName().equals(winner.getName())) {
                index = i;
            }
        }

        if (index != -1) {
            candidates.get(index).setScore(
                    candidates.get(index).getScore() + d.getNumVoters());
        } else {
            candidates.add(new Candidate(winner.getName(), d.getNumVoters()));
        }

        return true;
    }

    /**
     * @return a deep-copied list of the districts contained within this
     * composite district
     */
    public List<District> getDistricts() {
        return new ArrayList<>(districts);
    }
}