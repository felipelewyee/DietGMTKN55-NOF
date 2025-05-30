using DoNOF

mol = """
0 1
N     0.52521    2.51825   -0.25458
C     1.44365    1.75808   -0.94521
C     0.87722    0.55751   -1.31187
C    -0.46749    0.57737   -0.80971
C    -1.52707   -0.34966   -0.84320
C    -2.72661   -0.00505   -0.24499
C    -2.90264    1.24455    0.39097
C    -1.87270    2.17035    0.44430
C    -0.65603    1.82084   -0.15449
H     0.69977    3.43193    0.12260
H     2.44426    2.12404   -1.10868
H    -1.43592   -1.30970   -1.33476
H    -3.86792    1.47598    0.82066
H    -2.01323    3.12939    0.92595
O    -3.79005   -0.88773   -0.31259
C    -4.03088   -1.55014    0.92584
H    -4.26565   -0.83753    1.71941
H    -3.16081   -2.14019    1.22441
H    -4.88134   -2.20825    0.76824
C     1.56625   -0.59999   -1.95973
C     2.16576   -1.56311   -0.91681
N     3.22054   -0.94962   -0.13166
C     3.07452   -0.24860    1.04090
C     1.82277   -0.51377    1.85034
H     2.36936   -0.24847   -2.61205
H     0.86587   -1.15449   -2.58959
H     2.57589   -2.44079   -1.42032
H     1.38468   -1.91214   -0.24417
H     4.05499   -0.67959   -0.63170
O     3.95071    0.51231    1.42912
H     1.68692   -1.58120    2.02480
H     0.93826   -0.13774    1.33676
H     1.93172   -0.00282    2.80178
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "MCONF-23"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
