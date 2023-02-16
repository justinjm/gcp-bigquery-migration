#!/bin/bash

# install dependencies 
echo "install dependencies  ========================================================="
sudo apt-get update
sudo apt-get install -yq git python3 python3-pip python3-distutils
sudo pip install --upgrade pip virtualenv

# activate venv 
echo "activate venv  ========================================================="
virtualenv -p python3 env
source env/bin/activate

# Install DVT
echo "Install DVT  ========================================================="
pip install google-pso-data-validator 

# Install below  packages required for MSSQL
## install MSSQL ODBC Driver
echo "install MSSQL ODBC Driver ========================================================="
sudo su << EOF 

curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
#Debian 11
curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list

exit 
EOF

echo "install MSODBC driver  ========================================================="

sudo ACCEPT_EULA=Y apt-get install -y msodbcsql17
# optional: for bcp and sqlcmd
sudo ACCEPT_EULA=Y apt-get install -y mssql-tools
deactivate 
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc
source env/bin/activate

 echo "install additional drivers ========================================================="
# optional: for unixODBC development headers
sudo apt-get install -y unixodbc-dev
# optional: kerberos library for debian-slim distributions
sudo apt-get install -y libgssapi-krb5-2

echo "install python ODBC ========================================================="
## install python ODBC driver 
pip install pyodbc