using DoNOF

mol = """
0 1
H    -1.57582   -1.69738   -1.32882
C    -0.77642   -1.31318   -0.70291
H     1.97028    0.35737    0.00000
C     0.32626   -0.58360   -1.15743
C    -0.77642   -1.31318    0.70291
H     1.90994   -1.41640    0.00000
C     1.29420   -0.50011    0.00000
C    -0.36429    1.50587   -0.69397
H     0.63966   -0.53049   -2.19544
C    -0.36429    1.50587    0.69397
H    -1.57582   -1.69738    1.32882
C     0.32626   -0.58360    1.15743
H     0.63966   -0.53049    2.19544
H     0.46024    1.95413    1.24117
H    -1.29684    1.44422   -1.24394
H     0.46024    1.95413   -1.24117
H    -1.29684    1.44422    1.24394
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-TS8"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
