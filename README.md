# IBM CASCON 2019
## Workshop Title: Running Mission Critical Applications With IBM Db2® on Cloud.
### Prerequisites
* Required: [Install Docker](https://docs.docker.com/v17.09/engine/installation)
* Optional: [IBM Cloud SignUp](https://cloud.ibm.com/registration)


### Running Sample Application
* docker pull pmutyala/db2oc_cas2019:db2onc_cas2019; docker images
* docker run -it <image id> /bin/bash
* For HA: cd /cas2019/acrtest; java -cp ../dsdriver/java/db2jcc4.jar:. JDBCSample <fqdn> <user> <password>
* For DR: cd /cas2019/acrtest; java -cp ../dsdriver/java/db2jcc4.jar:. JDBCSample <primary fqdn> <user> <password <drhostname>
