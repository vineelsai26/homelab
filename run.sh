cd docker-compose

for dir in *; do
    if [ -d "$dir" ]; then
        cd "$dir"
        docker compose up -d
        cd ..
    fi
done

cd ..
