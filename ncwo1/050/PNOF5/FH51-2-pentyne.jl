using DoNOF

mol = """
0 1
C    -1.15652    2.93352    1.38639
H    -1.85900    3.64037    1.84779
H    -0.88476    3.31466    0.39188
H    -0.25010    2.90547    2.00564
C    -1.78583    1.53234    1.27367
H    -2.67209    1.57855    0.61846
H    -1.07752    0.85015    0.77388
C    -2.16997    0.96730    2.56451
C    -2.47847    0.52535    3.65251
C    -2.85195   -0.01527    4.95275
H    -2.42391   -1.01781    5.10694
H    -2.49336    0.62859    5.77044
H    -3.94494   -0.10110    5.05178
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-2-pentyne"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
