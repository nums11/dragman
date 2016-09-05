class User < ActiveRecord::Base
	before_update :ensure_highestScore, if: :score_changed?

	private
	def ensure_highestScore
		self.score = self.score_change.compact.max
	end

end
