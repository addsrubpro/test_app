class Emoneyout < ActiveRecord::Base
  belongs_to :transaction
end

# == Schema Information
# Schema version: 20110301132940
#
# Table name: emoneyouts
#
#  id             :integer         not null, primary key
#  clearing_date  :date
#  transaction_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

