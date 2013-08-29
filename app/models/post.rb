class Post < ActiveRecord::Base
  	belongs_to :user_thread
  	belongs_to :user
    has_many :rates
    has_one :topic, through: :user_thread
    has_many :upRates, -> { where type: 'UpRate' }, class_name: 'Rate'
    has_many :downRates, ->  { where type: 'DownRate' }, class_name: 'Rate'

  	validates :title,
		presence: true,
		length: { minimum: 4 }

	validates :content,
		presence: true,
		length: { minimum: 1 }


	self.per_page = 10



  def getPage
    page = self.user_thread.posts.where("id <= #{self.id}").all.count
    (page/10.0).ceil
  end

  def postTagId
    "post#{self.id}"
  end

end
