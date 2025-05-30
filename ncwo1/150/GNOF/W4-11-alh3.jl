using DoNOF

mol = """
0 1
Al    0.00000    0.00000    0.00000
H     0.00000    1.58050    0.00000
H     1.36875   -0.79025    0.00000
H    -1.36875   -0.79025    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "W4-11-alh3"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
