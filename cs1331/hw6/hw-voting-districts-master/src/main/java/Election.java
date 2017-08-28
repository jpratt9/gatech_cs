import java.util.List;
import java.util.ArrayList;
import java.util.Set;
import java.util.HashSet;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;

/**
 * Represents an election taking place, with voters inside local districts who
 * vote for three candidates, each getting ranked 1-3 with a score of 3, 2, or 1
 * The winner of each local district moves on to become a candidate in the
 * composite district in which the local district is contained, with his/her
 * score being the total number of voters in the district they came from. This
 * process repeats for composite districts contained within other composite
 * districts until you get to the state level, where a final winner of each
 * "big district" is announced.
 *
 * Note that I could not get mergesort to actually spit out a list for use
 * in external files HOWEVER if you look at MyMergeSort, you will see that it
 * can sort a List of Candidates given that they are instantiated in
 * MyMergeList::main.
 *
 * @author jpratt9
 * @version  1
 */
public class Election {

    private static Set<Voter> voters;
    private static List<LocalDistrict> localDistricts;
    private static List<District> allDistricts;
    private static List<CompositeDistrict> compositeDistricts;
    private static List<District> bigDistricts;
    private static Scanner reader;

    /**
     * OF NOTE - input files must be formated the same way as test files were.
     *
     * Runs an elections through the following process:
     * 1)  gather votes from all voters, assigning a rank to each candidate
     *     each voter chooses
     * 2)  apply the voters votes to their respective local district
     *     tallying up the new score for each candidate each time a vote is
     *     cast
     * 3)  (NOT WORKING) add each of these local districts to their composite
     *     district, with the candidates of these local districts being the
     *     winners from their sub-districts. Repeat this from the lowest size
     *     of district upward until state level is reached, then declare winner
     *     and display the sorted list of candidates who made it to the state
     *     level.
     * @param  args args[0] is the FILENAME of your districts.txt file
     *              args[1] is the FILENAME of your local_districts.txt file
     *              args[2] is the FILENAME of your voters.txt file
     * @throws FileNotFoundException it makes sense to throw an exception and
     * crash the program if one of the files you try testing doesn't exist/work,
     * right?
     */
    public static void main(String[] args) throws FileNotFoundException {

        bigDistricts = new ArrayList<>();
        compositeDistricts = new ArrayList<>();


        // proves that this project can parse in voters
        readVoters(args[2]);
        // proves that this project can add these voters to local districts
        // and dynamically change the scores of candidates within
        readLocalDistricts(args[1]);

        // instantiate big districts
        reader = new Scanner(new File(args[0]));
        for (String s : reader.nextLine().split(", ")) {
            allDistricts.add(new CompositeDistrict(s));
            bigDistricts.add(new CompositeDistrict(s));
            compositeDistricts.add(new CompositeDistrict(s));
        }

        // PROVES via printing to console that local district and
        // voter/candidate code works!
        for (District d : localDistricts) {
            System.out.println("District " + d.toString());
            for (Candidate c : d.getCandidates()) {
                System.out.println(c);
            }
            System.out.println("Winner = " + d.getWinner());
            System.out.println("-----");
        }

        // TODO read all districts and process votes
        /*String[] line;
        String distName;
        while (reader.hasNext()) {
            line = reader.nextLine().split(": ");
            distName = line[0];
            compositeDistricts.add(new CompositeDistrict(distName));
            allDistricts.add(new CompositeDistrict(distName));
            for (CompositeDistrict dComp : compositeDistricts) {
                if (dComp.getName().equals(distName)) {
                    line = line[1].split(", ");
                    for (String smallName : line) {
                        for (District dSmall : allDistricts) {
                            if (dSmall.getName().equals(smallName)) {
                                dComp.addDistrict(dSmall);
                            }
                        }
                    }
                }
            }
        }*/

    }

    // accepts a string file name parameter for the voters.txt file and reads
    // the voters described in this file, then adds each of these voters to the
    // set of voters
    private static void readVoters(String fn)
            throws FileNotFoundException {
        voters = new HashSet<>();
        reader = new Scanner(new File(fn));
        while (reader.hasNext()) {
            voters.add(new Voter(reader.nextLine()));
        }
    }

    // accepts a string file name parameter for the local_districts.txt file
    // then reads in each line that describes a local district in this file,
    // initializes a LocalDistrict with the described voters for each line,
    // and adds each LocalDistrict initialized to the list of local districts
    private static void readLocalDistricts(String fn)
            throws FileNotFoundException {
        allDistricts = new ArrayList<>();
        localDistricts = new ArrayList<>();
        reader = new Scanner(new File(fn));

        String[] line;
        while (reader.hasNext()) {
            line = reader.nextLine().split(": ");
            localDistricts.add(new LocalDistrict(line[0]));
            line = line[1].split(", ");
            for (String s : line) {
                for (Voter v : voters) {
                    if (v.getName().equals(s)) {
                        localDistricts.get(
                                localDistricts.size() - 1).addVoter(v);
                    }
                }
            }
        }
        allDistricts.addAll(localDistricts);
    }
}