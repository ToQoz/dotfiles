#EasyEther Setting -TO BE CONFIG ANDRIOD BY ADB
EASYTETHER_EXT=/System/Library/Extensions/EasyTetherUSBEthernet.kext
alias easytether-on="sudo kextload $EASYTETHER_EXT"
alias easytether-off="sudo kextunload $EASYTETHER_EXT"
alias easytether-status="kextstat |grep EasyTether"