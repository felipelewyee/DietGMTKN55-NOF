using DoNOF

mol = """
0 1
C     0.89711    1.06574   -0.07420
H     1.59236    1.89234   -0.11643
C     1.37150   -0.23373    0.09330
H     2.43500   -0.41305    0.17372
C     0.47487   -1.29934    0.16429
H     0.84510   -2.30822    0.29017
C    -0.89646   -1.06598    0.06919
H    -1.59386   -1.89077    0.12647
C    -1.37216    0.23369   -0.09640
H    -2.43617    0.41471   -0.15810
C    -0.47441    1.29798   -0.17020
H    -0.84288    2.30663   -0.30181
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-28A"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
