# only for test reasons
xml.instruct!
xml.person1 {
	xml.id1(@person.id, "type"=>"EUR")
	xml.name1 @person.name
	xml.partyid1 @person.party.id
	xml.accounts {
		@person.party.accounts.each { |account|
			xml.account_id account.id
			xml.account_numberany account.account_number
		}
	}
}