reset

set grid
set xlabel 'N'
set ylabel 'time(sec)'
set style fill solid

set key left
set key box

set datafile separator ","
set title 'clz time'
set term png enhanced font 'Verdana,10'

set output 'runtime.png'

plot  "clz_result.csv" using 1:2 title 'recursive' , \
     "" using 1:3 title 'iteration' , \
     "" using 1:4 title 'binary_search', \
     "" using 1:5 title 'byte_shift' , \
"" using 1:6 title 'harley' , \
