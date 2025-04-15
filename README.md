***After forking and cloning this repository, run 'make' in the terminal. This will synchronize your package library and build the report.***

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

