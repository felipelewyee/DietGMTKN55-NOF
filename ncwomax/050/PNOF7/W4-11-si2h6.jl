using DoNOF

mol = """
0 1
Si    0.00000    1.17088    0.00000
H    -1.38995    1.68512    0.00000
H     0.69546    1.68369    1.20405
H     0.69546    1.68369   -1.20405
Si    0.00000   -1.17088    0.00000
H     1.38995   -1.68512    0.00000
H    -0.69546   -1.68369    1.20405
H    -0.69546   -1.68369   -1.20405
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "W4-11-si2h6"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
