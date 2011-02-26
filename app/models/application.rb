class Application < ActiveRecord::Base
end

# == Schema Information
# Schema version: 20110226094856
#
# Table name: applications
#
#  id                   :integer         not null, primary key
#  applicationstatus_id :integer
#  status_date          :date
#  payment_account      :integer
#  name                 :string(255)
#  street               :string(255)
#  country_id           :integer
#  account_number       :integer
#  accounttype_id       :integer
#  created_at           :datetime
#  updated_at           :datetime
#

