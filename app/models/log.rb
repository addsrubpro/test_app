#!/usr/bin/env ruby
class Log
  def self.debug(msg)
    prefix = "[Debug] " 
    write_log(prefix,msg)
  end
  def self.info(msg)
    prefix = "[Info] " 
    write_log(prefix,msg)
  end
  def self.warn(msg)
    prefix = "[Warning] " 
    write_log(prefix,msg)
  end
end

private
def write_log(prefix,msg)
  timestamp = "[" + Time.now.strftime("%Y-%m-%d %H:%M:%S") + "] "
  complete_msg = "\n" + prefix + timestamp + msg
  File.open(File.expand_path(File.dirname(__FILE__) + "/../../log/batchlogger.log"), 'a') {|f| f.write(complete_msg) }
end