cd docker-compose

for dir in *; do
    if [ -d "$dir" ]; then
        cd "$dir"
        docker compose down
        cd ..
    fi
done

cd ..
