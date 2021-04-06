
https://docs.google.com/document/d/1Jhi2PrA4JQmhjl1v9GVA3t9bGFaVMEFXqvIV1oi04ds/edit?usp=sharing



Installing the App using a Developer Edition Org or a Trailhead Playground
Follow this set of instructions if you want to deploy the application  any  Developer Edition Org or a Trailhead Playground.




1) git clone https://github.com/aradhikachawla/FleetManagement
2) cd FleetManagement
3) sfdx auth:web:login -s -a mydevorg
4) sfdx force:source:deploy -p force-app
5) sfdx force:user:permset:assign -n FleetManage
6) Open the org and select the Fleet Management system from App Launcher
7) The Application should contain 5 tabs  Fleet Buses, Bus, Garage, Sensors, Maintenance records.
8) Click on ‘Create the data’ to  import the data.
 







