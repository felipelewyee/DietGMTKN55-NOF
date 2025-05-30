using DoNOF

mol = """
0 1
Sb    0.07941   -1.16740    0.00000
H     0.92543   -1.96223    1.21137
H     0.92543   -1.96223   -1.21137
H    -1.13927   -2.32204    0.00000
O     0.07941    2.66198    0.00000
H    -0.06917    1.71249    0.00000
H    -0.80123    3.03943    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVY28-sbh3_h2o"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
