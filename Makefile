.PHONY: all install clean

all: install Report.html

install:
	Rscript -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv'); renv::restore()"

Report.html: output/clean_habs_data.rds output/map.rds output/summary_table.rds output/plots.rds output/regressions.rds
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

docker_build:
	docker build --platform linux/amd64 --no-cache -t annaimpel/final_image:latest .

docker_run:
	docker run --rm \
		-v $$(pwd)/output:/final_project/output \
		--platform linux/amd64 \
		annaimpel/final_image:latest \
		Rscript code/Build.R