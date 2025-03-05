 #!/bin/zsh
## Sample Setting
 function ask_yes_no {
   while true; do
     echo -n "$* [Y/n]: (default: y) "
     read ANS
     case $ANS in
       [Yy]* | "")
         return 0
         ;;
       [Nn]*)
         return 1
         ;;
     esac
   done
 }
 function app_dl_web {
   if ask_yes_no "Do you want to download $1?"; then
     sleep 1; echo "Download $1"
     sleep 1; open $2
   fi
 }
 function app_dl_curl {
   DL_PATH="$HOME/Downloads/$(basename $2)"
   if ask_yes_no "Do you want to download $1?"; then
     sleep 1; echo "Download $1"
     sleep 1; curl $2 --output $DL_PATH
     open $DL_PATH
   fi
 }

 # Davinci Resolve
 app_dl_web "Davinci Resolve" https://www.blackmagicdesign.com/jp/products/davinciresolve#
# DataLoader
 app_dl_web "DataLoader" https://help.salesforce.com/s/articleView?id=000383107&type=1
# JamfPro
 app_dl_web "JamfPro" https://account.jamf.com/

# WeWork Printer
 app_dl_curl "WeWork Printer" https://it-assets.s3.amazonaws.com/printing/We_Work_Installer.zip

# # Logi Options+
# app_dl_curl "Logi Options+" https://download01.logi.com/web/ftp/pub/techsupport/optionsplus/logioptionsplus_installer.zip
