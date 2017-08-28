import java.util.Set;

/**
* Represents a movie on Netflix, with a title (name), rating out of 10, year of
* release, and genre(s).
*
* @author  jpratt9
* @version 2015-11-5
*/

public class Movie {

    private String name;
    private double rating;
    private int yearReleased;
    private Set<Genre> genres;

    /**
     * Creates a movie with all required parameters.
     *
     * @param name          the movie's title.
     * @param rating        the rating of this movie on a scale of 1 to 10 (?).
     * @param yearReleased  the movie's year of release.
     * @param genres        a Collection containing all genres this movie is of.
     *                      For example, the genres Set for a RomCom would
     *                      contain Genre.ROMANCE and Genre.COMEDY, and for a
     *                      Horror it would only contain Genre.HORROR.
     */
    public Movie(String name, double rating, int yearReleased,
                    Set<Genre> genres) {
        this.name = name;
        this.rating = rating;
        this.yearReleased = yearReleased;
        this.genres = new MySet<Genre>();
        this.genres.addAll(genres);
    }

    /**
     * @return  the title of this movie
     */
    public String getName() {
        return name;
    }

    /**
     * @return  this movie's rating on a scale from 1 to 10 (?)
     */
    public double getRating() {
        return rating;
    }

    /**
     * @return  this movie's release year
     */
    public int getYearReleased() {
        return yearReleased;
    }

    /**
     * @return  a set of this movie's genre(s)
     */
    public Set<Genre> getGenres() {
        return genres;
    }

    /**
     * Returns a hash code for this movie. The hash code for a Movie object is
     * computed as
     *     31 + namehash * 17 + rating * 17 + year * 17
     *         + genreArray[0].ordinal() * 17 + genreArray[1].ordinal() * 17
     *         + ... +     + genreArray[n-1].ordinal() * 17
     * using int arithmetic, where namehash is the hash code for this movie's
     * name, genreArray[i] is the ith element of genreArray, genreArray is the
     * backing array of genres casted to Genre and n is the length of this
     * array.
     *
     * @return a hash code value for this Movie.
     */
    @Override
    public int hashCode() {
        int res = 31;
        res += name.hashCode() * 17;
        res += (int) rating * 17;
        res += yearReleased * 17;
        for (Genre g : genres) {
            res += g.ordinal() * 17;
        }
        return res;
    }

    /**
     * Compares this movie to the specified object. The result is true if and
     * only if the argument is not null and is a Movie object that has the same
     * name, rating, release year, and genres.
     * @param  o    The object to compare this Movie against.
     * @return      true if the given object represents a Movie equivalent to
     *              this movie, false otherwise.
     */
    @Override
    public boolean equals(Object o) {
        if (o == null || !(o instanceof Movie)) {
            return false;
        }
        if (this == o) {
            return true;
        }
        boolean res = true;
        Movie m = (Movie) o;
        if (name.equals(m.name) && rating == m.rating
                    && yearReleased == m.yearReleased) {
            for (Genre g : m.genres) {
                if (!genres.contains(g)) {
                    return false;
                }
            }
        }
        return true;
    }

    /**
     * Returns a string representation of the movie in the form
     *     "name (yearReleased) - rating/10 - Genres: GENRE_0, GENRE_1,
     *         ... , GENRE_(n-1)"
     * where GENRE_i is the ith element of genres and n is the size of genres.
     * For example, Back to the Future (1985) would be,
     *     "Back to the Future (1985) - 8.5/10 - Genres: ADVENTURE, COMEDY,
     *         SCIFI"
     * @return  a string representation of the movie.
     */
    @Override
    public String toString() {
        String res = name + " (" + yearReleased + ", " + rating
                + "/10) - Genres: ";
        for (Genre g : genres) {
            res = res + g + ", ";
        }
        return res.substring(0, res.length() - 2);
    }
}