import java.util.Map;
import java.util.HashMap;
import java.io.File;
import java.io.Scanner;

public class WordCount {

    private Map<String, int> wordCount;

    public WordCount(String filename) {

        wordCount = new HashMap<>();
        File f = new File(filename);
        Scanner read = new Scanner(f);

        do {

            String[] line = 

        } while (f.hasNext());
    }
}