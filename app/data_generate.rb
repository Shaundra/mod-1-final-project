
# run twice once with "artists" and again with "lyrics"
def get_all_songs_with_(header)
  url = URI("https://musicdemons.com/api/v1/song")
  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["with"] = header

  response = https.request(request)
end

def convert_songs_to_json(header)
  # take HTTPOK response and convert to json
  JSON.parse(get_all_songs_with_(header).body)
end

def flatten_artists(songs_array)
  songs_array.each_with_object([]) do |song, arr|
    song["artists"] = song["artists"].map { |artist| artist["name"] }.join(" & ")
  end
end

def merge_lyrics_songs(songs, lyrics)
  songs.each do |song|
    song_lyrics = lyrics.select { |elmt| elmt["id"] == song["id"] }.first
    song.merge(song_lyrics)
  end
end

# raw_songs_artists = convert_songs_to_json("artists")
# raw_songs_lyrics = convert_songs_to_json("lyrics")
#
