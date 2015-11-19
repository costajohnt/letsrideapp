# == Schema Information
#
# Table name: rides
#
#  id             :integer          not null, primary key
#  title          :string
#  description    :text
#  start_date     :date
#  end_date       :date
#  start_time     :time
#  end_time       :time
#  distance       :integer
#  drop           :boolean
#  public         :boolean
#  start_location :string
#  end_location   :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#  slug           :string
#

class Ride < ActiveRecord::Base
	has_many :ride_joinings, :foreign_key => :joined_ride_id
	has_many :joiners, :through => :ride_joinings, :source => :joined_ride
	belongs_to :user #:creator, :class_name => "User"
	extend FriendlyId
	friendly_id :title, use: :slugged

	def self.search(search)
	  where(start_location: "#{search}") 
	end
end
