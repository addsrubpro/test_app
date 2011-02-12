class Useraccount < ActiveRecord::Base
  has_many :useraccountrights, :dependent => :delete_all
  has_many :rights, :through => :useraccountrights
  
  attr_accessible :username, :email
  validates :username, :length => { :minimum => 2, :maximum => 8 }
end


# == Schema Information
# Schema version: 20110209185700
#
# Table name: useraccounts
#
#  id         :integer         not null, primary key
#  username   :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

