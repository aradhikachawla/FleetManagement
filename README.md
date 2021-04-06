
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







# Salesforce DX Project: Next Steps
Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

## How Do You Plan to Deploy Your Changes?

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
