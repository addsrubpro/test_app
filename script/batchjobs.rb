## Background processing (batch jobs)

# Jobs to run daily at day's close
# --------------------------------
# Calculate amount of e-money in circulation and build history
#Log.info("Started job ... Calculate e-money in circulation and build history.")
#Emoneyoutstanding.history_emoney_outstanding
#Log.info("... e-money in circulation: " + $overalltotal.to_s)
#Log.info("Finished.")

# Calculate capital requirement
#Log.info("Started job ... Calculate capital requirement.")
#CapitalRequirement.calc_capital
#Log.info("... e-money in circulation mean: " + $mean.to_s + " capital requirement: " + $capital.to_s)
#Log.info("Finished.")

# Jobs to run daily at specified time
# -----------------------------------
# E-money re-change (e-money in -> book money out)
#Log.info("... EmRecha.process started ... Parse NFC XML file -> Create SEPA XML file.")
#EmRecha.process
#Log.info("Finished.")

# E-money issue (book money in -> e-money out)
Log.info("... EmIssue.process started ... Parse SEPA XML file -> Create NFC XML file.")
EmIssue.process
Log.info("Finished.")