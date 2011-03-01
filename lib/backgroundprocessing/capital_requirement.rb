#!/usr/bin/env ruby
class CapitalRequirement
  # calculate capital requirement and write to output file
  def self.calc_capital
    calc_mean
    $capital = $mean * 0.02
    write_result($capital)
    return $capital
  end
end

private
  # determine average amount for last 6 month
  def calc_mean
    $mean = Emoneyoutstanding.average(:amount, :conditions => "date > '#{Date.current - 180}'")
    return $mean
  end
  
  # write result to output file
  def write_result(capital)
    capital_2digits = '%.2f' % capital
    stream = "\n" + Date.current.to_s + ": Calculated capital requirement = " + capital_2digits + " EUR."   # Paragraph 11(3) No.2 E-Geldgesetz 2010
    if capital < 350000.00
      stream += " However, at least 350000.00 EUR."       # Paragraph 11(1) E-Geldgesetz 2010
    end
    File.open(File.expand_path(File.dirname(__FILE__) + "/../../tmp/inout/current_capital_requirement.txt"), 'a') {|f| f.write(stream) }
    return
  end

