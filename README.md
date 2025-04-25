# Report Overview:

This project processes and visualizes data on algal colony counts and their relationship with phycocyanin levels. The analysis includes generating maps, tables, and regression models. The final output is a compiled HTML report that can be generated using the provided code.

## Building Report:

1. Clone the repository: After forking and cloning this repository, navigate to the project folder in your terminal.
2. Run `make clean` in terminal to ensure any populated outputs are reset.
3. Run `make` to synchronize your package library, build the report, and generate final output. 
4. output/ folder will become populated with .rds files and final Report.html.

## Docker Instructions:

- A link to the image on Docker Hub can be found here: https://hub.docker.com/repository/docker/annaimpel/final_image/general
- In the terminal, the command `make docker_build` will build the image on your machine. Note that this image operates using a Mac/Linux-OS-specific target. The line `--platform linux/amd64` addresses Mac M1 chip compatibility issues.
- In the terminal, the command `make docker_run` will mount the report folder in your local project directory to the container and generate the compiled report in the report directory.

## File Descriptions:

`code/Input.R`
- Imports data set, specifying column/variable types
- Mutates data set to create version that changes all '0' algal colony counts to NA
- Saves clean set as a '.rds' object in output/ folder

`code/Map.R`
- Imports coordinate data, specifying longitude/latitude values
- Creates a static map of sample sites using tmap package
- Saves map as a '.rds' object in output/ folder

`code/Table.R`
- Imports data from '.rds' file saved in output
- Mutates data to sort my phycocyanin levels 
- Uses gtsummary to make table of algal colony counts 
- Saves table as a '.rds' object in output/ folder
- ***required table***

`code/Graph.R`
- Imports data from '.rds' file saved in output
- Creates plot of "Microcystis vs Phycocyanin"
- Creates plot of "Dolichospermum vs Phycocyanin"
- Saves plots in '.rds' object in output/ folder
- ***required figure***

`code/Regression.R`
- Imports data from '.rds' file saved in output
- Creates linear models of algal species and phycocyanin levels
- Uses gtsummary to display regression results in table for each algal species
- Saves two regression tables in '.rds' object in output/ folder

`Report.Rmd`
- Loads cleaned data and configuration parameters
- Loads and displays map, tables, and regressions

`code/Build.R`
- Renders final Report.Rmd into .html using markdown

`habs_config.yaml`
- sets parameters to show or hide code

