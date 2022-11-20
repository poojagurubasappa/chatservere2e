#!/usr/bin/env bash
clear

echo ""
echo " *************************************************************************************"
echo " * Generating Root Certificate                                                       *"
echo " *************************************************************************************"
echo ""

openssl genrsa -out ./ssl/key.pem

# clear
# echo ""
# echo " *************************************************************************************"
# echo " * Generating Server Certificate Key                                                 *"
# echo " *************************************************************************************"
# echo ""

# echo " Please enter the password to this user account to proceed..."

openssl req -new -key ./ssl/key.pem -out ./ssl/csr.pem

# echo ""
# echo " *************************************************************************************"
# echo " * Generating Server Certificate                                                     *"
# echo " *************************************************************************************"
# echo ""

openssl x509 -req -in ./ssl/csr.pem -signkey ./ssl/key.pem  -out ./ssl/cert.pem

# clear
# echo ""
# echo "  ************************************************************************************"
# echo "  * You need your computer to believe that you are a valid certificate authority     *"
# echo "  * To do this follow these steps:                                                   *"
# echo "  * 1. Double click on the 'rootCA.pem' file in finder                               *"
# echo "  * 2. Open Keychain Access and right/ctrl click on the 'lego' certificate and       *"
# echo "  *    choose 'get info'                                                             *"
# echo "  * 3. Open up the 'trust' section                                                   *"
# echo "  * 4. Choose 'Always trust' in the SSL section                                       *"
# echo "  * 5. Close the dialog and enter your password                                      *"
# echo "  * 5. From the root lego-web directory, restart the Lego server ensuring you set it *"
# echo "  *    to the correct port e.g. sudo PORT=443 npm run int-api-test                   *"
# echo "  * 6. Try it in the browser - you should get the green padlock showing it's working *"
# echo "  ************************************************************************************"
# echo ""

# read -n 1 -s -p "Press any key to open finder at the location of your rootCA.pem"

# open ./
