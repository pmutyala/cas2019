# IBM CASCON Workshop 2019

## Title: Running Mission Critical Applications With IBM Db2® on Cloud.

### Prerequisites
* Required: [Install Docker](https://docs.docker.com/v17.09/engine/installation)
* Optional: [IBM Cloud SignUp](https://cloud.ibm.com/registration)

### Introduction
IBM Db2® on Cloud is a fully managed enterpise grade transactional database service offered on IBM® Cloud. IBM Db2® on Cloud has rich feature support for running enterprise mission critical applications. The service offers highavailablity, and disaster recovery options for databases that require minimal downtime. The service also offers support to restore data incase of user error to revert to a consistent point in time and has ability to copy a source database to a remote target when its required to duplicate data for testing or developement purposes. Db2® on Cloud also offers ability to scale resources for compute and storage independently as workload demands. With fully managed databases, users can focus on application managment while leaving the database management to IBM. IBM is responsible for infrastucture, availability, maintenance and operations of the database while user focuses on the application management. 


### Topics to be covered. 

#### Secure from Groud up

* Encrypted database 
  - Complete encryption for data at rest and data in motion
```txt
Encryption Info:
   Object Name:               XXXXX   
   Object Type:               DATABASE
   Encyrption Key Info:       
          Encryption Algorithm: AES
     Encryption Algorithm Mode: CBC
         Encryption Key Length: 256
              Master Key Label: DB2_SYSGEN_db2inst1_BLUDB_2019-10-08-11.48.07_DEBCBFDB
 Master Key Rotation Timestamp: 2019-11-01-19.15.40.000000
   Master Key Rotation Appl ID: DB2 HADR STANDBY KEY ROTATION ID
   Master Key Rotation Auth ID: DB2 HADR PRIMARY DRIVEN KEY ROTATION
     Previous Master Key Label: DB2_SYSGEN_db2inst1_BLUDB_2019-11-01-17.59.29_3C5B794E
   KeyStore Info:             
                 KeyStore Type: PKCS12
             KeyStore Location: /mnt/blumeta0/db2/keystore/keystore.p12
            KeyStore Host Name: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
           KeyStore IP Address: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
      KeyStore IP Address Type: IPV4
```


* IBMID Federated User support. 
  - IBM Db2® on Cloud allows IBMID authentication against database by using an API key or token gernated. [IBM Cloud API Keys](https://cloud.ibm.com/iam/apikeys)

- Authenticating Via IBMID 
```java
java -cp /Applications/dsdriver/java/db2jcc4.jar com.ibm.db2.jcc.DB2Jcc -url "jdbc:db2://$host:$port/BLUDB:apiKey=$key;securityMechanism=15;sslConnection=true;"
```

#### Move, Load, and Go

- User Management and Database access
* User management via API and accessing database.

```shell
# Generating a token
curl -H "Content-Type: application/json" \
    -d "{\"userid\":\"$user\",\"password\":\"$pw\"}" \
    -X POST https://\"$host\"/dbapi/v3/auth/tokens

# Create an user
curl -H "Authorization: Bearer \"$token\"" \
    -H "Content-Type: application/json" \
    -d "{\"name\": \"$name\", \"role\":\"$role\", \"email\":\"$email\", \"id\":\"$id\", \"password\":\"$pw\"}" \
    -X POST "https://\"$host\"/dbapi/v3/users"
```

* Create Tables via RunSQL API  
* Load data via Load API
* Select Data via RunSQL API

- Running Admin tasks via Db2 on cloud APIs
```shell
# Generating a token
curl -H "Content-Type: application/json" \
    -d "{\"userid\":\"$user\",\"password\":\"$pw\"}" \
    -X POST https://\"$host\"/dbapi/v3/auth/tokens

# Run a SQLJOB to create a table

curl -H "Authorization: Bearer \"$token\"" \
    -H "Content-Type: application/json" \
    -d "{\"commands\":\"create table t1(x int, y char(20))\", \"limit\":\"10\", \"seperator\":\";\", \"stop_on_error\":\"yes\"}" \
    -X POST "https://\"$token\"/dbapi/v3/sql_jobs"

# Run a SQLJOB to Insert into a table
curl -H "Authorization: Bearer \"$token\"" \
    -H "Content-Type: application/json" \
    -d "{\"commands\":\"insert into t1 values(1,'pandu')\", \"limit\":\"10\", \"separator\":\";\", \"stop_on_error\":\"yes\"}" \
    -X POST "https://\"$host\"/dbapi/v3/sql_jobs"

# Upload table data
curl -H "Authorization: Bearer \"$token\"" \
    -H "Content-Type: multipart/form-data" \
    -F "data=@sample.csv" \
    -X POST "https://\"$host\"/dbapi/v3/home_content/"

# Load table data
curl -H "Authorization: Bearer \"$token\"" \
    -H "content-type: application/json" \
    -d "{\"load_source\":\"SERVER\",\"schema\":\"$user\",\"table\":\"t1\",\"file_options\":{\"has_header_row\":\"no\"},\"auto_create_table\":{\"execute\",\"yes\"},\"server_source\":{\"file_path\":\"\/mnt\/blumeta0\/home\/bluadmin\/sample.csv\"}}" \
    -X POST "https://\"$host\"/dbapi/v3/load_jobs"
```

#### Start small and grow as it demands
* Scale compute and Storage as required. Allows to grow compute and storage in increments and fully online when using highavailable option.

#### IBM Db2® on Cloud High Availability and Disaster Recovery Features
* [IBM Db2 on Cloud HADR Architecture](https://github.com/pmutyala/cas2019/blob/master/CASCON_2019_submission_260.pdf).

- Running Sample Application
  * docker pull pmutyala/db2oc_cas2019:db2onc_cas2019; docker images
  * docker run -it imageid /bin/bash
  * For HA: cd /cas2019/acrtest; java -cp ../dsdriver/java/db2jcc4.jar:. JDBCSample fqdn user password
  * For DR: cd /cas2019/acrtest; java -cp ../dsdriver/java/db2jcc4.jar:. JDBCSample primary_fqdn user password dr_fqdn
  
#### IBM Db2® on Cloud Data Restore options
* Introduction to Self Serve Restore to Point In Time support
* Introduction to IBM Db2 on Cloud COPY service.
  



