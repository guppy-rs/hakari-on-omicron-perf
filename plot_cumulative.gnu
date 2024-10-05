# Data preprocessing using AWK
set print "cumulative_data.tmp"
print "0 0 0 0"  # Add starting point at (0,0,0)
system "awk '{with += $2; without_unification += $3; without += $4; print NR, with, without_unification, without}' input_data.txt >> cumulative_data.tmp"
set print

# Color definitions
set style line 1 lc rgb "#4E79A7" lw 2 pt 7 ps 0.5  # Steel Blue, with point type and size
set style line 2 lc rgb "#59A14F" lw 2 pt 7 ps 0.5  # Green, with point type and size
set style line 3 lc rgb "#F28E2B" lw 2 pt 7 ps 0.5  # Dark Orange, with point type and size

# Plot settings
set terminal pngcairo enhanced font "Arial,10" size 1400,800
set output 'cumulative.png'
set title "Cumulative Cargo Build Times Comparison" font ",14"
set xlabel "Build Commands" offset 0,-1
set ylabel "Cumulative Time (seconds)"
set key outside right top vertical box
set grid

# Set y-axis to start from 0
set yrange [0:*]

# Set x-axis ticks at intervals of 1
set xtics 1
set xrange [0:14]  # Adjust range to include 0

# Plot
plot "cumulative_data.tmp" using 1:2 with linespoints title "With Hakari" ls 1, \
     "" using 1:3 with linespoints title "Hakari without target-host unification" ls 2, \
     "" using 1:4 with linespoints title "Without Hakari" ls 3

# Clean up temporary file
system "rm cumulative_data.tmp"
