using DoNOF

mol = """
0 1
N    -1.11520    2.76767    0.10199
C     0.16127    2.39061    0.46142
C     0.25132    1.01749    0.50486
C    -1.04873    0.51931    0.15058
C    -1.58872   -0.77548    0.02974
C    -2.91647   -0.90712   -0.33729
C    -3.72866    0.22173   -0.58730
C    -3.22300    1.50628   -0.46612
C    -1.88003    1.64102   -0.09311
H    -1.43731    3.71410    0.01616
H     0.91468    3.13327    0.66958
H    -0.99713   -1.66439    0.20676
H    -4.75361    0.06429   -0.89500
H    -3.84655    2.36866   -0.66368
O    -3.44715   -2.17377   -0.50503
C    -4.28668   -2.56217    0.57947
H    -5.13188   -1.87963    0.69144
H    -3.72317   -2.58668    1.51527
H    -4.65465   -3.55835    0.34850
C     1.46975    0.20221    0.80384
C     2.06682   -0.41407   -0.47225
N     3.22465   -1.25311   -0.22526
C     4.53090   -0.85149   -0.14297
C     4.83387    0.56388   -0.59560
H     1.22475   -0.60441    1.50019
H     2.22669    0.81969    1.29189
H     2.33967    0.37963   -1.16527
H     1.30788   -1.01567   -0.97386
H     3.06937   -2.18213    0.13414
O     5.40790   -1.61017    0.24390
H     5.89340    0.74028   -0.44287
H     4.25940    1.29853   -0.03211
H     4.59662    0.68995   -1.65203
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "MCONF-43"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
