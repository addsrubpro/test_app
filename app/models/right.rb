class Right < ActiveRecord::Base
  has_many :useraccountrights
  has_many :useraccounts, :through => :useraccountrights
end

# == Schema Information
# Schema version: 20110211121348
#
# Table name: rights
#
#  id          :integer         not null, primary key
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

