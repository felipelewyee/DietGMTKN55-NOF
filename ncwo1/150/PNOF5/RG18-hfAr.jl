using DoNOF

mol = """
0 1
H     0.00000    0.00000   -0.57671
F     0.00000    0.00000   -1.49246
Ar    0.00000    0.00000    2.06917
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RG18-hfAr"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
