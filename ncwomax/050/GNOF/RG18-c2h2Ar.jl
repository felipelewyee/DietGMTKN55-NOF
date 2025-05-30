using DoNOF

mol = """
0 1
H    -1.66665    0.00000   -0.79377
C    -0.60325    0.00000   -0.79377
C     0.60325    0.00000   -0.79377
H     1.66665    0.00000   -0.79377
Ar    0.00000    0.00000    3.17506
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RG18-c2h2Ar"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
