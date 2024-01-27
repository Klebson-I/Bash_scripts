path=$1

if [[ -z $path ]];then
    echo No path given, exit script
    exit 0
fi

lsResult=$(ls $path)

onlyFiles=()

for fileOrDir in ${lsResult[@]};do
    if [[ $fileOrDir == *"."* ]];then
        onlyFiles+=($fileOrDir)
    fi
done



echo ${onlyFiles[@]}