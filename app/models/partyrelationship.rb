class Partyrelationship < ActiveRecord::Base
  belongs_to :principal, :class_name => "Party"
  belongs_to :possession, :class_name => "Party"
end


# == Schema Information
# Schema version: 20110216084804
#
# Table name: partyrelationships
#
#  id            :integer         not null, primary key
#  principal_id  :integer
#  possession_id :integer
#  interest      :decimal(3, 3)
#  created_at    :datetime
#  updated_at    :datetime
#

