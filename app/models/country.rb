class Country < ActiveRecord::Base
  has_many :requests
end

# == Schema Information
# Schema version: 20110305114333
#
# Table name: countries
#
#  id          :integer         not null, primary key
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

