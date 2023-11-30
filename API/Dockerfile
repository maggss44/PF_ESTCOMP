# Parent image
FROM rstudio/plumber:v1.1.0
# Packages
RUN R -e "install.packages(c('randomForest'), repos='http://cran.rstudio.com/')"
# Copy the current directory contents into the container at /usr/local/src/app
COPY . /myproject
WORKDIR /myproject
# port
EXPOSE 8000
# Run plumber
ENTRYPOINT ["Rscript", "entrypoint.R"]
CMD ["entrypoint.R"]
