class Address < ActiveRecord::Base
  belongs_to :party
end

# == Schema Information
# Schema version: 20110226094856
#
# Table name: addresses
#
#  id          :integer         not null, primary key
#  party_id    :integer
#  street      :string(255)
#  city        :string(255)
#  country_id  :integer
#  valid_since :date
#  created_at  :datetime
#  updated_at  :datetime
#

