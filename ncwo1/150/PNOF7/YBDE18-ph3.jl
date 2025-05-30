using DoNOF

mol = """
0 1
P     0.00000    0.00000    0.12703
H     0.00000    1.18937   -0.63513
H    -1.03002   -0.59468   -0.63513
H     1.03002   -0.59468   -0.63513
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-ph3"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
