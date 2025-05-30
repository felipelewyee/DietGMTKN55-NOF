using DoNOF

mol = """
0 1
C    -0.04750    0.95182    0.00000
C     0.05533   -1.20851    0.67215
C     0.05533   -1.20851   -0.67215
N    -0.00683    0.11342   -1.05589
N    -0.00683    0.11342    1.05589
H     0.09648   -2.02861    1.37104
H     0.09648   -2.02861   -1.37104
C    -0.02690    0.56551   -2.42377
C    -0.02690    0.56551    2.42377
H     0.86044    0.22914   -2.96135
H    -0.91210    0.20118   -2.94688
H    -0.04266    1.65196   -2.41980
H    -0.91210    0.20118    2.94688
H     0.86044    0.22914    2.96135
H    -0.04266    1.65196    2.41980
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CARBHB12-4O_A"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
