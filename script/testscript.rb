## Background processing (batch jobs)
## Script needs to run daily at day's close

# Create SEPA XML file - outgoing transfers
require'builder'
Log.info("Started job ... Create SEPA XML file.")
Transfer.sepa_out
Log.info("Finished.")

# Calculate amount of e-money in circulation and build history
#Log.info("Started job ... Calculate e-money in circulation and build history.")
#Emoneyoutstanding.history_emoney_outstanding
#Log.info("... e-money in circulation: " + $overalltotal.to_s)
#Log.info("Finished.")

# Calculate capital requirement
#Log.info("Started job ... Calcutate capital requirement.")
#CapitalRequirement.calc_capital
#Log.info("... e-money in circulation mean: " + $mean.to_s + " capital requirement: " + $capital.to_s)
#Log.info("Finished.")