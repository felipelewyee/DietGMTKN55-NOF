using DoNOF

mol = """
0 1
N     1.58971    0.08453   -0.26034
C     0.98659   -1.07317    0.04067
H     1.63087   -1.94220    0.09849
C    -0.38093   -1.19883    0.27710
H    -0.80119   -2.16175    0.52971
C    -1.17857   -0.06346    0.19154
H    -2.24346   -0.12048    0.36959
C    -0.56990    1.14740   -0.12396
H    -1.14458    2.05949   -0.20432
C     0.80578    1.16969   -0.33610
H     1.30566    2.09878   -0.58238
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-25A"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
