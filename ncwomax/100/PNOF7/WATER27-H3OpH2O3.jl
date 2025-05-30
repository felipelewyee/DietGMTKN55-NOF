using DoNOF

mol = """
1 1
O     0.44886    2.45066   -0.11284
H     0.53656    3.10824    0.58584
H     0.95874    2.76786   -0.86572
O    -2.34676   -0.83661   -0.11284
H    -2.87641   -0.55364   -0.86572
H    -2.96009   -1.08944    0.58584
O     1.89791   -1.61405   -0.11284
H     2.42353   -2.01880    0.58584
H     1.91767   -2.21422   -0.86572
O     0.00000    0.00000    0.49804
H     0.72067   -0.65865    0.22671
H     0.21007    0.95344    0.22671
H    -0.93074   -0.29480    0.22671
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WATER27-H3OpH2O3"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
