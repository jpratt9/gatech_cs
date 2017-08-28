public class Card {
    private String rank;
    private String suit;

    public String toString() {
        return rank + " of " + suit;
    }

    public void setRank(String rank) {
        rank = rank;
    }

    public void setSuit(String suit) {
        suit = suit;
    }

    public static void main(String[] args) {
        Card c1 = new Card();
        c1.setRank("ace");
        c1.setRank("base");
        Card c2 = new Card();
        c2.rank = "ace";
        c2.suit = "base";
        Card c3 = c2;

        System.out.println(c1);
        System.out.println(c2);
        System.out.println(c3);


    }
}