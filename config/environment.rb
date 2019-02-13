require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: "db/guess_from_lyrics.sqlite"
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

require_all 'app'
# require 'rest-client'
require "uri"
require "net/http"
