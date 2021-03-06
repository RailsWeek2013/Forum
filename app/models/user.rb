class User < ActiveRecord::Base
	has_many :posts
	has_many :user_threads
  has_many :rates
  has_many :upRates,    class_name: 'Rate',conditions: { type: 'upRate' }
  has_many :downRates,  class_name: 'Rate',conditions: { type: 'downRate' }
  has_many :sent_messages,      class_name: 'PrivateMessage', foreign_key: "sender_id"
  has_many :received_messages,  class_name: 'PrivateMessage', foreign_key: "receiver_id"

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
end
