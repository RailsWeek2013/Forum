class Post < ActiveRecord::Base
  	belongs_to :userThread
  	belongs_to :user

  	validates :title, 
		presence: true,
		length: { minimum: 4 }

	validates :content,
		presence: true,
		length: { minimum: 1 }

end
