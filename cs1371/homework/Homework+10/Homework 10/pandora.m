function nextSong = pandora(nowPlaying, songList)
%Returns the best song to play next (NEXTSONG) given the characteristics of
%the current playing song (NOWPLAYING), a list of songs (SONGLIST), and a
%formula for ranking songs' similarity

similarityIndices = [];

for i = 1:length(songList) %notice how match values are set to 0 by default, eliminating the need for else's in our if-elseif statements
    genreMatch = 0;
    keyMatch = 0;
    vocalMatch = 0;
    instrumentMatch = 0;
    
    if strcmp(nowPlaying.Genre.Genre,songList(i).Genre.Genre) %genre match check
        genreMatch = 1;
    elseif ~isempty(strfind(songList(i).Genre.RelatedGenres, nowPlaying.Genre.Genre)) 
        genreMatch = 0.5;
    end
    
    if strcmp(nowPlaying.Key, songList(i).Key) %key match check
        keyMatch = 1;
    end
    
    if strcmp(nowPlaying.Vocals, songList(i).Vocals) %vocal match check
        vocalMatch = 1;
    end
    
    if strcmp(nowPlaying.DrivingInstrument.Instrument,songList(i).DrivingInstrument.Instrument) %genre match check
        instrumentMatch = 1;
    elseif ~isempty(strfind(songList(i).DrivingInstrument.RelatedInstruments, nowPlaying.DrivingInstrument.Instrument)) 
        instrumentMatch = 0.5;
    end
    
    similarityIndices = [similarityIndices 0.4 * genreMatch + 0.1 * keyMatch + 0.2 * keyMatch + 0.3 * instrumentMatch]; %appends rank using given formula
end
[~, ndx] = max(similarityIndices); %finds the location of the index of the song with the highest rank
nextSong = songList(ndx).Title; 
end