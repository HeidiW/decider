class WelcomeController < ApplicationController

	before_action:current_user

    def index
    	@shows = @current_user.shows
	end
	
end