username=$(python -c "import json; print(json.load(open(\"services.json\", \"r+\"))['username'])")
password=$(python -c "import json; print(json.load(open(\"services.json\", \"r+\"))['password'])")
hostname=$(python -c "import json; print(json.load(open(\"services.json\", \"r+\"))['hostname'])")
drhost=$(python -c "import json; print(json.load(open(\"services.json\", \"r+\"))['hostname_DR'])")
echo $hostname
if [[ $1 == "user" ]]; then
# Generating a token for db user

token=$(curl -H "Content-Type: application/json" \
    -d "{\"userid\":\"${username}\",\"password\":\"${password}\"}" \
    -X POST "https://${hostname}/dbapi/v3/auth/tokens")
echo $token > token.json
token=$(python -c "import json; print(json.load(open(\"token.json\", \"r+\"))['token'])")
echo $token
# Create an user using admin user token
name="cascon2019user"
id="demouser1"
role="bluuser"
email="cascon@ca.ibm.com"
pw="REDACTED"
curl -H "Authorization: Bearer $token" \
    -H "Content-Type: application/json" \
    -d "{\"name\": \"$name\", \"role\":\"$role\", \"email\":\"$email\", \"id\":\"$id\", \"password\":\"$pw\"}" \
    -X POST "https://$hostname/dbapi/v3/users"
fi
