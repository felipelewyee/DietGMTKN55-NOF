using DoNOF

mol = """
0 1
C    -0.00618    0.71926    0.00000
C     1.19598    0.00418    0.00000
C     1.20275   -1.38580    0.00000
C     0.00215   -2.09210    0.00000
C    -1.20032   -1.39443    0.00000
C    -1.20135   -0.00154    0.00000
C    -0.00251    2.22798    0.00000
H     2.13730    0.54400    0.00000
H     2.14598   -1.91979    0.00000
H     0.00598   -3.17556    0.00000
H    -2.14084   -1.93310    0.00000
H    -2.14527    0.53278    0.00000
H    -1.01770    2.62730    0.00000
H     0.51201    2.62340    0.88016
H     0.51201    2.62340   -0.88016
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ISO34-E12"

p.ipnof = 9

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
