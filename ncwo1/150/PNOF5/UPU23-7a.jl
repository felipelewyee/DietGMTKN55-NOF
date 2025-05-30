using DoNOF

mol = """
-1 1
H    -5.35169   -1.39835   -2.37287
O    -4.51981   -1.42859   -1.87386
C    -4.67014   -0.59277   -0.71607
H    -5.58272   -0.85114   -0.16506
H    -4.72025    0.46744   -1.00100
C    -3.47060   -0.77000    0.18488
H    -3.56327   -0.06669    1.02188
O    -3.42831   -2.12476    0.72567
C    -2.09122   -2.57085    0.83880
H    -1.89817   -2.95086    1.84319
N    -1.87046   -3.71037   -0.11146
C    -2.76481   -4.01922   -1.10335
H    -3.63736   -3.37692   -1.14427
C    -2.56120   -5.04082   -1.97417
H    -3.28612   -5.26245   -2.74618
C    -1.36946   -5.84256   -1.88284
O    -1.05896   -6.79666   -2.60824
N    -0.50594   -5.44743   -0.84809
H     0.35771   -5.97436   -0.74360
C    -0.68368   -4.41813    0.05177
O     0.13719   -4.13655    0.92486
C    -2.10131   -0.59628   -0.47084
H    -2.08598   -1.03977   -1.46955
C    -1.18825   -1.38701    0.47256
H    -0.25594   -1.70725    0.00049
O    -0.92761   -0.63172    1.65647
H    -0.91590    0.30518    1.37767
O    -1.74755    0.78354   -0.52311
P    -0.91822    1.34096   -1.85541
O    -1.86925    2.16945   -2.66634
O    -0.13068    0.21902   -2.45735
O     0.15345    2.30388   -1.08830
C    -0.33187    3.36650   -0.24213
H    -1.19331    3.02519    0.34019
H    -0.63209    4.22353   -0.85527
C     0.77724    3.78667    0.69220
H     0.43563    4.66035    1.26221
O     1.05705    2.70308    1.62507
C     2.43365    2.65709    1.94606
H     2.57657    2.65892    3.02780
N     3.01819    1.37804    1.41835
C     2.31724    0.54580    0.58506
H     1.31925    0.88682    0.34715
C     2.84453   -0.59737    0.07906
H     2.26461   -1.22709   -0.58194
C     4.19862   -0.96868    0.39460
O     4.80410   -1.97490    0.00379
N     4.85456   -0.03964    1.21900
H     5.82103   -0.24299    1.46143
C     4.34598    1.12588    1.74997
O     5.00898    1.88957    2.45253
C     2.13565    4.08888    0.06764
H     2.35639    3.37916   -0.73575
C     3.08356    3.86705    1.25786
H     4.11645    3.67132    0.95868
O     3.01150    4.97887    2.15137
H     2.88602    5.76422    1.58150
O     2.14757    5.43130   -0.41861
H     2.86941    5.51448   -1.06411
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "UPU23-7a"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
