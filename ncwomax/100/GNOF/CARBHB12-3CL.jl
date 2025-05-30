using DoNOF

mol = """
0 1
Cl    0.00000    0.00000   -3.06150
H     0.00000    0.00000   -1.76898
Si    0.00000    0.00000    0.92563
H     1.09470    0.00000    1.95243
H    -1.09470    0.00000    1.95243
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CARBHB12-3CL"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
