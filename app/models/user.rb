class User < ActiveRecord::Base
	has_and_belongs_to_many :shows
	has_secure_password
	validates :email, presence: true
  
  	validates :password, length: {within: 5..14, too_short: "is too short, it needs to be between 5 and 14 characters", too_long: "is too long, it needs to be between 5 and 14 characters"}
end
