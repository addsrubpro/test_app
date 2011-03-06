class Address < ActiveRecord::Base
  belongs_to :party
  
  validates :street, :presence => true
  validates :housenumber, :presence => true
  validates :zipcode, :presence => true
  validates :city, :presence => true
  validates :country_id, :presence => true
end


# == Schema Information
# Schema version: 20110303133148
#
# Table name: addresses
#
#  id                :integer         not null, primary key
#  party_id          :integer
#  street            :string(255)
#  city              :string(255)
#  country_id        :integer
#  valid_since       :date
#  created_at        :datetime
#  updated_at        :datetime
#  housenumber       :string(255)
#  postal_supplement :string(255)
#  zipcode           :string(255)
#

