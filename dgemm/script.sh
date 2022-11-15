function info
{
    cat ../data/output.dat|tr -d " "|sed 1,2d > ../data/$1.dat
    echo $1".dat created in ../data/"
}
function run
{
    make clean
    taskset -c 1 make run CC=gcc OFLAGS=-$1 CFLAGS=$2 > ../data/output.dat
    info dgemmgcc$1
    make clean
    taskset -c 1 make run CC=clang OFLAGS=-$1 CFLAGS=$2 > ../data/output.dat
    info dgemmclang$1
    make clean
    taskset -c 1 make run CC=icx OFLAGS=-$1 CFLAGS=$2 > ../data/output.dat
    info dgemmicx$1
    make clean
    gnuplot -c plot.gp $1 
    echo "dgemm"$1".png created in ../images/"
}
run O0 "-g -Wall"
run O1 "-g -Wall"
run O2 "-g -Wall"
run O3 "-g -Wall"
gnuplot -c compiler.gp gcc
echo "dgemmgcc.png creates in ../images/"
gnuplot -c compiler.gp clang
echo "dgemmclang.png creates in ../images/"
gnuplot -c compiler.gp icx
echo "dgemmicx.png creates in ../images/"

echo "Performance measurements done !"


