import java.io.File;
import java.io.FileWriter;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

public class Playlist {

    public static void main(String[] args) throws FileNotFoundException,
            IOException {
        ArrayList<Song> songs = new ArrayList<Song>();
        String fn = args[0];
        Scanner reader = new Scanner(new File(fn));
        String[] line = reader.nextLine().split("\t");
        Song tmp;

        do {
            line = reader.nextLine().split("\t");
            tmp = new Song(line[0], line[0], line[3], 
                    Integer.parseInt(line[10]));
            if (!songs.contains(tmp)) {
                songs.add(tmp);
            }
        } while (reader.hasNextLine());

        Collections.sort(songs);

        String newName  = fn.substring(0,fn.indexOf("."));
        newName = newName + "-sorted."
                + fn.substring(fn.indexOf(".") + 1,fn.length());
        FileWriter fw = new FileWriter(new File(newName));
        fw.write("Artist\tAlbum\tName\tTrack Number\n");

        for(Song song : songs) {
            fw.write(song.toString()+"\n");
        }

        fw.close();
        
    }
}