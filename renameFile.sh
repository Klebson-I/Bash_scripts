path=$1
suffix=$2

if [[ -z $path ]];then
    echo No path given, exit script
    exit 0
fi

if [[ -z $suffix ]];then
    echo No suffix given, exit script
    exit 0
fi

lsResult=$(ls $path)

onlyFiles=()

for fileOrDir in ${lsResult[@]};do
    if [[ $fileOrDir == *"."* ]];then
        onlyFiles+=($fileOrDir)
    fi
done

for file in ${onlyFiles[@]};do
    formatted_input=$(echo "$file" | tr '.' ' ')
    read -a splitFile <<<"$formatted_input"
    mv "${path}/$file" "${path}/${splitFile[0]}${suffix}.${splitFile[1]}"
done

echo ${onlyFiles[@]}