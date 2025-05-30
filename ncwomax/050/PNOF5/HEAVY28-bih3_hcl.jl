using DoNOF

mol = """
0 1
Bi    0.00000    0.00000    1.00001
H    -0.71818    1.24393    2.02126
H    -0.71818   -1.24393    2.02126
H     1.43636    0.00000    2.02126
Cl    0.00000    0.00000   -2.89551
H     0.00000    0.00000   -4.16828
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVY28-bih3_hcl"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
