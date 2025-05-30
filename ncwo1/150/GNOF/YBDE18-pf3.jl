using DoNOF

mol = """
0 1
P     0.00000    0.00000    0.50534
F     0.00000    1.37292   -0.28074
F    -1.18898   -0.68646   -0.28074
F     1.18898   -0.68646   -0.28074
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "YBDE18-pf3"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
