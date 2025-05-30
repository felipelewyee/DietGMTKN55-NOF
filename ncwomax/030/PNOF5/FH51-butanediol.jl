using DoNOF

mol = """
0 1
C    -2.43509   -0.03648    0.03112
H    -2.14563   -1.09723    0.06457
H    -2.06441    0.40076   -0.90472
H    -3.53498    0.02321    0.02340
C    -1.86698    0.70606    1.23526
H    -2.17083    1.77122    1.18924
C    -0.33374    0.66895    1.28240
H    -0.02999   -0.39618    1.32956
C     0.23427    1.41275    2.48580
H    -0.13682    0.97675    3.42205
H     1.33414    1.35276    2.49395
H    -0.05489    2.47355    2.45095
O    -2.31301    0.12204    2.47331
H    -3.27698    0.01513    2.41229
O     0.11250    1.25165    0.04379
H     1.07624    1.36026    0.10552
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-butanediol"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
