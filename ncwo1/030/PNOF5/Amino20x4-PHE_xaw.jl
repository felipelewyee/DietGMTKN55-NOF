using DoNOF

mol = """
0 1
N    -2.34835   -0.80022   -0.78189
C    -1.10037   -0.32952   -0.24594
C    -1.08824    1.18467   -0.38527
O    -1.72707    1.74511   -1.27324
C     0.10047   -0.93999   -1.00397
C     1.40240   -0.51959   -0.39294
C     1.79531   -1.04712    0.84267
C     2.19777    0.46510   -0.98568
C     2.94955   -0.59078    1.47658
C     3.35591    0.92001   -0.35851
C     3.73062    0.39773    0.87859
H    -2.83921   -0.16496   -1.39214
H    -1.03071   -0.62740    0.80139
H     0.03909   -0.62555   -2.04691
H    -0.02140   -2.02215   -0.95660
H     1.19166   -1.82108    1.30273
H     1.90048    0.87948   -1.94155
H     3.24187   -1.00962    2.43007
H     3.96323    1.67919   -0.83282
H     4.62786    0.75061    1.36813
N    -0.31762    1.83602    0.51440
H     0.28688    1.27434    1.09246
C    -0.01557    3.24441    0.36250
H     0.15664    3.68749    1.33922
H     0.86494    3.39920   -0.26246
H    -0.86747    3.72367   -0.10860
C    -2.81242   -2.04011   -0.48617
O    -2.19865   -2.80667    0.25067
C    -4.13025   -2.41062   -1.12080
H    -3.97827   -3.28602   -1.74792
H    -4.55781   -1.60938   -1.71804
H    -4.82720   -2.68630   -0.33323
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "Amino20x4-PHE_xaw"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
