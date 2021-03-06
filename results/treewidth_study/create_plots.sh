#!/bin/bash

#either the $PYTHONPATH must be set to include alib, vnep_approx, evaluation_acm_ccr_2019 or 
#you execute this from within the virtual environment in which these packages were installed

set -e			#to exit upon failure
shopt -s nullglob	#for looping over files correctly, even if there are none

function move_logs_and_output() {
	mkdir -p $1
	echo "make sure to check the logs for errors and that the generated output is correct"
	for file in output/*; 	do mv $file input/; done
	for file in log/*; 	do mv $file $1/ ; done
}
mkdir -p log/ && mkdir -p input && mkdir -p output

#generate plots in folder ./plots
mkdir -p ./plots

#The following commands create the plots used in the ACM CCR 2019 paper and can be executed as it is.
#A plots folder will be created to store the plots in. The pdf's are not checked into the github repository due to their size

python -m evaluation_acm_ccr_2019.cli treewidth_plot_computation_results treewidth_computation_acm_ccr_2019.yml input/treewidth_computation_acm_ccr_2019_results_aggregated_results.pickle ./plots/ --output_filetype pdf
move_logs_and_output log_treewidth_plot_pdf

python -m evaluation_acm_ccr_2019.cli treewidth_plot_computation_results treewidth_computation_acm_ccr_2019.yml input/treewidth_computation_acm_ccr_2019_results_aggregated_results.pickle ./plots/ --output_filetype png
move_logs_and_output log_treewidth_plot_png



