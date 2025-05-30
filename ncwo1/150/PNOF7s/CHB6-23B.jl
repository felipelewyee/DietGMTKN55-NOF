using DoNOF

mol = """
0 1
O     0.72608    0.97875    0.12101
H     1.68902    0.99417    0.17326
H     0.47192    1.90747    0.17793
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CHB6-23B"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
