using DoNOF

mol = """
0 1
C    -5.50357   -0.67028   -0.03635
H    -5.31626   -1.74853   -0.14005
H    -5.11091   -0.17570   -0.93819
H    -6.59390   -0.52848   -0.02888
C    -4.86724   -0.09281    1.23159
H    -5.27139   -0.61382    2.11789
C    -3.32819   -0.15514    1.28000
H    -2.94673    0.34597    0.36915
C    -2.80507    0.63515    2.49551
H    -3.14419    0.13162    3.41844
H    -3.28869    1.62641    2.49757
C    -1.28600    0.82524    2.54369
H    -0.91831    1.31651    1.62960
H    -0.99514    1.45409    3.39747
H    -0.75198   -0.12993    2.64532
C    -2.81428   -1.60106    1.27468
H    -1.71625   -1.64361    1.27647
H    -3.17205   -2.14311    2.16555
H    -3.15664   -2.15245    0.38793
H    -5.17353    0.96176    1.33561
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-3-methylpentane"

p.ipnof = 7

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
