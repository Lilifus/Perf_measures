set term png
set output sprintf("./images/%s.png",ARG1)

red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB"; purple = "#800080";
set style data histogram
set style histogram cluster gap 1
set style fill solid
set boxwidth 0.9
set datafile separator ";"
set xtics format ""
set grid ytics

set title sprintf("Compiler %s",ARG1)
plot sprintf("./data/%sO0.dat",ARG1) using 11:xtic(1) title "O0" linecolor rgb red,   \
     sprintf("./data/%sO1.dat",ARG1) using 11 title "O1" linecolor rgb blue,   \
     sprintf("./data/%sO2.dat",ARG1) using 11 title "O2" linecolor rgb green,   \
     sprintf("./data/%sO3.dat",ARG1) using 11 title "O3" linecolor rgb purple,   \

