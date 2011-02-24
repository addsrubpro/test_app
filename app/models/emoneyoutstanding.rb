class Emoneyoutstanding < ActiveRecord::Base
  # calculates total amount of e-money in circulation and build history in DB
  def self.history_emoney_outstanding
    calc_daily_credit_debit
    prior_date = Date.current - 1
    unless Emoneyoutstanding.find_by_date(prior_date).nil?
      prior_date_amount = Emoneyoutstanding.find_by_date(prior_date).amount
    else
      prior_date_amount = 0
      Log.warn("No prior date amount for e-money in circulation has been found. The prior date amount has been set to zero. This may be all right for first initiation.")
    end
    $overalltotal = prior_date_amount + @dailytotal
    Emoneyoutstanding.create(:amount => $overalltotal, :date => Date.current)
    return $overalltotal
  end
end

private
  # calculate daily total for e-money issued and re-changed
  def calc_daily_credit_debit
   credit = Transaction.sum(:amount, :conditions => "date IS '#{Date.current}' AND sign IS 'c' ")
   debit = Transaction.sum(:amount, :conditions => "date IS '#{Date.current}' AND sign IS 'd' ")
   @dailytotal = credit - debit
   return @dailytotal
  end
  
# == Schema Information
# Schema version: 20110221082811
#
# Table name: emoneyoutstandings
#
#  id         :integer         not null, primary key
#  amount     :decimal(, )
#  date       :date
#  created_at :datetime
#  updated_at :datetime
#

