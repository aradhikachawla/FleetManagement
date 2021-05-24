


1) Click below to have Presentation powerpoint slides for the App Demo

https://docs.google.com/presentation/d/1ojltf-8nwbhafFqilp4NoWl1dizbMuwm1LFVmeUtz0g/edit#slide=id.p4


2) Two Pdfs uploaded Powerpoint Presentation as pdf for demo for the App built and one as the expected results for the deployment from  github

3) This App can be installed in two way, either  github or using unmanaged package to install

Steps to Install the  app, Fleet Management system into a Developer Edition Org or a Trailhead Playground
 
       1)  git clone https://github.com/aradhikachawla/FleetManagement
       2)  cd FleetManagement
       3) sfdx auth:web:login -s -a mydevorg
       4) sfdx force:source:deploy -p force-app
       5) sfdx force:user:permset:assign -n FleetManagement


Unmanaged package(in case needed to install the App)  -    
https://login.salesforce.com/packaging/installPackage.apexp?p0=04t3t000002w0GB -latest
https://login.salesforce.com/packaging/installPackage.apexp?p0=04t3t000002w0G6  -original (used in Demo)


This readme file is uploaded as google doc so can be accessed and saved as  :- https://docs.google.com/document/d/1Jhi2PrA4JQmhjl1v9GVA3t9bGFaVMEFXqvIV1oi04ds/edit?usp=sharing

Step to Navigate to the App and verify the results

7) Open the org and select the app  ‘Fleet Management system’  from App Launcher
8) Click on Fleet Buses tab
9) Click on bottom flow  ‘Click here to setup the bus data’ and click next and refresh the page
10) Data should be displayed on the Fleet Buses Page, when clicked on any bus image, details should appear on right side and you should be able to save the record and edits should reflect on the left side  buses list.
10 On Bus tab Bus records can be seen and resale value should be triggered for 24 and 36 seater ready to use buses.
11) Flow on Fleet Buses  can be used any time to run the batch file to kick off the maintenance records for 5000 miles service for 60 seater buses

Note : Data Creation flow has been created for Bus and Garage and added - Flow - Create the Data.


Apex Trigger 
1) CalculateResaleValue
2) CalculateResaleValueHelper
3) CalculateResaleValueTest

App ‘Fleet Management Systems’ 
1) Lightning Page - Fleet Buses
2) LWCs - busBeerList, BusBeerTile, busFullDetail, busDetail, busResaleTile
3) Apex Class -LWCController

Batch File / Schedulable file
1) BatchClassForMaintananceNew
2) BatchMainClassNew
3) MaintenanceSchedulableClass
4) MaintenanceSchedulableClassTest
5) Flow - Schedule flow for nightly job
6) Flow - 60 seater Bus maintenance



Note : Data Creation flow has been created for Bus and Garage and added - Flow - Create the Data.

 
Link to above all instructions google doc- https://docs.google.com/document/d/1Jhi2PrA4JQmhjl1v9GVA3t9bGFaVMEFXqvIV1oi04ds/edit#

 








