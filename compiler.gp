set term png
set output sprintf("./images/%s%s.png",ARG2,ARG1)

red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB"; purple = "#800080";
set style data histogram
set style histogram cluster gap 1
set style fill solid
set boxwidth 0.9
set datafile separator ";"
set xtics format "" rotate by 45 right font ", 10"
set xlabel "Versions"
set ylabel "Bandwidth in MiB/s"
set grid ytics

set title sprintf("%s: Compiler %s",ARG2, ARG1)
plot sprintf("./data/%s%sO0.dat",ARG2,ARG1) using "MiB/s":xtic(1) title "O0" linecolor rgb red,   \
     sprintf("./data/%s%sO1.dat",ARG2,ARG1) using "MiB/s" title "O1" linecolor rgb blue,   \
     sprintf("./data/%s%sO2.dat",ARG2,ARG1) using "MiB/s" title "O2" linecolor rgb green,   \
     sprintf("./data/%s%sO3.dat",ARG2,ARG1) using "MiB/s" title "O3" linecolor rgb purple,   \

