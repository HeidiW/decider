class UsersController < ApplicationController

	#users GET    /users(.:format)   users#index
	def index
		@user = current_user
		@users = User.all
	end

	#POST   /users(.:format)  users#create
	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to log_in_path
		else
			render 'new'
		end
	end

	#new_user GET    /users/new(.:format)  users#new
	def new
		@user = User.new
	end

	#edit_user GET    /users/:id/edit(.:format)  users#edit
	def edit
		@user = User.find(params[:id])
	end

	 #user GET    /users/:id(.:format)  userss#show
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
