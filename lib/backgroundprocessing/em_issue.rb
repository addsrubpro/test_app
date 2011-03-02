module EmIssue
  require'builder'
  
  def self.process
    hash = Hash.from_xml(File.read('tmp/inout/xmlfile.xml'))
    parse_store(hash)
    prepare_nfcxml
  end
end  

private
  
def parse_store(hash)
  arr = hash.[]("Document").[]("pain.001.001.02").[]("PmtInf").[]("CdtTrfTxInf")
  arr.each_index do |i|
    amt = hash.[]("Document").[]("pain.001.001.02").[]("PmtInf").[]("CdtTrfTxInf")[i].[]("Amt").[]("InstdAmt").to_i
    transactiontype_id = 1
    flat = Hash[:amt, amt, :transactiontype_id, transactiontype_id]
    store_record(flat)
  end
end

def store_record(flat)
  t = Transaction.new
  t.date = Date.current
  t.amount = flat[:amt]
  t.transactiontype_id = flat[:transactiontype_id]
  t.save
  t.create_emoneyout(:clearing_date => Date.current)       # creates an entry in table emoneyouts and sets the transaction_id {FK} to id {PK} in transactions table 
end

def prepare_nfcxml
  xm = Builder::XmlMarkup.new(:indent =>2)
  File.open(File.expand_path(File.dirname(__FILE__) + "/../../tmp/inout/em_out.xml"), 'w') {|f| f.write( BuildNfcxml.build_nfcxml(xm) ) }
end