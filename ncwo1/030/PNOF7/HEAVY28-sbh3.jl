using DoNOF

mol = """
0 1
Sb    0.00000    0.00000    0.70963
H    -0.69522    1.20416   -0.23654
H    -0.69522   -1.20416   -0.23654
H     1.39044    0.00000   -0.23654
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVY28-sbh3"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
