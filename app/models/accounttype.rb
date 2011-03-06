class Accounttype < ActiveRecord::Base
  has_many :requests
end

# == Schema Information
# Schema version: 20110305114333
#
# Table name: accounttypes
#
#  id                  :integer         not null, primary key
#  description         :string(255)
#  default_charge_rate :decimal(2, 4)
#  created_at          :datetime
#  updated_at          :datetime
#

