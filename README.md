# Nationwide Azure Landing Zone

## What
This repo comprises of terraform modules to deploy key components of Azure LZ.

## Who
This code is maintained by the Contino landing zone team.

## When
Initial LZ work was completed by 3rd parties working with NBS, but was adopted November 2019 and is currently on-going.

## Where
This code base constitutes a new platform within NBS that has no integrations with existing cloud infrastructure.

## Structure
The structure of this repo is designed to follow the pattern set by the AWS project where possible, although differs in areas where Azure structure is not the same and requires a different approach.

```
o
+---.pipelines
+---config
+---library
|   +---jobs
|   +---stages
|   \---steps
+---terraform
|   \---modules
|       \---sub-modules


```


# Dev environments



## Github

https://github.com/nationwide-ccoe/nbs-azure-lz 

Pipeline service connection "nationwide-ccoe" for Github integration.

This account is also used for AWS repos, so repos should be named in "nbs_azure_xxx" to distinguish them from AWS repos.



## Devops

AzureDevops organisation : https://dev.azure.com/CCOEAzPOC/

Contino devopment project : https://dev.azure.com/CCOEAzPOC/NBSContino

- Pipelines   https://dev.azure.com/CCOEAzPOC/NBSContino/_build
- Boards are mnaged by NBS in Jira

Long term path to production will clone project into NBS Prod : https://dev.azure.com/NBSUKDevOps/



## Azure

Initial work creates resources in "NonProd".  Contino  require a clean environment to target tests against, so will start targeting a Contino account.  Once this is working as expected, pipelines will be updated so changes are sent to NBS (non-prod or prod) Azure environments