# CryptoTrooper

CryptoTrooper is the world's first Linux white-box ransomware for learning purpose

It requires :
* **Debian-based 64-bit OS with root** - mostly used nowadays
* **Apache/Nginx** - for Web service encryption and for changing the main page
* **MySQL/PostgreSQL** - for database encryption
* **/root and /home** - for personal data encryption

How it works :
* **Infection** - the victim's server is exploited and infected somehow, gaining root privileges
* **Encryption** - the ransomware generates a unique symmetric encryption key and encrypts the data
* **White-box** - the white-box cipher uses the one-way white-boxed key and encrypts the key used for data encryption
* **Decryption** - the victim sends to the attacker the white-box encrypted key and its initialization vector (IV), this key is decrypted by the attacker with its IV and the master key used to generate the white-box key, the true key is sent to the victim

Pros :
* NO INTERNET CONNECTION IS REQUIRED AFTER INFECTION (since it doesn't uses public-key cryptography at all or any C&C)
* Key-extraction protection
* AES only
* Anti-forensic
* Random key generation
* Radom IV

Cons :
* [Chowns white-box construction](https://github.com/OpenWhiteBox/AES) is broken (not the implementation, but the algorithm itself), thus the ransomware presents ABSOLUTELY NO THREAT AND NO INTEREST FOR MALICIOUS PURPOSE
* CBC mode isn't the best-one for random data and not the fastest
* 128-bit key-length should be longer
* The same key is used for every file
* The same hardcoded white-box key is used for every execution
* No code obfuscation (except white-box)

Purposes : 
* Learn ransomware's implementations and concepts, in order to defeat it
* Practice reverse engineering
* Be prepared for new and advanced threats
* Demonstrate the ransomware's power and potential

##How to

*Prepare environment*
```bash
apt-get install apache2 nginx-common mysql-server postgresql
```

*Prepare ransomware*
```bash
cd /
mv $CRYPTOTROOPER_SOURCE_DIRECTORY/* .


*Encrypt*
```bash
/cipher.sh &
```
It will encrypt the data with AES-128-CBC with a randomly generated key and a random IV for each file

Than it will use white-box to one-way encrypt this key and will generate key.enc and key.iv

The victim now has to send both files to the attacker

If you visit the local Website, you will notice the message
```bash
firefox localhost &
```

*After payment*
```bash
mv key.enc key.iv $YOUR_DIRECTORY
./whiteDecipher.sh
```
It will decrypt the victim's key that you may send to it


*Decrypt*
```bash
mv key /
/decipher.sh
```
Everything should get back to as it was

###Notes

Encryption isn't just encoding, but mathematical encoding

White-box encryption isn't just obfuscation, but mathematical obfuscation

The only way to defeat evil is to become its master

> "Research is to see what everybody else has seen, and to think what nobody else has thought."

Albert Szent-Gyorgyi


