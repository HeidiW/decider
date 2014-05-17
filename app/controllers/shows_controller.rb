class ShowsController < ApplicationController

	#before_action:current_user

	def search 
	end

	def results
		@genre = params[:genre]
		@results = Show.search_by_genre(@genre)
	end

	def save

		new_show = ShowsController.tms_lookup(params[:track_id])

		new_show.save

		@current_user.shows << new_show

		redirect_to root_path
	end

    def destroy
    	Show.delete(params[:id])
    	redirect_to root_path
	end

end