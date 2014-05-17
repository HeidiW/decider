require 'tmsapi'

tms = TMSAPI::API.new api_key: 'jyvujmbqacmstrfkjyjfyv8r'

shows = tms.programs.new_shows lineupId: 'USA-TX42500-X', startDateTime: Time.now.strftime("%FT%RZ")

results = shows.select do |show|
	if show["program"]["genres"]
		matches = show["program"]["genres"].select do |genre|
			genre.downcase.match('news')
		end
		!matches.empty?
	end
end

puts results.inspect