class Post < ActiveRecord::Base
  belongs_to :userThread
  belongs_to :user
end
