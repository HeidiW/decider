class Show < ActiveRecord::Base
	belongs_to :user

	def self.search_by_genre(genre)
		@tms ||= self.get_api_instance

		shows = @tms.programs.new_shows lineupId: 'USA-TX42500-X', startDateTime: Time.now.strftime("%FT%RZ")
		results = shows.select do |show|
			if show["program"]["genres"]
				matches = show["program"]["genres"].select do |g|
					g.downcase.match(genre)
				end
				!matches.empty?
			end
		end
	end

	private
		def self.get_api_instance
			TMSAPI::API.new api_key: 'jyvujmbqacmstrfkjyjfyv8r'
		end
end
