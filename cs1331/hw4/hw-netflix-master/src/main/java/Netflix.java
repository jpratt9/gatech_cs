import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Random;
import java.util.Scanner;

/**
 * Your Netflix journey begins here!
 *
 * @author Jayanth
 * @author Srijan
 * @author PUT YOUR NAME HERE
 * @version 1.0
 */
public class Netflix {

    private static Scanner in;
    private static PopulateNetflix popPop;
    private static Random rand;
    private static Library library;
    private static List<Movie> list;

    /**
     * Main method for Netflix. This produces the high-end login screen
     * for our Netflix service that took a team of experienced
     * UI designers to create.
     *
     * @param  args command-line arguments for the program.
     * @throws Exception e
     */
    public static void main(String[] args) throws Exception {
        in = new Scanner(System.in);
        popPop = new PopulateNetflix();
        library = new Library(popPop.getNetflixPopulation());
        // Change the variable below to be a properly type-parameterized
        // map from roommate names to a list of movies. See the instructions
        // for which roommates to add and what their watchlists should be
        Map<String, List<Movie>> userWatchLists = new HashMap<>();

        //Taylor
        List<Movie> taylorList = new ArrayList<Movie>(library.getMovies());
        taylorList = library.moviesWithGenre(taylorList, Genre.COMEDY);
        taylorList = library.listAlphabetically(taylorList);
        userWatchLists.put("Taylor", taylorList);

        //George
        List<Movie> georgeList = new ArrayList<Movie>(library.getMovies());
        georgeList = library.moviesWithGenre(georgeList, Genre.ACTION,
            Genre.ADVENTURE);
        georgeList = library.listByHighestRating(georgeList);
        userWatchLists.put("George", georgeList);

        //Sarah
        List<Movie> sarahList = new ArrayList<Movie>(library.getMovies());
        sarahList = library.listByYearRange(sarahList, 1980, 2000);
        userWatchLists.put("Sarah", sarahList);

        boolean running = true;
        System.out.println("Welcome to your very own Netflix service!");
        while (running) {
            System.out.println("\nNow, who's watching tonight? [q to exit]");

            String response = in.nextLine();
            if (response.equals("q")) {
                System.out.println("Thanks for watching!");
                running = false;
            } else if (userWatchLists.containsKey(response)) {

                // Change this to get the requested user's watch list
                // instead of an empty list
                List<Movie> watchList = userWatchLists.get(response);

                int numMovies = -1;
                while (numMovies < 1) {
                    System.out.println("How many movies would you like"
                        + " to watch? (1 - 10)");
                    try {
                        numMovies = Integer.parseInt(in.nextLine());
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid input, please try again");
                    }
                }

                System.out.println("\nHere you go!\n");

                if (numMovies > watchList.size()) {
                    numMovies = watchList.size();
                }
                for (Movie m : watchList.subList(0, numMovies)) {
                    System.out.println(m);
                }
            } else {
                System.out.println("\nNetflix does not "
                    + "recognize that input\n");
            }
        }
    }
}
