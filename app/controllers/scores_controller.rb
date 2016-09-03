class ScoresController < ApplicationController
	before_action :require_user, only: [:index]

	def index
		@user = User.find(current_user)		
		@score = @user.score
		@score = 0
	end

	def leaderboard
		@users = User.all.order(:score).reverse_order.limit(10)
	end

end
