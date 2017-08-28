import java.util.Iterator;

public class AnimeListTest {

    public static void main(String[] args) {

        MyAnimeList myList = new MyAnimeList();

        myList.add(new Anime("Sprirted Away", 2001));
        myList.add(new Anime("Hunter x Hunter", 1999));
        myList.add(new Anime("Ace of Diamond", 2006));
        myList.add(new Anime("Tom and Jerry", 1940));

        Iterator aIt = myList.iterator();
        while (aIt.hasNext()) {
            System.out.println(aIt.next());
        }

        myList.sortByName();
        System.out.println(myList);

        myList.sortByYear();
        System.out.println(myList);
    }

}