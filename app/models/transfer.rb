class Transfer
  def self.sepa_in
    a = Hash.from_xml(File.read('tmp/inout/xmlfile.xml'))
    parse_xml(a)
  end
  def self.sepa_out
    xm = Builder::XmlMarkup.new(:indent =>2)
    File.open(File.expand_path(File.dirname(__FILE__) + "/../../tmp/inout/xmlfile.xml"), 'w') {|f| f.write( build_xml(xm) ) }
  end
end

private

def build_xml(xm)
  @clearingouts = Clearingout.all
  # SEPA XML structure for transfer out
  xm.instruct!
  xm.Document("xmlns"=>"urn:swift:xsd:$pain.001.002.02", "xmlns:xsi"=>"http://www.w3.org/2001/XMLSchema-instance", "xsi:schemaLocation"=>"urn:swift:xsd:$pain.001.002.02 pain.001.002.02.xsd") do
    xm.tag!("pain.001.001.02") do
      xm.GrpHdr do
        xm.MsgId "Message ID 4040"
      end
      xm.PmtInf do
        @clearingouts.each do |co|
          xm.CdtTrfTxInf do	
            xm.PmtId do
              xm.EndToEndId(co.transaction.account.party.person.name) 	  # originator name
            end
            xm.Amt do
              xm.InstdAmt(co.transaction.amount, "Ccy"=>"EUR")	          # amount
            end
            xm.CdtrAgt do
              xm.FinInstnID do
                xm.BIC("SPXYZ123456789")                                  # BIC
              end
            end
            xm.Cdtr do
              xm.Nm(co.transaction.account.party.person.name)             # creditor name
            end
            xm.CdtrAcct do
              xm.Id do
                iban = "DE" + co.transaction.account.party.payment_account.to_s	
                xm.IBAN(iban)                                             # IBAN
              end
            end
            xm.RmtInf do
              information = "any text"		
              xm.Ustrd(information)				          # text
            end
          end
        end
      end
    end
  end
end

def parse_xml(sepa_h)
  size = sepa_h.[]("Document").[]("pain.001.001.02").[]("PmtInf").[]("CdtTrfTxInf")
  size.each_index do |i|
    amt = sepa_h.[]("Document").[]("pain.001.001.02").[]("PmtInf").[]("CdtTrfTxInf")[i].[]("Amt").[]("InstdAmt").to_d
    transactiontype_id = 3
    hash = Hash[:amt, amt, :transactiontype_id, transactiontype_id]
    write_record(hash)
  end
end

def write_record(hash)
  t = Transaction.new
  t.amount = hash[:amt]
  t.transactiontype_id = hash[:transactiontype_id]
  t.save
end
