options=({a..z} {0..9});
uuid=""

for i in {1..32}; do
    randomIndex=$((RANDOM % 32))
    element="${options[$randomIndex]}"
    uuid="${uuid}${element}"
done

echo $uuid