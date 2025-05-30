using DoNOF

mol = """
0 2
C    -1.06378   -0.00001   -0.08261
N     1.51023   -0.00001   -0.23169
H    -1.38701    0.90853   -0.57965
H    -1.26670   -0.00458    0.98240
H    -1.38778   -0.90389   -0.58760
H     0.24008   -0.00007   -0.24660
H     1.67743    0.80557    0.37285
H     1.67753   -0.80553    0.37290
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-RKT21"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
