
email: mymonkeysuncle@outlook.com
password: 3F4tb4n4n4$
birthdate: 04/01/1976
name: Blue Dragon
phone: 4157914706
state: alaska

creditcard: Capital One Mastercard
security SMS: 1-415-791-4706

site: https://azure.microsoft.com/en-us/get-started/welcome-to-azure?src=acom_free&subscriptionId=143c0af4-cd7d-4f86-9e47-9b006cf4e88e

MFA required
tutorial: https://learn.microsoft.com/en-us/entra/identity/authentication/tutorial-enable-azure-mfa

CLI
brew update && brew install azure-cli
tim@Tims-MacBook-Pro ~ % az --version
azure-cli                         2.65.0

core                              2.65.0
telemetry                          1.1.0

Dependencies:
msal                              1.31.0
azure-mgmt-resource               23.1.1

Python location '/usr/local/Cellar/azure-cli/2.65.0_2/libexec/bin/python'
Extensions directory '/Users/tim/.azure/cliextensions'

Python (Darwin) 3.11.10 (main, Sep  7 2024, 01:03:31) [Clang 15.0.0 (clang-1500.1.0.2.5)]

Legal docs and information: aka.ms/AzureCliLegal


Your CLI is up-to-date.

tim@Tims-MacBook-Pro ~ % ls -ld ~/.azure
drwxr-xr-x  12 tim  staff  384 Nov  4 15:43 /Users/tim/.azure
tim@Tims-MacBook-Pro ~ % ls -l ~/.azure
total 64
-rw-r--r--  1 tim  staff     5 Nov  4 15:42 az.json
-rw-r--r--  1 tim  staff     5 Nov  4 15:42 az.sess
-rw-r--r--  1 tim  staff    67 Nov  4 15:42 az_survey.json
-rw-r--r--  1 tim  staff    61 Nov  4 15:42 azureProfile.json
-rw-r--r--  1 tim  staff  5642 Nov  4 15:43 commandIndex.json
drwxr-xr-x  4 tim  staff   128 Nov  4 15:43 commands
-rw-------  1 tim  staff    27 Nov  4 15:42 config
drwxr-xr-x  3 tim  staff    96 Nov  4 15:42 logs
drwxr-xr-x  2 tim  staff    64 Nov  4 15:43 telemetry
-rw-r--r--  1 tim  staff   211 Nov  4 15:42 versionCheck.json


tim@Tims-MacBook-Pro ~ % az login
A web browser has been opened at https://login.microsoftonline.com/organizations/oauth2/v2.0/authorize. Please continue the login in the web browser. If no web browser is available or if the web browser fails to open, use device code flow with `az login --use-device-code`.

Retrieving tenants and subscriptions for the selection...

[Tenant and subscription selection]

No     Subscription name     Subscription ID                       Tenant
-----  --------------------  ------------------------------------  -----------------
[1] *  Azure subscription 1  143c0af4-cd7d-4f86-9e47-9b006cf4e88e  Default Directory

The default is marked with an *; the default tenant is 'Default Directory' and subscription is 'Azure subscription 1' (143c0af4-cd7d-4f86-9e47-9b006cf4e88e).

Select a subscription and tenant (Type a number or Enter for no changes): 1

Tenant: Default Directory
Subscription: Azure subscription 1 (143c0af4-cd7d-4f86-9e47-9b006cf4e88e)

[Announcements]
With the new Azure CLI login experience, you can select the subscription you want to use more easily. Learn more about it and its configuration at https://go.microsoft.com/fwlink/?linkid=2271236

If you encounter any problem, please open an issue at https://aka.ms/azclibug

[Warning] The login output has been updated. Please be aware that it no longer displays the full list of available subscriptions by default.

tim@Tims-MacBook-Pro ~ % 

tim@Tims-MacBook-Pro ~ % az account show   
{
  "environmentName": "AzureCloud",
  "homeTenantId": "85f3c712-de1f-45c9-904b-a9f2cbc8ba2c",
  "id": "143c0af4-cd7d-4f86-9e47-9b006cf4e88e",
  "isDefault": true,
  "managedByTenants": [],
  "name": "Azure subscription 1",
  "state": "Enabled",
  "tenantDefaultDomain": "mymonkeysuncleoutlook.onmicrosoft.com",
  "tenantDisplayName": "Default Directory",
  "tenantId": "85f3c712-de1f-45c9-904b-a9f2cbc8ba2c",
  "user": {
    "name": "mymonkeysuncle@outlook.com",
    "type": "user"
  }
}

tim@Tims-MacBook-Pro ~ % az account set --subscription "Azure subscription 1"

tim@Tims-MacBook-Pro ~ % az account get-access-token
{
  "accessToken": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IjNQYUs0RWZ5Qk5RdTNDdGpZc2EzWW1oUTVFMCIsImtpZCI6IjNQYUs0RWZ5Qk5RdTNDdGpZc2EzWW1oUTVFMCJ9.eyJhdWQiOiJodHRwczovL21hbmFnZW1lbnQuY29yZS53aW5kb3dzLm5ldC8iLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC84NWYzYzcxMi1kZTFmLTQ1YzktOTA0Yi1hOWYyY2JjOGJhMmMvIiwiaWF0IjoxNzMwNzYzNTg2LCJuYmYiOjE3MzA3NjM1ODYsImV4cCI6MTczMDc2ODcwMCwiYWNyIjoiMSIsImFpbyI6IkFZUUFlLzhZQUFBQXRJWVhsUkJLVS9WRklXUEJIeU9PRUg2MVQyYTZIYzhYb0RCcDA2aVNiYU5kTnY5NVZGVmM4YS9pTE5PVXRBeXdXa3BWN1M0SFJqbzJoSWZxOUI0ZTI5ZWFqa1RIcjVjc2pETkFzdkhubU5EOUVRM3RCK3dPZ3FzVTdJR1ZzK1cxbUFnYWRMNUJXVmllLzliREg0UnYyVXY2RnM1eDh0d0V5UFBlbVJ0cFgzWT0iLCJhbHRzZWNpZCI6IjE6bGl2ZS5jb206MDAwMzdGRkY4QTAwNTNEQyIsImFtciI6WyJwd2QiLCJtZmEiXSwiYXBwaWQiOiIwNGIwNzc5NS04ZGRiLTQ2MWEtYmJlZS0wMmY5ZTFiZjdiNDYiLCJhcHBpZGFjciI6IjAiLCJlbWFpbCI6Im15bW9ua2V5c3VuY2xlQG91dGxvb2suY29tIiwiZmFtaWx5X25hbWUiOiJEcmFnb24iLCJnaXZlbl9uYW1lIjoiQmx1ZSIsImdyb3VwcyI6WyI2MzRlMmU0ZS1hNTE3LTRkODgtYmU4Zi02YmMyZTljMTVkNzIiXSwiaWRwIjoibGl2ZS5jb20iLCJpZHR5cCI6InVzZXIiLCJpcGFkZHIiOiIyMy45My4xMTEuNjEiLCJuYW1lIjoiQmx1ZSBEcmFnb24iLCJvaWQiOiJmNzQ4YjY2YS01ZGJjLTRkZjktOGRiYy02YzQxZDRkNTA0NGIiLCJwdWlkIjoiMTAwMzIwMDNGMjI3MjMwOCIsInJoIjoiMS5BWEVCRXNmemhSX2V5VVdRUzZueXk4aTZMRVpJZjNrQXV0ZFB1a1Bhd2ZqMk1CTnhBZmh4QVEuIiwic2NwIjoidXNlcl9pbXBlcnNvbmF0aW9uIiwic3ViIjoiY0l4R2x6NlJaOW1HQkUwRGpvc3hhYlhNc0Nodzc1YUphM3ZYS18xTUE2ayIsInRpZCI6Ijg1ZjNjNzEyLWRlMWYtNDVjOS05MDRiLWE5ZjJjYmM4YmEyYyIsInVuaXF1ZV9uYW1lIjoibGl2ZS5jb20jbXltb25rZXlzdW5jbGVAb3V0bG9vay5jb20iLCJ1dGkiOiJNaUJ5SEZoMmxVaTFzSVVfejNXakFBIiwidmVyIjoiMS4wIiwid2lkcyI6WyI2MmU5MDM5NC02OWY1LTQyMzctOTE5MC0wMTIxNzcxNDVlMTAiLCJiNzlmYmY0ZC0zZWY5LTQ2ODktODE0My03NmIxOTRlODU1MDkiXSwieG1zX2NhZSI6IjEiLCJ4bXNfY2MiOlsiQ1AxIl0sInhtc19lZG92Ijp0cnVlLCJ4bXNfaWRyZWwiOiI2IDEiLCJ4bXNfdGNkdCI6MTczMDc1NzkyN30.PojmTDeTogHF1ZGYoAYEyEsU8U1SvtyyQgJlKAkUYpdPRvgXqcVar-Rt12qHa3pMyd1c3e06Z1Pb84dduSaOk6uscSytZdaip8IzMJYdmZ-h2epac2hAq5oHTE_nYMXeJNalLRCaYti6CXLWFuja8OUTOek2THGkCAZ87RYOVcTsSzCTH-cNTS6neCmdxmmBoRwOmXoVkMue0R6mJNWRY2l_0EgBec2SqrAWMqFwOh1NW0xPEwskW9HYJF6vbSRbbpQHLfRfcEFHAgwwUGublsFa1VHAZTahcErdYf5aBPviFRoltZ8gkdJFwfUhhVWOWADZyZEsLZgVr_MtLEzRLQ",
  "expiresOn": "2024-11-04 17:04:58.000000",
  "expires_on": 1730768698,
  "subscription": "143c0af4-cd7d-4f86-9e47-9b006cf4e88e",
  "tenant": "85f3c712-de1f-45c9-904b-a9f2cbc8ba2c",
  "tokenType": "Bearer"
}

Microsoft Entra Suite Trial 90 day (start 11/04/24)

email: mymonkeysuncle@bluedragon.onmicrosoft.com
password: 3F4tb4n4n4$
email: greendragon@bluedragon.onmicrosoft.com
password: 3F4tb4n4n4$
email: reddragon@bluedragon.onmicrosoft.com
password: 3F4tb4n4n4$
site: https://admin.microsoft.com/AdminPortal/Home#/homepage





