require 'tmsapi'

tms = TMSAPI::API.new api_key: 'jyvujmbqacmstrfkjyjfyv8r'

# Grab the list of shows
shows = 
		tms
			.programs
			.new_shows(lineupId: 'USA-TX42500-X', startDateTime: Time.now.strftime("%FT%RZ"))

# Make a list of all the genres claimed by one or more shows
available_genres = []
shows.each do |show|
	if show['program']['genres']
		show['program']['genres'].each {|genre| available_genres << genre}
	end
end

# Create a nice string to output to the user listing the available genres
available_genres = available_genres.uniq.sort.join("\n").prepend("\nAvailable genres:\n") << "\n\n"

# Loop until the user quits
while(true)

	print 'Search the TMS database for programs matching a genre. Type q to quit, or g to see a list of available genres: '
	genre = gets.chomp.downcase

	# User has asked to quit, so we quit
	break if genre == 'q'

	# User has asked for the list of available genres
	if genre == 'g'
		puts available_genres
		next
	end

	print "\n\n" # Spacing

	# Do some transformations on the list of shows:
	# 	Select the shows matching the queried genre
	# 	Convert (map) the raw show data into a curated form
	results = 
		shows
			.select { |show|
				if show["program"]["genres"]
					matches = show["program"]["genres"].select do |g|
						g.downcase.match(genre)
					end
					!matches.empty?
				end
			}
			.map { |show|

				title = show['program']['title']
				description = show['program']['short_description']
				genres = show['program']['genres'].join(', ')
				start_time = Time.parse(show['start_time']).strftime("%a %D %I:%S %p")
				duration = "#{show['duration']} minutes"
				channel = show['station']['call_sign']

				[title, description, genres, start_time, duration, channel] - ['', nil]

			}


	# Print the results
	results.each {|show| puts show.join("\n") << "\n\n"}
	print "\n" # ...and some spacing

end

