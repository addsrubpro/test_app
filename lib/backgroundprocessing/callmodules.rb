module Callmodules
class Call
  require 'math'
  
  
  def self.compute
    puts "The answer is: " + Math::Addition.add(120, 10).to_s   # calls Module::Class.method
    puts "Summarize two values =" + Math::Addition.add(200, 21).to_s
  end
end

end

# call function from console > Callmodules::Call.compute  