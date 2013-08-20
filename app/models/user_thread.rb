class UserThread < ActiveRecord::Base

	belongs_to :topic
	has_many :posts , dependent: :delete_all
	belongs_to :user

	validates :title, 
		presence: true, 
		length: { minimum: 4 }

	validates :topic_id,
		presence: true

	validates :user_id,
		presence: true
end
