def get_all_songs_with_artists
  url = URI("https://musicdemons.com/api/v1/song")
  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true

  request = Net::HTTP::Get.new(url)
  # request["with"] = "lyrics"
  request["with"] = "artists"

  response = https.request(request)
end

def get_songs_lyrics
  # iterates through get_all_songs_with_artists and grabs lyrics
end

def convert_songs_to_json
  # take HTTPOK response and convert to json
  JSON.parse(get_all_songs.body)
end
