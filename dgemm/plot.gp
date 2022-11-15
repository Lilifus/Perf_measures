set term png
set output sprintf("../images/dgemm%s.png",ARG1)

red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB";
set style data histogram
set style histogram cluster gap 1
set style fill solid
set boxwidth 0.9
set datafile separator ";"
set xtics format ""
set grid ytics

set title sprintf("Compiler comparaison with flag %s",ARG1)
plot sprintf("../data/dgemmgcc%s.dat",ARG1) using "MiB/s":xtic(1) title "GCC" linecolor rgb red,   \
     sprintf("../data/dgemmclang%s.dat",ARG1) using "MiB/s" title "CLANG" linecolor rgb blue,   \
     sprintf("../data/dgemmicx%s.dat",ARG1) using "MiB/s" title "ICX" linecolor rgb skyblue

