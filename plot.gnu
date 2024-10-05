# Color definitions
set style line 1 lc rgb "#4E79A7" # Steel Blue
set style line 2 lc rgb "#59A14F" # Green
set style line 3 lc rgb "#F28E2B" # Dark Orange

# Plot settings
set terminal pngcairo enhanced font "Arial,10" size 1400,800
set output 'build_times.png'
set title "Cargo Build Times Comparison" font ",14"
set style data histogram
set style histogram cluster gap 1
set style fill solid 0.7 border -1
set boxwidth 0.9
set xtics rotate by 45 right
set xlabel "Build Commands" offset 0,-2
set ylabel "Time (seconds)"
set yrange [0:*]
set key outside right top vertical box
set grid ytics

# Plot
plot 'input_data.txt' using 2:xtic(1) title "With Hakari" ls 1, \
     '' using 3:xtic(1) title "Hakari without target-host unification" ls 2, \
     '' using 4:xtic(1) title "Without Hakari" ls 3
