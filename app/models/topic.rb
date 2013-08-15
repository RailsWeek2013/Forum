class Topic < ActiveRecord::Base

	has_many :userThreads

	validates :name, 
		presence: true 

end
