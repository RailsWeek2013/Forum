class Rate < ActiveRecord::Base

  belongs_to :user
  belongs_to :post

  validates :post_id, :user_id, presence: true
  validates_uniqueness_of :user_id, scope: [:post_id]

end

class UpRate < Rate
end

class DownRate < Rate
end