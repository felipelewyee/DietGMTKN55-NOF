using DoNOF

mol = """
0 1
H     0.14752    0.50303    0.00000
F     0.03792   -1.30313    0.00000
F     0.03792    1.42820    0.00000
H    -0.83011   -1.62866    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PX13-hf_2"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
