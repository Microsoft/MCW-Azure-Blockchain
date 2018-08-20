![](https://github.com/Microsoft/MCW-Template-Cloud-Workshop/raw/master/Media/ms-cloud-workshop.png  "Microsoft Cloud Workshops")


<div class="MCWHeader1">
Azure Blockchain
</div>

<div class="MCWHeader2">
Hands-on lab step-by-step
</div>

<div class="MCWHeader3">
June 2018
</div>

Information in this document, including URL and other Internet Web site references, is subject to change without notice. Unless otherwise noted, the example companies, organizations, products, domain names, e-mail addresses, logos, people, places, and events depicted herein are fictitious, and no association with any real company, organization, product, domain name, e-mail address, logo, person, place or event is intended or should be inferred. Complying with all applicable copyright laws is the responsibility of the user. Without limiting the rights under copyright, no part of this document may be reproduced, stored in or introduced into a retrieval system, or transmitted in any form or by any means (electronic, mechanical, photocopying, recording, or otherwise), or for any purpose, without the express written permission of Microsoft Corporation.

Microsoft may have patents, patent applications, trademarks, copyrights, or other intellectual property rights covering subject matter in this document. Except as expressly provided in any written license agreement from Microsoft, the furnishing of this document does not give you any license to these patents, trademarks, copyrights, or other intellectual property.

The names of manufacturers, products, or URLs are provided for informational purposes only and Microsoft makes no representations and warranties, either expressed, implied, or statutory, regarding these manufacturers or the use of the products with any Microsoft technologies. The inclusion of a manufacturer or product does not imply endorsement of Microsoft of the manufacturer or product. Links may be provided to third party sites. Such sites are not under the control of Microsoft and Microsoft is not responsible for the contents of any linked site or any link contained in a linked site, or any changes or updates to such sites. Microsoft is not responsible for webcasting or any other form of transmission received from any linked site. Microsoft is providing these links to you only as a convenience, and the inclusion of any link does not imply endorsement of Microsoft of the site or the products contained therein.

©  2018 Microsoft Corporation. All rights reserved.

Microsoft and the trademarks listed at <https://www.microsoft.com/en-us/legal/intellectualproperty/Trademarks/Usage/General.aspx> are trademarks of the Microsoft group of companies. All other trademarks are property of their respective owners.

**Contents**

<!-- TOC -->

- [Azure Blockchain hands-on lab step-by-step](#azure-blockchain-hands-on-lab-step-by-step)
    - [Abstract and learning objectives](#abstract-and-learning-objectives)
        - [Overview](#overview)
    - [Solution architecture](#solution-architecture)
    - [Requirements](#requirements)
    - [Exercise 1: Setup Azure Active Directory Tenant](#exercise-1-setup-azure-active-directory-tenant)
        - [Task 1: Create Azure AD Tenant](#task-1-create-azure-ad-tenant)
        - [Task 2: Create App Registration](#task-2-create-app-registration)
        - [Task 3: Create Azure AD Administrator Group](#task-3-create-azure-ad-administrator-group)
        - [Task 4: Add Administrator User](#task-4-add-administrator-user)
    - [Exercise 2: Deploy Azure Blockchain Workbench](#exercise-2-deploy-azure-blockchain-workbench)
        - [Task 1: Generate SSH Public / Private Key](#task-1-generate-ssh-public--private-key)
        - [Task 2: Deploy Azure Blockchain Workbench](#task-2-deploy-azure-blockchain-workbench)
        - [Task 3: Get Azure Blockchain Workbench Web Client URL](#task-3-get-azure-blockchain-workbench-web-client-url)
        - [Task 4: Configure the Reply URL](#task-4-configure-the-reply-url)
    - [Exercise 3: Check Blockchain Workbench Web Client Deployment](#exercise-3-check-blockchain-workbench-web-client-deployment)
        - [Task 1: Open Blockchain Workbench Web Client](#task-1-open-blockchain-workbench-web-client)
    - [Exercise 4: Create Smart Contract](#exercise-4-create-smart-contract)
        - [Task 1: Code TelemetryCompliance Smart Contract](#task-1-code-telemetrycompliance-smart-contract)
        - [Task 2: Create the Configuration Files](#task-2-create-the-configuration-files)
        - [Task 3: Deploy the Smart Contract](#task-3-deploy-the-smart-contract)
    - [Exercise 5: Assign Users to Contract Personas](#exercise-5-assign-users-to-contract-personas)
        - [Task 1: Create Users in Azure AD](#task-1-create-users-in-azure-ad)
        - [Task 2: Create User Assignments](#task-2-create-user-assignments)
    - [Exercise 6: Create and Process an Instance of the Smart Contract](#exercise-6-create-and-process-an-instance-of-the-smart-contract)
        - [Task 1: Create Contract Instance](#task-1-create-contract-instance)
        - [Task 2: Transfer Responsibility to Contoso Shipping](#task-2-transfer-responsibility-to-contoso-shipping)
        - [Task 3: Ingest Simulated Device Telemetry](#task-3-ingest-simulated-device-telemetry)
        - [Task 4: Accept Responsibility to Blockchain Shipping](#task-4-accept-responsibility-to-blockchain-shipping)
        - [Task 5: Final Delivery to Northwind Traders](#task-5-final-delivery-to-northwind-traders)
        - [Task 6: Audit Smart Contract for Compliance](#task-6-audit-smart-contract-for-compliance)
    - [After the hands-on lab](#after-the-hands-on-lab)
        - [Task 1: Delete Resources](#task-1-delete-resources)
        - [Task 2: Delete Azure AD Tenant](#task-2-delete-azure-ad-tenant)

<!-- /TOC -->

# Azure Blockchain hands-on lab step-by-step

## Abstract and learning objectives

In this lab, students will learn how to build and configure an Internet of Things (IoT) Audit Solution using Azure Blockchain. Students will do this using Ethereum Blockchain with the use of Smart Contracts to collect device telemetry information in addition to enforce contract specifics related to conditions during transport of goods. Specifically, the IoT devices will report temperature and humidity data that will be validated through the Smart Contracts against agreed upon acceptable ranges.

Students will learn how to:

- Deploy and Configure Azure Blockchain Workbench

- Write and Deploy Ethereum Smart Contracts with Solidity

- Integrate both IoT and Blockchain together into a single solution

### Overview

In this lab, students will deploy a Blockchain solution using the Azure Blockchain Workbench. They will then configure authentication and authorization of multiple users using Azure AD. Then a Smart Contract to track and enforce compliance of a package in the Supply Chain will be implemented within the Blockchain written in Solidity. Finally, the student will create an instance of the Smart Contract on the Blockchain, go through the business workflow defined in the Smart Contract. The student will also feed IoT device sensor telemetry into the Blockchain Smart Contract to validate compliance of the contract using a simulated device account.

## Solution architecture

![](images/lab-guide/image2.png)

## Requirements

1. An Azure Subscription

## Exercise 1: Setup Azure Active Directory Tenant

Duration: 15 minutes

In this exercise, the student will configure a new Azure AD Tenant that
the Azure Blockchain Workbench will use to authenticate users.

The authentication and authorization of users in the Blockchain App
Builder is performed using an Azure Active Directory (AAD) Tenant. To
reduce the potential for conflict, a new AAD Tenant will be created for
use with this lab.

### Task 1: Create Azure AD Tenant

1. Login to the Azure Portal at <http://portal.azure.com> using the credentials for your Azure Subscription that you will be using to deploy the resources created within this lab

2. In the navigation on the left, click **+Create a resource**, then **Identity**, and click **Azure Active Directory**

3. On the **Create directory** blade, enter the following values, and click **Create**

    a.  Organization name: **Northwind Traders**

    b.  Initial domain name: ***enter a unique domain name**

    c.  Country or region: **select your country / region**

    ![](images/lab-guide/image7.png)

4. Wait for the new directory to be created. This should only take a minute.

    ![](images/lab-guide/image8.png)

5. Within the **Create directory** blade, click on the link that states "*Click here, to manage your new directory*". This will take to directly to the newly created directory.

    ![](images/lab-guide/image9.png)

6.  On the **Azure Active Directory** blade, click on **Custom domain names**

    ![](images/lab-guide/image10.png)

7. Copy the **Domain Name** for the **Azure Active Directory Tenant**. This will be used later.

    ![](images/lab-guide/image11.png)

### Task 2: Create App Registration

1. On the **Azure Active Directory** blade, click on **App registrations**

    ![](images/lab-guide/azuread-app-registrations-list.png)

2. On the **App registrations** pane, click **+New application registration** to add a new app

    ![](images/lab-guide/azuread-create-appregistration-button.png)

3. On the **Create** blade, enter the following values, then click **Create**:

    a. Name: **Azure Blockchain Workbench Web Client**
    b. Application type: **Web app / API**
    c. Sign-on URL: **http://localhost**

    ![](images/lab-guide/azuread-app-registration-create.png)

4. On the **Registered app** blade, copy the **Application ID**. Save this for reference later.

    ![](images/lab-guide/azuread-registeredapp-appid.png)

5. On the **Registered app** blade, click on **Settings**, then click on **Keys** within the Settings pane

    ![](images/lab-guide/azuread-registeredadd-settings-keys.png)

6. On the **Keys** blade, create a new **Password** with the following values, then click **Save**
    a. Description: **Client Secret**
    b. Expires: **Never expires**

    ![](images/lab-guide/azuread-registeredapp-keys-create.png)

7. Copy the **Password Value** for the newly created Password. Be sure to do this before closing the blade, as this is the only time the password will be visible here.

    ![](images/lab-guide/azuread-registeredapp-key-value.png)

8. On the **Registered app** blade, click the **Manifest** button to open the editor to edit the manifest json for the application registration

    ![](images/lab-guide/azuread-registeredapp-manifest-button.png)

9. On the **Edit manifest** blade, locate the **appRoles** object array JSON.

    ![](images/lab-guide/azuread-registredapp-manifest-approles-empty.png)

10. Replace the **appRoles** definition with the following JSON. This will configure the Registered App to use the Azure AD "Administrator" Group to specify Blockchain Workbench administrators.

    ```
      "appRoles": [
         {
           "allowedMemberTypes": [
             "User",
             "Application"
           ],
           "displayName": "Administrator",
           "id": "<A unique GUID>",
           "isEnabled": true,
           "description": "Blockchain Workbench administrator role allows creation of applications, user to role assignments, etc.",
           "value": "Administrator"
         }
       ],
    ```

11. Within the JSON that was just pasted into the **Edit manifest** editor, replace the **<A unique GUID\>** placeholder with a unique GUID value.

    To generate a unique GUID, open **PowerShell** locally or within the **Azure Cloud Shell** of the Azure Portal and run the following command:

    ```
    New-GUID
    ```

    ![](images/lab-guide/azuread-registeredapp-cloud-shell-new-guid.png)

    > Alternatively, open a web browser and navigate to <https://www.guidgen.com/> to generate a unique GUID from within the Web Browser.

12. Once the **unique GUID** has been placed within the Manifest editor, the final JSON will look similar to the following:

    ![](images/lab-guide/azuread-registeredapp-manifest-approles-unqiue-guid.png)

13. Click **Save**

    ![](images/lab-guide/azuread-registeredapp-manifest-save-buton.png)

14. On the **Registered app** blade, click **Settings**, then **Required permissions**

    ![](images/lab-guide/azuread-registeredapp-settings-required-permissions-link.png)

15. On the **Required permissions** pane, click **+ Add**

    ![](images/lab-guide/azuread-registeredapp-required-permissions-add-button.png)

16. On the **Add API access** blade, click on **Select an API**, then click **Microsoft Graph**, then click **Select**

    ![](images/lab-guide/azuread-registeredapp-permission-step1-microsoft-graph.png)

17. Within the **Enable Access** pane on the **Select permissions** step, scroll down and select the **Read all users' full profiles** permission, then click **Select**

    ![](images/lab-guide/azuread-registeredapp-permission-step2-enable-access.png)

18. Click **Done** to add the Required Permissions

19. On the **Required permissions** pane, click the **Grant permissions** button.

    ![](images/lab-guide/azuread-registeredapp-permission-grant-permission-button.png)

20. Click **Yes** to confirm granting the permissions for all accounts in the current directory.

    ![](images/lab-guide/azuread-registeredapp-permissions-confirm-grant.png)

### Task 3: Create Azure AD Administrator Group

1. On the **Azure Active Directory** blade, click on **Groups**

    ![](images/lab-guide/azuread-groups-button.png)

2. Click **+New group**

    ![](images/lab-guide/azuread-groups-new-group.png)

3. On the **Group** blade, enter the following values, then click **Create**;
    a. Group type: **Security**
    b. Group name: **Administrator**
    c. Membership type: **Assigned**
    
    ![](images/lab-guide/azuread-group-new-administrator-group.png)

### Task 4: Add Administrator User

1. On the **Azure Active Directory** blade, click on **Users**

    ![](images/lab-guide/azuread-users-button.png)

2. On the **All users** pane, click on the Azure AD User that you are currently logged into the Azure Portal with

    ![](images/lab-guide/azuread-all-users-list-me.png)

3. On the **User** blade, click on **Groups**

    ![](images/lab-guide/azuread-user-groups-button.png)

4. Click the **+ Add** button to begin adding the Azure AD User to the Administrator group

    ![](images/lab-guide/azuread-user-add-group-button.png)

5. On the **Select Group** pane, click the **Administrator** group, then click **Select**

    ![](images/lab-guide/azuread-user-add-group-select-administrator.png)

6. On the **Azure Active Directory** blade, click on **Enterprise applications**

    ![](images/lab-guide/azuread-enterprise-applications-link.png)

7. On the **Enterprise applications - All applications** pane, click on the **Azure Blockchain Workbench Web Client** name in the list

    ![](images/lab-guide/azuread-enterprise-applications-list.png)

8. On the **Enterprise Application** blade for the Azure Blockchain Workbench Web Client, click on **Users and groups**

    ![](images/lab-guide/azuread-enterprise-applications-users-and-groups-link.png)

9. On the **Users and groups** pane, click the **+ Add user** button

    ![](images/lab-guide/azuread-enterprise-applications-usersandgroups-adduser-button.png)

10. On the **Add Assignment** blade, click **Users**, select the User you're currently logged into the Azure Portal with, then click **Select**

    ![](images/lab-guide/azuread-enterprise-applications-usersandgroups-adduser-adminuser.png)

11. Verify the **Role** is set to **Administrator**, then click **Assign**

    ![](images/lab-guide/azuread-enterprise-applications-usersandgroups-adduser-role-verify-assign-button.png)

## Exercise 2: Deploy Azure Blockchain Workbench

Duration: 60 - 90 minutes

In this exercise, the student will deploy and setup Azure Blockchain App Builder.

### Task 1: Generate SSH Public / Private Key

1. Run **PuTTY Key Generator** (puttygen.exe):

    <https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html>

2. Click **Generate** to begin generating a new public/private key pair, and follow the instructions to move the mouse to generate randomness

    ![](images/lab-guide/image37.png)

3. Click **Save public key** to save the generated Public Key to a file

    ![](images/lab-guide/image38.png)

4. In the **Save public key as:** dialog, choose a folder location to save the Public Key file, then name the file **PublicKey.txt** and click **Save**

    ![](images/lab-guide/image39.png)

5. Click **Save private key** to save the generated Private Key to a file
    ![](images/lab-guide/image40.png)

6. When prompted "*Are you sure you want to save this key without a passphrase to protect it?",* click **Yes**. Normally, you would set a passphrase for better security of the Private Key, but for this Lab you can skip that.

    ![](images/lab-guide/image41.png)

7. On the **Save private key as:** dialog, choose the same folder used earlier, then name the Private Key file **PrivateKey.ppk** and click **Save**

    ![](images/lab-guide/image42.png)

8. You can now close PuTTY Key Generator, but remember where the Key files have been saves. They will need needed in a future step.

### Task 2: Deploy Azure Blockchain Workbench

1.  Login to the Azure Portal at <http://portal.azure.com> using the credentials for your Azure Subscription that you will be using to deploy the resources created within this lab

2.  Click on the **Directory and Subscription filter** button in the top menu of the Azure Portal, and ensure that the Azure Active Directory for your Azure Subscription is selected. When previously configuring the **Northwind Traders Directory**, it will currently be selected, so you will need to click on the appropriate Directory for your Azure Subscription to change Directories and be able to continue with the lab.
    ![](images/lab-guide/image43.png)

3.  Now that you made sure to select the Directory for your Azure Subscription, click **+Create a resource** to begin provisioning a new resource

    ![](images/lab-guide/image44.png)

4.  In the **Marketplace Search** box type **Azure Blockchain Workbench**, then press **Enter**

    ![](images/lab-guide/image45.png)

5.  In the search results, click on **Azure Blockchain Workbench**

    ![](images/lab-guide/image46.png)

6.  Click **Create**

    ![](images/lab-guide/image47.png)

7.  On the **Basic** step of the **Create Azure Blockchain Workbench** blade, enter the following values, and click **OK**:

    a.  Resource prefix: *Choose a prefix to use as the base for naming resources. Tip: Using the first letter of your first name, and the first 3 letters of your last name (ex: jdoe) is an easy way to make this unique.*

    b.  VM user name: **demouser**

    c. Authentication type: **SSH public key**

    d.  SSH public key: *paste in the contents of the PublicKey.txt key file that was previously created.
    
    ![](images/lab-guide/image48.png)

    e.  Database password: **Demo@pass123**

    f.  Deployment Region: *Choose the Azure Region closest to you*

    g.  Resource group: **BlockchainLab**

    h.  Location: *Choose the same Azure Region that was chosen for Deployment Region*

    ![](images/lab-guide/image49.png)

8.  On the **Azure Active Directory setup** step, enter the following values, then click **OK**:

    a.  Azure AD tenant Domain name: *Enter the Domain name for the Azure AD Tenant to use for the Blockchain Workbench*

    b.  Azure AD client Application ID: *Enter the **Azure AD Client Application ID** that was copied previously*

    c.  Azure AD client Application key: *Enter the **Azure AD Client Application Key** that was copied previously*

    ![](images/lab-guide/image50.png)

9.  On the **Network size and performance** step, leave the default values and click **OK**

    ![](images/lab-guide/image50b-networksizeandperfstep.png)

10. On the **Azure Monitor** step, leave the default values and click **OK**

    ![](images/lab-guide/image50c-azuremonitor.png)

11.  On the **Summary** step, click **OK** once validation is complete

    ![](images/lab-guide/image51.png)

12. On the **Buy** step, click **Create**

    ![](images/lab-guide/image52.png)

13. Wait for **Blockchain Workbench** to deploy. This can take approximately 60 - 90 minutes to complete. Wait for this to finish
    before moving on.
    
    ![](images/lab-guide/image53.png)

### Task 3: Get Azure Blockchain Workbench Web Client URL

1.  Click on **Resource groups** in the navigation on the left-side of the Azure Portal, and click on the **BlockchainLab** resource group in the list

    ![](images/lab-guide/image54.png)

2.  On the Resource group blade for the **BlockchainLab**, click on the **TYPE** column header to sort the list of resources within the Resource Group

    ![](images/lab-guide/image55.png)

3.  Now with the **App Service** resources at the top of the list, click on the App Service resource that does *NOT* have "-api" at the end of the name. The App Service to click should be the first one when resources are sorted by TYPE.

    ![](images/lab-guide/image56.png)

4.  On the **App Service** blade, copy the **URL** for the Web App for future use. It's recommended that you open Notepad and save this in a .txt file for future reference
    
    ![](images/lab-guide/image57.png)


### Task 4: Configure the Reply URL

1.  Login to the Azure Portal at <http://portal.azure.com> using the credentials for your Azure Subscription that you will be using to deploy the resources created within this lab

2.  Click on the **Directory and Subscription filter** button at the top of the Azure Portal, then select the **Northwind Traders** Azure AD Tenant that was created for this lab

    ![](images/lab-guide/image58.png)

3.  In the navigation on the left-side of the Azure Portal, click on **Azure Active Directory**

    ![](images/lab-guide/image59.png)

4.  On the **Azure Active Directory** blade for the Northwind Traders Directory, click on **App registrations**

    ![](images/lab-guide/image60.png)

5.  On the **App registrations** pane, click the **View all applications** button to show all App registrations

    ![](images/lab-guide/azuread-app-registrations-view-all-button.png)

6.  Click on the **Azure Blockchain Workbench Web Client** app registration in the list

    ![](images/lab-guide/image61.png)

7.  On the **Registered app** blade, click on **Reply URLs** under Settings

    ![](images/lab-guide/image62.png)

8.  Add a new **Reply URL** and paste in the **URL** that was copied from the **Azure Blockchain Workbench Web App** previously, then click **Save**. Be sure that it's an "http**s**://*"* URL.

    ![](images/lab-guide/image64.png)

## Exercise 3: Check Blockchain Workbench Web Client Deployment

Duration: 15 minutes

In this exercise, the student will access the Azure Blockchain Workbench Web Client to make sure the deployment is working as expected. The student will also check the Ethereum network status.

### Task 1: Open Blockchain Workbench Web Client

1. Open a new browser window in incognito or private browser mode, then navigate to the URL for the **Blockchain Workbench Web Client**

2. When prompted, login to the site using your **Microsoft Account** that you previously added to the **Administrator** Group within Azure AD

    ![](images/lab-guide/image66.png)

3. Once logged in you will see the dashboard view of the **Azure Blockchain Workbench Web Client**

    ![](images/lab-guide/image68.png)

## Exercise 4: Create Smart Contract
---------------------------------

Duration: 30 minutes

In this exercise, you will create a new Smart Contract that targets the Ethereum blockchain that is written in the Solidity programming
language.

### Task 1: Code TelemetryCompliance Smart Contract

1. Open **Visual Studio Code**, click **File** followed by **Open Folder...**

    ![](images/lab-guide/image80.png)

2. In the **Open Folder** dialog, select the **C:/HOL** folder. If the folder does not exist yet, please create it.

    ![](images/lab-guide/image81.png)

3. Expand the **Explorer** pane, then hover over the **HOL** folder, and click the **New File** button

    ![](images/lab-guide/image82.png)

4. Type in **TelemetryCompliance.sol** as the file name

    ![](images/lab-guide/image83.png)

5. Open the **TelemetryCompliance.sol** file, then add the following line to the top of the file. This first line specifies the source code is written for Solidity version 0.4.20 or newer that does not break functionality up to, but not including version 0.5.0. This is to ensure the Smart Contract does not behave differently with a new compiler version.

    ```
    pragma solidity ^0.4.20;
    ```

6. Next, add the base contract for Blockchain Workbench, WorkbenchBase

    When creating Smart Contracts, this base contract will capture the contract type and address, then log them as events. The type and address are passed into the base contract from the constructor, and the ContractCreated function is called from the constructor. As state changes, the contract will call the ContractUpdated function on the base contract to indicate an update has occurred, specifying the function in the contract that was called.

    ```
    contract WorkbenchBase {
        event WorkbenchContractCreated(string applicationName, string workflowName, address originatingAddress);
        event WorkbenchContractUpdated(string applicationName, string workflowName, string action, address originatingAddress);
    
        string internal ApplicationName;
        string internal WorkflowName;
    
        function WorkbenchBase(string applicationName, string workflowName) internal {
            ApplicationName = applicationName;
            WorkflowName = workflowName;
        }
    
        function ContractCreated() internal {
            WorkbenchContractCreated(ApplicationName, WorkflowName, msg.sender);
        }
    
        function ContractUpdated(string action) internal {
            WorkbenchContractUpdated(ApplicationName, WorkflowName, action, msg.sender);
        }
    }
    ```

7. Next, add the beginning of the Smart Contract. The type name for this contract will be TelemetryCompliance, and it will inherit from the WorkbenchBase base contract.
    
    ```
    contract TelemetryCompliance is WorkbenchBase('TelemetryCompliance', 'TelemetryCompliance')
    {
        // insert smart contract code here
    }
    ```

8. Next, the functionality of the Smart Contract needs to be filled out. Start this by adding the following **enum StateType** definition within the **TelemetryCompliance** class.

    ```
    enum StateType {
        Creating,
        Created,
        TransitionRequestPending,
        InTransit,
        FinalDelivery,
        Completed,
        OutOfCompliance
    }
    ```

9. Add the **State** property of type **StateType**. This will be used through-out the lifetime of the Smart Contract to store the appropriate state of the contact.

    ```
    StateType public State;
    ```

10. Add the following additional properties to the Smart Contract. These properties will be used to track the different individuals who will be participating in the workflow.

    ```
    address public InitiatingCounterparty;
    address public Counterparty;
    address public PreviousCounterparty;
    address public RequestedCounterparty;
    address public Device;
    address public SupplyChainOwner;
    address public SupplyChainObserver;
    ```

    The "**Counterparty**" properties that were added are used to reflect the different individuals' organizations that have had, do currently     have, or are about to have possession of a package.

    There is also a "**Device**" property to provide telemetry information on humidity and temperature which will be evaluated by the Smart Contract. The contract is setup so that this ca work with both a real device and Azure IoT Hub, or a person simulating the device as a logged in user.

    The "**SupplyChainOwner**" represents the organization that is shipping the package through the supply chain.

    The "**SupplyChainObserver**" represents an organization that does not participate in the supply chain but may be monitoring it. An example of an observer could be a government agency. 

    >NOTE: The SupplyChainObserver is included in the properties of the Smart Contract, but it's not being implemented in this lab.

11. Add the following properties to be used to enforce the package will be maintained in an environment with minimum and maximum threshold readings (min and max) for both Temperature and Humidity. There are also properties that record the last reported values and the timestamp for the last sensor update; as a Unix epoch date value versus a formatted date and time.

    ```
    int public MinHumidity;
    int public MaxHumidity;
    int public MinTemperature;
    int public MaxTemperature;
    int public LastHumidity;
    int public LastTemperature;
    uint public LastSensorUpdateTimestamp;
    ```

12. Next, add some properties to provide information on the compliance status of the contract. The **ComplianceStatus** property will store whether the monitored sensor values are out of compliance. The **enum** **SensorType** will be used along with the **ComplianceSensorType** property to store information on the specific sensor reading recorded. The **ComplianceSensorReading** property will store the actual value of the sensor reading. Also, the **ComplianceDetail** property will store additional information about the compliance.
    
    ```
    enum SensorType { None, Humidity, Temperature }
    bool public ComplianceStatus;
    string public ComplianceDetail;
    SensorType public ComplianceSensorType;
    int public ComplianceSensorReading;
    ```

13. To start adding the functionality of Smart Contract, next, add the following **Constructor** to the **TelemetryCompliance** Smart Contract:

    ```
    function TelemetryCompliance(address device, address supplyChainOwner, address supplyChainObserver, int minHumidity, int maxHumidity, int minTemperature, int maxTemperature) 
    {
        ComplianceStatus = true;
        ComplianceSensorReading = -1;
        InitiatingCounterparty = msg.sender;
        Counterparty = InitiatingCounterparty;
        Device = device;
        SupplyChainOwner = supplyChainOwner;
        SupplyChainObserver = supplyChainObserver;
        MinHumidity = minHumidity;
        MaxHumidity = maxHumidity;
        MinTemperature = minTemperature;
        MaxTemperature = maxTemperature;
        State = StateType.Created;
        ContractCreated();
    }
    ```

    The constructor function has the same name as the Smart Contract and is called when the contract is created. The contract assumes the individual creating the contract is the **Counterparty** and will also assign this individual to the **InitiatingCounterparty**.

    Initially, the constructor set the **ComplianceStatus** to **true** for meeting compliance, and the **ComplianceSensorReading** to **-1** since no sensor readings have occurred yet. It then sets the **State** to indicated it was just **Created**.

14. Next, add the **IngestTelemetry** function to the Smart Contract. This function will receive the device telemetry information from sensors on the package. The parameters of this function are the **humidity** and **temperature** to receive data from sensors, and the third is the **timestamp** parameter is an integer representing a Unix epoch time for when the sensor information was collected.

    The IngestTelemetry function performs the following actions:

    a.  It verifies the sender of the telemetry is the Device that's assigned to the contract

    b.  It confirms the contract is in a state where it is interested in receiving telemetry information; aka the contract State is not "Completed" or "Out of Compliance"

    c.  It assigns the values to their associated properties; LastHumidity, LastTemperature, and LastSensorUpdateTimestamp

    d.  It checks the Temperature and Humidity telemetry values to
        identify if they are out of established ranges when the contract was created. If telemetry is not within the min and max values, then the contract will be recorded as "Out of Compliance" by setting the ComplianceStatus property to false. It will also record which telemetry has caused the compliance issue.

    > NOTE: The sensor data may be collected continuously, but data will not be sent to the contract continuously. Instead, it will be sent when business rules have identified that the data falls outside the acceptable ranges. Not reflected in the lab, is the scenario where information is also sent once per x, where x is a time interval such as 5 minutes, 30 minutes, an hour, etc.
    
    ```
    function IngestTelemetry(int humidity, int temperature, uint timestamp)
    {
        if (Device != msg.sender || State == StateType.OutOfCompliance || State == StateType.Completed)
        {
            revert();
        }
        
        LastHumidity = humidity;
        LastTemperature = temperature;
        LastSensorUpdateTimestamp = timestamp;
        
        if (humidity > MaxHumidity || humidity < MinHumidity)
        {
            ComplianceSensorType = SensorType.Humidity;
            ComplianceSensorReading = humidity;
            ComplianceDetail = 'Humidity value out of range.';
            ComplianceStatus = false;
        }
        else if (temperature > MaxTemperature || temperature < MinTemperature)
        {
            ComplianceSensorType = SensorType.Temperature;
            ComplianceSensorReading = temperature;
            ComplianceDetail = 'Temperature value out of range.';
            ComplianceStatus = false;
        }

        if (ComplianceStatus == false)
        {
            State = StateType.OutOfCompliance;
            /*When updating state */
            ContractUpdated("IngestTelemetry");
        }
    }
    ```

15. Add the **RequestTransferResponsiblity** function to the Smart Contract. This function will manage making requests for another party to take responsibility for an item. This function performs an evaluation whether the address associated with the request is the current *Counterparty*, and the contract is in a state where a transfer is possible.
    
    If the appropriate context is not in place, it will flag an error to the caller using the *"revert()"* method.
    
    If the appropriate context is in place, then it sets the *RequestedCounterparty* property to the value of the *newCounterparty* parameter.

    ```
    function RequestTransferResponsibility( address newCounterparty )
    {
        if (Counterparty != msg.sender || (State != StateType.Created && State != StateType.InTransit) || newCounterparty == Device || newCounterparty == SupplyChainObserver)
        {
            revert();
        }
        RequestedCounterparty = newCounterparty;
        State = StateType.TransitionRequestPending;
        /*When updating state */
        ContractUpdated("RequestTransferResponsibility");
    }
    ```

16. Next, add the **AcceptTransferResponsibility** function. This function manages the process of the requested party to acknowledge a transfer of responsibility of an item. This function performs an evaluation whether the address associated with the request is the current *RequestedCounterparty*, and the contract is in a state of *TransitionRequestPending*.
    
    If the appropriate context is not in place, it will flag an error to the caller using the "*revert()*" method.

    If the appropriate context is in place, it sets the *PreviousCounterparty* property to the value of the current *CounterParty* property. It then sets the current *CounterParty* to the *RequestedCounterparty* that has accepted the transfer of responsibility. It transitions the state to "*InTransit*" and resets the *RequestedCounterparty* to 0x0.

    ```
    function AcceptTransferResponsibility()
    {
        if (RequestedCounterparty != msg.sender || State != StateType.TransitionRequestPending)
        {
            revert();
        }

        PreviousCounterparty = Counterparty;
        Counterparty = RequestedCounterparty;
        RequestedCounterparty = 0x0;
        State = StateType.InTransit;
        /*When updating state */
        ContractUpdated("AcceptTransferResponsibility");
    }
    ```

17. Add the **TakeFinalDelivery** function. This function is used to identify when the final delivery of the package has taken place. The function performs an evaluation to determine whether the address associated with the request to terminate the function is the current *Counterparty* and that the package is in the state of "*InTransit*"
    
    If not, it will flag an error to the caller using the "*revert()*" method.
    
    If it is the *Counterparty*, it then sets the state of the contract, via the **State** property, to **FinalDelivery**.

    ```
    function TakeFinalDelivery()
    {
        if (Counterparty != msg.sender || State != StateType.InTransit)
        {
            revert();
        }

        State = StateType.FinalDelivery;
        /*When updating state */
        ContractUpdated("TakeFinalDelivery");
    }
    ```

18. Add the **Complete** function. This function allows the **SupplyChainOwner** to sign off on the contract as being complete when the contract is in the final delivery state. This function confirms that the caller is the *SupplyChainOwner* and that the contract is in the *FinalDelivery* state.
    
    If not, it will flag an error to the caller using the "*revert()*" method.
    
    If it is, then it sets the *State* of the contract to *Completed*, sets the *PreviousCounterparty* property to the current value of the *Counterparty* property, and then resets the value of the current *Counterparty*.

    ```
    function Complete()
    {
        if (SupplyChainOwner != msg.sender || State != StateType.FinalDelivery)
        {
            revert();
        }

        PreviousCounterparty = Counterparty;
        Counterparty = 0x0;
        State = StateType.Completed;
        /*When updating state */
        ContractUpdated("Complete");
    }
    ```

19. Save the file

    ![](images/lab-guide/image84.png)

### Task 2: Create the Configuration Files

In this task, you will create the configuration file that contains metadata on the Smart Contract so the Blockchain Workbench will be
able to generate an application for the contract.

1.  With **Visual Studio Code** still open to the **C:/HOL** folder, create a new file named **TelemetryCompliance.json**

    ![](images/lab-guide/image85.png)

2.  Open the **TelemetryCompliance.json** file, then add the following JSON object code:

    ```
    {
    "ApplicationName": "TelemetryCompliance",
    "DisplayName": "Telemetry Compliance",
    "Description": "",
    "ApplicationRoles": [
        {
            "Name": "Admin",
            "Description": "Admin"
        },
        {
            "Name": "User",
            "Description": "User"
        }
    ],
    "Workflows": [
        {
            "Name": "TelemetryCompliance",
            "DisplayName": "Telemetry Compliance",
            "Description": "",
            "Initiators": ["Admin", "User"],
            "StartState": "Creating",
            "Properties": [
    
            ],
            "Constructor": {
                "Parameters": [
                ]
            },
            "Functions": [
    
            ],
            "States": {
    
            }
        }
      ]
    }
    ```

3.  Within the **"Properties"** object, add the following JSON to define the metadata for the Properties of the TelemtryCompliance smart contract. This will create mappings for the properties defined in the Smart Contract.

    There are multiple items that can be reflected by an address in a Solidity smart contract, such as a user or contract, so Blockchain Workbench provides custom data types to help to determine how to interact with the contract appropriately. The *InitiatingCounterparty*, *Counterparty*, *PreviousCounterparty*, *RequestedCounterparty*, *Device*, *SupplyChainOwner*, and *SupplyChainObserver* properties are all defined as a "*user*" type.

    Additional properties for tracking the sensor rules and compliance
    details are also defined here, with a 1:1 mapping with what was seen
    in the Smart Contract definition created previously.
    
    ```
                {
                    "Name": "State",
                    "DisplayName": "State",
                    "Description": "Holds the state of the contract.",
                    "Type": {
                        "Name": "state"
                    }
                },
                {
                    "Name": "InitiatingCounterparty",
                    "DisplayName": "Initiating Counterparty",
                    "Description": "",
                    "Type": {
                        "Name": "user"
                    }
                },
                {
                    "Name": "Counterparty",
                    "DisplayName": "Counterparty",
                    "Description": "",
                    "Type": {
                        "Name": "user"
                    }
                },
                {
                    "Name": "PreviousCounterparty",
                    "DisplayName": "Previous Counterparty",
                    "Description": "",
                    "Type": {
                        "Name": "user"
                    }
                },
                {
                    "Name": "RequestedCounterparty",
                    "DisplayName": "Requested Counterparty",
                    "Description": "",
                    "Type": {
                        "Name": "user"
                    }
                },
                {
                    "Name": "Device",
                    "DisplayName": "Device",
                    "Description": "",
                    "Type": {
                        "Name": "user"
                    }
                },
                {
                    "Name": "SupplyChainOwner",
                    "DisplayName": "SupplyChain Owner",
                    "Description": "",
                    "Type": {
                        "Name": "user"
                    }
                },
                {
                    "Name": "SupplyChainObserver",
                    "DisplayName": "SupplyChain Observer",
                    "Description": "",
                    "Type": {
                        "Name": "user"
                    }
                },
                {
                    "Name": "MinHumidity",
                    "DisplayName": "Minimum Humidity",
                    "Description": "",
                    "Type": {
                        "Name": "int"
                    }
                },
                {
                    "Name": "MaxHumidity",
                    "DisplayName": "Maximum Humidity",
                    "Description": "",
                    "Type": {
                        "Name": "int"
                    }
                },
                {
                    "Name": "MinTemperature",
                    "DisplayName": "Minimum Temperature",
                    "Description": "",
                    "Type": {
                        "Name": "int"
                    }
                },
                {
                    "Name": "MaxTemperature",
                    "DisplayName": "Maximum Temperature",
                    "Description": "",
                    "Type": {
                        "Name": "int"
                    }
                },
                {
                    "Name": "ComplianceSensorType",
                    "DisplayName": "Compliance Sensor Type",
                    "Description": "",
                    "Type": {
                        "Name": "int"
                    }
                },
                {
                    "Name": "ComplianceSensorReading",
                    "DisplayName": "Compliance Sensor Reading",
                    "Description": "",
                    "Type": {
                        "Name": "int"
                    }
                },
                {
                    "Name": "ComplianceStatus",
                    "DisplayName": "Compliance Status",
                    "Description": "",
                    "Type": {
                        "Name": "bool"
                    }
                },
                {
                    "Name": "ComplianceDetail",
                    "DisplayName": "Compliance Detail",
                    "Description": "",
                    "Type": {
                        "Name": "string"
                    }
                },
                {
                    "Name": "LastHumidity",
                    "DisplayName": "Last Humidity",
                    "Description": "",
                    "Type": {
                        "Name": "int"
                    }
                },
                {
                    "Name": "LastTemperature",
                    "DisplayName": "Last Temperature",
                    "Description": "",
                    "Type": {
                        "Name": "int"
                    }
                },
                {
                    "Name": "LastSensorUpdateTimestamp",
                    "DisplayName": "Last Sensor Update Timestamp",
                    "Description": "",
                    "Type": {
                        "Name": "int"
                    }
                }
    ```

4.  Modify the following metadata JSON within the **"Constructor"** object. This provides a metadata definition of the Constructor for the Smart Contract to Blockchain Workbench.

    The **TelemetryCompliance** contract has seven parameters for its constructor. Three properties (*device, supplyChainOwner,* and *supplyChainObserver*) are specified as a "*user*" type. This provides context to Blockchain Workbench that it can provide to downstream clients and systems.

    The contract is measuring compliance of counterparties maintaining the item in an environment by evaluating telemetry from two types of sensors (temperature and humidity). The remaining four parameters in the constructor capture the minimum and maximum allowed ranges of sensor readings allowed to be considered in compliance (*minHumidity*, *maxHumidity*, *minTemperature*, *maxTemperature*).

    ```
            "Constructor": {
                "Parameters": [

                    {
                        "Name": "device",
                        "Description": "...",
                        "DisplayName": "Device",
                        "Type": {
                            "Name": "user"
                        }
                    },
                    {
                        "Name": "supplyChainOwner",
                        "Description": "...",
                        "DisplayName": "SupplyChain Owner",
                        "Type": {
                            "Name": "user"
                        }
                    },
                    {
                        "Name": "supplyChainObserver",
                        "Description": "...",
                        "DisplayName": "SupplyChain Observer",
                        "Type": {
                            "Name": "user"
                        }
                    },
                    {
                        "Name": "minHumidity",
                        "Description": "...",
                        "DisplayName": "Minimum Humidity",
                        "Type": {
                            "Name": "int"
                        }
                    },
                    {
                        "Name": "maxHumidity",
                        "Description": "...",
                        "DisplayName": "Maximum Humidity",
                        "Type": {
                            "Name": "int"
                        }
                    },
                    {
                        "Name": "minTemperature",
                        "Description": "...",
                        "DisplayName": "Minimum Temperature",
                        "Type": {
                            "Name": "int"
                        }
                    },
                    {
                        "Name": "maxTemperature",
                        "Description": "...",
                        "DisplayName": "Maximum Temperature",
                        "Type": {
                            "Name": "int"
                        }
                    }
                
                ]

            },
    ```

5.  Add the following metadata JSON to the **"Functions"** object that defines the *Functions* in the Smart Contract:

    As was seen in the smart contract, there are five functions: "*IngestTelemetry*," "*RequestTransferResponsibility*," "*AcceptTransferResponsibility*," "*TakeFinalDelivery*," and "*Complete*."

    As was seen earlier in this lab exercise, the type of "*user*" is assigned to provide context to Blockchain Workbench about the type of address needed for the action.

    If a function has no parameters, the parameters will be represented by an open and closed curly brace.

    ```
           "Functions": [

                {
                    "Name": "IngestTelemetry",
                    "DisplayName": "Ingest Telemetry",
                    "Description": "...",
                    "Parameters": [
                        {
                            "Name": "humidity",
                            "Description": "...",
                            "DisplayName": "humidity",
                            "Type": {
                                "Name": "int"
                            }
                        },
                        {
                            "Name": "temperature",
                            "Description": "...",
                            "DisplayName": "temperature",
                            "Type": {
                                "Name": "int"
                            }
                        },
                        {
                            "Name": "timestamp",
                            "Description": "...",
                            "DisplayName": "timestampt",
                            "Type": {
                                "Name": "int"
                            }
                        }
                    ]
                },
                {
                    "Name": "RequestTransferResponsibility",
                    "DisplayName": "Request Transfer Responsibility",
                    "Description": "...",
                    "Parameters": [
                        {
                            "Name": "newCounterparty",
                            "Description": "...",
                            "DisplayName": "newCounterparty",
                            "Type": {
                                "Name": "user"
                            }
                        }
                    ]
                },
                {
                    "Name": "AcceptTransferResponsibility",
                    "DisplayName": "AcceptTransferResponsibility",
                    "Description": "...",
                    "Parameters": [
                    ]
                },
                {
                    "Name": "TakeFinalDelivery",
                    "DisplayName": "TakeFinalDelivery",
                    "Description": "...",
                    "Parameters": [
                    ]
                },
                {
                    "Name": "Complete",
                    "DisplayName": "Complete",
                    "Description": "...",
                    "Parameters": [
                    ]
                }
            ]
    ```

6.  Add the following metadata JSON to the "**States**" object that defines the *Functions* in the Smart Contract:

    ```
            "States": [

                {
                    "Name": "Creating",
                    "DisplayName": "Creating",
                    "Description": "...",
                    "PercentComplete": 0,
                    "Value": 0,
                    "Style": "Success",
                    "Transitions": [
                    ]
                },
                {
                    "Name": "Created",
                    "DisplayName": "Created",
                    "Description": "...",
                    "PercentComplete": 10,
                    "Value": 1,
                    "Style": "Success",
                    "Transitions": [
                        {
                            "AllowedRoles": ["Admin", "User"],
                            "AllowedInstanceRoles": ["InitiatingCounterparty"],
                            "Description": "...",
                            "Function": "RequestTransferResponsibility",
                            "NextStates": [ "InTransit" ],
                            "DisplayName": "RequestTransferResponsibility"
                        },
                        {
                            "AllowedRoles": ["Admin", "User"],
                            "AllowedInstanceRoles": ["Device"],
                            "Description": "...",
                            "Function": "IngestTelemetry",
                            "NextStates": [ "InTransit", "OutOfCompliance" ],
                            "DisplayName": "IngestTelemetry"
                        }
                    ]
                },
                {
                    "Name": "TransitionRequestPending",
                    "DisplayName": "TransitionRequestPending",
                    "Description": "...",
                    "PercentComplete": 50,
                    "Value": 2,
                    "Style": "Success",
                    "Transitions": [
                        {
                            "AllowedRoles": ["Admin", "User"],
                            "AllowedInstanceRoles": ["Counterparty"],
                            "Description": "...",
                            "Function": "AcceptTransferResponsibility",
                            "NextStates": [ "InTransit" ],
                            "DisplayName": "AcceptTransferResponsibility"
                        },
                        {
                            "AllowedRoles": ["Admin", "User"],
                            "AllowedInstanceRoles": ["Device"],
                            "Description": "...",
                            "Function": "IngestTelemetry",
                            "NextStates": [ "InTransit", "OutOfCompliance" ],
                            "DisplayName": "IngestTelemetry"
                        }
                    ]
                },
                {
                    "Name": "InTransit",
                    "DisplayName": "InTransit",
                    "Description": "...",
                    "PercentComplete": 50,
                    "Value": 3,
                    "Style": "Success",
                    "Transitions": [
                        {
                            "AllowedRoles": ["Admin", "User"],
                            "AllowedInstanceRoles": ["Counterparty"],
                            "Description": "...",
                            "Function": "RequestTransferResponsibility",
                            "NextStates": [ "FinalDelivery" ],
                            "DisplayName": "RequestTransferResponsibility"
                        },
                        {
                            "AllowedRoles": ["Admin", "User"],
                            "AllowedInstanceRoles": ["Counterparty"],
                            "Description": "...",
                            "Function": "TakeFinalDelivery",
                            "NextStates": [ "FinalDelivery" ],
                            "DisplayName": "TakeFinalDelivery"
                        },
                        {
                            "AllowedRoles": ["Admin", "User"],
                            "AllowedInstanceRoles": ["Device"],
                            "Description": "...",
                            "Function": "IngestTelemetry",
                            "NextStates": [ "FinalDelivery", "OutOfCompliance" ],
                            "DisplayName": "IngestTelemetry"
                        }
                    ]
                },
                {
                    "Name": "FinalDelivery",
                    "DisplayName": "FinalDelivery",
                    "Description": "...",
                    "PercentComplete": 90,
                    "Value": 4,
                    "Style": "Success",
                    "Transitions": [
                        {
                            "AllowedRoles": ["Admin", "User"],
                            "AllowedInstanceRoles": [],
                            "Description": "...",
                            "Function": "Complete",
                            "NextStates": [ "Completed" ],
                            "DisplayName": "Complete"
                        }
                    ]
                },
                {
                    "Name": "Completed",
                    "DisplayName": "Completed",
                    "Description": "...",
                    "PercentComplete": 100,
                    "Value": 5,
                    "Style": "Success",
                    "Transitions": [
                    ]
                },
                {
                    "Name": "OutOfCompliance",
                    "DisplayName": "OutOfCompliance",
                    "Description": "...",
                    "PercentComplete": 100,
                    "Value": 6,
                    "Style": "Failure",
                    "Transitions": [
                    ]
                }

            ]
    ```

7. Save the file

### Task 3: Deploy the Smart Contract

1.  Open a new browser / tab and navigate to the **Blockchain Workbench Web Client** application

2.  Login to the Blockchain Workbench web application using the same account you logged in to your Azure Subscription with, and previously configured as an *Administrator* for the app

3. Click the **+ New** tile button to begin creating a new Blockchain application

    ![](images/lab-guide/image87.png)

    > NOTE: If you do not see the "+ New" tile button, then please go back and verify you configured / setup the Administrator user permissions correctly

4.  On the **New Application** form, click the **Browse** button

    ![](images/lab-guide/image88.png)

5. In the **Open** dialog, locate and select the **TelemetryCompliance.json** file, then click **Open**

    ![](images/lab-guide/open-file-telemetrycompliance-json.png)

    >When uploading the JSON file, it will be validated. If there are any errors in the file, they will display in a red box directly below the **Browse** button. If you have questions about the JSON Schema for Azure Blockchain Workbench, then refer to the [Azure Blockchain Workbench configuration reference](https://docs.microsoft.com/en-us/azure/blockchain-workbench/blockchain-workbench-configuration-overview) article within the documentation.
    
    >![](images/lab-guide/telemetrycompliance-json-file-errors-display-screenshot.png)
    
    >You can also use the following tools to check the files for errors:
    >
    >- Test the Solidity (.sol) Smart Contract source code using the remix IDE available at <http://remix.ethereum.org>
    >
    >- Test the JSON file using <http://jsoneditoronline.org>


6.  Click on the **Browse** button to **UPLOAD THE CONTRACT CODE (.sol, .zip)**, then choose the **TelemetryCompliance.sol** Solidity source code file for the Smart Contract
    
    ![](images/lab-guide/image89.png)

7. Once file validation passed for the uploaded files, click **Deploy** to deploy the Blockchain Application to the Azure Blockchain Workbench

    ![](images/lab-guide/blockchain-workbench-deploy-application-button.png)

8. Once the Deployment is complete, you should see the **Telemetry Compliance** Blockchain Application in the list of Applications

    ![](images/lab-guide/blockchain-application-deployment-success.png)

## Exercise 5: Assign Users to Contract Personas

Duration: 15 minutes

In this exercise, the student will create some additional Users within Azure AD that correspond to the different user roles within the Blockchain solution. These Users will also be assigned to the different personas within the Azure Blockchain Workbench their roles within the workflow coincide with.

### Task 1: Create Users in Azure AD

1. Login to the Azure Portal at <http://portal.azure.com> using the credentials for your Azure Subscription

2. Click on the **Directory and Subscription filter** button at the top of the Azure Portal, then select the **Northwind Traders** Azure AD Tenant that was created for this lab

    ![](images/lab-guide/image58.png)

3. In the navigation on the left side of the Azure Portal, click on **Azure Active Directory**

    ![](images/lab-guide/image98.png)

4. On the **Azure Active Directory** blade, click on **Users**

    ![](images/lab-guide/image99.png)

5. Click **+New user** to begin adding a new user

    ![](images/lab-guide/image100.png)

6. On the **User** blade, enter the following values:

    a.  Name: **Woodgrove Distribution**

    b.  User name: **woodgrovedistribution**@\<your-azure-ad-tenant\>.onmicrosoft.com

    ![](images/lab-guide/image101.png)

7. Check the **Show Password** box, then **copy the password** for future reference

    ![](images/lab-guide/image102.png)

8. Click **Create**

    ![](images/lab-guide/image103.png)

9. Repeat the last couple steps to create the following additional users within Azure AD, and log in with them to the Blockchain Workbench Web Client so their accounts get created

    | Name                              | User name                         
    | --------------------------------- | ---------------------------------
    | Contoso Shipping                  | **contososhipping**@\<your-azure-ad-tenant\>.onmicrosoft.com
    | Blockchain Shipping               | **blockchainshipping**@\<your-azure-ad-tenant\>.onmicrosoft.com
    | Simulated Device                  | **simulateddevice**@\<your-azure-ad-tenant\>.onmicrosoft.com
    | Northwind Traders Supplychain     | **northwindtraderssupplychain**@\<your-azure-ad-tenant\>.onmicrosoft.com
    | Government Regulator              | **governmentregulator**@\<your-azure-ad-tenant\>.onmicrosoft.com

    > NOTE: Be sure to record the passwords for each account so you can login with them later.

10. There should now be a total of **7 users** within the Northwind Traders Azure AD Directory. The 6 you just added, plus your Microsoft Account for managing the Azure AD Tenant and Azure Subscription.

    ![](images/lab-guide/image108.png)

### Task 2: Create User Assignments

1. Open a new browser window in incognito or private browser mode, then navigate to the URL for the **Blockchain Client App**

2. When prompted, login to the site using your **Microsoft Account** that you previously added to the **Administrator** Group within Azure AD

    ![](images/lab-guide/image66.png)

3. Once logged in, click the **Telemetry Compliance** Application

    ![](images/lab-guide/clientapp-applications-list-telemetry-compliance-app.png)

4. On the **Telemetry Compliance** Application, click on the **members** link in the upper-right

    ![](images/lab-guide/clientapp-telemetry-compliance-app-zero-members-link.png)

5. On the **Membership** pane, click the **Add a member** button

    ![](images/lab-guide/workbench-membership-add-member-button.png)

6. On the **Add a member** pane, type the **Northwind Traders Supplychain** into the account name field, then click on and select that user from the suggested list of Users within Azure AD

    ![](images/lab-guide/workbench-add-member-name.png)
    
7. Select the **Role** of **User**, then click **Add**

    ![](images/lab-guide/workbench-add-member-role.png)

8. Repeat the previous couple of steps to add the following list of member users:

    | Member User Name               | Role |
    | ----------------               | ---- |
    | Woodgrove Distribution         | User |
    | Contoso Shipping               | User |
    | Blockchain Shipping            | User |
    | Simulated Device               | User |
    | Northwind Traders Supplychain  | User |
    | Government Regulator           | Auditor |

9. There should now be **6 Member Users** added

    ![](images/lab-guide/workbench-members-list.png)

## Exercise 6: Create and Process an Instance of the Smart Contract

Duration: 45 minutes

In this exercise, the student will create a new instance of the TelemetryCompliance Smart Contract, and work through the workflow of the Supply Chain as programmed in the code of the Smart Contract. The student will also test the Compliance piece by simulating IoT Device Telemetry by logging in as the "Simulated Device" user.

### Task 1: Create Contract Instance

1.  Open a new browser in Incognito or Private browser mode, and navigate to the **Blockchain Workbench Web Client URL**

    >NOTE: Since you just finished creating all the different user accounts, you need to make sure you log into the Blockchain App Builder web app with each login to setup each of the accounts in the Blockchain network. Also, since these accounts were just created, you'll need to wait a couple minutes for that setup to fully finish processing within the Blockchain network before continuing with this task.

2.  Login as the **woodgrovedistribution** user

    ![](images/lab-guide/image123.png)

3.  Click the **Telemtry Compliance** application tile

    ![](images/lab-guide/image124.png)

4.  Click the **New Contract** button

    ![](images/lab-guide/image125.png)
    
5.  On the **Create** dialog, fill in the following values:

    a.  device: **Simulated Device**

    b.  supplyChainOwner: **Northwind Traders Supplychain**

    c.  supplyChainObserver: **Government Regulator**

    d.  minHumidity: **80**

    e.  maxHumidity: **90**

    f.  minTemperature: **40**

    g.  maxTemperature: **55**

    ![](images/lab-guide/image126.png)


6.  Click **Create**

7.  Wait for the Contract to be created

    ![](images/lab-guide/image127.png)

    > NOTE: This can take a few minutes to create the new Contract.

8.  Once the Contract has been created, Click on the new Contract in the list

    ![](images/lab-guide/image128.png)

9.  When viewing the Smart Contract, scroll down to view the **Status** and **Details** panes. Notice that the **Status** shows as **Created**.

    ![](images/lab-guide/image129.png)

10. Scroll back up to the top of the page, click the **Take action** button

    ![](images/lab-guide/image131.png)

11. In the **Action** dropdown, select **Request Transfer Responsibility**, then click **Take action**

    ![](images/lab-guide/image132.png)
    
12. In the **newCounterparty** field, enter the **Contoso Shipping** user, then click **Take action**

    ![](images/lab-guide/request-transfer-responsibility-newCounterparty.png)

13. View that the **Actions** pane for the Smart Contract now show the message "*You took action Request Transfer Responsibility*"

    ![](images/lab-guide/request-transfer-responsibility-you-took-action.png)

14. Log out, and Close the browser

### Task 2: Transfer Responsibility to Contoso Shipping

1. Open a new browser in Incognito or Private browser mode, and navigate to the **Blockchain Workbench Web Client URL**

2. Login as the **contososhipping** user

    ![](images/lab-guide/image133.png)

3.  Click the **Telemetry Compliance** application tile

    ![](images/lab-guide/image124.png)

4. Click the **Smart Contract** in the list

    ![](images/lab-guide/image135.png)

5. Scroll down to the **Status** section and view that the Status is currently set to **TransitionRequestPending**

    ![](images/lab-guide/image136.png)

6. Scroll back up to the top of the page, and click the **Take action** button

    ![](images/lab-guide/image137.png)

7. In the Action dropdown, select **AcceptTransferResponsibility**, then click **Take action**

    ![](images/lab-guide/image138.png)

8. Wait a minute or two for the responsibility transfer to process within the Blockchain

9. Scroll down to the **Status** section, and view the Status is now set to **InTransit**

    ![](images/lab-guide/image139.png)

10. Scroll back up to the top, and click the **Take action** button

    ![](images/lab-guide/image142.png)

11. In the Action dropdown, select **Request Transfer Responsibility**, then click **Take action**

    ![](images/lab-guide/image140.png)

12. In the **newCounterparty** field, select the **Blockchain Shipping** user, then click **Take action**
    
    ![](images/lab-guide/image143.png)

13. Log out, and Close the browser

### Task 3: Ingest Simulated Device Telemetry

1.  Open a new browser in Incognito or Private browser mode, and navigate to the **Blockchain Workbench Web Client URL**

2.  Login as the **simulateddevice** user

    ![](images/lab-guide/image144.png)

3.  Click the **Telemetry Compliance** application tile

    ![](images/lab-guide/image124.png)

4.  Click the **Smart Contract** in the list

    ![](images/lab-guide/image145.png)

5.  Click the **Take action** button

    ![](images/lab-guide/image142.png)

6. Select **Ingest Telemetry** in the Action dropdown, then click **Take action**

    ![](images/lab-guide/image146.png)

7. On the **IngestTelemetry** dialog, enter the following values:

    a.  Humidity: **85**

    b.  Temperature: **48**

    ![](images/lab-guide/image147.png)

8. The **timestamp** field needs to be entered in as a **Unix Timestamp**. To easily get the Current Unix Timestamp, simply open a new browser, navigate to <http://www.unixtimestamp.com>, then copy the **Current Unix Timestamp** and paste it into the **timestamp** field within the **IngestTelemetry** dialog.

    ![](images/lab-guide/image148.png)

9. Once the **timestamp** has been entered, click **Take action**
    
    ![](images/lab-guide/image149.png)

10. The **Simulated Device** for the package that the Smart Contract instance is tracking has now been logged and verified with the Smart Contract

11. Log out, and Close the browser

### Task 4: Accept Responsibility to Blockchain Shipping

1. Open a new browser in Incognito or Private browser mode, and .navigate to the **Blockchain Workbench Web Client URL**

2. Login as the **blockchainshipping** user

    ![](images/lab-guide/image150.png)

3. Click the **Telemetry Compliance** application tile

    ![](images/lab-guide/image124.png)

4. Click on the **Smart Contract**

    ![](images/lab-guide/image135.png)

5. Click the **Take action** button

    ![](images/lab-guide/image142.png)

6. Select **AcceptTransferResponsibility** in the Action dropdown, then click **Take action**

    ![](images/lab-guide/image152.png)

7. Wait a minute or two for the action to complete within the Blockchain

8. Click the **Take action** button

    ![](images/lab-guide/image142.png)

9. Select **Request Transfer Responsibility** in the Action dropdown, then click **Take action**

    ![](images/lab-guide/image155.png)

10. In the **newCounterparty** field, select the **Northwind Traders Supplychain** user, then click **Take action**

    ![](images/lab-guide/image156.png)

11. Log out, and Close the browser

### Task 5: Final Delivery to Northwind Traders

1. Open a new browser in Incognito or Private browser mode, and navigate to the **Blockchain Workbench Web Client URL**

2. Login as the **northwindtraderssupplychain** user

    ![](images/lab-guide/image157.png)

3. Click the **Telemetry Compliance** application tile

    ![](images/lab-guide/image124.png)

4. Click the **Take action** button

    ![](images/lab-guide/image142.png)

5. Select **AcceptTransferResponsibility** in the Action dropdown, then click **Take action**

    ![](images/lab-guide/take-action-accept-transfer-responsibility.png)

6. Wait a minute or two for the Blockchain network to process

7. Click the **Take action** button

    ![](images/lab-guide/image142.png)

8. Select **TakeFinalDelivery** in the Action dropdown, then click **Take action**

    ![](images/lab-guide/take-action-take-final-delivery.png)

9.  Wait a minute or two for the Blockchain network to process

10. Log out, and Close the browser

### Task 6: Audit Smart Contract for Compliance

1. Open a new browser in Incognito or Private browser mode, and navigate to the **Blockchain Workbench Web Client URL**

2. Login as the **governmentregulator** user

    ![](images/lab-guide/image164.png)

3. Click the **Telemetry Compliance** application tile

    ![](images/lab-guide/image124.png)

4. Click on the **Smart Contract** in the list

    ![](images/lab-guide/image135.png)

5. Scroll down and view the information displayed in the **Status**, **Details**, and **Activity** sections for the Smart Contract

    ![](images/lab-guide/audit-smart-contract-status.png)

6. Log out, and Close the browser

## After the hands-on lab 

Duration: 15 minutes

### Task 1: Delete Resources

1. Now that the Lab is complete, go ahead and delete all the Resource Groups that were created for this Lab. You will no longer need those resources and it will be beneficial to clean up your Azure Subscription.

### Task 2: Delete Azure AD Tenant

1. **Only follow this task if you created a new Azure AD tenant just to use for this lab. If you used an existing Azure AD tenant to manage the user accounts for this lab, then DO NOT delete it.**

2. Open a browser window / tab, then navigate to and login to the Azure Portal at <http://portal.azure.com>

3. Click on the **Directory and Subscription filter** button in the top menu of the Azure Portal, and select the **Northwind Traders** Azure AD directory

    ![](images/lab-guide/image168.png)

4. In the navigation pane on the left, click on **Azure Active Directory**

    ![](images/lab-guide/image169.png)

5. Before the Azure AD Tenant can be deleted, it first needs to be cleaned up

6. On the Azure Active Directory blade, click on **Users**

    ![](images/lab-guide/image170.png)

7. Go through and **Delete** each of the Users that were created for this lab

    ![](images/lab-guide/image172.png)

8. On the **Azure Active Directory** blade, click on **App registrations**

    ![](images/lab-guide/image174.png)

9. Click the **View all application** button to show all application registration

10. Click on the **Azure Blockchain Workbench Web Client** app registration

    ![](images/lab-guide/image175.png)

11. Click the **delete** button, and click **Yes** to confirm deleting the app registration

    ![](images/lab-guide/image176.png)

12. On the **Azure Active Directory** blade, click **Delete directory** button, and click the **Delete** button on the **Delete directory 'Northwind Traders'?** confirmation pane

    ![](images/lab-guide/image178.png)

You should follow all steps provided *after* attending the hands-on lab.
