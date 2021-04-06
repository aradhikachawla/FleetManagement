
https://docs.google.com/document/d/1Jhi2PrA4JQmhjl1v9GVA3t9bGFaVMEFXqvIV1oi04ds/edit?usp=sharing

Installing the App using a Developer Edition Org or a Trailhead Playground
Follow this set of instructions if you want to deploy the application  any  Developer Edition Org or a Trailhead Playground.

git clone https://github.com/aradhikachawla/FleetManagement
cd FleetManagement
sfdx auth:web:login -s -a mydevorg
sfdx force:source:deploy -p force-app
sfdx force:user:permset:assign -n FleetManage
Open the org and select the Fleet Management system from App Launcher
Click on ‘Upload the data’ to  import the data.
The Application should contain 5 tabs  Fleet Buses, Bus, Garage, Sensors, Maintenance records.







