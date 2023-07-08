for dir in *; do
    if [ -d "$dir" ]; then
        cd "$dir"
        docker compose down --remove-orphans
        docker compose pull
        docker compose up -d
        cd ..
    fi
done
