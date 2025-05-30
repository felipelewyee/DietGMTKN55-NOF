using DoNOF

mol = """
0 1
Si    0.00000    0.00000   -0.69484
H     1.08692    0.00000    0.34742
H    -1.08692    0.00000    0.34742
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CARBHB12-3N_B"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
