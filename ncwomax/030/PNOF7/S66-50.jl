using DoNOF

mol = """
0 1
C     0.83471    1.09365   -1.06030
H     1.48355    1.95847   -1.07660
C     1.38228   -0.18817   -1.03125
H     2.45578   -0.31750   -1.02524
C     0.54557   -1.30305   -1.00437
H     0.97001   -2.29719   -0.97743
C    -0.83857   -1.13621   -1.00674
H    -1.48746   -2.00078   -0.98161
C    -1.38607    0.14564   -1.03570
H    -2.45955    0.27525   -1.03276
C    -0.54941    1.26054   -1.06233
H    -0.97405    2.25479   -1.08014
C     0.00395    0.05394    2.48815
H     0.00094    0.03639    1.42407
C     0.00761    0.07352    3.70052
H     0.01072    0.09070    4.76172
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-50"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
