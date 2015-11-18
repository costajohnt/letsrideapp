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
#

class Ride < ActiveRecord::Base
	has_many :users
end
