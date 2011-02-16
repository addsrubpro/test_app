class Useraccount < ActiveRecord::Base
  has_many :useraccountrights, :dependent => :delete_all
  has_many :rights, :through => :useraccountrights
  
  belongs_to :person, :include => :party   # for eager-loading party
  
  attr_accessible :username, :email, :person_id
  validates :username, :length => { :minimum => 2, :maximum => 8 }
end



# == Schema Information
# Schema version: 20110213120036
#
# Table name: useraccounts
#
#  id         :integer         not null, primary key
#  username   :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  person_id  :integer
#

