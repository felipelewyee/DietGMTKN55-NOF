using DoNOF

mol = """
0 1
N     0.00000    0.00000    0.48304
F     0.00000    1.22759   -0.12523
F    -1.06313   -0.61380   -0.12523
F     1.06313   -0.61380   -0.12523
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-nf3"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
