class Topic < ActiveRecord::Base

	has_many :user_threads , dependent: :destroy

	validates :name, 
		presence: true, 
		length: { minimum: 4 }, 
		uniqueness: { scope: :name }
end
