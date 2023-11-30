# DOCKER
en terminal `docker-compose up`
para hacer tirar el docker y volver hacer el build de la imagen `docker-compose down` después `docker-compose build --no-cache` y finalmente `docker-compose up`

# LOCAL
## Proyecto EstComp

El proceso de ejecutar la aplicación es aún más fácil ahora.
- Tener este repo clonado en sus máquinas.
- Tener un web browser abierto(chrome, firefox, etc.).
- Abrir dos terminales.

### Para correr la aplicación
- Navega en ambas terminales a la carpeta que contenga este repo.
- En una de las terminales ejecuta este comando `Rscript ./API/plumber_debug.R`.
- Cambia de terminal y ejecuta este comando `Rscript -e "shiny::runApp('./shiny/shiny_app.R')"`.
- En tu navegador escribe 'http://localhost:6789' en el search bar (donde escribes las direcciones web tipo www.itam.mx).

### Para cerrar la aplicación
- En ambas terminales presiona 'Cmd + .'.
