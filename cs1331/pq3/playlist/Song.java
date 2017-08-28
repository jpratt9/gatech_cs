public final class Song implements Comparable<Song> {

    private String name;
    private String artist;
    private String album;
    private int trackNum;

    public Song(String name, String artist, String album, int trackNum) {
        this.name = name;
        this.artist = artist;
        this.album = album;
        this.trackNum = trackNum;
    }

    public String getName() {
        return name;
    }

    public String getArtist() {
        return artist;
    }

    public String getAlbum() {
        return album;
    }

    public int getTrackNum() {
        return trackNum;
    }

    public int compareTo(Song o) {
        if (!(artist.equals(o.artist))) {
            return artist.compareTo(o.artist);
        }
        if (!(album.equals(o.album))) {
            return album.compareTo(o.album);
        }
        return trackNum - o.trackNum;
    }

    public boolean equals(Object obj) {
        if (obj == null || !(obj instanceof Song)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        Song o = (Song) obj;
        return name.equals(o.name) && artist.equals(o.artist)
                && album.equals(o.album) && trackNum == o.trackNum;
    }

    public int hashCode() {
        int res = 17;
        res += 31 * res + name.hashCode();
        res += 31 * res + artist.hashCode();
        res += 31 * res + album.hashCode();
        res += 31 * res + trackNum;
        return res;
    }

    public String toString() {
        return artist + "\t" + album + "\t" + trackNum + "\t" + name;
    }

}