class Party < ActiveRecord::Base
  has_one :person
  has_many :accounts
  
  has_many :principal_possession_relationships, :class_name => "Partyrelationship", :foreign_key => :principal_id, :dependent => :destroy
  has_many :possessions, :through => :principal_possession_relationships, :source => :possession
  
  has_many :possession_principal_relationships, :class_name => "Partyrelationship", :foreign_key => :possession_id, :dependent => :destroy
  has_many :principals, :through => :possession_principal_relationships, :source => :principal
end

# == Schema Information
# Schema version: 20110214114731
#
# Table name: parties
#
#  id              :integer         not null, primary key
#  payment_account :integer
#  created_at      :datetime
#  updated_at      :datetime
#

