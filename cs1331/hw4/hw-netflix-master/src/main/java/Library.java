import java.util.Collections;
import java.util.Collection;
import java.util.List;
import java.util.ArrayList;

/**
* Represents the entire library of Netflix movies.
*
* @author  jpratt9
* @version 2015-11-4
*/

public class Library {

    private List<Movie> movies;

    /**
     * Creates an empty Netflix Library.
     */
    public Library() {
        this.movies = new ArrayList<Movie>();
    }

    /**
     * Creates a Netflix library containing all Movie objects contained within
     * movies.
     *
     * @param           movies represents a collection of movies to be added to
     *                         this library.
     */
    public Library(Collection<Movie> movies) {
        this.movies = new ArrayList<Movie>(movies);
    }

    /**
     * @return  a copy of movies.
     */
    public List<Movie> getMovies() {
        return new ArrayList<Movie>(movies);
    }

    /**
     * Alphabetically sorts and returns the inputted list of movies moviesIn.
     *
     * @param           moviesIn a list of movies to be sorted.
     * @return          an ArrayList containing an alphabetically-sorted
     *                     shallow copy of movies.
     */
    public List<Movie> listAlphabetically(List<Movie> moviesIn) {
        Collections.sort(moviesIn, (Movie a, Movie b) -> {
                return a.getName().compareTo(b.getName());
            });
        return moviesIn;
    }

    /**
     * Returns a version of the inputted list of movies moviesIn for which each
     * movie is of one of the genres inputted as genresIn.
     *
     * @param           moviesIn a list of movies to be sorted.
     * @param           genresIn each movie in the final list must be of at
     *                           least one of these genres
     * @return          the final list of movies are each of at least one of the
     *                      genres in genresIn
     */
    public List<Movie> moviesWithGenre(List<Movie> moviesIn,
            Genre... genresIn) {
        boolean genreMatch;
        List<Movie> tmp = new ArrayList<Movie>();
        for (int i = 0; i < moviesIn.size(); i++) {
            Movie ttmp = moviesIn.get(i);
            genreMatch = false;
            for (int j = 0; j < genresIn.length; j++) {
                if (ttmp.getGenres().contains(genresIn[j])) {
                    genreMatch = true;
                }
            }
            if (genreMatch) {
                tmp.add(ttmp);
            }
        }
        return tmp;
    }

    /**
     * Removes all movies in the list of movies moviesIn whose release year is
     * not between start (inclusive) and end (exclusive), then returns this
     * modified list.
     *
     * @param           moviesIn the list of movies to be modified and returned.
     * @param           start starting year for movies in returned List
     *                  (inclusive)
     * @param           end ending year for movies in returned List
     *                  (exclusive)
     * @return          List shallow copy of movies that only contains movies
     *                  whose release year is between start and end.
     */
    public static List<Movie> listByYearRange(List<Movie> moviesIn, int start,
            int end) {
        List<Movie> tmp = new ArrayList<Movie>();
        for (int i = 0; i < moviesIn.size(); i++) {
            Movie ttmp = moviesIn.get(i);
            if (ttmp.getYearReleased() >= start
                    && ttmp.getYearReleased() < end) {
                tmp.add(ttmp);
            }
        }
        return tmp;
    }

    /**
     * Sorts moviesIn by rating in ascending order, then returns this.
     *
     * @param           moviesIn the list of movies to be modified and returned.
     * @return          moviesIn sorted by rating in ascending order.
     */
    public static List<Movie> listByLowestRating(List<Movie> moviesIn) {
        Collections.sort(moviesIn, (Movie a, Movie b) -> {
                return (int) ((a.getRating() - b.getRating()) * 100);
            });
        return moviesIn;
    }

    /**
     * Sorts moviesIn by rating in descending order, then returns this.
     *
     * @param           moviesIn the list of movies to be modified and returned.
     * @return          moviesIn sorted by rating in descending order.
     */
    public static List<Movie> listByHighestRating(List<Movie> moviesIn) {
        Collections.sort(moviesIn, (Movie a, Movie b) -> {
                return (int) ((b.getRating() - a.getRating()) * 100);
            });
        return moviesIn;
    }
}