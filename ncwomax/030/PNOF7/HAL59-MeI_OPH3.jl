using DoNOF

mol = """
0 1
C    -2.76216   -0.69297    0.00617
I    -0.81525    0.17313   -0.00189
H    -3.25707   -0.41049    0.92856
H    -2.66064   -1.77060   -0.05591
H    -3.30787   -0.31316   -0.85025
O     2.23927    0.92349    0.00739
P     2.79864   -0.45415   -0.00045
H     2.53557   -1.23540   -1.14588
H     2.37440   -1.31346    1.03514
H     4.20321   -0.55076    0.09932
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-MeI_OPH3"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
