xml.instruct!
xml.Document("xmlns"=>"urn:swift:xsd:$pain.001.002.02", "xmlns:xsi"=>"http://www.w3.org/2001/XMLSchema-instance", "xsi:schemaLocation"=>"urn:swift:xsd:$pain.001.002.02 pain.001.002.02.xsd") {
xml.tag!("pain.001.001.02") {
xml.GrpHdr {
	xml.MsgId "Message ID 4040"
	}
xml.PmtInf { @clearingouts.each { |clearingout|
xml.CdtTrfTxInf {	
	xml.PmtId {
		xml.EndToEndId(clearingout.transaction.account.party.person.name) 	# originator name
	}
	xml.Amt {
		xml.InstdAmt(clearingout.transaction.amount, "Ccy"=>"EUR")			# amount
	}
	xml.CdtrAgt {
		xml.FinInstnID {
			xml.BIC("SPXYZ123456789") 								# BIC
		}
	}
	xml.Cdtr {
		xml.Nm(clearingout.transaction.account.party.person.name)			# creditor name
	}
	xml.CdtrAcct {
		xml.Id {
			iban = "DE" + clearingout.transaction.account.party.payment_account.to_s	
			xml.IBAN(iban)										# IBAN
		}
	}
	xml.RmtInf {
		information = "any text"		
		xml.Ustrd(information)										# text
	}


}
}
}
}
}