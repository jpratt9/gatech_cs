import java.util.ArrayList;
import java.util.Iterator;
import java.util.Comparator;

public class MyAnimeList implements Iterable<Anime> {
    private ArrayList<Anime> animeList;

    public MyAnimeList() {
        animeList = new ArrayList<Anime>();
    }

    public void add(Anime a) {
        animeList.add(a);
    }

    public String toString() {
        return animeList.toString();
    }

    /*
     * TODO: YOUR CODE BELOW
     * Fill out the method body. It should only have one line.
     **/
    public void sortByName() {
        animeList.sort(Comparator.comparing(a -> a.getName()));
    }

    /*
     * TODO: YOUR CODE BELOW
     * Fill out the method body. It should only have at most two line.
     **/
    public void sortByYear() {
        animeList.sort(Comparator.comparing(a -> a.getYearOfProduction()));
    }

    /*
     * TODO: YOUR CODE BELOW
     * change method body to return new AnimeIterator() after
     * implementing AnimeIterator.
     **/
    public Iterator<Anime> iterator() {
        Iterator myAnimeIterator = new AnimeIterator();
        return myAnimeIterator;
    }

    private class AnimeIterator implements Iterator<Anime> {
        //TODO: YOUR CODE BELOW
        private int cursor = 0;

        public boolean hasNext() {
            //TODO: YOUR CODE BELOW
            return cursor < animeList.size();
        }

        public Anime next() {
            //TODO: YOUR CODE BELOW
            return animeList.get(cursor++);
        }

        public void remove() {
            //TODO: YOUR CODE BELOW
            MyAnimeList.this.animeList.remove(cursor--);
        }
    }
}