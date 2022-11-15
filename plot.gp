set term png
set output sprintf("./images/%s%s.png",ARG2,ARG1)

red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB";
set style data histogram
set style histogram cluster gap 1
set style fill solid
set boxwidth 0.9
set datafile separator ";"
set xtics format "" rotate by 45 right font ", 10"
set xlabel "Versions"
set ylabel "Bandwidth in MiB/s"
set grid ytics

set title sprintf("%s: Compiler comparaison with flag %s",ARG2,ARG1)
plot sprintf("./data/%sgcc%s.dat",ARG2,ARG1) using "MiB/s":xtic(1) title "GCC" linecolor rgb red,   \
     sprintf("./data/%sclang%s.dat",ARG2,ARG1) using "MiB/s" title "CLANG" linecolor rgb blue,   \
     sprintf("./data/%sicx%s.dat",ARG2,ARG1) using "MiB/s" title "ICX" linecolor rgb skyblue

