``` bash
for ncwo in ncwo1 ncwomax; do echo $ncwo; cd $ncwo; for set in 030 050 100 150; do echo $set; cd $set; for nof in PNOF5 PNOF7 PNOF7s GNOF GNOFm; do echo $nof; cd $nof; julia analyzer.jl; mv *NOF*.yaml ~/Dropbox/DietGMTKN55-NOF; cd ..; done; cd ..; done; cd ..; done
```
