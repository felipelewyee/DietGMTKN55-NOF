using DoNOF

mol = """
0 1
C    -0.92548    0.26459    0.02516
C     0.54711    0.26201   -0.02474
O    -0.18688    1.50957    0.00188
H    -1.44877    0.05848   -0.91833
H     1.06961    0.05140    0.91820
C     1.32643   -0.03769   -1.27734
H     2.24393    0.56740   -1.31807
H     1.62078   -1.09796   -1.30476
H     0.72818    0.18368   -2.17142
C    -1.70588   -0.03558    1.27695
H    -2.62115    0.57276    1.31934
H    -2.00412   -1.09483    1.30155
H    -1.10677    0.18122    2.17158
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-dimethyloxirane"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
