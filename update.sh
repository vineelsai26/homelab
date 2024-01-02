cd docker-compose

for dir in *; do
    if [ -d "$dir" ]; then
        cd "$dir"
        docker compose pull
        docker compose up -d --force-recreate
        cd ..
    fi
done

cd ..
