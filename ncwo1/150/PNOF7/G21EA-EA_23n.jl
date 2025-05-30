using DoNOF

mol = """
0 2
P     0.00000    0.00000    0.74542
O     0.00000    0.00000   -0.74542
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "G21EA-EA_23n"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
