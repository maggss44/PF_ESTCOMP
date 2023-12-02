# LOCAL
## Proyecto EstComp

El proceso de ejecutar la aplicación es aún más fácil ahora.
- Tener este repo clonado en sus máquinas.
- Tener un web browser abierto(chrome, firefox, etc.).
- Abrir tres terminales.

### DB
si en tus contenedores de docker no tienes "monitoreo_manufactura" 
correr en cualquier terminal
```
docker run \
    --name monitoreo_manufactura \
    -p 5432:5432 \
    -e POSTGRES_PASSWORD=postgres \
    -e POSTGRES_INITDB_ARGS="--auth-local=md5" \
    -d \
    postgres
```
y después
```
Rscript data/import_data.R
```
al finalizar estará corriendo el motor posgres en el puerto 5432 con los datos.
Si ya tienes el contenedor entonces solo correr en una terminal `docker start monitoreo_manufactura`

### Para correr la aplicación
- Navega en dos terminales a la carpeta que contenga este repo.
- En una de las terminales ejecuta este comando `Rscript ./API/plumber.R`.
- Cambia de terminal y ejecuta este comando `Rscript -e "shiny::runApp('./shiny/shiny_app.R', host = '0.0.0.0', port = 5000)"`.
- En tu navegador escribe 'http://localhost:5000' en el search bar (donde escribes las direcciones web tipo www.itam.mx).

### Para cerrar la aplicación
- En ambas terminales presiona 'Cmd + .'.
