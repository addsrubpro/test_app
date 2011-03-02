# E-money re-change (e-money in -> book money out)
module EmRecha
  require'builder'
  
  def self.process
    em = Hash.from_xml(File.read('tmp/inout/em_out.xml'))
    parse_store(em)
    xm = Builder::XmlMarkup.new(:indent =>2)
    File.open(File.expand_path(File.dirname(__FILE__) + "/../../tmp/inout/bm_out.xml"), 'w') {|f| f.write( BuildSepaxml.build_sepaxml(xm) ) }
  end
end

private

def parse_store(em)
  arr = em.[]("sequence").[]("amount")
  arr.each_index do |i|
    amt = em.[]("sequence").[]("amount")[i].to_i
    transactiontype_id = 4
    account_id = 1   # for test only
    flat = Hash[:amt, amt, :account_id, account_id, :transactiontype_id, transactiontype_id]
    write_transaction(flat)
  end
end

def write_transaction(flat)
  t = Transaction.new
  t.date = Date.current
  t.amount = flat[:amt]
  t.transactiontype_id = flat[:transactiontype_id]
  t.account_id = flat[:account_id]
  t.save
  t.create_clearingout(:clearing_date => Date.current)       # creates an entry in table clearingouts and sets the transaction_id {FK} to id {PK} in transactions table
end