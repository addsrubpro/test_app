class Person < ActiveRecord::Base
  has_one :useraccount
  belongs_to :party, :include => :accounts
  belongs_to :title
  
  validates :title_id, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates :telephone, :presence => true
  validates :birth_date, :presence => true
  validates :birth_place, :presence => true
end


# == Schema Information
# Schema version: 20110303121650
#
# Table name: people
#
#  id          :integer         not null, primary key
#  party_id    :integer
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  title_id    :integer
#  degree      :string(255)
#  first_name  :string(255)
#  middle_name :string(255)
#  last_name   :string(255)
#  email       :string(255)
#  telephone   :string(255)
#  birth_date  :date
#  birth_place :string(255)
#

