class Transfer
  def self.sepa_in
    a = Hash.from_xml(File.read('tmp/inout/xmlfile.xml'))
    parse_xml(a)
    em_out
  end
  def self.sepa_out
    e = Hash.from_xml(File.read('tmp/inout/em_out.xml'))
    parse_em_in_xml(e)
    xm = Builder::XmlMarkup.new(:indent =>2)
    File.open(File.expand_path(File.dirname(__FILE__) + "/../../tmp/inout/bm_out.xml"), 'w') {|f| f.write( build_bm_out_xml(xm) ) }
  end
end

private

# --- part for self.sepa_in ---
def parse_xml(sepa_h)
  arr = sepa_h.[]("Document").[]("pain.001.001.02").[]("PmtInf").[]("CdtTrfTxInf")
  arr.each_index do |i|
    amt = sepa_h.[]("Document").[]("pain.001.001.02").[]("PmtInf").[]("CdtTrfTxInf")[i].[]("Amt").[]("InstdAmt").to_d
    transactiontype_id = 1
    hash = Hash[:amt, amt, :transactiontype_id, transactiontype_id]
    write_record(hash)
  end
end

def write_record(hash)
  t = Transaction.new
  t.date = Date.current
  t.amount = hash[:amt]
  t.transactiontype_id = hash[:transactiontype_id]
  t.save
  t.create_emoneyout(:clearing_date => Date.current)       # creates an entry in table emoneyouts and sets the transaction_id {FK} to id {PK} in transactions table 
end

def em_out
  xm = Builder::XmlMarkup.new(:indent =>2)
  File.open(File.expand_path(File.dirname(__FILE__) + "/../../tmp/inout/em_out.xml"), 'w') {|f| f.write( build_em_out_xml(xm) ) }
end

def build_em_out_xml(xm)
  @emoneyouts = Emoneyout.find_all_by_clearing_date(Date.current)
  xm.instruct!
  xm.sequence do
    @emoneyouts.each do |e|
      xm.amount(e.transaction.amount)
    end
  end
end

# --- part for self.sepa_out ---
def parse_em_in_xml(em_h)
  arr = em_h.[]("sequence").[]("amount")
  arr.each_index do |i|
    amt = em_h.[]("sequence").[]("amount")[i].to_d
    transactiontype_id = 4
    account_id = 1   # for test only
    hash = Hash[:amt, amt, :account_id, account_id, :transactiontype_id, transactiontype_id]
    write_transaction(hash)
  end
end

def write_transaction(hash)
  t = Transaction.new
  t.date = Date.current
  t.amount = hash[:amt]
  t.transactiontype_id = hash[:transactiontype_id]
  t.account_id = hash[:account_id]
  t.save
  t.create_clearingout(:clearing_date => Date.current)       # creates an entry in table clearingouts and sets the transaction_id {FK} to id {PK} in transactions table
end

def build_bm_out_xml(xm)
  @clearingouts = Clearingout.find_all_by_clearing_date(Date.current)
  # SEPA XML structure for bm_out (book money transfer out)
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

