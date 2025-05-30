using DoNOF

mol = """
0 1
C    -1.85175   -0.60506   -0.39570
H    -1.79874   -1.35126   -1.18865
O    -1.85175   -1.35000    0.82205
C    -0.67474    0.35668   -0.49480
H    -0.78034    0.94863   -1.40896
H    -0.71169    1.06084    0.34010
C     0.67474   -0.35668   -0.49480
H     0.78034   -0.94863   -1.40896
H     0.71169   -1.06084    0.34010
H    -1.97443   -0.72071    1.53828
H    -2.79417   -0.06229   -0.51417
C     1.85175    0.60506   -0.39570
H     2.79417    0.06229   -0.51417
H     1.79874    1.35126   -1.18865
O     1.85175    1.35000    0.82205
H     1.97443    0.72071    1.53828
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B14"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
