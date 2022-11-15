function info
{
    cat ../data/output.dat|tr -d " "|sed 1,2d > ../data/$1.dat
    echo $1".dat created in ../data/"
}
function run
{
    make clean
    taskset -c 1 make run CC=gcc OFLAGS=-$1 CFLAGS=$2 > ../data/output.dat
    info reducgcc$1
    make clean
    taskset -c 1 make run CC=clang OFLAGS=-$1 CFLAGS=$2 > ../data/output.dat
    info reducclang$1
    make clean
    taskset -c 1 make run CC=icx OFLAGS=-$1 CFLAGS=$2 > ../data/output.dat
    info reducicx$1
    make clean
    gnuplot -c plot.gp $1 
    echo "reduc"$1".png created in ../images/"
}
run O0 "-g -Wall"
run O1 "-g -Wall"
run O2 "-g -Wall"
run O3 "-g -Wall"
gnuplot -c compiler.gp gcc
echo "reducgcc.png creates in ../images/"
gnuplot -c compiler.gp clang
echo "reducclang.png creates in ./images/"
gnuplot -c compiler.gp icx
echo "reducicx.png creates in ./images/"

echo "Performance measurements done !"


