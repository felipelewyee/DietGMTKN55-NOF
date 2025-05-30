using DoNOF

mol = """
0 1
I     0.00000    0.00000    0.96839
C     0.00000    0.00000   -1.17117
F     0.00000    1.24411   -1.64065
F    -1.07743   -0.62205   -1.64065
F     1.07743   -0.62205   -1.64065
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-F3CI"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
