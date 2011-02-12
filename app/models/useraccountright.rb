class Useraccountright < ActiveRecord::Base
  belongs_to :useraccount
  belongs_to :right
end

# == Schema Information
# Schema version: 20110211100713
#
# Table name: useraccountrights
#
#  id             :integer         not null, primary key
#  useraccount_id :integer
#  right_id       :integer
#  created_at     :datetime
#  updated_at     :datetime
#

