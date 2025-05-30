using DoNOF

mol = """
0 1
P     0.00000    0.00000   -3.62827
C     0.00000    0.00000   -5.15275
H     0.00000    0.00000   -6.22438
I     0.00000    0.00000    0.09563
C     0.00000    0.00000    2.23634
F     0.00000    1.24425    2.70662
F    -1.07756   -0.62213    2.70662
F     1.07756   -0.62213    2.70662
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-PCH_F3CI"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
