using DoNOF

mol = """
0 1
O     0.22079    1.07509   -0.00667
H     1.18506    1.04262   -0.00632
C    -0.24064   -0.26036    0.00160
H    -1.32692   -0.22897    0.00074
H     0.08139   -0.81984   -0.87993
H     0.08033   -0.80854    0.89059
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-08A"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
