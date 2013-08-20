class Topic < ActiveRecord::Base

	has_many :user_threads , dependent: :delete_all

	validates :name, 
		presence: true, 
		length: { minimum: 4 }, 
		uniqueness: { scope: :name }
end
