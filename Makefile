all: build_times.png cumulative.png

build_times.png: input_data.txt plot.gnu
	gnuplot plot.gnu

cumulative.png: input_data.txt plot_cumulative.gnu
	gnuplot plot_cumulative.gnu
