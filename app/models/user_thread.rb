class UserThread < ActiveRecord::Base

	belongs_to :topic
	has_many :posts

end
