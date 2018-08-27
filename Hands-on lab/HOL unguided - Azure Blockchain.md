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

- [Azure Blockchain hands-on lab unguided](#azure-blockchain-hands-on-lab-unguided)
    - [Abstract and learning objectives](#abstract-and-learning-objectives)
    - [Overview](#overview)
    - [Solution architecture](#solution-architecture)
    - [Requirements](#requirements)
    - [Exercise 1: Setup Azure Active Directory Tenant](#exercise-1-setup-azure-active-directory-tenant)
        - [Help references](#help-references)
        - [Task 1: Create Azure AD Tenant](#task-1-create-azure-ad-tenant)
            - [Tasks to complete](#tasks-to-complete)
            - [Exit criteria](#exit-criteria)
        - [Task 2: Create App Registrations](#task-2-create-app-registrations)
            - [Tasks to complete](#tasks-to-complete-1)
            - [Exit criteria](#exit-criteria-1)
        - [Task 3: Create Azure AD Administrator Group](#task-3-create-azure-ad-administrator-group)
            - [Tasks to complete](#tasks-to-complete-2)
            - [Exit criteria](#exit-criteria-2)
        - [Task 4: Add Administrator User](#task-4-add-administrator-user)
            - [Tasks to complete](#tasks-to-complete-3)
            - [Exit criteria](#exit-criteria-3)
    - [Exercise 2: Deploy Azure Blockchain Workbench](#exercise-2-deploy-azure-blockchain-workbench)
            - [Help references](#help-references-1)
        - [Task 1: Generate SSH Public / Private Key](#task-1-generate-ssh-public--private-key)
            - [Tasks to complete](#tasks-to-complete-4)
            - [Exit criteria](#exit-criteria-4)
        - [Task 2: Deploy Azure Blockchain Workbench](#task-2-deploy-azure-blockchain-workbench)
            - [Tasks to complete](#tasks-to-complete-5)
            - [Exit criteria](#exit-criteria-5)
        - [Task 3: Get Azure Blockchain Workbench Web CLient URL](#task-3-get-azure-blockchain-workbench-web-client-url)
            - [Tasks to complete](#tasks-to-complete-6)
            - [Exit criteria](#exit-criteria-6)
        - [Task 4: Configure the Reply URL](#task-4-configure-the-reply-url)
            - [Tasks to complete](#tasks-to-complete-7)
            - [Exit criteria](#exit-criteria-7)
    - [Exercise 3: Check Blockchain Workbench Web Client Deployment](#exercise-3-check-blockchain-workbench-web-client-deployment)
        - [Task 1: Open Blockchain Workbench Web Client](#task-1-open-blockchain-workbench-web-client)
            - [Tasks to complete](#tasks-to-complete-8)
            - [Exit criteria](#exit-criteria-8)
    - [Exercise 4: Create Smart Contract](#exercise-4-create-smart-contract)
            - [Help references](#help-references-2)
        - [Task 1: Code TelemetryCompliance Smart Contract](#task-1-code-telemetrycompliance-smart-contract)
            - [Tasks to complete](#tasks-to-complete-9)
            - [Exit criteria](#exit-criteria-9)
        - [Task 2: Create the Configuration Files](#task-2-create-the-configuration-files)
            - [Tasks to complete](#tasks-to-complete-10)
            - [Exit criteria](#exit-criteria-10)
        - [Task 3: Deploy the Smart Contract](#task-3-deploy-the-smart-contract)
            - [Tasks to complete](#tasks-to-complete-11)
            - [Exit criteria](#exit-criteria-11)
    - [Exercise 5: Assign Users to Contract Personas](#exercise-5-assign-users-to-contract-personas)
            - [Help references](#help-references-3)
        - [Task 1: Create Users in Azure AD](#task-1-create-users-in-azure-ad)
            - [Tasks to complete](#tasks-to-complete-12)
            - [Exit criteria](#exit-criteria-12)
        - [Task 2: Create User Assignments](#task-2-create-user-assignments)
            - [Tasks to complete](#tasks-to-complete-13)
            - [Exit criteria](#exit-criteria-13)
    - [Exercise 6: Create and Process an Instance of the Smart Contract](#exercise-6-create-and-process-an-instance-of-the-smart-contract)
            - [Help references](#help-references-4)
        - [Task 1: Create Contract Instance](#task-1-create-contract-instance)
            - [Tasks to complete](#tasks-to-complete-14)
            - [Exit criteria](#exit-criteria-14)
        - [Task 2: Transfer Responsibility to Contoso Shipping](#task-2-transfer-responsibility-to-contoso-shipping)
            - [Tasks to complete](#tasks-to-complete-15)
            - [Exit criteria](#exit-criteria-15)
        - [Task 3: Ingest Simulated Device Telemetry](#task-3-ingest-simulated-device-telemetry)
            - [Tasks to complete](#tasks-to-complete-16)
            - [Exit criteria](#exit-criteria-16)
        - [Task 4: Accept Responsibility to Blockchain Shipping](#task-4-accept-responsibility-to-blockchain-shipping)
            - [Tasks to complete](#tasks-to-complete-17)
            - [Exit criteria](#exit-criteria-17)
        - [Task 5: Final Delivery to Northwind Traders](#task-5-final-delivery-to-northwind-traders)
            - [Tasks to complete](#tasks-to-complete-18)
            - [Exit criteria](#exit-criteria-18)
        - [Task 6: Audit Smart Contract for Compliance](#task-6-audit-smart-contract-for-compliance)
            - [Tasks to complete](#tasks-to-complete-19)
            - [Exit criteria](#exit-criteria-19)
        - [Task 1: Delete Resources](#task-1-delete-resources)
        - [Task 2: Delete Azure AD Tenant](#task-2-delete-azure-ad-tenant)

<!-- /TOC -->

# Azure Blockchain hands-on lab unguided

## Abstract and learning objectives

In this lab, you will learn how to build and configure an Internet of Things (IoT) Audit Solution using Azure Blockchain. You will do this using Ethereum Blockchain with the use of Smart Contracts to collect device telemetry information in addition to enforce contract specifics related to conditions during transport of goods. Specifically, the IoT devices will report temperature and humidity data that will be validated through the Smart Contracts against agreed upon acceptable ranges.

At the end of this hands-on lab, you will be better able to build a solution to deploy and configure Azure Blockchain Workbench, write and deploy Ethereum Smart Contracts with Solidity, and integrate both IoT and Blockchain together into a single solution.

## Overview

In this lab, students will deploy a Blockchain solution using the Azure Blockchain Workbench. They will then configure authentication and authorization of multiple users using Azure AD. Then a Smart Contract to track and enforce compliance of a package in the Supply Chain will be implemented within the Blockchain written in Solidity. Finally, the student will create an instance of the Smart Contract on the Blockchain, go through the business workflow defined in the Smart Contract. The student will also feed IoT device sensor telemetry into the Blockchain Smart Contract to validate compliance of the contract using a simulated device account.

## Solution architecture

![](images/lab-guide/image2.png)

## Requirements

1. An Azure Subscription

## Exercise 1: Setup Azure Active Directory Tenant

Duration: 15 minutes

In this exercise, the student will configure a new Azure AD Tenant that the Azure Blockchain Workbench will use to authenticate users.

The authentication and authorization of users in the Blockchain App Builder is performed using an Azure Active Directory (AAD) Tenant. To reduce the potential for conflict, a new AAD Tenant will be created for use with this lab.

### Help references

| Title                                                     | Link
| --------------------------------------------------------- | ------------------------------------------------------------------------------------------------------
| What is Azure Active Directory?                           | <https://docs.microsoft.com/en-us/azure/active-directory/active-directory-whatis>
| Get started with Azure AD                                 | <https://docs.microsoft.com/en-us/azure/active-directory/get-started-azure-ad>
| Create a group and add members in Azure Active Directory  | <https://docs.microsoft.com/en-us/azure/active-directory/active-directory-groups-create-azure-portal>

### Task 1: Create Azure AD Tenant

#### Tasks to complete

1. Create a new Azure AD Tenant to use throughout with the Blockchain solution

#### Exit criteria

- A new Azure AD Tenant was created for use with the Blockchain
    solution

### Task 2: Create App Registrations

#### Tasks to complete

1. Create 2 App Registrations within Azure AD to be used by the 2 Web Apps deployed by Azure Blockchain Workbench

#### Exit criteria

- 2 App Registrations have been created with the following names:

    - Blockchain Client App

    - Blockchain Key Vault App

### Task 3: Create Azure AD Administrator Group

#### Tasks to complete

1. Create a new "Administrator" Group within Azure AD

#### Exit criteria

- An Azure AD Group named "Administrator" was created

### Task 4: Add Administrator User

#### Tasks to complete

1. Add the Admin user for the Azure Subscription to the "Administrator" group in Azure AD

#### Exit criteria

- The Microsoft Account you used to create the Azure AD Tenant has been added to the "Administrator" group that was created previously

## Exercise 2: Deploy Azure Blockchain Workbench

Duration: 60 - 90 minutes

In this exercise, the student will deploy and setup Azure Blockchain App Builder.

#### Help references

  |Title | Link|
  | -- | -- |
  |How to Use SSH keys with Windows on Azure   | <https://docs.microsoft.com/en-us/azure/virtual-machines/linux/ssh-from-windows>
  |Using PuTTY gen, the PuTTY key generator    | <https://the.earth.li/~sgtatham/putty/0.70/htmldoc/Chapter8.html#pubkey-puttygen>

### Task 1: Generate SSH Public / Private Key

#### Tasks to complete

1. Generate a new SSH Public / Private key pair

#### Exit criteria

- An SSH Public / Private key pair has been generated and saved to a local folder for future reference

### Task 2: Deploy Azure Blockchain Workbench

#### Tasks to complete

1. Provision and deploy a new instance of the Azure Blockchain App Builder from the Azure Marketplace

#### Exit criteria

- An instance of the Azure Blockchain Workbench has been provisioned

    > NOTE: Provisioning the Azure Blockchain Workbench will take approximately 60 minutes to complete

### Task 3: Get Azure Blockchain Workbench Web CLient URL

#### Tasks to complete

1. Locate and copy the URL for the Azure Blockchain Workbench Web App for later use/reference throughout the lab

#### Exit criteria

- The URL for the Azure Web App that hosts the Azure Blockchain App Builder Web App has been copied

### Task 4: Configure the Reply URL

#### Tasks to complete

1. Modify the **Blockchain Client App** registration in Azure AD to be configured with the Azure Blockchain Workbench Web App URL

2. Update the **Blockchain Client App** registration configuration so the "**groupMembershipClaims**" is set to "**SecurityGroup**"

#### Exit criteria

- The app registration within Azure AD has been configured with the correct URL and configuration so Azure AD can be used to authenticate user access to the Azure Blockchain Workbench Web App

## Exercise 3: Check Blockchain Workbench Web Client Deployment

Duration: 15 minutes

In this exercise, the student will access the Azure Blockchain App
Builder Web App to make sure the deployment is working as expected. The
student will also check the Ethereum network status.

### Task 1: Open Blockchain Workbench Web Client

#### Tasks to complete

1. Navigate to and log into the Azure Blockchain Workbench Web Client

#### Exit criteria

- The Administrator user can access and login to the Azure Blockchain Workbench Web App

## Exercise 4: Create Smart Contract

Duration: 30 minutes

In this exercise, you will create a new Smart Contract that targets the
Ethereum blockchain that is written in the Solidity programming
language.

#### Help references


|    |            |
|----------|:-------------:|
| **Description** | **Links** |
| Solidity Documentation  | <https://solidity.readthedocs.io/en/develop/index.html>  |
| Remix -- Solidity IDE  |  <http://remix.ethereum.org> |
| A Simple Smart Contract  | <https://solidity.readthedocs.io/en/develop/introduction-to-smart-contracts.html#a-simple-smart-contract>  |

### Task 1: Code TelemetryCompliance Smart Contract

#### Tasks to complete

1. Write the Solidity code for a new Smart Contract named
    TelemetryComplaince

#### Exit criteria

- The new Smart Contract written is programmed to handle the necessary flow for managing the Supply Chain of shipping packages

- The Smart Contract is also written to verify the Compliance of Temperature and Humidity sensor readings from IoT devices embedded within the package during shipping

### Task 2: Create the Configuration Files

#### Tasks to complete

1. Write the TelemetryCompliance.config.json configuration file for the Smart Contract that was written

#### Exit criteria

- The JSON configuration file for the TelemetryCompliance Smart Contract was written and can later be uploaded to the Azure Blockchain Workbench Web App

### Task 3: Deploy the Smart Contract

#### Tasks to complete

1. Upload and deploy the TelemetryCompliance Smart Contract to the Azure Blockchain Workbench Web App

#### Exit criteria

- The TelemetryCompliance Smart Contract was uploaded and deployed to the Azure Blockchain Workbench Web App so it can later be used within the Blockchain network

## Exercise 5: Assign Users to Contract Personas

Duration: 15 minutes

In this exercise, the student will create some additional Users within Azure AD that correspond to the different user roles within the Blockchain solution. These Users will also be assigned to the different personas within the Azure Blockchain Workbench their roles within the workflow coincide with.

#### Help references

  | Title | Link |
  | -- | -- |
  | Quickstart: Add new users to Azure Active Directory  |                     <https://docs.microsoft.com/en-us/azure/active-directory/add-users-azure-active-directory> |
  |Manage group membership for users in your Azure Active Directory tenant |   <https://docs.microsoft.com/en-us/azure/active-directory/active-directory-groups-members-azure-portal> |

### Task 1: Create Users in Azure AD

#### Tasks to complete

1. Create new Users within Azure AD for the following users:

    a. Woodgrove Distribution

    b. Contoso Shipping

    c. Blockchain Shipping

    d. Simulated Device

    e. Northwind Traders Supplychain

    f. Government Regulator

2. Login as each of the newly created Azure AD Users into the Azure Blockchain Workbench Web App so their user accounts are created within Workbench

#### Exit criteria

- The 6 users for the different parties involved in the Supply Chain workflow for the lab have been created in Azure AD and setup within the Azure Blockchain Workbench Web App

### Task 2: Create User Assignments

#### Tasks to complete

1. Login to the Azure Blockchain Workbench Web App as the Administrator user, then create **User Assignments** for each of the newly created Azure AD Users

#### Exit criteria

- The Azure AD Users have been mapped within the Azure Blockchain App Builder Web App to the following Roles defined on the TelemetryComplaince Smart Contract:

    | Member User Name               | Role |
    | ----------------               | ---- |
    | Woodgrove Distribution         | User |
    | Contoso Shipping               | User |
    | Blockchain Shipping            | User |
    | Simulated Device               | User |
    | Northwind Traders Supplychain  | User |
    | Government Regulator           | Auditor |

## Exercise 6: Create and Process an Instance of the Smart Contract

Duration: 45 minutes

In this exercise, the student will create a new instance of the
TelemetryCompliance Smart Contract, and work through the workflow of the
Supply Chain as programmed in the code of the Smart Contract. The
student will also test the Compliance piece by simulating IoT Device
Telemetry by logging in as the "Simulated Device" user.

#### Help references

  | Title | Link |
  | -- | -- |
  | Epoch Unix Time Stamp Converter |  <https://www.unixtimestamp.com/>|

### Task 1: Create Contract Instance

#### Tasks to complete

1. Login to the Azure Blockchain Workbench Web App as the "Woodgrove Distribution" user

2. Create a new instance of the TelemetryCompliance Smart Contract

#### Exit criteria

- A new instance of the TelemetryCompliance Smart Contract has been created within the Blockchain network using the following configuration settings:

    - Device: **Simulated Device**

    - supplyChainOwner: **Northwind Traders Supplychain**

    - supplyChainObserver: **Government Regulator**

    - minHumidity: **80**

    - maxHumidity: **90**

    - minTemperature: **40**

- The TelemetryComplaince Smart Contract is in the **Created** state

### Task 2: Transfer Responsibility to Contoso Shipping

#### Tasks to complete

1. Login to the Azure Blockchain Workbench Web App as the "Contoso
    Shipping" user

2. Accept responsibility for the Smart Contract

3. Request a transfer of responsibility assigning the new Counterparty to be the "Blockchain Shipping" user

#### Exit criteria

- The "Contoso Shipping" user has accepted responsibility for the Smart Contract instance

- The transfer of responsibility for the Smart Contract has been initiated to go to the "Blockchain Shipping" user

### Task 3: Ingest Simulated Device Telemetry

#### Tasks to complete

1. Login to the Azure Blockchain Workbench Web App as the "Simulated Device" user

2. Use the **Ingest Telemetry** function to send the following simulated device telemetry to the Smart Contract for compliance validation:

    a. Humidity: **85**

    b. Temperature: **48**

#### Exit criteria

- Simulated device telemetry has been ingested into the Smart Contract for Compliance verification

### Task 4: Accept Responsibility to Blockchain Shipping

#### Tasks to complete

1. Login to the Azure Blockchain Workbench Web App as the "Blockchain Shipping" user

2. Accept responsibility for the Smart Contract

3. Request a transfer of responsibility assigning the new Counterparty to be the "Northwind Traders Supplychain" user

#### Exit criteria

- The "Blockchain Shipping" user has accepted responsibility for the Smart Contract instance

- The transfer of responsibility for the Smart Contract has been initiated to go to the "Northwind Traders Supplychain" user

### Task 5: Final Delivery to Northwind Traders

#### Tasks to complete

1. Login to the Azure Blockchain Workbench Web App as the "Northwind Traders Supplychain" user

2. Accept responsibility for the Smart Contract

3. Initiate the **TakeFinalDelivery** action on the Smart Contract

#### Exit criteria

- The Smart Contract is in the responsibility of the "Northwind Traders Supplychain" user, and Final Delivery has been completed

### Task 6: Audit Smart Contract for Compliance

#### Tasks to complete

1. Login to the Azure Blockchain Workbench Web App as the "Government Regulator" user

2. View the TelemetryCompliance Smart Contract state and verify it's in Compliance and audit the full history of the Smart Contract

#### Exit criteria

- The "Government Regulator" user is able to audit the state of the TelemetryCompliance Smart Contract

After the hands-on lab 
-----------------------

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

12. Click the **delete** button, and click **Yes** to confirm deleting the app registration

    ![](images/lab-guide/image176.png)

13. On the **Azure Active Directory** blade, click **Delete directory** button, and click the **Delete** button on the **Delete directory 'Northwind Traders'?** confirmation pane

    ![](images/lab-guide/image178.png)

You should follow all steps provided *after* attending the hands-on lab.
