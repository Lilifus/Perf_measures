set term png
set output sprintf("../images/dotprod%s.png",ARG1)

red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB"; purple = "#800080";
set style data histogram
set style histogram cluster gap 1
set style fill solid
set boxwidth 0.9
set datafile separator ";"
set xtics format ""
set grid ytics

set title sprintf("Compiler %s",ARG1)
plot sprintf("../data/dotprod%sO0.dat",ARG1) using "MiB/s":xtic(1) title "O0" linecolor rgb red,   \
     sprintf("../data/dotprod%sO1.dat",ARG1) using "MiB/s" title "O1" linecolor rgb blue,   \
     sprintf("../data/dotprod%sO2.dat",ARG1) using "MiB/s" title "O2" linecolor rgb green,   \
     sprintf("../data/dotprod%sO3.dat",ARG1) using "MiB/s" title "O3" linecolor rgb purple,   \

