using DoNOF

mol = """
0 2
C    -1.17379    0.14938    0.00000
O     0.05976    0.73421    0.00000
C     1.17033   -0.05784    0.00000
H    -1.25785   -0.92765    0.00000
H    -1.99816    0.83907    0.00000
O     2.27112    0.39653    0.00000
H     0.92860   -1.13370    0.00000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-P30"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
