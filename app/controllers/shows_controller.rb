class ShowsController < ApplicationController

	#before_action:current_user

	def search 
	end

	def results
		@genre = params[:genre]
		@results = Show.search_by_genre(@genre).map do |show|
			title = show["program"]["title"]
			genre = show["program"]["genres"].join(", ")
			desc = show["program"]["short_description"]
			start = Time.parse(show["start_time"])
			duration = show["duration"]
			network = show["station"]["call_sign"]
			Show.new(

				title: title,
				description: desc,
				genre: genre,
				network: network,
				airtime: start,
				duration: duration

			)
		end
	end

	def save

		new_show = ShowsController.tms_lookup(params[:track_id])

		new_show.save

		@current_user.shows << new_show

		redirect_to root_path
	end

	def create
		current_user.shows.create(ActiveSupport::JSON.decode(params[:show]))
		redirect_to current_user
	end

    def destroy
    	Show.delete(params[:id])
    	redirect_to root_path
	end

end