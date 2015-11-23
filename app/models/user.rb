# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  email               :string
#  password_digest     :string
#  name                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  slug                :string
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class User < ActiveRecord::Base
	has_many :ride_joinings, :foreign_key => :ride_joiner_id
	has_many :joined_rides, :through => :ride_joinings
	has_many :created_rides, :foreign_key => :user_id, :class_name => "Ride"


	has_secure_password

	validates :name, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	validates :email, uniqueness: true

	extend FriendlyId
	friendly_id :name, use: :slugged

	has_attached_file :avatar,
	                  :styles => { :medium => "300x300>", :thumb => "44x44#" },
	                  :storage => :s3,
	                  :s3_credentials => Proc.new { |a| a.instance.s3_credentials },
	                  :path => "avatars/:id/:style/avatar.:extension",
	                  :default_url => "http://i.imgur.com/7GPalNX.png?1"

	def s3_credentials
	  { :bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_PUBLIC_KEY'], :secret_access_key => ENV['S3_SECRET'] }
	end

	validates_attachment :avatar,
	                     :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
	                   

end
