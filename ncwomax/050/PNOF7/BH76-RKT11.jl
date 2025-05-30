using DoNOF

mol = """
0 3
C     0.00087   -0.50561    0.00000
H    -1.05538   -0.74806    0.00000
H     0.52075   -0.77071    0.91245
H     0.52075   -0.77071   -0.91245
H     0.01214    0.79678    0.00000
O     0.00087    1.99832    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-RKT11"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
