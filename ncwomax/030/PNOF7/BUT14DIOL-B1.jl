using DoNOF

mol = """
0 1
C     1.57838    0.14769    0.34381
H     1.39475    0.01297    1.41355
O     1.35993   -1.08620   -0.35978
C     0.65385    1.21510   -0.22132
H     1.05783    2.18028    0.09392
H     0.72969    1.18486   -1.31144
C    -0.81733    1.15213    0.20816
H    -1.30353    2.06574   -0.14583
H    -0.88377    1.15976    1.29926
H     1.98412   -1.73445   -0.02139
H     2.61629    0.45895    0.20654
C    -1.62773   -0.03405   -0.31130
H    -2.68423    0.15102   -0.11857
H    -1.50187   -0.11815   -1.39751
O    -1.32426   -1.26015    0.33338
H    -0.41765   -1.47531    0.07664
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B1"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
