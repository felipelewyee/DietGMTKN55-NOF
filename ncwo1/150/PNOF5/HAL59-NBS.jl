using DoNOF

mol = """
0 1
Br    0.00000    0.00000    1.63340
C     0.00000    1.15635   -0.96957
N     0.00000    0.00000   -0.18563
O     0.00000    2.28460   -0.57260
O     0.00000   -2.28460   -0.57260
C     0.00000   -1.15635   -0.96957
C     0.00000   -0.66192   -2.38632
C     0.00000    0.66192   -2.38632
H     0.00000    1.34825   -3.21867
H     0.00000   -1.34825   -3.21867
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-NBS"

p.ipnof = 5

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
