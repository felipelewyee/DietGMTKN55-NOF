using DoNOF

mol = """
0 1
I     0.00000    0.00000    1.54204
C     0.00000    0.00000   -0.55300
C     0.00000    1.20557   -1.23820
C     0.00000    1.19911   -2.62542
C     0.00000    0.00000   -3.32097
C     0.00000   -1.19911   -2.62542
C     0.00000   -1.20557   -1.23820
H     0.00000    2.14238   -0.69755
H     0.00000    2.13968   -3.16123
H     0.00000    0.00000   -4.40320
H     0.00000   -2.13968   -3.16123
H     0.00000   -2.14238   -0.69755
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-PhI"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
