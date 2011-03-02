module BuildNfcxml
  
  def self.build_nfcxml(xm)
    @emoneyouts = Emoneyout.find_all_by_clearing_date(Date.current)
    xm.instruct!
    xm.sequence do
      @emoneyouts.each do |e|
        xm.amount(e.transaction.amount)
      end
    end
  end
  
end
