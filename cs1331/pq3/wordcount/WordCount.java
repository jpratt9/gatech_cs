import java.io.File;
import java.io.FileWriter;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

public class WordCount {

    public static void main(String[] args) throws FileNotFoundException,
            IOException {
        Map<String, Integer> wordCounts = new HashMap<String, Integer>();
        String fn = args[0];
        Scanner reader = new Scanner(new File(fn));
        String[] line;
        double totalWords = 0;

        do {
            line = reader.nextLine().split("[\\p{Punct}\\s]+");
            for (String s : line) {
                s = s.toLowerCase();
                if (wordCounts.containsKey(s)) {
                    wordCounts.put(s, wordCounts.get(s) + 1);
                } else {
                    wordCounts.put(s, 1);
                }
                totalWords++;
            }
        } while (reader.hasNextLine());



        for (String s : wordCounts.keySet()) {
            System.out.println(s + "\t"
                    + (100 * wordCounts.get(s) / totalWords));
        }
        
    }
}