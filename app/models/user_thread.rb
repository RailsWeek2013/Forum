class UserThread < ActiveRecord::Base

	belongs_to :topic
	has_many :posts
	belongs_to :user

end
