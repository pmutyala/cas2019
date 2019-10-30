# IBM CASCON 2019
## Workshop Title: Running Mission Critical Applications With IBM Db2® on Cloud.

### Prerequisites
* Required: [Install Docker](https://docs.docker.com/v17.09/engine/installation)
* Optional: [IBM Cloud SignUp](https://cloud.ibm.com/registration)


### User Management and Database access using IBM Db2® on Cloud APIs
* User management via API and accessing database.
* IBMID Federated User support. IBM Db2® on Cloud allows IBMID authentication against database by using an API key or token gernated. [IBM Cloud API Keys](https://cloud.ibm.com/iam/apikeys)


### Move, Load and Go using IBM Db2® on Cloud APIs
* Create Tables via RunSQL API  
* Load data via Load API
* Select Data via RunSQL API

### IBM Db2® on Cloud High Availability and Disaster Recovery Features
* [IBM Db2 on Cloud HADR Architecture](https://github.com/pmutyala/cas2019/blob/master/CASCON_2019_submission_260.pdf).


- Running Sample Application
  * docker pull pmutyala/db2oc_cas2019:db2onc_cas2019; docker images
  * docker run -it <image id> /bin/bash
  * For HA: cd /cas2019/acrtest; java -cp ../dsdriver/java/db2jcc4.jar:. JDBCSample fqdn user password
  * For DR: cd /cas2019/acrtest; java -cp ../dsdriver/java/db2jcc4.jar:. JDBCSample primary_fqdn user password dr_fqdn
  
### IBM Db2® on Cloud Recovery options
* Introduction to Self Serve Restore to Point In Time support
* Introduction to IBM Db2 on Cloud COPY service.
  



