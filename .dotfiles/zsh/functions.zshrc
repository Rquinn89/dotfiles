#Quick function to create a backup of a file
function bak(){
    cp $1 "$1.bak"
}
#Quick function to create x lines of whitepsace in terminal to separate things when scrolling....
function mkspce(){
    printf '\n%.0s' $(seq 1 $1)
}
# Easy function to check hex numbers...
#
function hex2dec(){
    #echo $((16#$1))
    #echo "obase=10; $1" | bc
    printf "%d\n" $1
}
function dec2hex(){
    #echo "obase=16; $1" | bc
    printf "0x%x\n" $1
}

