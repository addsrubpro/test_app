#!/usr/bin/env ruby
# only code kladde
xm = Builder::XmlMarkup.new(:indent =>2)
$string = (
  xm.html1 do
    x2.head222 do
    end
  end
)

  xm = Builder::XmlMarkup.new
  x2 = Builder::XmlMarkup.new(:target=>xm)

$s = (
    xm.Document do
      xml.tag!("EndToEndId", transaction.account.party.person.name)
    end  
      xm.head2 do
    end
)


require'builder'
xm = Builder::XmlMarkup.new(:indent =>2)
@clearingouts = Clearingout.all
xm.Document { @clearingouts.each { |clearingout| xm.CdtTrfTxInf { xm.PmtId { xm.tag!("EndToEndId", clearingout.transaction.account.party.person.name) }}}}

print $s = (xm.sometag do xm.sometag2 do xm.tag!(Clearingout.all.to_xml(:skip_types => true,:skip_instruct => true)) end end )

##
require'builder'
xm = Builder::XmlMarkup.new(:indent =>2)
$s = (
    xm.Document do
      xm.tag!("SomeTag", "same value")
    end  
    xm.onemoretag do
      xm.hellau "nothing"    
    end
)
$s += Clearingout.all.to_xml(:skip_types => true,:skip_instruct => true)

