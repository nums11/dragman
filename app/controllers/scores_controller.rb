class ScoresController < ApplicationController
	def index
		@score = current_user.score
	end
end
