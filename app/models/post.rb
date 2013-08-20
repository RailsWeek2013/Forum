class Post < ActiveRecord::Base
  	belongs_to :user_thread
  	belongs_to :user

  	validates :title, 
		presence: true,
		length: { minimum: 4 }

	validates :content,
		presence: true,
		length: { minimum: 1 }


	self.per_page = 10

end
