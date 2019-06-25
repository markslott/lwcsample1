#!/bin/sh

sfdx force:data:tree:export -d ./ -q "SELECT Name, (SELECT Id,MailingCity,MailingCountry,MailingPostalCode,MailingState,MailingStreet,FirstName,LastName,Email,Phone FROM Contacts WHERE MailingPostalCode != null) from Account" -x export-demo -u mlott@msl.cdo6.demo --plan

sfdx force:data:tree:import -p ./export-demo-Account-Contact-plan.json
