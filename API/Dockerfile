# Parent image
FROM rstudio/plumber:latest
# Packages
RUN R -e "install.packages(c('randomForest'), repos='http://cran.rstudio.com/')"
# Copy the current directory contents into the container at /usr/local/src/app
COPY . /app
# port
EXPOSE 8080
# Run plumber
CMD ["Rscript", "/app/plumber.R"]
