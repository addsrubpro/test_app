class Person < ActiveRecord::Base
  has_one :useraccount
  belongs_to :party, :include => :accounts
  
  def to_xml(options = {})
    xml = options[:builder] || Builder::XmlMarkup.new(options)
    xml.instruct! unless options[:skip_instruct]
    build_xml(xml)
  end
end

private
def build_xml(xml)
  xml.pers do
    xml.tag!("Ownname", name, :type => "EUR")
  end
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

