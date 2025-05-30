using DoNOF

mol = """
0 1
N     0.23064   -1.33964    0.00000
F     0.23064   -2.75246    0.00000
H     0.81003   -1.11774    0.80648
H     0.81003   -1.11774   -0.80648
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-13a"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
