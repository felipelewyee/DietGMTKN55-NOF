using DoNOF

mol = """
0 1
C     0.00000    1.13574    0.71750
C     0.00000    1.19066   -0.66811
C     0.00000    0.00000   -1.37494
C     0.00000   -1.19066   -0.66811
C     0.00000   -1.13574    0.71750
N     0.00000    0.00000    1.40899
H     0.00000    2.04991    1.30172
H     0.00000    2.14589   -1.17586
H     0.00000    0.00000   -2.45774
H     0.00000   -2.14589   -1.17586
H     0.00000   -2.04991    1.30172
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-pyr"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
