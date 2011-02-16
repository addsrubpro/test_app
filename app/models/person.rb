class Person < ActiveRecord::Base
  has_one :useraccount
  belongs_to :party, :include => :accounts
end

# == Schema Information
# Schema version: 20110213121110
#
# Table name: people
#
#  id         :integer         not null, primary key
#  party_id   :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

