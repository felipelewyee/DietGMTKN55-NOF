using DoNOF

mol = """
0 1
N     0.00000    0.00000   -0.28533
H    -0.46842    0.81133    0.09511
H    -0.46842   -0.81133    0.09511
H     0.93684    0.00000    0.09511
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CARBHB12-3N_A"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
