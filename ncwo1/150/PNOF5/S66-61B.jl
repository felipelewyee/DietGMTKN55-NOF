using DoNOF

mol = """
0 1
C    -0.48118   -0.32755   -0.03836
O    -0.90380   -1.44273   -0.23550
O    -1.29488    0.73141    0.19423
H    -2.19564    0.37703    0.15370
C     0.95908    0.08211   -0.02115
H     1.58491   -0.78807   -0.17930
H     1.13512    0.81639   -0.80427
H     1.19639    0.55141    0.93065
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-61B"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
