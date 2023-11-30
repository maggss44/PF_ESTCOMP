# Monitoreo De Proceso de Manufactura
## ESTCOMP-Proyecto_Final

_SET UP_
- crear ambiente virtual con `python -m venv venv`
- activar ambiente virtual en mac/linux `source venv/bin/activate` en windows `venv\Scripts\activate`
- instalar librerías `pip install -r requirements.txt` 
- tener el _Docker daemon_ corriendo
- tener el .env en la carpeta pricipal del proyecto

* (para hacer ejecutable _postgres.sh_ ejecutar en terminal `chmod +x postgres.sh`)
* para abrir conecxión con el postgre ejecutar `bash postgres.sh` (Si es la primera vez que se ejecutará se tienen que cargar los datos con `bash postgres.sh initial`)

## R(modelo de ml, API y Shiny)
HICE UN CAMBIO AL SCRIPT DE import_data.py, POR ESTO, DEBEN DE ELIMINAR EL CONTENEDOR DE monitoreo_manufactura Y REPETIR LOS PASOS ANTERIORES PARA VOLVERLO A CREAR (LOS PASOS QUE PUSO LAURO).

Una vez que hicieron lo anterior correr los archivos es muy sencillo.

- Asegúrense de que tienen la versión más reciente del repo usando `git pull`.
- Tengan encendido el docker con Postgres.
- Abran rStudio y en la consola de R, la ventana en la parte inferior, navegen a la ruta de la carpeta 'R' del repositorio con el comando `setwd('path/to/R')`. Pueden checar el directorio en el que se encuentran con el comando `getwd()`.
- Una vez que estén el path correcto corran en la consola de R el comando `renv::restore()`, esto debería checar e installar todas las paqueterias que utiliza el proyecto.
- Ejecuten el archivo plumber_debug.R en segundo plano con el botón de 'Source' y eligan 'Source as background Job' del menú que se despliega, en whatsapp mando un screenshot para que vean donde es :).
- Finalmente en el archivo shiny_app.R den click en 'Run app'.
- LISTO!!!