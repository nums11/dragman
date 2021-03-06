class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id 
			redirect_to '/play'
		else
			render '/'
		end
	end

	def edit
		@user = User.find(current_user)
		@score = @user.score
		@score = 0
	end

	def update
		@user = User.find(current_user)
		@score = @user.score
		if @user.update(user_params)	
			redirect_to '/leaderboard'
		else
			redirect_to '/leaderboard'
		end
	end

	private
	def user_params
		params.require(:user).permit(:nick_name, :score, :user_id)
	end
end
