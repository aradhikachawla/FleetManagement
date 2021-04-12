
Link to below steps:- https://docs.google.com/document/d/1Jhi2PrA4JQmhjl1v9GVA3t9bGFaVMEFXqvIV1oi04ds/edit?usp=sharing


Installing the App using a Developer Edition Org or a Trailhead Playground
Follow this set of instructions if you want to deploy the application  any  Developer Edition Org or a Trailhead Playground.


Steps to Install the  app, Fleet Management system into a Developer Edition Org or a Trailhead Playground
git clone https://github.com/aradhikachawla/FleetManagement
cd FleetManagement
sfdx auth:web:login -s -a mydevorg
sfdx force:source:deploy -p force-app
sfdx force:user:permset:assign -n FleetManagement
Open the org and select the app  ‘Fleet Management system’  from App Launcher
Click on Fleet Buses tab
Click on bottom flow  ‘Click here to setup the bus data’ and click next and refresh the page
Data should be displayed on the Fleet Buses Page, when clicked on any bus image, details should appear on right side and you should be able to save the record and edits should reflect on the left side  buses list.
On Bus tab Bus records can be seen and resale value should be triggered for 24 and 36 seater ready to use buses.
 11) Flow on Fleet Buses  can be used any time to run the batch file to kick off the maintenance records for 5000 miles service for 60 seater buses

Link to Presentation powerpoint slides -  https://1drv.ms/p/s!AmVXbv4LwVfGb-xV77JY8CeEtUw?e=6kwDYx

Question 1 - ER Diagram (included in Presentation)
Question 2 - Apex Trigger 
CalculateResaleValue, CalculateResaleValueHelper, CalculateResaleValueTest
Question 3 -App ‘Fleet Management Systems’ 
Lightning Page - Fleet Buses  LWC - busBeerList, BusBeerTile, busFullDetail, busDetail, busResaleTile ,  - Apex Class -LWCController
Question 4 - Batch File - BatchClassForMaintananceNew, BatchMainClassNew,  MaintenanceSchedulableClass, MaintenanceSchedulableClassTest, Flow - Schedule flow for nightly job,    Flow - 60 seater Bus maintenance
Note : Data Creation flow has been created for Bus and Garage and added - Flow - Create the Data.

 
Link to above all instructions google doc- https://docs.google.com/document/d/1Jhi2PrA4JQmhjl1v9GVA3t9bGFaVMEFXqvIV1oi04ds/edit#
 










