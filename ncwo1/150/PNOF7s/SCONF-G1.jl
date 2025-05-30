using DoNOF

mol = """
0 1
C    -0.61610   -1.46191   -0.26083
O     0.68360   -1.15822    0.23313
C     1.19566    0.10132   -0.24015
C     0.28187    1.23476    0.24642
C    -1.61813   -0.41509    0.23115
C    -1.15639    0.97199   -0.20163
O    -1.96495    2.00556    0.35519
O     0.77036    2.45745   -0.28967
C     2.62333    0.20711    0.28398
O     3.43702   -0.85810   -0.18882
H    -2.88479    1.84370    0.08824
H     0.11416    3.14560   -0.08812
H     3.00825   -1.68701    0.07957
O    -1.02012   -2.69875    0.24948
O    -2.91466   -0.61329   -0.32502
H    -1.19494    1.02713   -1.30145
H     0.30477    1.26588    1.34724
H     1.21816    0.09503   -1.34134
H     3.07364    1.13404   -0.07645
H    -0.45827   -3.39869   -0.11986
H    -3.24490   -1.47747   -0.03025
H    -0.58978   -1.47906   -1.36410
H    -1.65370   -0.47100    1.32851
H     2.60592    0.22906    1.38477
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "SCONF-G1"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
