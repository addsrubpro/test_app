class Account < ActiveRecord::Base
  belongs_to :party
  has_many :transactions
end


# == Schema Information
# Schema version: 20110216084804
#
# Table name: accounts
#
#  id             :integer         not null, primary key
#  party_id       :integer
#  accounttype_id :integer
#  account_number :integer
#  charge_rate    :decimal(3, 3)
#  enabled        :boolean
#  created_at     :datetime
#  updated_at     :datetime
#

