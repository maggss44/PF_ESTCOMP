# Parent image
FROM rocker/shiny-verse:4.3.0
# packages
RUN Rscript -e "install.packages(c('httr'), repos='http://cran.rstudio.com/')"
# copy script
COPY app.R /myproject/app.R
# Port
EXPOSE 6789
# Run app
CMD ["Rscript", "-e", "shiny::runApp('/myproject/app.R', host = '0.0.0.0', port = 6789)"]
