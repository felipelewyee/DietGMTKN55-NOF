using DoNOF

mol = """
0 1
N     0.00000    0.00000    0.28223
H     0.46901    0.81235   -0.09408
H     0.46901   -0.81235   -0.09408
H    -0.93802    0.00000   -0.09408
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-NH3"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
