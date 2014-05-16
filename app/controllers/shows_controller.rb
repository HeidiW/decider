class ShowsController < ApplicationController

	before_action:current_user

	def search 
		@shows = Show.tms_search(params[:search_term])
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