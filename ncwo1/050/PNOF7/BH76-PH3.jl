using DoNOF

mol = """
0 1
P     0.00000    0.00000    0.56885
H     0.59567    1.03173   -0.18962
H     0.59567   -1.03173   -0.18962
H    -1.19134    0.00000   -0.18962
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-PH3"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
