class Transaction < ActiveRecord::Base
  belongs_to :account
  has_one :clearingout  
end



# == Schema Information
# Schema version: 20110219093314
#
# Table name: transactions
#
#  id                 :integer         not null, primary key
#  account_id         :integer
#  transactiontype_id :integer
#  amount             :decimal(, )
#  date               :date
#  sign               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

