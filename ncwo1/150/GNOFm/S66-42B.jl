using DoNOF

mol = """
0 1
C     0.96373   -0.84779    0.02641
H     1.41758   -0.93985   -0.96158
H     1.50823   -1.51177    0.69560
C     1.01804    0.61816    0.45934
H     1.97633    1.09106    0.24862
H     0.82993    0.69980    1.53257
C    -0.14931    1.23098   -0.31143
H     0.12500    1.31976   -1.36490
H    -0.43372    2.22212    0.04020
C    -1.26625    0.19340   -0.14040
H    -1.99179    0.21702   -0.95177
H    -1.81034    0.39810    0.78185
C    -0.54322   -1.17314   -0.03674
H    -0.78588   -1.81730   -0.88010
H    -0.85832   -1.70055    0.86234
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-42B"

p.ipnof = 9

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
