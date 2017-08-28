public class Pfunk {

    public static void main(String[] args) {
        // The following lines can be uncommented and should give the
        // expected output after you have finished the assignment

        Pfunker thomas = new Lollypop("bootzilla");
        System.out.println(thomas.accomplishTask("write ICML experiments"));

        Pfunker chris = new Clone("dvoidoffunk");
        System.out.println(chris.accomplishTask("write ICML paper"));

        Pfunker michael = new Pyramid("sirnose");
        System.out.println(michael.accomplishTask("review NIPS submissions"));
    }
}
