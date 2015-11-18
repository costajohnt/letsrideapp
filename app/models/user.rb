class User < ActiveRecord::Base
	has_many :rides
	has_secure_password
end
