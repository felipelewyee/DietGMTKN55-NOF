using DoNOF

mol = """
0 4
N     0.00000    0.00000    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "G21IP-n"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
