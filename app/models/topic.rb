class Topic < ActiveRecord::Base

	has_many :userThreads

	validates :name, 
		presence: true, 
		length: { minimum: 4 }, 
		uniqueness: { scope: :name }
end
