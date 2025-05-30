using DoNOF

mol = """
0 1
N     2.76821   -0.14759    0.13017
C     1.36218    0.01288   -0.12177
C     1.07141    1.50548   -0.13800
O     1.78189    2.29786    0.47691
C     0.51506   -0.68325    0.96756
C    -0.94809   -0.62987    0.64897
C    -1.47062   -1.41830   -0.38079
C    -1.80797    0.26142    1.29820
C    -2.80802   -1.31413   -0.75717
C    -3.14607    0.37086    0.93547
C    -3.64927   -0.41632   -0.09976
O    -4.96889   -0.26677   -0.41924
H     3.24557    0.65199    0.51727
H     1.12104   -0.44279   -1.08349
H     0.86455   -1.71454    1.01707
H     0.72389   -0.19917    1.92290
H    -0.82485   -2.12435   -0.88987
H    -1.42203    0.88182    2.09801
H    -3.19893   -1.93626   -1.55382
H    -3.81134    1.05509    1.44340
H    -5.18008   -0.88631   -1.12549
N    -0.01859    1.86657   -0.85177
H    -0.61670    1.12463   -1.17862
C    -0.56083    3.20728   -0.77127
H     0.25845    3.88930   -0.56895
H    -1.02800    3.47071   -1.71604
H    -1.29681    3.29337    0.02901
C     3.39942   -1.31411   -0.15232
O     2.80596   -2.27737   -0.62967
C     4.87558   -1.34804    0.15846
H     5.05861   -2.13864    0.88240
H     5.25204   -0.40658    0.55015
H     5.41406   -1.60264   -0.75109
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "Amino20x4-TYR_xag"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
