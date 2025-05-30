# DietGMTKN55-NOF

Para copiar los yaml a la carpeta:
``` bash
for ncwo in ncwo1 ncwomax; do
    echo $ncwo
    cd $ncwo
    for set in 030 050 100 150; do
        echo $set
        cd $set
        for nof in PNOF5 PNOF7 PNOF7s GNOF GNOFm; do
            echo $nof 
            cd $nof
            julia analyzer.jl
            mv *NOF*.yaml ~/Dropbox/DietGMTKN55-NOF
            cd .. 
        done
        cd .. 
    done 
    cd ..
done
```

Para editary propagar: ~/Dropbox/Proyectos/DietGMTKN55/def2-TZVPD/ncwo1/030/GNOF/analyzer.jl
``` bash
for set in 030 050 100 150; do
    echo $set 
    cd $set
    for method in PNOF5 PNOF7s PNOF7 GNOF GNOFm; do 
        echo $method 
        cd $method
        cp ~/Dropbox/Proyectos/DietGMTKN55/def2-TZVPD/ncwo1/030/GNOF/analyzer.jl .
        julia --project=@analyzer analyzer.jl
        cd ..
    done 
    cd ..
done
```
