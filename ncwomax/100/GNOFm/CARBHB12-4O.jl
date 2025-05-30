using DoNOF

mol = """
0 1
C     0.01355   -0.15117   -0.36188
C     0.12759    0.65043    1.75336
C     0.10512   -0.69437    1.83581
N     0.03662   -1.15399    0.53958
N     0.07144    0.95244    0.41199
H     0.18038    1.39742    2.52920
H     0.13389   -1.34300    2.69666
C    -0.00625   -2.54645    0.17202
C     0.08019    2.29398   -0.12269
H     0.87200   -3.07713    0.54156
H    -0.90005   -3.03148    0.56678
H    -0.02195   -2.60872   -0.91265
H    -0.78933    2.85581    0.22100
H     0.98266    2.82628    0.17958
H     0.05692    2.22970   -1.20817
O    -0.03204    0.61616   -3.18495
H     0.06318    0.20314   -2.30235
H    -0.97393    0.58094   -3.35485
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CARBHB12-4O"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
