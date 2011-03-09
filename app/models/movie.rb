class Movie < ActiveRecord::Base
	has_many :rankings
	belongs_to :nominated_by_user, :class_name => 'User'

	def self.all_ranked_for_user(user)
		user.rankings.map{|r| r.movie} | all
	end
	
	def score(restrict_to_users = nil)
		rankings.select{|r| restrict_to_users.nil? || restrict_to_users.map{|u| u.id}.include?(r.user_id)}.map{|r| r.rank}.sum.to_i
	end
end
