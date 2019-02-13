
# run twice once with "artists" and again with "lyrics"
def get_all_songs_with_(header)
  url = URI("https://musicdemons.com/api/v1/song")
  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true

  request = Net::HTTP::Get.new(url)
  # request["with"] = "lyrics"
  request["with"] = header

  response = https.request(request)
end

def convert_songs_to_json
  # take HTTPOK response and convert to json
  JSON.parse(get_all_songs.body)
end
