.PHONY: all install clean

all: install habs_report.html

install:
	Rscript -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv'); renv::restore()"

habs_report.html: output/clean_habs_data.rds output/map.rds output/summary_table.rds output/plots.rds output/regressions.rds
	Rscript code/Build.R

output/clean_habs_data.rds: code/Input.R
	Rscript code/Input.R

output/map.rds: code/Map.R
	Rscript code/Map.R

output/summary_table.rds: code/Table.R
	Rscript code/Table.R

output/plots.rds: code/Graph.R
	Rscript code/Graph.R

output/regressions.rds: code/Regression.R
	Rscript code/Regression.R

clean:
	rm -rf output/*.rds output/*.html

