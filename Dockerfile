FROM rocker/tidyverse:latest

WORKDIR /final_project

COPY . /final_project

RUN apt-get update && apt-get install -y \
    gdal-bin \
    libgdal-dev \
    libproj-dev \
    libgeos-dev \
    libudunits2-dev
    
RUN Rscript -e "install.packages('renv')"
RUN Rscript -e "renv::restore()"