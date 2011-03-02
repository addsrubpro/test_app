module EmRecha
  require'builder'
  
  def self.process
    e = Hash.from_xml(File.read('tmp/inout/em_out.xml'))
    parse_em_in_xml(e)
    xm = Builder::XmlMarkup.new(:indent =>2)
    File.open(File.expand_path(File.dirname(__FILE__) + "/../../tmp/inout/bm_out.xml"), 'w') {|f| f.write( BuildSepaxml.build_sepaxml(xm) ) }
  end
end

private

def parse_em_in_xml(em_h)
  arr = em_h.[]("sequence").[]("amount")
  arr.each_index do |i|
    amt = em_h.[]("sequence").[]("amount")[i].to_i
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