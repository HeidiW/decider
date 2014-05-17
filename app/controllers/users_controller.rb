class UsersController < ApplicationController

	#users GET    /users(.:format)   users#index
	def index
		@user = User.all
	end

	#POST   /users(.:format)  users#create
	def create
		@user = User.create(user_params)
		redirect_to "/user/#{@user.id}"
	end

	#new_planet GET    /users/new(.:format)  users#new
	def new
		@user = User.new
	end

	#edit_user GET    /users/:id/edit(.:format)  planets#edit
	def edit
		@user = User.find(params[:id])
	end

	 #planet GET    /planets/:id(.:format)  planets#show
	def show
	 	@user = User.find(params[:id])
	end

	#PUT    /users/:id(.:format)  users#update
	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to "/users/#{@user.id}"
	end

	#DELETE /users/:id(.:format)  users#destroy
	def destroy
		User.delete(params[:id])
		redirect_to "/users"
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password)
		end
end
