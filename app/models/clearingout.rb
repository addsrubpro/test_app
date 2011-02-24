class Clearingout < ActiveRecord::Base
  belongs_to :transaction

# for xml creation currently use the controller 
  def to_xml(options = {})
        xml = options[:builder] || Builder::XmlMarkup.new(options)
        xml.instruct! unless options[:skip_instruct]
        build_xml(xml)
  end
end

private
def build_xml(xml)
    xml.CdtTrfTxInf do
      xml.PmtId do
        xml.tag!("EndToEndId", transaction.account.party.person.name)
      end
      xml.Amt do
        xml.tag!("InstdAmt", transaction.amount, :Ccy => "EUR")
      end
    end
end

# temp code:
# xml.some transaction.account.id
# xml.tag!("any_tag")

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

