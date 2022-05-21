# MY OBSERVATIONS :
- As I have two GitHub accounts I must modify __Control Panel\All Control Panel Items\Credential Manager\Edit Generic Credential__ in Windows to push into the correct account.

- Must use __powershell__ terminal not bash terminal if you get the error:
   _'C:\Program' is not recognized as an internal or external command, operable program or batch file._

- Use: SELECT ... __WITH SECURITY_ENFORCED__ to get rid of the error:
   _Validate CRUD permission before SOQL/DML operation (rule: Security-ApexCRUDViolation)_

- For deploying 
   - __SFDX: Deploy Source to Org__ to main organisation
   - __sfdx force:source:push__ to scrap organisation  

- [__sfdx__ documentation](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)

- In powershell:
    - __sfdx force:data:soql:query -q "SELECT Id, Name, Account.Name FROM Contact"__

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


