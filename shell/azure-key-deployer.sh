SSH_KEY_PATH="~/.ssh/id_rsa"
AZURE_SSH_KEY_PATH="~/.ssh/azure.pfx"
openssl req -x509 \
  -key ~/.ssh/id_rsa \
  -nodes \
  -days 365 -newkey rsa:2048 \
  -out ~/.ssh/azure.pem \
  -subj '/CN=www.saharacluster.com/O=Saharacluster./C=KE'
openssl x509 \
  -outform der \
  -in ~/.ssh/azure.pem \
  -out ~/.ssh/azure.pfx
fingerprint=$(openssl x509 -fingerprint -inform der -in ~/.ssh/azure.pfx | grep "SHA1 Fingerprint")
fingerprint="${fingerprint#*=}"
fingerprint="${fingerprint//:/}"
echo $fingerprint