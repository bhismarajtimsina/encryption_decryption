#!/usr/bin/env bash

# HEADING

echo THIS IS A COURSEWORK2 TASK2 OF CYBERSECURITY FOUNDATION
figlet 'ENCRYPTION AND DECRYPTION' -f digital | lolcat 
echo BY BHISMA RAJ TIMSINA
echo ---------------------------------------------------

#FROM HERE SCRIPT CODE BEGIN
echo "  "
echo "Please select What you want to Do"
# submenu
submenu () {
  local PS3='Please enter  option: '
  local options=("newfile" "existfile" "quit")
  local opt
  select opt in "${options[@]}"
  do
      case $opt in
          "newfile")
              echo "You have Selected a Newfile" 
		newfile
		datastore

              ;;
          "existfile")
              echo "You have Selected a Exist File"
		existfile
		datastore
              ;;
          "quit")
              return
              ;;
          *) echo "invalid option $REPLY";;
      esac
  done
}


again () {
	echo "Do you want to Do Encryption or Decryption Again"
  local PS3="Plese choose a Option:"
  local options=("YES" "NO" )
  local opt
  select opt in "${options[@]}"
  do
      case $opt in
          "YES")
              echo "You have Selected Yes" 
                menu

              ;;
          "NO")
              echo "You have Selected No"
                exit
              ;;
          *) echo "invalid option $REPLY";;
      esac
  done
}

# main menu
menu (){
echo "Please select one option" | lolcat
PS3='Please enter option: '
options=("Encryption" "Decryption" "exit")
select opt in "${options[@]}"
do
    case $opt in
        "Encryption")
            echo "You Choose Encryption"
	    echo  "In Which File Doyou want To Do Encryption"

	    submenu
            ;;
        "Decryption")
            echo "You Choose Decryption"
		echo " Choose a location and File of Encrypted file you want to decrypt"
		existfile
		decstore
		dec_method
            ;;
        "exit")
            exit
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
}

newfile (){
 echo "Enter a  Word to insert in file"
                read -p "Enter a word that you want to type in file:" file
                echo "Enter the full location to save file"
                read -e -p "Enter a location:" location
                read -p "Enter a Filename:" filename
                echo $file > $location$filename

}
existfile (){
echo "Enter the Full location of the file"
read -e -p "Enter a Location:" location
cd $location
ls
echo "Which file do you want to select:"
read -e -p "Enter a filename:" filename
cat $location$filename
}

datastore (){
echo " "
echo " Enter the Filename and location in which data is to be encrypted"
read -e -p "Enter a Full location where data is to be saved:" datasb
read  -e -p "Enter a file name:" datas
touch $datasb$datas
method
}
# submenu
method () {
  local PS3='Please enter  option: '
  local options=("asymmetrickey encryption" "symmetric key encryption" "quit")
  local opt
  select opt in "${options[@]}"
  do
      case $opt in
          "asymmetrickey encryption")
              echo "You have selected asymmetrickey encrytion "
		asy

              ;;
          "symmetric key encryption")
              echo "You have Selected a symmetric key encryption"
		popular
              ;;
          "quit")
              return
              ;;
          *) echo "invalid option please enter a correct encryption method $REPLY";;
      esac
  done
}
asy (){
cd /home/$USER
echo "Generating Private Key"
openssl genrsa -out private.pem 1024
echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'
echo "Private key generated"
echo "Generating Public key"
openssl rsa -in private.pem -pubout -out public.pem
echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'
echo "Public key Generated"
openssl pkeyutl -encrypt -in $location$filename -out $datasb$datas -inkey public.pem -pubin
echo "Encryption in process"
echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'
echo "Sucessfully Encrypted"
echo "your Encrypted File"

gh
echo " "
menu
}

popular (){
echo "Here is a list of some Popular Encryption"
 local PS3='Enter a Option: '
  local options=("aes-128-cbc" "aes-256-cbc" "aes-128-ecb" "aes-256-ecb" "manualinput" "quit")
  local opt
  select opt in "${options[@]}"
  do

      case $opt in
          "aes-128-cbc")
              echo "You have Selected aes-128-cbc"
		rty
		openssl enc -aes-128-cbc -in $location$filename -out $datasb$datas -k $password -pbkdf2
		loading
		menu
              ;;
          "aes-256-cbc")
              echo "You have Selected a aes-256-cbc"
		 rty
                openssl enc -aes-256-cbc -in $location$filename -out $datasb$datas -k $password -pbkdf2
		loading
		menu
              ;;


	"aes-128-ecb")
		echo "You have Selected a aes-156-ecb"
		 rty
                openssl enc -aes-128-ecb -in $location$filename -out $datasb$datas -k $password -pbkdf2
		loading
		menu
		;;
	 "aes-256-ecb")
                echo "You have Selected a aes-256-ecb"
		 rty
                openssl enc -aes-256-ecb -in $location$filename -out $datasb$datas -k $password -pbkdf2
		loading
		menu
                ;;
	 "manualinput")
                echo "You have selected a manual method to select encryption type"

		echo "HERE IS A LIST OF ENCRYPTION TYPE"

		echo "aes-128-cbc       aes-128-ecb       aes-192-cbc       aes-192-ecb       
aes-256-cbc       aes-256-ecb       aria-128-cbc      aria-128-cfb      
aria-128-cfb1     aria-128-cfb8     aria-128-ctr      aria-128-ecb      
aria-128-ofb      aria-192-cbc      aria-192-cfb      aria-192-cfb1     
aria-192-cfb8     aria-192-ctr      aria-192-ecb      aria-192-ofb      
aria-256-cbc      aria-256-cfb      aria-256-cfb1     aria-256-cfb8     
aria-256-ctr      aria-256-ecb      aria-256-ofb      base64            
bf                bf-cbc            bf-cfb            bf-ecb            
bf-ofb            camellia-128-cbc  camellia-128-ecb  camellia-192-cbc  
camellia-192-ecb  camellia-256-cbc  camellia-256-ecb  cast              
cast-cbc          cast5-cbc         cast5-cfb         cast5-ecb         
cast5-ofb         des               des-cbc           des-cfb           
des-ecb           des-ede           des-ede-cbc       des-ede-cfb       
des-ede-ofb       des-ede3          des-ede3-cbc      des-ede3-cfb      
des-ede3-ofb      des-ofb           des3              desx              
rc2               rc2-40-cbc        rc2-64-cbc        rc2-cbc           
rc2-cfb           rc2-ecb           rc2-ofb           rc4               
rc4-40            seed              seed-cbc          seed-cfb          
seed-ecb          seed-ofb          sm4-cbc           sm4-cfb           
sm4-ctr           sm4-ecb           sm4-ofb           
"

		read -e -p "Enter a encryption:" encc
 		rty
                openssl enc -$encc -in $location$filename -out $datasb$datas -k $password -pbkdf2
		loading
		menu
                ;;

          "quit")
              return
              ;;
          *) echo "invalid option please enter a correct encryption method $REPLY";
  esac
done
}

rty (){
read  -e -p  "Enter a password for encryption:" password
}

pty (){
read -e -p "Enter a password for Decryption:" pdf
}
loading (){
echo "Encryption in process"
echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'
echo "Sucessfully Encrypted"
echo "Your Encrypted File"
gh
echo "  "
}
loadingdec (){
echo "Decryption in process"
echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'
echo "Sucessfully Decrypted"
echo "Your Decrypted File"
gh
echo " "
}


asy_dec (){
cd /home/$USER
openssl pkeyutl -decrypt -in $location$filename -out $datasb$datas -inkey private.pem 
loadingdec
again
}



dec_method () {
  local PS3='Please enter  option: '
  local options=("asymmetrickey decryption" "symmetric key decryption" "quit")
  local opt 
  select opt in "${options[@]}"
  do
      case $opt in
          "asymmetrickey decryption")
              echo "You have selected asymmetrickey decryption "
		asy_dec

              ;;
          "symmetric key decryption")
              echo "You have Selected a symmetric key decryption"
		popular_dec
              ;;
          "quit")
              return
              ;;
          *) echo "invalid option please enter a correct encryption method $REPLY";;
      esac
  done
}


decstore (){
echo " "
 echo -e " Enter the Filename and location in which data is to be decrypted"
read -e -p "Enter a Full location where decrypted is to be saved:" datasb
read  -e -p "Enter a file name:" datas
touch $datasb$datas
dec_method
}
popular_dec (){
echo "Here is a list of some Popular Decryption"
 local PS3='Enter a Option: '
  local options=("aes-128-cbc" "aes-256-cbc" "aes-128-ecb" "aes-256-ecb" "manualinput" "quit")
  local opt
  select opt in "${options[@]}"
  do

      case $opt in
          "aes-128-cbc")
              echo "You have Selected aes-128-cbc"
                pty
		openssl enc -aes-128-cbc -in $location$filename  -out $datasb$datas -k $pdf -pbkdf2 -d
		
                loadingdec
                again
              ;;
          "aes-256-cbc")
              echo "You have Selected a aes-256-cbc"
                 pty
                openssl enc  -aes-256-cbc -in $location$filename -out $datasb$datas -k $pdf -pbkdf2 -d
                loadingdec
                again
              ;;


        "aes-128-ecb")
                echo "You have Selected a aes-156-ecb"
                 pty
                openssl enc -aes-128-ecb -in $location$filename -out $datasb$datas -k $pdf -pbkdf2 -d
                loadingdec
                again
                ;;
         "aes-256-ecb")
                echo "You have Selected a aes-256-ecb"
                 pty
                openssl enc -aes-256-ecb -in $location$filename -out $datasb$datas -k $pdf -pbkdf2 -d
                loadingdec
                again
                ;;
         "manualinput")
                echo "You have selected a manual method to select encryption type"

                echo "HERE IS A LIST OF ENCRYPTION TYPE"

                echo "aes-128-cbc       aes-128-ecb       aes-192-cbc       aes-192-ecb       
aes-256-cbc       aes-256-ecb       aria-128-cbc      aria-128-cfb      
aria-128-cfb1     aria-128-cfb8     aria-128-ctr      aria-128-ecb      
aria-128-ofb      aria-192-cbc      aria-192-cfb      aria-192-cfb1     
aria-192-cfb8     aria-192-ctr      aria-192-ecb      aria-192-ofb      
aria-256-cbc      aria-256-cfb      aria-256-cfb1     aria-256-cfb8     
aria-256-ctr      aria-256-ecb      aria-256-ofb      base64            
bf                bf-cbc            bf-cfb            bf-ecb            
bf-ofb            camellia-128-cbc  camellia-128-ecb  camellia-192-cbc  
camellia-192-ecb  camellia-256-cbc  camellia-256-ecb  cast
cast-cbc          cast5-cbc         cast5-cfb         cast5-ecb         
cast5-ofb         des               des-cbc           des-cfb           
des-ecb           des-ede           des-ede-cbc       des-ede-cfb       
des-ede-ofb       des-ede3          des-ede3-cbc      des-ede3-cfb      
des-ede3-ofb      des-ofb           des3              desx
rc2               rc2-40-cbc        rc2-64-cbc        rc2-cbc           
rc2-cfb           rc2-ecb           rc2-ofb           rc4
rc4-40            seed              seed-cbc          seed-cfb          
seed-ecb          seed-ofb          sm4-cbc           sm4-cfb           
sm4-ctr           sm4-ecb           sm4-ofb           
"

                read -e -p "Enter a encryption:" encc
                pty
                openssl enc  -$encc -in $location$filename -out $datasb$datas -k $pdf -pbkdf2 -d
                loadingdec
                again
                ;;

          "quit")
              return
              ;;
          *) echo "invalid option please enter a correct encryption method $REPLY";
  esac
done
}

gh () {
        cat $datasb$datas
}


menu
