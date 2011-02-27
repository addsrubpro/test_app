class Clearingout < ActiveRecord::Base
  belongs_to :transaction
end


# == Schema Information
# Schema version: 20110219093314
#
# Table name: clearingouts
#
#  id             :integer         not null, primary key
#  clearing_date  :date
#  transaction_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

