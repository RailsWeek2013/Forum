class UserThread < ActiveRecord::Base

	belongs_to :topic
	has_many :posts , dependent: :destroy
	belongs_to :user

	validates :title, 
		presence: true, 
		length: { minimum: 4 },
    uniqueness: { scope: :title }

	validates :topic_id,
		presence: true

	validates :user_id,
		presence: true
end
