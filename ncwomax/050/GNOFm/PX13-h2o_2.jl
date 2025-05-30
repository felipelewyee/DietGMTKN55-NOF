using DoNOF

mol = """
0 1
O     0.00076    1.52325    0.00000
H    -0.08636    0.55749    0.00000
H    -0.89879    1.86064    0.00000
O     0.00076   -1.39613    0.00000
H     0.48653   -1.71757    0.76620
H     0.48653   -1.71757   -0.76620
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PX13-h2o_2"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
