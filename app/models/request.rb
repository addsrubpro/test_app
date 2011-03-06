class Request < ActiveRecord::Base
  belongs_to :title
  belongs_to :requeststatus
  belongs_to :country
  belongs_to :accounttype
  
  validates :payment_iban, :presence => true
  validates :title_id, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates :telephone, :presence => true
  validates :birth_date, :presence => true
  validates :birth_place, :presence => true
  validates :street, :presence => true
  validates :housenumber, :presence => true
  validates :zipcode, :presence => true
  validates :city, :presence => true
  validates :country_id, :presence => true
  validates :accounttype_id, :presence => true
end

# == Schema Information
# Schema version: 20110303094723
#
# Table name: requests
#
#  id                 :integer         not null, primary key
#  requeststatus_id   :integer
#  requeststatus_date :date
#  payment_iban       :string(255)
#  title_id           :integer
#  degree             :string(255)
#  first_name         :string(255)
#  middle_name        :string(255)
#  last_name          :string(255)
#  email              :string(255)
#  telephone          :string(255)
#  birth_date         :date
#  birth_place        :string(255)
#  street             :string(255)
#  housenumber        :string(255)
#  postal_supplement  :string(255)
#  zipcode            :string(255)
#  city               :string(255)
#  country_id         :integer
#  accounttype_id     :integer
#  created_at         :datetime
#  updated_at         :datetime
#

