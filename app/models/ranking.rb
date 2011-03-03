class Ranking < ActiveRecord::Base
	belongs_to :user
	belongs_to :movie
	
	before_save :clear_existing
	
	def clear_existing
		Ranking.where(:movie_id => movie_id, :user_id => user_id).each{|r| r.destroy}
	end
end
