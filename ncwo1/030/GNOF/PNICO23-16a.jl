using DoNOF

mol = """
0 1
N     0.05498   -2.12560    0.00000
H    -0.48623   -2.97976    0.00000
H     0.65552   -2.14648    0.81343
H     0.65552   -2.14648   -0.81343
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-16a"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
