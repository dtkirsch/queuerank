class User < ActiveRecord::Base
	acts_as_authentic
	
	has_many :rankings
	has_many :movies, :foreign_key => "nominated_by_user_id"

end
