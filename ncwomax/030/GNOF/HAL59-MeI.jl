using DoNOF

mol = """
0 1
I     0.00000    0.00000    0.32526
C     0.00000    0.00000   -1.80324
H     0.00000    1.03020   -2.13980
H    -0.89218   -0.51510   -2.13980
H     0.89218   -0.51510   -2.13980
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-MeI"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
