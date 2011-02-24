## Background processing (batch jobs)
## Script needs to run daily at day's close

# batch job name: emoney_circulation_historicisation
# calculate total amount of e-money in circulation and build history in DB
Log.info("Started job ... 'emoney_circulation_historicisation' ")
Emoneyoutstanding.history_emoney_outstanding
Log.info("... e-money in circulation: " + $overalltotal.to_s)
Log.info("Finished.")

# batch job name: capital_requirement
# calculate capital requirement
Log.info("Started... job 'capital_requirement' ")
CapitalRequirement.calc_capital
Log.info("... e-money in circulation mean: " + $mean.to_s + " capital requirement: " + $capital.to_s)
Log.info("Finished.")




## write clearingout XML SEPA file
#stream = Clearingout.all.to_xml(:root => 'Document', :skip_types => true)
#File.open("tmp/inout/current_clearingout1.xml", 'w') {|f| f.write(stream) }