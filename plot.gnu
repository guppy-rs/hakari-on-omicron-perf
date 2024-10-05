set style line 1 lc rgb "#4E79A7" # Steel Blue
set style line 2 lc rgb "#F28E2B" # Dark Orange

set terminal pngcairo enhanced font "Arial,10" size 1200,800
set output 'build_times.png'
set title "Cargo Build Times" font ",14"
set style data histogram
set style histogram cluster gap 1
set style fill solid 0.7 border -1
set boxwidth 0.9
set xtics rotate by 0 center
set xlabel "Build Command" offset 0,-1
set ylabel "Time (seconds)"
set yrange [0:*]
set key outside right top vertical box
set grid ytics

plot 'input_data.txt' using 2:xtic(1) title "With hakari" ls 1, \
     '' using 3:xtic(1) title "Without hakari" ls 2
