raw_songs_artists = convert_songs_to_json("artists")
flatten_artists(raw_songs_artists)
raw_songs_lyrics = convert_songs_to_json("lyrics")
complete_songs = merge_lyrics_songs(raw_songs_artists, raw_songs_lyrics)
remove_no_lyric_songs(complete_songs)
# lyrics_to_array(complete_songs)

seed_songs_and_artists(complete_songs)
