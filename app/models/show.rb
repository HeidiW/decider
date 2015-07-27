class Show < ActiveRecord::Base
  has_and_belongs_to_many :users

  def self.search_by_genre(genre, start_date_time=nil, end_date_time=nil)
    @tms ||= self.get_api_instance

    puts "start_date_time is", start_date_time,
         "end_date_time is", end_date_time

    start_date_time ||= Time.now.strftime("%FT%RZ")

    puts "start_date_time is now", start_date_time

    query = {
      lineupId: 'USA-TX42500-X',
      startDateTime: start_date_time,
    }
    query[:endDateTime] = end_date_time if end_date_time

    shows = @tms.programs.new_shows(query)
    shows = shows.select {|show| show["program"]["title_lang"] == "en"}
    results = shows.select do |show|
      if show["program"]["genres"]
        matches = show["program"]["genres"].select do |g|
          g.downcase.match(genre.downcase)
        end
        !matches.empty?
      end
    end
    results.take(3)
  end

  def self.available_genres
    @tms ||= self.get_api_instance

    shows = @tms.programs.new_shows lineupId: 'USA-TX42500-X', startDateTime: Time.now.strftime("%FT%RZ")
    available_genres = []
    shows.each do |show|
      if show['program']['genres']
        show['program']['genres'].each {|genre| available_genres << genre}
      end
    end
    available_genres.uniq.sort
  end

  private
  def self.get_api_instance
    TMSAPI::API.new api_key: 'jyvujmbqacmstrfkjyjfyv8r'
  end
end
