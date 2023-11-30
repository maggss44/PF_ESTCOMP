# create or open postgres database
if [ "$1" = 'initial' ]; then
    docker run \
        --name monitoreo_manufactura \
        -p 5432:5432 \
        -e POSTGRES_PASSWORD=postgres \
        -e POSTGRES_INITDB_ARGS="--auth-local=md5" \
        -d \
        postgres

    echo "###IMPORT DATA###"
    sleep 10
    python data/import_data.py
else 
    docker start monitoreo_manufactura
fi