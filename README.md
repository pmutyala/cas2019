# IBM CASCON Workshop 2019

## Title: Running Mission Critical Applications With IBM Db2® on Cloud.

### Prerequisites
* Required: [Install Docker](https://docs.docker.com/v17.09/engine/installation)
* Optional: [IBM Cloud SignUp](https://cloud.ibm.com/registration)

### Introduction
IBM Db2® on Cloud is a fully managed enterpise grade transactional database service offered on IBM® Cloud. IBM Db2® on Cloud has rich feature support for running enterprise mission applications. The service offers highavailablity, and disaster recovery options for databases that require minimal downtime. The service also offers support to restore data incase of user error to revert to a consistent point in time and has ability to copy a source database to a remote target when its required to duplicate data for testing or developement purposes. Db2® on Cloud also offers ability to scale resources for compute and storage independently as workload demands.

With fully managed databases, users can focus on application managment while leaving the database 


### Topics to be covered. 

#### User Management and Database access
* User management via API and accessing database.
* IBMID Federated User support. IBM Db2® on Cloud allows IBMID authentication against database by using an API key or token gernated. [IBM Cloud API Keys](https://cloud.ibm.com/iam/apikeys)

#### Move, Load, and Go
* Create Tables via RunSQL API  
* Load data via Load API
* Select Data via RunSQL API

#### Start small and grow as it demands
* Scale compute and Storage as required

#### IBM Db2® on Cloud High Availability and Disaster Recovery Features
* [IBM Db2 on Cloud HADR Architecture](https://github.com/pmutyala/cas2019/blob/master/CASCON_2019_submission_260.pdf).

- Running Sample Application
  * docker pull pmutyala/db2oc_cas2019:db2onc_cas2019; docker images
  * docker run -it <image id> /bin/bash
  * For HA: cd /cas2019/acrtest; java -cp ../dsdriver/java/db2jcc4.jar:. JDBCSample fqdn user password
  * For DR: cd /cas2019/acrtest; java -cp ../dsdriver/java/db2jcc4.jar:. JDBCSample primary_fqdn user password dr_fqdn
  
#### IBM Db2® on Cloud Data Restore options
* Introduction to Self Serve Restore to Point In Time support
* Introduction to IBM Db2 on Cloud COPY service.
  



