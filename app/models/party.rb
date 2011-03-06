class Party < ActiveRecord::Base
  has_one :person, :dependent => :destroy
  accepts_nested_attributes_for :person
  
  has_many :accounts, :dependent => :destroy
  accepts_nested_attributes_for :accounts
  
  has_many :addresses, :dependent => :destroy
  accepts_nested_attributes_for :addresses
  
  has_many :principal_possession_relationships, :class_name => "Partyrelationship", :foreign_key => :principal_id, :dependent => :destroy
  has_many :possessions, :through => :principal_possession_relationships, :source => :possession
  
  has_many :possession_principal_relationships, :class_name => "Partyrelationship", :foreign_key => :possession_id, :dependent => :destroy
  has_many :principals, :through => :possession_principal_relationships, :source => :principal

  validates :payment_iban, :presence => true
end



# == Schema Information
# Schema version: 20110306112019
#
# Table name: parties
#
#  id           :integer         not null, primary key
#  payment_iban :string(40)
#  created_at   :datetime
#  updated_at   :datetime
#

