using DoNOF

mol = """
0 1
K     0.00000    0.00000   -1.08887
F     0.00000    0.00000    1.08887
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ALKBDE10-kf"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
