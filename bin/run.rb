require_relative "../config/environment"
# require_relative "./cli.rb"

def rake(*tasks)
  tasks.each { |task| Rake.application[task].tap(&:invoke).tap(&:reenable) }
end

# not a robust check, good enough for now
rake("db:seed") if Song.none?
