function info
{
    cat ./data/output.dat|tr -d " " > ./data/$1.dat
    echo "Output sent to ./data/"$1".dat"
}
function run
{
    make clean
    make $5 CC=gcc OFLAGS=-$3 CFLAGS=$4 > /dev/null 
    echo "Executing "$5" using gcc with flags "$3"..."
    taskset -c 1 ./$5/$5 $1 $2 > ./data/output.dat
    info $5gcc$3
    make clean
    make $5 CC=clang OFLAGS=-$3 CFLAGS=$4 > /dev/null 
    echo "Executing "$5" using clang with flags "$3"..."
    taskset -c 1 ./$5/$5 $1 $2 > ./data/output.dat
    info $5clang$3
    make clean
    make $5 CC=icx OFLAGS=-$3 CFLAGS=$4 > /dev/null 
    echo "Executing "$5" using icx with flags "$3"..."
    taskset -c 1 ./$5/$5 $1 $2 > ./data/output.dat
    info $5icx$3
    make clean
    gnuplot -c plot.gp $3 $5
    echo -e "Histograms created in: \n\t./images/"$5$3".png"
}
function plotcompilers
{
    gnuplot -c compiler.gp gcc $1
    echo -e "\t./images/"$1gcc".png"
    gnuplot -c compiler.gp clang $1
    echo -e "\t./images/"$1clang".png"
    gnuplot -c compiler.gp icx $1
    echo -e "\t./images/"$1icx".png"
}
run 80 100 O0 "-g -Wall" dgemm
run 80 100 O1 "-g -Wall" dgemm
run 80 100 O2 "-g -Wall" dgemm
run 80 100 O3 "-g -Wall" dgemm

run 80 100 O0 "-g -Wall" dotprod
run 80 100 O1 "-g -Wall" dotprod
run 80 100 O2 "-g -Wall" dotprod
run 80 100 O3 "-g -Wall" dotprod

run 80 100 O0 "-g -Wall" reduc
run 80 100 O1 "-g -Wall" reduc
run 80 100 O2 "-g -Wall" reduc
run 80 100 O3 "-g -Wall" reduc

echo "Histograms created in:"
plotcompilers dgemm
plotcompilers dotprod
plotcompilers reduc

echo "Performance measurements done !"


