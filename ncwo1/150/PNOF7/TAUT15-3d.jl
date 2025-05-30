using DoNOF

mol = """
0 1
C    -2.43681   -1.25726   -0.09421
C    -1.15737   -0.96563    0.19258
O    -0.39396   -1.77722    1.00333
C    -0.46378    0.19876   -0.31956
C     0.79751    0.61100   -0.05235
N     1.66281    0.02727    0.85029
C     1.34721    1.84703   -0.69749
H    -3.00708   -0.60358   -0.73192
H    -2.91760   -2.14021    0.30122
H    -0.94442   -2.51240    1.28672
H    -1.04321    0.81069   -0.99344
H     1.42600   -0.89990    1.15805
H     2.64016    0.17766    0.67389
H     0.62337    2.29308   -1.37154
H     2.24721    1.61133   -1.26739
H     1.61997    2.57938    0.06182
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "TAUT15-3d"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
