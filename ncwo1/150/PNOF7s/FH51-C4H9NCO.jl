using DoNOF

mol = """
0 1
C    -2.97014   -1.45069    0.04163
H    -3.74823   -2.23137    0.04924
H    -2.01241   -1.95974    0.24032
C    -3.25449   -0.45803    1.17411
H    -2.47242    0.31924    1.20674
H    -4.20868    0.05538    0.98549
N    -3.35906   -1.09225    2.47164
C    -2.92398   -0.76929   -1.33014
H    -3.87831   -0.24585   -1.50894
H    -2.14453    0.01176   -1.32550
C    -2.65736   -1.75086   -2.47448
H    -2.62798   -1.23544   -3.44465
H    -1.69500   -2.26681   -2.34047
H    -3.44170   -2.52067   -2.52899
C    -2.64412   -1.64248    3.27650
O    -2.06554   -2.19578    4.14833
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-C4H9NCO"

p.ipnof = 7
p.ista = 1

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
