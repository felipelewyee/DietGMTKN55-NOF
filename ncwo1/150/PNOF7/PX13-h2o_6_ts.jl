using DoNOF

mol = """
0 1
O     2.07916   -1.20040    0.09532
H     1.03545    1.79345    0.00000
H     2.07089    0.00000    0.00000
O     2.07916    1.20040   -0.09532
H     1.03545   -1.79345    0.00000
O     0.00000   -2.40081   -0.09532
H    -1.03545   -1.79345    0.00000
O     0.00000    2.40081    0.09532
H     0.00000    2.94056    0.88969
H     2.54660    1.47028   -0.88969
H     2.54660   -1.47028    0.88969
H     0.00000   -2.94056   -0.88969
O    -2.07916   -1.20040    0.09532
H    -1.03545    1.79345    0.00000
H    -2.54660   -1.47028    0.88969
O    -2.07916    1.20040   -0.09532
H    -2.07089    0.00000    0.00000
H    -2.54660    1.47028   -0.88969
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PX13-h2o_6_ts"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
