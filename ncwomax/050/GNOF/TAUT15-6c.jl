using DoNOF

mol = """
0 1
N     0.15661   -1.51781    0.04380
C     0.99334   -0.43780   -0.03358
C     0.56444    0.88204   -0.06488
C    -0.81433    1.24979   -0.05131
N    -1.58864    0.08173    0.00848
C    -1.10004   -1.20498    0.05339
N     1.69457    1.64198   -0.13032
C     2.74014    0.76832   -0.13380
N     2.35905   -0.49402   -0.07527
O    -1.31781    2.36146   -0.09314
N    -2.06526   -2.19441    0.04599
H    -2.58464    0.22967   -0.06080
H     3.76091    1.10591   -0.17977
H    -2.87264   -2.01899    0.62151
H    -1.65726   -3.09908    0.22027
H     1.73155    2.64618   -0.17055
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "TAUT15-6c"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
