using DoNOF

mol = """
0 1
Te    0.00000    0.00000    1.97517
H    -1.15322    0.00000    3.13323
H     1.15322    0.00000    3.13323
H     0.96025    0.00000   -3.05517
S     0.00000    0.00000   -2.13129
H    -0.96025    0.00000   -3.05517
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVY28-teh2_h2s"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
